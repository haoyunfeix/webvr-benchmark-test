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
  program_number = 0
  capturing = False
  for l in raw.splitlines():
    if l == '__VERTEXSHADER__':
      filename = 'shader_%03d.vert' % program_number
      fp = open(os.path.join('extracted-shaders', filename), 'wb')
      capturing = True
    elif l == '__FRAGMENTSHADER__':
      if fp:
        fp.close()
      filename = 'shader_%03d.frag' % program_number
      fp = open(os.path.join('extracted-shaders', filename), 'wb')
      capturing = True
    elif l == '__ENDPROGRAM__':
      fp.close()
      program_number += 1
      capturing = False
    elif capturing:
      fp.write(l + '\n');
  return 0

if __name__ == "__main__":
  sys.exit(main(sys.argv[1:]))
