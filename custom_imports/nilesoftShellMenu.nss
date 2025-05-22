

item(title='Reload' type='*|taskbar' image = image.glyph(\uE045,27) cmd=app.reload)
	
	item(title='Unload' type='*|taskbar' image =\uE12f cmd=app.unload)
	item(title='docs' cmd='C:\Users\Zaved\AppData\Local\BraveSoftware\Brave-Browser\Application\brave.exe' 
	args='https://nilesoft.org/docs'
	image=image.glyph(\uE141,18))
	item(title="Directory" image=\uE0E8 cmd='"@app.dir"' col=1)
	item(title='Config' image = image.glyph(\uE26E,18) dir=app.directory() cmd='code' args='.')