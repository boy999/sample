#!/usr/bin/python
import sys, os, string, re, math

rows = 0
cols =0
layers = 1

if len(sys.argv) == 3:
  rows = int(sys.argv[1])
  cols = int(sys.argv[2])
else:
  if len(sys.argv) == 4:
    rows = int(sys.argv[1])
    cols = int(sys.argv[2])
    layers = int(sys.argv[3])
  else:
    sys.stderr.write("usage : GarnetFileMaker.py <rows> <cols> \n\n")

banks = rows*cols*layers
bank = 0
while bank < banks:
    sys.stdout.write("ext_node:L1Cache:%d int_node:%d link_latency:1 \n" % (bank, bank))
    sys.stdout.write("ext_node:L2Cache:%d int_node:%d link_latency:1 \n" % (bank, bank))
    bank += 1

sys.stdout.write("\n")

layer_iter = 0;
while layer_iter < layers:
  row = 0
  while row < rows:
    col = 0;
    while col < cols-1:
      bank = layer_iter*rows*cols + row*cols + col;
      sys.stdout.write("int_node:%d int_node:%d link_latency:1 link_weight:1\n" % (bank, bank+1))
      col += 1
    row += 1
    sys.stdout.write("\n")
  layer_iter += 1;

sys.stdout.write("\n")

layer_iter = 0;
while layer_iter < layers:
  row = 0
  while row < rows - 1:
      col = 0
      while col < cols:
	bank = layer_iter*rows*cols + row*cols + col;
	sys.stdout.write("int_node:%d int_node:%d link_latency:1 link_weight:2\n" % (bank, rows+bank))
	col += 1
      sys.stdout.write("\n")
      row += 1
  layer_iter += 1;

layer_iter = 0;
while layer_iter < layers - 1:
  row = 0
  while row < rows:
      col = 0
      while col < cols:
	bank = layer_iter*rows*cols + row*cols + col;
	sys.stdout.write("int_node:%d int_node:%d link_latency:0 link_weight:3\n" % (bank, rows*cols+bank))
	#connect across 2 layers
	if(layer_iter < layers-2):
	  sys.stdout.write("int_node:%d int_node:%d link_latency:0 link_weight:3\n" % (bank, 2*rows*cols+bank))
	col += 1
      sys.stdout.write("\n")
      row += 1
  layer_iter += 1;

