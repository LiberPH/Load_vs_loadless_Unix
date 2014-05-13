#!/bin/bash
###################################################
#Script for comparision between loaded and not loaded model by canberra distance. This
#can be run from kon_koff_changes.sh or independently. This program changes kon and
#koff for making the different comparisions in
#
###################################################

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
RUNR=~/Users/liberPH/Documents/PHD/Scripts/Programas_locals/UnixV/canberra.R #Calculate Canberra distance
RUNR2=~/Users/liberPH/Documents/PHD/Scripts/Programas_locals/UnixV/normalize_kon_koff.R
##################################################
# Create a directory and move into it.

echo Creating directory "$WORKINGDIR"_"$TAU"...
mkdir "$WORKINGDIR"_"$TAU"
echo "cd'ing into "$WORKINGDIR"_"$TAU""...
cd "$WORKINGDIR"_"$TAU"
echo Current directory is `pwd`...

##################################################
# Copy the bngl files inside the just created directory

cp $ORIG mastercontrol.bngl
cp $BNGLFILE $WORKFILE
cp $ORIG control.bngl


##################################################
mkdir "$WORKINGDIR"_params_e-9_e-11 #Run for first couple kon/koff
cd "$WORKINGDIR"_params_e-9_e-11
cp $ORIG mastercontrol.bngl
cp $BNGLFILE $WORKFILE
cp $ORIG control.bngl

#Change tau values
sed -i '' "s/tau 120/tau $TAU/g" control.bngl
sed -i '' "s/tau 120/tau $TAU/g" mastercontrol.bngl
sed -i '' "s/tau 120/tau $TAU/g" $WORKFILE

echo "

About to run BioNetGen on several files.
Warning: Check all the paths are correct before to continue.
This is going to take a while. Go grab some popcorn or get some coffee.
...

"

#Run Change_binding_inner.sh
/Users/liberPH/Documents/PHD/Scripts/Programas_locals/UnixV/Change_binding_inner.sh "$WORKINGDIR" "$WORKFILE" control.bngl "$WORKFILENAME" "$TAU" > "$WORKFILENAME".txt

cd ..


############################################################
mkdir "$WORKINGDIR"_params_on_0.000409_off_3e-3
cd "$WORKINGDIR"_params_on_0.000409_off_3e-3
cp $BNGLFILE $WORKFILE
cp $ORIG control.bngl
cp $ORIG mastercontrol.bngl
sed -i '' "s/tau 120/tau $TAU/g" control.bngl
sed -i '' "s/tau 120/tau $TAU/g" $WORKFILE
sed -i '' "s/tau 120/tau $TAU/g" mastercontrol.bngl

echo "

About to run BioNetGen on several files.
This is going to take a while. Go grab some popcorn or get some coffee.
...

"

	sed -i '' "s/koff 1e-11/koff 3e-3*60/g" control.bngl #Quantitative TF binding kinetics at single molecular level
	sed -i '' "s/kon 1e-9/kon 0.000409*60*1e-9*6.022e23*42e-15/g" control.bngl

	sed -i '' "s/koff 1e-11/koff 3e-3*60/g" mastercontrol.bngl #Quantitative TF binding kinetics at single molecular level
	sed -i '' "s/kon 1e-9/kon 0.000409*60*1e-9*6.022e23*42e-15/g" mastercontrol.bngl
	

	sed -i '' "s/koff 1e-11/koff 3e-3*60/g" $WORKFILE #Quantitative TF binding kinetics at single molecular level
	sed -i '' "s/kon 1e-9/kon 0.000409*60*1e-9*6.022e23*42e-15/g" $WORKFILE


/Users/liberPH/Documents/PHD/Scripts/Programas_locals/UnixV/Change_binding_inner.sh "$WORKINGDIR" "$WORKFILE" control.bngl "$WORKFILENAME" "$TAU" > "$WORKFILENAME".txt


cd ..

##############################################################
mkdir "$WORKINGDIR"_params_on_0.0002_off_4e-3
cd "$WORKINGDIR"_params_on_0.0002_off_4e-3
cp $ORIG mastercontrol.bngl
cp $BNGLFILE $WORKFILE
cp $ORIG control.bngl
sed -i '' "s/tau 120/tau $TAU/g" control.bngl
sed -i '' "s/tau 120/tau $TAU/g" $WORKFILE
sed -i '' "s/tau 120/tau $TAU/g" mastercontrol.bngl

echo "

About to run BioNetGen on several files.
This is going to take a while. Go grab some popcorn or get some coffee.
...

