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
***CSV File Handling***
---
```


```
***TXT File Handling***
---
```


```
























