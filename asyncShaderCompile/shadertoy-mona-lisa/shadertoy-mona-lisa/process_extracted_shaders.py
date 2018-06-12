#!/usr/bin/env python

import os
import sys

def read_file(path):
  with open(path) as fp:
    return fp.read()

def write_file(path, contents):
  with open(path, 'wb') as fp:
    fp.write(contents)

def main(argv):
  raw = read_file('extracted-shaders.txt')
  fp = None
  open_file = False
  # HLSL mode requires snipping some of the extracted shaders.
  write_output = True
  for l in raw.splitlines():
    if l == '__FILE__':
      open_file = True
    elif open_file:
      if fp:
        fp.close()
      fp = open(os.path.join('extracted-shaders', l), 'wb')
      open_file = False
      if l.endswith('.hlsl'):
        write_output = False
      else:
        write_output = True
    else:
      if write_output:
        if l.startswith('// COMPILER INPUT HLSL END'):
          write_output = False
        else:
          fp.write(l + '\n');
      else:
        # Analyze the shader's comments to see whether we should start writing
        if l.startswith('// COMPILER INPUT HLSL BEGIN'):
          write_output = True
  fp.close()
  return 0

if __name__ == "__main__":
  sys.exit(main(sys.argv[1:]))
