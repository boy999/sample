#!/usr/bin/perl
#0 - stats file
#1 - template file
#2 - output file
#3  - num cores 
#4 - num l2 banks 


if($#ARGV != 0)
{
    print "Arguments <loop_data_file>\n";
    exit(0);
}

#Xeon Events:
#RetiredInst UOPSRetired FPInst STInst LDInst MULInst ALLCycles L1ICA L1DCA L2CA L2Miss L1IMiss L1DMiss BrInst BrCall BrMissRetire DTLBMiss ITLBMiss IFetchStall RATStall RSStall Cycles

#Atom Events:
#RetiredInst UOPSRetired FPInst STInst LDInst MULInst ALLCycles L1ICA L1DCA L2CA L2Miss L1IMiss L1DMiss BrInst BrCall BrMissRetire DTLBMiss InstQueFull InstFetEmpty ITLBMiss RSStallDivBusy Cycles BACLEARS CycDivBusy

$j=0;
#$baseAdd = hex(0x400000);
$baseAdd = 0;
$interval = 0;
$prevIndex = 1;
$sum =0;
$hashmap = {};
$hashmap2 = {};

open(fptr0, $ARGV[0]) || die "Could not open power stats file!";
while(<fptr0>)
{
    chomp;
    if (($j % 2) == 0)
    {
        $j++;        
        next;
    }

    $hashmap2->{$array[1]} = $hashmap2->{$array[1]} + 1;
    if($j==1)
    {
        @array = split(/ /, $_);
        $baseAdd = $array[1];
        $interval = $array[2];
        $j++;
    }
    else
    {
        @array = split;
        
        if ($interval == $array[2])
        {
            $sum = $sum + $array[1] - $baseAdd;
        }
        else
        {
            $num = $j - $prevIndex;    
            $num = $num/2;
            $float = $sum / $num;
            $rounded = sprintf "%.0f", $float;
            $rounded = $rounded + $baseAdd;
            print STDOUT $rounded." ".$array[1]." ".$array[2]." ".$sum." ".$num."\n";
            $hashmap->{$interval} = $rounded;
            $interval = $array[2];
            $sum = $array[1] - $baseAdd;
            $prevIndex = $j;
        }

#        for($i=0;$i<=$#AtomPerfDataNames;$i++)
#        {
#            $hash_ref->{$AtomPerfDataNames[$i]} = $hash_ref->{$AtomPerfDataNames[$i]} + $array[$hashmap{$AtomPerfDataNames[$i]}];
#        }

        $j++;
    }

}

$num = $j - $prevIndex;
$num = $num/2;
$float = $sum / $num;
$rounded = sprintf "%.0f", $float;
$rounded = $rounded + $baseAdd;
#print STDOUT $rounded." ".$array[0]." ".$array[1]." ".$sum."\n";
$hashmap->{$interval} = $rounded;
$interval = $array[2];
$sum = $array[1] - $baseAdd;
$prevIndex = $j;


open(fptr1, ">".$ARGV[0]."_processed") || die "Could not open power stats file!";
open(fptr2, ">".$ARGV[0]."_loop") || die "Could not open power stats file!";

print STDOUT $interval;
print STDOUT "\n";

for ($i=0; $i <= $interval; $i++)
{
    $inter = $i + 1;
    print fptr1 $inter." ".$hashmap->{$i};
    print fptr1 "\n";
    
#    $loop = $hashmap->{$i} + $baseAdd;
#    $loop = sprintf("%x", $loop);
#    print fptr2 $inter." ".$loop;
#    print fptr2 "\n";

}

for (keys %$hashmap2)
{
    print fptr2 "Loop ".$_." runs ".$hashmap2->{$_}." times\n";
}

close(fptr);
close(fptr1);
close(fptr2);
