import os
import shutil  # For deleting directories with contents

delet_dir = "/home/aranea/Desktop/Delete"  # Specify the working directory

if not os.path.exists(delet_dir):
    print(f"No directory to delete: {delet_dir}")
    exit(1)

# Display the contents of the directory before deletion
print("Directory contents before deletion:")
count = 1
for item in os.listdir(delet_dir):  # Or os.listdir("/home/aranea/Desktop/Delete")
    print(f"{count}: {item}")
    count += 1

# Request a command from the user
comand = input("Enter command (file->f, directory->d, file & directory->al, quit->q): ")

# Process the command
if comand == "f":
    for root, dirs, files in os.walk(delet_dir):
        for file in files:
            file_path = os.path.join(root, file)
            os.remove(file_path)
            print(f"Deleted file: {file_path}")
elif comand == "d":
    for root, dirs, files in os.walk(delet_dir, topdown=False):
        for dir in dirs:
            dir_path = os.path.join(root, dir)
            try:
                os.rmdir(dir_path)
                print(f"Deleted directory: {dir_path}")
            except OSError as e:
                print(f"Error deleting directory {dir_path}: {e}")
elif comand == "al":
    shutil.rmtree(delet_dir)
    print(f"All files and directories have been deleted: {delet_dir}")
elif comand == "q":
    print("Quit command received. Exiting the script.")
    exit(0)
else:
    print("Invalid command.")
    exit(1)

# Display the contents of the directory after deletion
print("Directory contents after deletion:")
if os.path.exists(delet_dir):
    count1 = 1
    for item in os.listdir(delet_dir):
        print(f"{count1}: {item}")
        count1 += 1
else:
    print("Directory does not exist.")

