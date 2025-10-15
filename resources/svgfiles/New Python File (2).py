import os

def rename_files_in_folder(folder_path):
    # Check if the folder exists
    if not os.path.exists(folder_path):
        print(f"The folder '{folder_path}' does not exist.")
        return

    # Iterate through all files in the folder
    for filename in os.listdir(folder_path):
        # Construct the full file path
        file_path = os.path.join(folder_path, filename)

        # Skip directories
        if os.path.isdir(file_path):
            continue

        # Check if the filename contains a '-' and rename it
        if '-' in filename:
            # Split the filename at the '-' and keep the part after it
            new_filename = filename.split('-', 1)[1]

            # Construct the new file path
            new_file_path = os.path.join(folder_path, new_filename)

            # Rename the file
            os.rename(file_path, new_file_path)
            print(f"Renamed: '{filename}' -> '{new_filename}'")
        else:
            print(f"Skipped: '{filename}' (no '-' in the name)")

if __name__ == "__main__":
    # Specify the folder path
    folder_path = input("Enter the path to the folder: ").strip()

    # Call the function to rename files
    rename_files_in_folder(folder_path)
