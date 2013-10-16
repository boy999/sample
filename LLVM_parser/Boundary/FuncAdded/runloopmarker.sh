llvm-gcc -O3 -emit-llvm -c loopMarker.c -o loopMarker.bc
#llvm-gcc -emit-llvm -c loopMarker.c -o loopMarker.bc
llvm-dis -f loopMarker.bc
