#!/bin/bash

#################################################
#Script for changing tau values in retro_short_Molecules_tau_local.sh
#Once a tau has been choosen retro_short_Molecules_tau_local.sh will be run.
#
#################################################



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
# If the number of parameters is greater than 4...
[ "$#" -eq 4 ] || yaValio "
`basename $0` requieres 4 parameters, but received $#

Usage:
`basename $0` outputDirectory bnglFile1 origbnglfile workFileName
"
##################################################
# Report initial configuration of the script and set variables
echo "`basename $0` started. OutputDirectory is $1, bnglFile is $2, bnglFile2 is $3 workFileName
 is $4"

WORKINGDIR=$1
BNGLFILE=$2
ORIG=$3
WORKFILENAME=$4
WORKFILE=$WORKFILENAME.bngl
#ORIG=~/200513/5_nuc_onoff_cd_mol.bngl
RUNBNGL="perl /Users/liberPH/Downloads/RuleBender-2.0.382-osx64/BioNetGen-2.2.5/BNG2.pl"
RUNR=~/Users/liberPH/Documents/PHD/Scripts/Programas_locals/UnixV/canberra.R

##################################################
# Create a directory and move into it.

echo Creating directory "$WORKINGDIR"...
mkdir $WORKINGDIR
echo "cd'ing into $WORKINGDIR"...
cd $WORKINGDIR
echo Current directory is `pwd`...

##################################################
# Copy the bngl file inside the just created directory

cp $BNGLFILE $WORKFILE
cp $ORIG control.bngl

####################################################################
# W A R N I N G : Check that the paths are correct before to start #
####################################################################

TAU=43 # Run retro_short_Molecules_tau_local.sh using tau as 43...

/Users/liberPH/Documents/PHD/Scripts/Programas_locals/UnixV/retro_short_Molecules_tau_local.sh "$WORKINGDIR" "$BNGLFILE" "$ORIG" "$WORKFILENAME" "$TAU" > "$WORKFILENAME".txt

TAU=90 # Run retro_short_Molecules_tau_local.sh using tau as 90...

/Users/liberPH/Documents/PHD/Scripts/Programas_locals/UnixV/retro_short_Molecules_tau_local.sh "$WORKINGDIR" "$BNGLFILE" "$ORIG" "$WORKFILENAME" "$TAU" > "$WORKFILENAME".txt

TAU=120 # Run retro_short_Molecules_tau_local.sh using tau as 120...

/Users/liberPH/Documents/PHD/Scripts/Programas_locals/UnixV/retro_short_Molecules_tau_local.sh "$WORKINGDIR" "$BNGLFILE" "$ORIG" "$WORKFILENAME" "$TAU" > "$WORKFILENAME".txt

TAU=240 # Run retro_short_Molecules_tau_local.sh using tau as 240...

/Users/liberPH/Documents/PHD/Scripts/Programas_locals/UnixV/retro_short_Molecules_tau_local.sh "$WORKINGDIR" "$BNGLFILE" "$ORIG" "$WORKFILENAME" "$TAU" > "$WORKFILENAME".txt 

cd ..
