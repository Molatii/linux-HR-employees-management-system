#!/bin/bash/
#this is delete sh

w=0
while [ $w = 0 ]
do
   
clear


echo "************************************************************"
echo "                      Delete Selection                      "
echo "************************************************************"
echo "To Delete Record (Enter) :: 1                               "
echo "Back TO Main Menu (Home) :: x                               "
echo "************************************************************"

echo "ENTER YOUR SELECTION"
read selection


case $selection in

 1)

function remove(){
 echo ""
   b=$(grep -i "$it" records.txt)
   echo "$b"
   echo ""

   echo "*******Record Saved to (old_records.txt) for Backup*****"
   echo "$b" >> old_records.txt

   echo ""
   echo "**************Record deleted in (records.txt)***********"
   sed -i "/$it/d" records.txt
   echo "$b"
   
    echo ""
    echo "Enter__ *any number*___ to close Department Records"
         read answer

    if [[ $answer == 9 ]]
    then
    echo "Closing..........."
    sleep 1
    clear

    else

   echo "Closing..............."
   sleep 1
   clear
   fi

}
 echo "DELETE AN EMPLOYEE (DATA)"
 echo ""
 cat records.txt
 echo ""
 echo "***Enter Employee id to deleted record...***"
 echo "--Note--:write Employee Id as it is (Fisrt Letter is Capital letter)"
 read it

remove
;;

x)
  echo "Loading Dashboard....."
  sleep 1
  sh dashboard.sh
  
  w=2
;;

*)
  echo "***Invalied input***"
  echo "--------Try again-----------"
  sleep 3
;;


esac
done
