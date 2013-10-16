llvm-gcc -O3 -emit-llvm -c marker.c -o marker.bc
llvm-dis -f marker.bc
