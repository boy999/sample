#!/bin/bash
if [ "$#" -lt 1 ] ;
then
	echo "Needs 1 arg - <filename>";
	exit;
fi

#LLVM_DIR=/mnt/karthikg/llvm-2.2/

LLVM_DIR=~/llvm-2.2/
#rm -f output*.*
#llvm-gcc --emit-llvm  -O2 -c $1 -o output.bc

INPUT_FILE=$1;
ext=${INPUT_FILE##*.}
basename=`basename "${INPUT_FILE}"`;

#echo "File ${basename} ext $ext \n";

if [ "$ext" == "c" ] ;
then
	llvm-gcc --no-inline -O2 -emit-llvm -c -o output.bc ${INPUT_FILE};
	INPUT_FILE=output.bc;
fi

#llvm-dis -f ${INPUT_FILE}
#llvm-ld  -disable-inlining ${LLVM_DIR}/lib/hashtable/ir/hashtable.bc output.bc -o output2.bc
#INPUT_FILE=output2.bc

opt -load ${LLVM_DIR}/Release/lib/reliability_analysis.so \
	-load ${LLVM_DIR}/Release/lib/MyUtils.so          \
	-load ${LLVM_DIR}/Release/lib/runtime-monitors.so \
	-load ${LLVM_DIR}/Release/lib/hybrid_analysis.so  \
	-dep-edge-profiler < ${INPUT_FILE} > output_tmp.bc

#llvm-dis -f output_tmp.bc
if [ -f "output_tmp.bc" ] ;
then
	opt -instcombine < output_tmp.bc > output2.bc
	#llvm-dis -f output2.bc
	#llvm-dis -f ${LLVM_DIR}/lib/hashtable/ir/hashtable.bc > hashtable.ll 
	llvm-ld -disable-opt ${LLVM_DIR}/lib/hashtable/ir/hashtable.bc output2.bc -o output3
	#llvm-dis -f output3.bc
	llc -march=c -f -o gen_output.c output3.bc
	gcc -o exec_profile -O3 gen_output.c -lm 
fi

echo "Hey jackass, the output of the pipe_profiler executable will have store/load ids and not instruction ids, don't bang your head thinking something is wrong";
