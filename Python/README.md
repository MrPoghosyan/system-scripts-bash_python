# Delete Directory Script

This Python script allows you to delete files, directories, or both from a specified directory based on user input. It also displays the contents of the directory before and after the deletion.

## Features

- Delete all files within a specified directory.
- Delete all empty directories within a specified directory.
- Delete both files and directories within a specified directory.
- Exit the script without performing any deletions.

## How to Use

1. Place the script in your desired directory.
2. Run the script using Python:
   ```bash
   python3 <script_name.py>
3. You will be prompted to enter a command:

    f: Delete all files in the directory.
    d: Delete all empty directories in the directory.
    al: Delete all files and directories in the directory.
    q: Quit the script without deleting anything.

4. The script will display the contents of the directory before and after the deletion operation.
5. Requirements:
    Python 3.x

Example:
    bash

    Enter command (file->f, directory->d, file & directory->al, quit->q): f
    Deleted file: /home/aranea/Desktop/Delete/example.txt
    ...
    Directory contents after deletion:
    1: some_file.txt


You can customize it further according to your needs.
