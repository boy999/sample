#!/bin/bash
if [ "$#" -lt 1 ] ;
then
	echo "Needs 1 args - <filename> [<compile>]";
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


llvm-dis -f ${INPUT_FILE}

opt -load ${LLVM_DIR}/Release/lib/reliability_analysis.so \
	-load ${LLVM_DIR}/Release/lib/MyUtils.so          \
	-load ${LLVM_DIR}/Release/lib/runtime-monitors    \
	-load ${LLVM_DIR}/Release/lib/FindBoundary.so  \
	-graph-driver < ${INPUT_FILE} > output_tmp.bc

llvm-dis -f output_tmp.bc
if [ -f "output_tmp.bc" ] ;
then
	opt -instcombine < output_tmp.bc > output2.bc
	llvm-dis -f output2.bc
	llvm-ld  -disable-inlining -O3 ${LLVM_DIR}/lib/hashtable/ir/callgraph.bc output2.bc -o output3
	llvm-dis -f output3.bc
	llc -march=c -f -o gen_output.c output3.bc
	if [ "$#" -gt 1 ] ;
	then 
		if [ $2 == "1" ] ;
		then
			gcc -o propagate -O3 gen_output.c -lm 
		fi
	fi
fi

