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
	llvm-gcc -O2 -emit-llvm -c -o call_output.bc ${INPUT_FILE};
	INPUT_FILE=call_output.bc;
fi


llvm-dis -f ${INPUT_FILE}

opt -load ${LLVM_DIR}/Release/lib/reliability_analysis.so \
	-load ${LLVM_DIR}/Release/lib/MyUtils.so          \
	-load ${LLVM_DIR}/Release/lib/runtime-monitors    \
	-load ${LLVM_DIR}/Release/lib/hybrid_analysis.so  \
	-callsite-marker < ${INPUT_FILE} > call_output_tmp.bc

llvm-dis -f call_output_tmp.bc
if [ -f "output_tmp.bc" ] ;
then
	opt -instcombine < call_output_tmp.bc > call_output2.bc
	llvm-dis -f call_output2.bc
	llvm-ld  -disable-inlining -O3 ${LLVM_DIR}/lib/hashtable_by/ir/callgraph.bc call_output2.bc -o call_output3
	llvm-dis -f call_output3.bc
	llc -march=c -f -o call_gen_output.c call_output3.bc
	if [ "$#" -ge 2 ] ;
	then 
		if [ $2 == "1" ] ;
		then
			gcc -o call_profile_by -O3 call_gen_output.c -lm 
		fi
	fi
fi

