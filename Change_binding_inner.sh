#!/bin/sh

#  Change_binding_inner.sh
###############################################
#Program for changing the rates for cognate DNA binding when having
#downstream loads.
###############################################
#
#  Created by Libertad PH on 12/05/14.
#
##################################################
# Function to handle errors
##################################################
yaValio() {
# Send the error message to STDERR, then exit
echo >&2 "$@"
exit 1
}
##################################################
# Check for the right number of parameters
# If the number of parameters is greater than 5...
[ "$#" -eq 5 ] || yaValio "
`basename $0` requieres 5 parameters, but received $#

Usage:
`basename $0` outputDirectory bnglFile1 origbnglfile workFileName TAU
"
##################################################
# Report initial configuration of the script and set variables
echo "`basename $0` started. WorkingDirectory name is $1, bnglFile is $2, bnglFile2 (original) is $3 workFileName is $4, tau is $5"
WORKINGDIR=$1
BNGLFILE=$2
ORIG=$3
WORKFILENAME=$4
TAU=$5
WORKFILE="$WORKFILENAME".bngl
RUNBNGL="perl /Users/liberPH/Downloads/RuleBender-2.0.382-osx64/BioNetGen-2.2.5/BNG2.pl"
RUNR=/Users/liberPH/Documents/PHD/Scripts/Programas_locals/UnixV/canberra.R #Change path before to start
RUNR2=/Users/liberPH/Documents/PHD/Scripts/Programas_locals/UnixV/normalize_kon_koff.R #Change path before to start
#####################################################

y=-5
z=0
a=-5
b=0
n=0

$RUNBNGL mastercontrol.bngl


for ((b=-5; b<=5 ; b++));
    do #Changing koffR
        sed -i '' "s/koffR koff\*2\^$a/koffR koff\*2\^$b/g" $WORKFILE
        sed -i '' "s/koffR koff\*2\^$a/koffR koff\*2\^$b/g" control.bngl
        for ((z=-5; z<=5 ; z++));
            do #Changing kdR
                sed -i '' "s/kdR kd\*2\^$y/kdR kd\*2\^$z/g" $WORKFILE
                sed -i '' "s/kdR kd\*2\^$y/kdR kd\*2\^$z/g" control.bngl
                $RUNBNGL $WORKFILE
                $RUNBNGL control.bngl
                cp "$WORKFILENAME".gdat "$WORKFILENAME"_"$b"_"$z".gdat
#cp "$WORKFILENAME".cdat "$WORKFILENAME"_"$b"_"$z".cdat #Uncomment this line in case you are interested in data from the *.cdat
                Rscript $RUNR "$WORKFILENAME".gdat control.gdat output.txt
                Rscript $RUNR2 "$WORKFILENAME".gdat control.gdat output2.txt
                LINE[$n]=`cat output.txt`
                LINE2[$n]=`cat output2.txt`
                y=$z
                n=$n+1
            done
echo "${LINE[*]}" >> "$WORKINGDIR"_0.txt #Output using canberra distance
echo "${LINE2[*]}" >> "$WORKINGDIR"_normalized.txt #Output normalizing
        a=$b
        n=0
    done