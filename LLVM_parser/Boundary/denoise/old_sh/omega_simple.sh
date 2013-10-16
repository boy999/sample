#!/bin/bash
if [ "$#" -lt 1 ] ;
then
	echo "Needs 1 args - <filename>";
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
	llvm-gcc --no-inline -O3 -emit-llvm -c -o omega_output.bc ${INPUT_FILE};
#	llvm-gcc --no-inline -O2 -emit-llvm -c -o output.bc ${INPUT_FILE};
#    -O3 -emit-llvm -c -o output.bc
	INPUT_FILE=omega_output.bc;
fi


llvm-dis -f ${INPUT_FILE}

opt -load ${LLVM_DIR}/Release/lib/omega_interface.so \
	-omega < ${INPUT_FILE} > omega_output_tmp.bc

