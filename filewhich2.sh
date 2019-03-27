#!/bin/bash

# Function to display usage
usage()
{
	echo "Usage: filewhich [-a] [-p /path/to/files:/path/to/more/files] file_name"; 
}

# Default value for -a 
SHOW_ALL=0;

# getopts code for named options
while getopts :ap: option
	do 
		case "${option}"
		in
			a) SHOW_ALL=1;;
			p) FILEPATH="${OPTARG}";;
		esac
done
shift $((OPTIND-1))

# verify that filename is given
if [ -z "$1" ]; then
	usage;
	exit 1;
fi


# Check for exported variable
if [ -z ${FILEPATH+xxx} ]; then 
	# FilePath is not set and -p option not used
	usage;
	exit 1;
fi

# Loop through colon-separated values
IFS=':' read -r -a array <<< "$FILEPATH"
for directory in "${array[@]}"
do
	# Use test's -e option to check if file exists
	if [ -e "$directory/$1" ]; then
		echo "$directory/$1";
		if [ $SHOW_ALL == 0 ]; then
			exit 0;
		fi;
	fi;
done