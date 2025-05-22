import sys
import os

def create_file(directory, extension):
    if not os.path.exists(directory):
        print(f"The directory '{directory}' does not exist.")
        return

    base_name = "new_file"
    counter = 0
    file_path = os.path.join(directory, f"{base_name}{extension}")

    # Keep incrementing the counter until we find a filename that doesn't exist
    while os.path.exists(file_path):
        counter += 1
        file_path = os.path.join(directory, f"{base_name}_{counter}{extension}")

    # Create the file
    with open(file_path, 'w') as file:
        file.write("")
    print(f"File created successfully at '{file_path}'")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: program.py <directory_path> <file_extension>")
    else:
        directory_path = sys.argv[1]
        file_extension = sys.argv[2]
        create_file(directory_path, file_extension)