"

	sed -i '' "s/koff 1e-11/koff 4e-3*60/g" mastercontrol.bngl #Quantitative TF binding kinetics at single molecular level
	sed -i '' "s/kon 1e-9/kon 0.0002*60*1e-9*6.022e23*42e-15/g" mastercontrol.bngl
	
	sed -i '' "s/koff 1e-11/koff 4e-3*60/g" control.bngl #Quantitative TF binding kinetics at single molecular level
	sed -i '' "s/kon 1e-9/kon 0.0002*60*1e-9*6.022e23*42e-15/g" control.bngl

	sed -i '' "s/koff 1e-11/koff 4e-3*60/g" $WORKFILE #Quantitative TF binding kinetics at single molecular level
	sed -i '' "s/kon 1e-9/kon 0.0002*60*1e-9*6.022e23*42e-15/g" $WORKFILE



/Users/liberPH/Documents/PHD/Scripts/Programas_locals/UnixV/Change_binding_inner.sh "$WORKINGDIR" "$WORKFILE" control.bngl "$WORKFILENAME" "$TAU" > "$WORKFILENAME".txt


cd ..

################################################################
mkdir "$WORKINGDIR"_params_on_0.0225_off_0.045
cd "$WORKINGDIR"_params_on_0.0225_off_0.045
cp $ORIG mastercontrol.bngl
cp $BNGLFILE $WORKFILE
cp $ORIG control.bngl
sed -i '' "s/tau 120/tau $TAU/g" control.bngl
sed -i '' "s/tau 120/tau $TAU/g" $WORKFILE
sed -i '' "s/tau 120/tau $TAU/g" mastercontrol.bngl

echo "

About to run BioNetGen on several files.
This is going to take a while. Go grab some popcorn or get some coffee.
...

"

	sed -i '' "s/koff 1e-11/koff 0.045*60/g" mastercontrol.bngl #LexA-DNA bond strength by single molecule force spectroscopy (recA)
	sed -i '' "s/kon 1e-9/kon 0.0225*60*1e-9*6.022e23*42e-15/g" mastercontrol.bngl
	
	sed -i '' "s/koff 1e-11/koff 0.045*60/g" control.bngl #LexA-DNA bond strength by single molecule force spectroscopy (recA)
	sed -i '' "s/kon 1e-9/kon 0.0225*60*1e-9*6.022e23*42e-15/g" control.bngl
	
	sed -i '' "s/koff 1e-11/koff 0.045*60/g" $WORKFILE #
	sed -i '' "s/kon 1e-9/kon 0.0225*60*1e-9*6.022e23*42e-15/g" $WORKFILE

 

/Users/liberPH/Documents/PHD/Scripts/Programas_locals/UnixV/Change_binding_inner.sh "$WORKINGDIR" "$WORKFILE" control.bngl "$WORKFILENAME" "$TAU" > "$WORKFILENAME".txt

cd ..

###################################################################
mkdir "$WORKINGDIR"_params_on_0.0065_off_0.13
cd "$WORKINGDIR"_params_on_0.0065_off_0.13
cp $ORIG mastercontrol.bngl
cp $BNGLFILE $WORKFILE
cp $ORIG control.bngl
sed -i '' "s/tau 120/tau $TAU/g" control.bngl
sed -i '' "s/tau 120/tau $TAU/g" $WORKFILE
sed -i '' "s/tau 120/tau $TAU/g" mastercontrol.bngl

echo "

About to run BioNetGen on several files.
This is going to take a while. Go grab some popcorn or get some coffee.
...

"
	sed -i '' "s/koff 1e-11/koff 0.13*60/g" mastercontrol.bngl #LexA-DNA bond strength by single molecule force spectroscopy (recA)
	sed -i '' "s/kon 1e-9/kon 0.0065*60*1e-9*6.022e23*42e-15/g" mastercontrol.bngl

	sed -i '' "s/koff 1e-11/koff 0.13*60/g" control.bngl #LexA-DNA bond strength by single molecule force spectroscopy (recA)
	sed -i '' "s/kon 1e-9/kon 0.0065*60*1e-9*6.022e23*42e-15/g" control.bngl
	$RUNBNGL control.bngl
	
	sed -i '' "s/koff 1e-11/koff 0.13*60/g" $WORKFILE #
	sed -i '' "s/kon 1e-9/kon 0.0065*60*1e-9*6.022e23*42e-15/g" $WORKFILE


/Users/liberPH/Documents/PHD/Scripts/Programas_locals/UnixV/Change_binding_inner.sh "$WORKINGDIR" "$WORKFILE" control.bngl "$WORKFILENAME" "$TAU" > "$WORKFILENAME".txt


cd ..

