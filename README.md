# Linux Shell Script

***Basic .sh File Opearion***
---
**Create New File**
```
touch fileName.sh
```
**Make it Executeable**
```
chmod +x fileName.sh
```
**To Edit and Write Code Inside the File**
```
nano fileName.sh

#!/bin/bash  
#Code here

```
**To Run The Script**
```
./fileName.sh
```
***Variables & Data Types***
---
Everything is string by default in bash, but you can do arithmetic:</br>
```
#!/bin/bash
name="Zia"
a=10
b=20
ans=$((a+b))
echo "Sum of $a and $b is $ans"
```

***Read Write***
---
```
#!/bin/bash
read -p "Enter Number:" num
echo "The Number is $num"
```

***Conditions (if, else, elif)***
---
```
#!/bin/bash
a=10
b=20
name="Zia"

# Condition inside [ ....... ]
if [ "$a" -gt "$b" ]
then
  echo "$a is greater than $b"
elif [ "$a" -eq "$b" ]
then
  echo "$a is equal to $b"
else
  echo "$a is less than $b"
fi


# For complex condition 
if [[ "$name" == Z* && "$a" -lt 100 ]]; then
  echo "Name starts with Z and a is less than 100"
fi
```

***Case or Switch***
---
```
#!/bin/bash
read -p "Enter Number:" num
case $num in
    1)
       echo "It's One"
       ;;
    2)
       echo "It's Two"
       ;;
    *)
       echo "It's Greater Then Two"
       ;;
esac
```
***Loop***
---
```
#!/bin/bash

# For Loop on Particular Value
for i in 1 2 3; do
  echo -e "Number: $i\n"
done

# For Loop on Range Value
for i in {1..3}; do
  echo -e "Number: $i\n"
done

# While Loop
count=1
while [ $count -ls 3 ]; do
  echo "Count: $count"
  count=$((count+1))
done

# Until Loop
count=1
until [ $count -gt 3 ]; do
  echo "Until Count: $count"
  count=$((count+1))
done

# Infinite Loop
count=1
while true; do
  echo "$count"
  count=$((count + 1))
  if [ $count -eq 3 ] ;then
    break
  fi
done  

```

***Array***
---
```
#!/bin/bash

numbers=("One" "Two" "Three")
echo "First Value is ${numbers[0]}"
echo "All Values ${numbers[@]}"

# Using Loop Iterate on each value
for i in ${numbers[@]};do
   echo -e "Values $i\n"
done

# Add single value 
numbers+=( "Four" )

# Add multiple value
numbers+=( "Five" "Six" )

# Remove Value  at 1st index
unset numbers[1]

# Length
echo "Length: ${#numbers[@]}"
echo "Length of first element: ${#numbers[0]}"

# Subset generate , first 2 Value
subset=${numbers[@]:0:2}

# Sort Value
sorted=($(printf "%s\n" "${numbers[@]}" | sort))

# Remove Duplicate
numbers+=("One")
unique=($(printf "%s\n" "${numbers[@]}" | sort | uniq))

```
***Function***
---
```
#--Without arguments--#
say_hello() {
  echo "Hello, World!"
}
#To call the function just write: say_hello

#--With arguments--#
greet() {
  echo "Hello, $1!"
  echo "second argument was: $2"
}

greet "Zia_1st arg" "extra info 2nd arg"

```
***CSV File Handling***
---
```
#-----To Create a CSV file-----#
CSV_FILE="data.csv"
create_file() {
    echo "ID,Name,Age" > "$CSV_FILE"
}

#-----To Add a Data row-------#
add_data() {
    echo "$id,$name,$age" >> "$CSV_FILE"
    echo "Data added."
}

#-----To Show all Data -------#
-> -t → creates a table layout
-> -s, → tells column that the separator is a comma 
show_data() {
    echo "All data:"
    column -t -s, "$CSV_FILE"
}

#-----To Show specific ID Data -------#
-> searches the CSV file for a line starting with that ID followed by a comma.
-> ^ means start of line.
-> grep "xyz$" file : finds lines that end with xyz.
-> grep "123" file : finds lines containing 123 anywhere (start, middle, or end).

read_data() {
    read -p "Enter ID to search:" id
    grep "^$id," "$CSV_FILE"
}

#----- To Delete Data of specific ID -------#
delete_data() {
    read -p "Enter ID to delete:" id
    tmpfile=$(mktemp)                            : creates a temporary file 
    grep -v "^$id," "$CSV_FILE" > "$tmpfile"     : copies all lines not starting with that ID into the temp file.
    mv "$tmpfile" "$CSV_FILE"                    : replaces the original file with the new one.
    echo "Data deleted."
}

#----- To Update Data of specific ID -------#
update_data() {
    read -p "Enter ID to update:" id
    line=$(grep "^$id," "$CSV_FILE")            : searches for a line that starts with the ID followed by a comma and store in the line variable
    if [ -z "$line" ]; then                     : checks if line is empty.
        echo "Record not found."                 
        return
    fi
    echo "Current data: $line"
    read -p "Enter new Name:" name
    read -p "Enter new Age:" age
    tmpfile=$(mktemp)       
    awk -F, -v id="$id" -v name="$name" -v age="$age" 'BEGIN{OFS=","}     : -F, tells awk the fields/columns are separated by commas.
    $1==id {$2=name; $3=age} {print}' "$CSV_FILE" > "$tmpfile"            : BEGIN{OFS=","} sets the output field separator back to comma
    mv "$tmpfile" "$CSV_FILE"                                            
    echo "Data updated."
}



```
***TXT File Handling***
---
```

```
























