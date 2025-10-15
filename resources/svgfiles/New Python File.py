import os
import requests
from bs4 import BeautifulSoup

# URL of the directory containing SVG files
url = "https://www.alucoildesign.com/assets/js/ionicons/svg/"

# Folder to save the downloaded SVGs
output_folder = "icons"
os.makedirs(output_folder, exist_ok=True)

# Fetch the HTML content of the directory
response = requests.get(url)
if response.status_code != 200:
    print(f"Failed to fetch the directory: {response.status_code}")
    exit()

# Parse the HTML to find all SVG file links
soup = BeautifulSoup(response.text, "html.parser")
svg_links = [a["href"] for a in soup.find_all("a") if a["href"].endswith(".svg")]

# Function to convert black SVGs to white
def convert_black_to_white(svg_content):
    soup = BeautifulSoup(svg_content, "xml")  # Use the 'lxml' parser for XML content
    for path in soup.find_all("path"):
        if not path.get("fill"):  # If no fill attribute is set, assume it's black
            path["fill"] = "white"
    return str(soup)

# Download and process each SVG file
for svg_link in svg_links:
    svg_url = url + svg_link
    svg_response = requests.get(svg_url)
    if svg_response.status_code == 200:
        # Convert black to white
        white_svg = convert_black_to_white(svg_response.text)
        
        # Save the modified SVG to the icons folder
        with open(os.path.join(output_folder, svg_link), "w", encoding="utf-8") as file:
            file.write(white_svg)
        print(f"Downloaded and converted: {svg_link}")
    else:
        print(f"Failed to download: {svg_link}")

print("All SVGs downloaded and converted successfully!")
