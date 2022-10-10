#!/bin/bash/
#create sh


function create(){


#:while loop used to create more than one account IF NESESSARY=============
               
w=0
while [ $w = 0 ]
do
             

echo "****CREATE NEW EMPLOYEE (DATA)***"
echo " "
echo "****Enter the name****"
echo ""
echo "**IMPORTANT***--Note--First letter sholud be a capital letter only"
read name
echo "****Enter salary****"
read salary
#DEPARTMENT INPUT==================================================                     
    p=0
    while [ $p = 0 ]
    do

            echo "****(HR, Mark, Tech)-- choice department (a=Hr, b=Mark, c=Tech)**** "
             read choice

           case  "$choice" in
                a)
                echo "----You selected -- Hr-- as the new employee department---- "
                Dept=HR
                p=1
                ;;
                b)
                echo "----You selected --Mark-- as the new employee department----"
                 Dept=Mark
                 p=1
                 ;;
                c)
                 echo "----You selected --Tech-- as the new employee department----"
                Dept=Tech
                p=1
                ;;
                *)
                echo "____The department entered does not exists ::$choice"
                echo "____Try again____"
                sleep 1
                ;;
         esac
     done
#==========================END OF DEPARTMENT INPUT===========================================

                       name1=$name


                        sub=`expr substr $name1 1 3`

                        x=$(date +-%y%m%d-%H:%M:%S)
                        empID=$sub$x

                        echo ""                                 
                        echo "****You entered the following DATA****"
                        echo ""
                        echo "EmpID  :: $empID "
                        echo "Name   :: $name"
                        echo "Salary :: $salary"
                        echo "Dept   :: $Dept"
                        echo ""

                        echo "****---COMFIRM---Do you want to save data to records file ?  (y = yes, n = no)****"
                        read answer

                        if 
                                [ $answer == 'y' ]

                        then
                                echo "-----------Data entered saved to records-----------"
                                echo "$empID $name $salary $Dept  " >> records.txt
                                echo "     "

                       elif
                             [ $answer == 'n' ]
                        then


                                echo "******Data entered not saved to records**********"
                                echo "   "
                        else

                                echo "***An expected option entered!!!!***"

                        fi


                            echo "****Do you want to create another account (y=yes, n=no)****"
                                read input


                                         if 
                                                [ $input == "y" ]
                                        then
                                                echo " "
                                                echo "__create another account___"
                                        else

					                     echo ""            
                                             echo "___THANK YOU___GOOD BYE___"
                                             echo "      "
                                             w=1

					    #Going Back to Menu	
					    sh dashboard.sh						
                                        fi



done
}
echo "________welcome_______"
echo"" 

create


