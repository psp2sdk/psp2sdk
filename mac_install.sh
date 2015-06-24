#!/bin/bash

# // smithsf0x

check_devkit_pro(){
	echo -ne "Check DEVKITPRO:                   "
	if [ -z "$DEVKITPRO" ]
		then
			echo "FAILED"
		else 
			echo "DONE"
	fi
}

check_devkit_arm(){
	echo -ne "Check DEVKITARM:                   "
	if [ -z "$DEVKITARM" ]
		then
			echo "FAILED"
		else 
			echo "DONE"
	fi
}

write2bash_profile(){
	echo "" >> ~/.bash_profile
	echo "#PSP2SDK" >> ~/.bash_profile
	echo "export PSP2SDK=\$DEVKITPRO/psp2" >> ~/.bash_profile
	echo "export PATH=\$PATH:\$PSP2SDK/bin" >> ~/.bash_profile
	echo -ne "DO"
}

psp2_folder(){
	if [ ! -d "$PSP2SDK" ]
		then 
			mkdir $PSP2SDK
			echo "DONE"
		else 
			echo "ALREADY CREATED"
	fi
}

setup(){
	check_devkit_pro
	check_devkit_arm
	echo -ne "Exporting and Writing:             "
	write2bash_profile
	export PSP2SDK=$DEVKITPRO/psp2
	export PATH=$PATH:$PSP2SDK/bin
	echo "NE"
	echo -ne "Creating PSP2SDK folder:           "
	psp2_folder
	echo "Setup FINISHED"
	echo "Run 'source ~/.bash_profile'"
	echo "Then this script again"
}

install_psp2sdk(){
	export PATH=$DEVKITARM/bin:$PATH
	if [ "$1" == "--show" ] 
		then
			./autogen.sh --prefix=$PSP2SDK
   			cd src && make install
    		cd ..
    		cd tools && make install
    	else
    		echo -ne "Running autogen.sh with Prefix:    "
    		./autogen.sh --prefix=$PSP2SDK >& /dev/null
    		echo "DONE"
    		echo -ne "Making and Installing PSP2SDK:     "
   			cd src && make install >& /dev/null
   			echo "DONE"
    		cd ..
    		echo -ne "Making and Installing psp2-fixup:  "
    		cd tools && make install >& /dev/null
    		echo "DONE"
    fi
}

is_first_time_run(){
	if [ -z "$PSP2SDK" ]
		then
			setup
		else 
			install_psp2sdk
			echo "[~FINISHED~]"
	fi
}

is_first_time_run
