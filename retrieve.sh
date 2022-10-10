#!/bin/bash/

m=0
clear
while [ $m = 0 ]
do

echo "********************************************************************************"
echo "                            RETRIEVE SELECTION                                  "
echo "********************************************************************************"
echo " ENTER X :: BACK TO MAIN MENU (HOME)"
echo "********************************************************************************"
echo " ENTER 1 :: EMPLOYEE BASED ON (NAME OR EMP_ID)"
echo " ENTER 2 :: HIGHEST AND  LOWEST PAID"
echo " ENTER 3 :: TOTAL NUMBER OF EMPLOYEES"
echo " ENTER 4 :: SALARYS ABOVE SUPPLIED VALUE"
echo " ENTER 5 :: SALARYS BELOW SUPPLIED VALUE"
echo " ENTER 6 :: EMPLOYEES BELONGING TO SUPPLIED DEPARTMENT"
echo "********************************************************************************"

echo "ENTER YOUR SELECTION"
read selection


case $selection in

 1)


function display(){

result=$( awk  -v name="$name" '$2==name { print $0 }'  records.txt)

result_lines=$( grep -i $name records.txt | wc -l)

if
 [ $result_lines -gt 1 ]
 then
 echo  "===Too many records found==="
 echo ""
 echo "$result" 
 echo "       "

  w=0
  while [ $w = 0 ]
  do

 echo "******Enter an Employee ID to specify the search******"
 read theid
        
     id_1=$( grep -i $theid records.txt | wc -l)


       if   
		[ $id_1 -eq 1 ]
                then
			     
             echo ""
             echo "__SEARCH FOUND___"
             echo ""
             grep --color=auto -i $theid records.txt
#

 echo ""
 echo "Enter__ *any number*___ to close employee Records"
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







#

             w=1
             
           
          else
            echo "THE ID ($theid) DOES NOT EXISTS"
            echo "---------Try again-------------"
           sleep 3
        fi
     done

 elif
     [ $result_lines -eq 1 ]
     then
     echo "____ONE RECORD FOUND..____"
     echo ""
     echo "$result"

 echo ""
 echo "Enter__ *any number*___ to close employee Records"
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

     echo "DATA NOT FOUND"
      sleep 4
      clear
fi
 }
echo ""
echo "RETRIEVE(display) AN EMPLOYEE"
echo""

echo "Enter the name to find the record"
echo ""
echo "****IMPORTANT****--The first letter should be capital letter--"
read name

display $name
  
;;


2)
#highest paid employee  and lowest



function high_and_low(){
  #name of highest paid employee and salary
  
  echo "***Below is the name and salary of the heighest paid employee***"       

  high=$(awk 'BEGIN {max =0} {if ($3>max) max=$3} END {print max}' records.txt)
  high2=$(awk -vhigh="$high" '$3==high {print $2}' records.txt)

  echo "Name :Salary"
  echo "$high2:$high"

  #name of the lowest paid employee and salary
  echo ""                               
  echo "***Below is the name and salary of the lowest paid employee***"

  low=$(awk  'BEGIN { min = 19191999999  } {if ($3 < min) min=$3} END {print min }' records.txt)
  low2=$( awk -vlow="$low" '$3==low   {print $2}' records.txt )
 
  echo "Name : Salary"
  echo "$low2 :$low"
  
 echo ""
 echo "Enter__ *any number*___ to close Higest and Lowest Records"
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
echo ""

high_and_low

;;


3)



#total number of employess

function total(){
   echo ""

   total=$(grep "" -c  records.txt)
   echo "Total Number of Employees is :$total"

 echo ""
 echo "Enter__ *any number*___ to close  Record"
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
echo ""
echo "BELOW IS THE TOTAL NUMBER OF ALL EMPLOYEES"

total

;;

4)
#employess above value

function above(){

  awk -vabove="$above" '$3 >above {print $2,$3}' records.txt


  echo ""
  echo "Enter__ *any number*___ to close above  Records"
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

  echo ""
  echo "Enter an Amount and Find Employees earning Above it"
  read above

above

;;

5)

#employees below value

function below(){

  awk -vbelow="$below" '$3 <below {print $2,$3}' records.txt


 echo ""
 echo "Enter__ *any number*___ to close Below Records"
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

echo "Enter an Amount and Find Employees earning Below it"
read below

below

;;

6)

#employees of given department

function given(){

   empty=$(grep "$belong" -c records.txt)

    if  [ $empty -ge "1" ]
         then
          awk -vbelong="$belong" '$4==belong { print $0 }' records.txt


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
              echo "SORRY---There are No employees in ($belong) Department"
              sleep 3
              clear
  fi
}

 echo "Enter Department to find Employees belonging to a given Department"
 echo ""
 echo "**IMPORTANT**::-----The first letter should be a Capital letter-------only (HR)is all capital letters"
 read belong


given

;;

x)
  echo "Loading Dashboard...."
  sleep 1
  sh dashboard.sh
  m=5
;;   

*)
   
   echo "******Invalied input********"
   echo "----Please try again.......------"
   sleep 3
   clear
;;  

esac
done
