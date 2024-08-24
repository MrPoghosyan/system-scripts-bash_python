#!/bin/bash

delet_dir="/home/aranea/Desktop/Delete/"
cd "$delet_dir" || { echo "No directory to delete: $delet_dir"; exit 1; }

ls -tmpa # Показываем содержимое каталога/See contents


# Запрашиваем у пользователя команду/Ask the user for a command
read -p "Enter command (File->f, Directory->d, All->al, Quit->q): " comand

# Обработка команды/Process command
if [[ "$comand" == "f" ]]; then
    find "$delet_dir" -type f -exec rm -f {} \;
    echo "All files have been deleted."
elif [[ "$comand" == "d" ]]; then
    find "$delet_dir" -type d -empty -exec rmdir {} \;
    echo "All empty directories have been removed."
elif [[ "$comand" == "al" ]]; then
    rm -rf "$delet_dir"*
    echo "All files and directories have been deleted."
elif [[ "$comand" == "q" ]]; then
    echo "Quit command received. Exiting the script."
    exit 0
else
    echo "Invalid command."
    exit 1
fi

echo "Directory contents after deletion:"
ls -tmpa

