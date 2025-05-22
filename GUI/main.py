from nicegui import ui

# Function to handle button click
def on_button_click():
    text = text_input.value
    ui.notify(f'You entered: {text}')

# Create a container with centered content

text_input = ui.input(label='Enter some text')
ui.button('Show Text', on_click=on_button_click)

# Run the NiceGUI app
ui.run()