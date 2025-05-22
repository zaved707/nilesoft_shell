
	item(title='Start Menu' image=image.glyph(0xE1b8) cmd=user.startmenu())
	item(title='User Folder' image=0xe0e3 cmd=user.dir())
	
	menu(title='Apps' image = image.glyph(0xe251))
		{
			item(title='Apps-Features' image=inherit cmd='ms-settings:appsfeatures')
			item(title='Default-Apps' image=inherit cmd='ms-settings:defaultapps')
			item(title='Optional-Features' image=inherit cmd='ms-settings:optionalfeatures')
			item(title='Startup' image=inherit cmd='ms-settings:startupapps')
			item(title='Startup Apps' image=image.glyph(0xE1aa) cmd='explorer' args='C:\Users\Zaved\AppData\Roaming\Microsoft\Windows\Start Menu\Programs')
}