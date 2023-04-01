# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.

#!/bin/bash
#Gets file as first proitional argument
file=$1
#Determines the total number of pokemon
total_mons=$(awk 'END {print NR-1}' $file)
#Calculates the average of both the HP and attack numbers of all the pokemon using awk 
HP_Avg=$(awk '{sum+=$6} END {print sum/NR-1}' $file)
Atk_Avg=$(awk '{sum+=$7} END {print sum/NR-1}' $file)
#Prints the summary of the file
echo "===== SUMMARY OF DATA FILE ====="
echo "   File name: $file"
echo "   Total Pokemon: $total_mons"
echo "   Avg. HP: $HP_Avg"
echo "   Avg. Attack: $Atk_Avg"
echo "===== END SUMMARY ====="
