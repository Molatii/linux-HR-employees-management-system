#!/bin/bash/
#Paballo molati 1818416 DASHBOARD.SH (MENU)
file1=records.txt
file2=old_records.txt

if [[ -e $file1 ]];
then
echo "Records file ready.........."
else
echo >  records.txt
echo "Records file Created........"
fi

if [[ -e $file2 ]];
then
echo "Old_Records file ready.........."
else
echo > old_records.txt
echo "Old_ Records file Created........"
fi
echo ""
sleep 3
echo "------------------------Welcome--------------------------"
echo ""
test=0

while   
        [[ $test = 0 ]]
do
        #clear used to clear the terminal for the user
        clear
        echo "=============================================="     
        echo "                     MENU                     "
        echo "=============================================="

        echo ""
        echo "        WELCOME TO A to Z Technologies!!         "
        echo ""
        echo "============================================="
        echo "TO CREATE NEW EMPLOYEE DATA ---- (ENTER) :: 1"
        echo "TO RETRIEVE AN EMPLOYEE   ------ (ENTER) :: 2"
        echo "TO UPDATE AN EMPLOYEE DATA------ (ENTER) :: 3"
        echo "TO TO DELETE AN  EMPLOYEE ------ (ENTER) :: 4"
        echo "TO (QUIT) THIS ---- MENU ------ (ENTER) :: x"
        echo " "
        echo "============================================="
        echo "Enter your selection"
        read input
        echo "                                             "
        echo "============================================="

	case "$input" in

                      1)
                       sh create.sh
                        test=1
                        ;;

                      2)
                       sh retrieve.sh
                        test=1
                        ;;
                      3)
                       sh update.sh
                        test=1
                        ;;
                      4)
                       sh delete.sh
                        test=1
                        ;;

                        x)
                        test=1
                        echo "EXITING........."
                        sleep 2
                        ;;

                        *)
                        
                        echo "Input not expected!! -----try again please--"
                        sleep 2 
                        ;;
      esac
done

