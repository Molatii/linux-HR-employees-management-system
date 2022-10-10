#!/bin/bash/
# this is update sh
w=0
while [ $w = 0 ]
do

clear

echo "********************************************************************************"
echo "                            UPDATE SELECTION                                    "
echo "********************************************************************************"
echo " ENTER 1 :: UPDATE SALARY"
echo " ENTER 2 :: UPDATE DEPARTMENT" 
echo " ENTER 3 :: AJUST SALARY BY DEPARTMENT"
echo " ENTER x :: BACK TO MAIN MENU (HOME)"
echo "********************************************************************************"

echo "ENTER YOUR SELECTION"
read selection


case $selection in

 1) 

#update salary

function upnow1(){

 a=$(grep -i -c "$theid" records.txt)

  if [[ $a == 1 ]]
  then

  echo ""
  echo "*****Employee ID exists*****"

  grep -i "$theid" records.txt

  echo ""

  echo "*****Enter current amount(Salary)*****"
  read old
  echo "*****Enter New Amount(Salary)**********"
  read new
 
  sed -i "s/$old/$new/" records.txt

  echo "******Record Updated******"
  grep -i "$theid" records.txt
  

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
  
  else

  echo ""       
  echo "**Sorry_The employee ID does not exists**"
  echo ""
  sleep 333  

  fi
  
  echo ""
  echo "" 
     

}

 echo "*****UPDATE AN EMPLOYEE (DATA)******"
 echo ""
 cat records.txt

 echo " "
 echo "*****Enter EmpID to edit Salary*****"
 read theid
 echo ""

upnow1

;;

  2)

#update Department

function upnow2(){


   a=$(grep -i -c "$id" records.txt)

   if [[ $a == 1 ]]
   then

   echo ""
   echo "*****Employee ID exists*****"

   grep -i "$id" records.txt
   echo ""

   echo "*****Enter current department name*****"
   read old


  echo "*****Enter New department name**********"
  read new

    sed -i "/$id/s/$old/$new/" records.txt  


  echo "*****Data(department name) is Updated*****"
  grep -i "$id" records.txt

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


   else

   echo "***********Employee ID  does not exists*****************"
   echo ""
  echo "YOU NEED THE ID TO UPDATE RECORDS......."
  

  sleep 3
   echo ""   
 fi

 echo ""
 echo ""


}
cat records.txt
echo ""
echo "**Enter employee EmpId to edit thier  Department**"
read id

upnow2

 
  ;;
3)
#update or  ajust by Percentage
function upnow3(){

   d=$(grep -i -c "$dp" records.txt)
    
  if [[ $d -ge 1 ]]
  then
        echo "****Department Exists ****"
        echo ""
        echo "*****Salaries Update according to Percentage given******"
              #awk  -vdp="$dp"  '$4==dp'|  awk -vper="$per" c=$3\/100\*per $3 = $3 + c records.txt                       
              # echo ""                 
              #awk  -vdp="$dp" -vper="$per"  '$4==dp {     }'
     sleep 3
     
    else

        echo "***Department Given does not exists..........***"
      sleep 3

  fi
}

   echo "** Ajust Salary by Percentage for a given department**"
   echo ""
   echo "--Enter the Department First--"
   read dp
   echo ""

   echo ""
   echo "--Enter the Percentage to ajust a given Department--"
   read per

upnow3

  ;;


  x)
    echo "Loading Dashboard........"  
    sleep 2
    sh dashboard.sh
   w=3
   ;;

  *)
   
   echo "INPUT NOT EXPECTED..."
   echo " Try again.............."
   sleep 2
   
  ;;

esac


done
