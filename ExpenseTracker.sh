#!/bin/bash
≈
csvFile="Expense.csv"

createOnceFile(){
	echo "ID,DATE,AMOUNT,TAG" > "$csvFile"
}

add_expense(){
    last_id=$(tail -n 1 "$csvFile" | cut -d',' -f1)
    if [[ "$last_id" =~ ^[0-9]+$ ]]; then
        new_id=$((last_id + 1))
    else
        new_id=1
    fi
    echo "Enter DATE (e.g., 2025-07-10):"
    read date
    echo "Enter AMOUNT:"
    read amount
    echo "Enter TAG:"
    read tag
    echo "$new_id,$date,$amount,$tag" >> "$csvFile"
    echo "Expense added with ID $new_id."
}

show_all_expense(){
    echo "-----------Showing all expenses-----------"
    echo "   DATE     AMOUNT    TAG"
    tail -n +2 "$csvFile" | sort -t',' -k2 -r | cut -d',' -f2- | column -t -s,
    echo "-------------------------------------------"
}


update_expense(){
    if [ ! -f "$csvFile" ]; then
        echo "File does not exist."
        return
    fi

    echo "All expenses with ID:"
    column -t -s, "$csvFile"

    echo "Enter ID to update:"
    read id

    # Find the line
    line=$(grep "^$id," "$csvFile")
    if [ -z "$line" ]; then
        echo "Record not found."
        return
    fi

    # Split old values
    old_date=$(echo "$line" | cut -d',' -f2)
    old_amount=$(echo "$line" | cut -d',' -f3)
    old_tag=$(echo "$line" | cut -d',' -f4)

    echo "Enter new DATE (old: $old_date) or * to keep:"
    read new_date
    echo "Enter new AMOUNT (old: $old_amount) or * to keep:"
    read new_amount
    echo "Enter new TAG (old: $old_tag) or * to keep:"
    read new_tag

    # Use old value if user typed *
    [ "$new_date" = "*" ] && new_date="$old_date"
    [ "$new_amount" = "*" ] && new_amount="$old_amount"
    [ "$new_tag" = "*" ] && new_tag="$old_tag"

    tmpfile=$(mktemp)
    awk -F, -v id="$id" -v date="$new_date" -v amount="$new_amount" -v tag="$new_tag" 'BEGIN{OFS=","}
    $1==id {$2=date; $3=amount; $4=tag} {print}' "$csvFile" > "$tmpfile"
    mv "$tmpfile" "$csvFile"

    echo "Expense updated."
}


delete_expense(){
    echo "Enter ID to delete:"
}

show_expense_of_tag(){
    echo "Enter TAG to filter expenses:"
}

show_date_range_expense(){
    echo "Enter start date (YYYY-MM-DD):"
}

show_expense_overview(){
    echo "Expense Overview:"
}

if [ -f "$csvFile" ]; then
	echo " Welcome to Expense Tracker "
else
	createOnceFile
fi

while true; do
	echo "-------Menu--------"
	echo "1.Add Expense"
	echo "2.Show All Expense"
	echo "3.Update Expense"
	echo "4.Delete Expense"
	echo "5.-- "
	echo "6.Show Expense of Tag"
	echo "7.Show Expense of a Date Range"
	echo "8.Show Expense Overview"
	echo "9.Exit"
	read -p "Enter Menu:" menu
	case $menu in
		1) add_expense ;;
		2) show_all_expense ;;
		3) update_expense ;;
		4) delete_expense ;;
		5) exit ;; #change it with your feature
		6) show_expense_of_tag ;;
		7) show_date_range_expense ;;
		8) show_expense_overview ;;
	 	9) exit ;;
		*) echo "Invalid Input" ;;
	esac
done

