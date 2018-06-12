#!/usr/bin/env python

# NOTE: requires fxc.exe and dxc.exe from the Windows SDK to be on PATH already.
#
# In a Chromium workspace, for Google employees, this can be set up by running:
# ...\src\third_party\depot_tools\win_toolchain\vs_files\[hash]\win_sdk\bin

# Produces a .csv file which can then be imported into a spreadsheet.
# Column B contains the mean of the runs of fxc.exe.
# Column D contains the mean of the runs of dxc.exe.

import os
import math
import subprocess
import sys
import time

SUBDIR = 'extracted-shaders'
NUM_RUNS_KEPT = 15

def run_fxc(filename):
  is_vert = False
  if filename.endswith('_vert.hlsl'):
    is_vert = True
  elif not filename.endswith('_frag.hlsl'):
    raise 'Don\'t know how to handle file ' + filename
  # Use check_output and ignore the output to suppress it.
  subprocess.check_output(['fxc.exe',
                           '/T',
                           'vs_5_0' if is_vert else 'ps_5_0',
                           '/Fo',
                           os.path.join(SUBDIR, 'output.fx'),
                           os.path.join(SUBDIR, filename)],
                          stderr=subprocess.STDOUT)

def run_dxc(filename):
  is_vert = False
  if filename.endswith('_vert.hlsl'):
    is_vert = True
  elif not filename.endswith('_frag.hlsl'):
    raise 'Don\'t know how to handle file ' + filename
  # Use check_output and ignore the output to suppress it.
  subprocess.check_output(['dxc.exe',
                           '-T',
                           'vs_6_0' if is_vert else 'ps_6_0',
                           '-Fo',
                           os.path.join(SUBDIR, 'output.dx'),
                           os.path.join(SUBDIR, filename)],
                          stderr=subprocess.STDOUT)
  
def time_invocation(func, file):
  start = time.clock()
  func(file)
  return time.clock() - start

def gather_data(func, file):
  times = []
  for i in xrange(2 + NUM_RUNS_KEPT):
    times.append(time_invocation(func, file))
  # Discard highest and lowest times (outliers).
  times.sort()
  del times[0]
  del times[len(times) - 1]
  return times


# 'A'..'Z', 'AA', 'AB', etc. Input is 1-based.
def column_marker(col):
  if col <= 0:
    raise Exception('Illegal input ' + str(col))
  # How many decimal places in base 26?
  places = math.trunc(math.ceil(math.log(col, 26)))
  if col == 1:
    places = 1
  output = ''
  # Convert to 0-based number.
  cur_num = col - 1
  while places > 0:
    place_value = (26 ** (places - 1))
    dividend = math.trunc(cur_num / place_value)
    # In the ones place, treat 'A' like 0. In other places, treat 'A'
    # like 1 (and 0). We probably won't have to worry about the latter
    # and will probably get the numbering scheme wrong.
    offset = dividend
    if place_value > 1 and offset > 0:
      offset -= 1
    output = output + chr(ord('A') + offset)
    cur_num -= dividend * place_value
    places = places - 1
  return output
  

def mean_stddev(data):
  num = len(data)
  mean = sum(data) / num
  diffs = [x - mean for x in data]
  sq_diffs = [d ** 2 for d in diffs]
  # Population standard deviation.
  return (mean, math.sqrt(sum(sq_diffs) / num))


def write(fp, line):
  fp.write(line + '\n')


def gather_both_compilers_data(filename):
  return {
    'filename': filename,
    'fxc_times': gather_data(run_fxc, filename),
    'dxc_times': gather_data(run_dxc, filename),
  }

def main(argv):
  data = []
  for i in xrange(108):
    data.append(gather_both_compilers_data('shader_%03d_vert.hlsl' % i))
    data.append(gather_both_compilers_data('shader_%03d_frag.hlsl' % i))
    print 'Gathered shader_%03d_{vert,frag}.hlsl' % i
  line_number = 2
  with open('compile_times.csv', 'wb') as fp:
    write(fp, 'Filename,Fxc Mean,Fxc Stddev,Dxc Mean,Dxc Stddev,fxc Raw Data' + (',' * NUM_RUNS_KEPT) + 'dxc Raw Data')
    for d in data:
      base = 6
      lineno = str(line_number)
      filename = d['filename']
      fxc_times = d['fxc_times']
      dxc_times = d['dxc_times']
      fxcrange = (column_marker(base) + lineno + ':' +
                  column_marker(base + len(fxc_times) - 1) + lineno)
      dxcrange = (column_marker(base + len(fxc_times)) + lineno + ':' +
                  column_marker(base + len(fxc_times) - 1 + len(dxc_times)) + lineno)
      write(fp, ','.join([filename,
                          '=AVERAGE(' + fxcrange + ')',
                          '=STDEV(' + fxcrange + ')',
                          '=AVERAGE(' + dxcrange + ')',
                          '=STDEV(' + dxcrange + ')'] +
                         map(str, fxc_times) +
                         map(str, dxc_times)))
      line_number += 1
  return 0

if __name__ == "__main__":
  sys.exit(main(sys.argv[1:]))
