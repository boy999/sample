#For more details, read the chapter on Performance monitoring Intel System Programming Guide

#atom core 1, xeon core 3
#Goal configure performance counter 0 to count instructions retired, counter 1 to count unhalted cycles

#This tells the system to count user and OS-mode instructions retired in counter 0
msr -w 0x186 0x004300c0 -c 1
msr -w 0x186 0x004300c0 -c 3

#This tells the system to count user and OS-mode unhalted reference cycles in counter 1
msr -w 0x187 0x0043013c -c 1
msr -w 0x187 0x0043013c -c 3

echo "Running on core 1"
#read counters 0 and 1 before running the benchmark
#msr -r 0xc1 -c 1
#msr -r 0xc2 -c 1

#run on core 1
#taskset 2  ./a.out

#read counters again - subtracting the values will give you the inst retired, time taken
#msr -r 0xc1 -c 1
#msr -r 0xc2 -c 1


echo "Running on core 3"
#read counters 0 and 1 before running the benchmark
msr -r 0xc1 -c 3
msr -r 0xc2 -c 3

#run on core 1
taskset 8  ./propagate > test.log


#read counters again - subtracting the values will give you the inst retired, time taken
msr -r 0xc1 -c 3
msr -r 0xc2 -c 3



