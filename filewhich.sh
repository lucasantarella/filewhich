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
	exit 255;
fi

# Loop through colon-separated values
IFS=':' read -r -a array <<< "$FILEPATH"
for directory in "${array[@]}"
do
	# Use glob expansion to check if file is present
	for f in $directory/*; do
		# Escape directory for use in sed
		escdirectory="$(echo "$directory" | sed 's/\//\\\//g')\/";
		filename=$(echo "$f" | sed -e "s/^${escdirectory}//" );
		# Check if file is present
		if [ "$filename" == "$1" ]; then
			echo "$directory/$filename";
			if [ $SHOW_ALL == 0 ]; then
				exit 0;
			fi;
		fi;
	done
done