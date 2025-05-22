import os
import win32com.client
from win32com.client import Dispatch

def get_shortcut_details(lnk_path):
    """Extract details from a .lnk file."""
    shell = Dispatch('WScript.Shell')
    shortcut = shell.CreateShortCut(lnk_path)
    return {
        'title': os.path.splitext(os.path.basename(lnk_path))[0],  # Shortcut name without extension
        'target': shortcut.TargetPath,  # Target path of the shortcut
        'icon': shortcut.IconLocation  # Icon location
    }

def get_pinned_taskbar_items():
    """Get all pinned taskbar items."""
    # Specify the full path to the taskbar items folder
    pinned_path = r"C:\Users\Zaved\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar"
    if not os.path.exists(pinned_path):
        raise FileNotFoundError("Pinned taskbar items directory not found.")
    
    pinned_items = []
    for item in os.listdir(pinned_path):
        if item.endswith('.lnk'):
            lnk_path = os.path.join(pinned_path, item)
            details = get_shortcut_details(lnk_path)
            pinned_items.append(details)
    return pinned_items

def write_to_file(items, output_file):
    """Write pinned items to a file in the specified format."""
    with open(output_file, 'w') as f:
        for item in items:
            print(item['icon'])
            if item['icon'] == ",0":
                print(True)
                f.write(f"item(title='{item['title']}' image cmd='{item['target']}')\n")
            else:
                print(False)
                f.write(f"item(title='{item['title']}' image=image.res('{item['icon'][:-2]}') cmd='{item['target']}')\n")
            #,,
def main():
    # Specify the output file path with double backslashes or raw string
    output_file = r"D:\Appdatazaved\nilesoft_shell\python_scripts\pinneditems.nss"
    try:
        pinned_items = get_pinned_taskbar_items()
        write_to_file(pinned_items, output_file)
        print(f"Pinned taskbar items have been written to {output_file}")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()