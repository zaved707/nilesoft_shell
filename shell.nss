settings
{
	priority=1
	exclude.where = !process.is_explorer
	showdelay = 200
	// Options to allow modification of system items
	modify.remove.duplicate=1
	tip.enabled=true
}



import 'goto_en.nss'
import 'imports/theme.nss'
import 'imports/images.nss'
import 'imports/remove.nss'


//item(title="ZAVED's\t"+'PC' image=image.glyph(0xE100) type='*|Taskbar' vis=label sep=bottom position=0)


menu(title='Actions' type='*'  image=icon.settings ){
		
	}

menu(title='Nilesoft Shell' image = image.glyph(\uE249,18)  sep=both type='*|taskbar' )
{
	import 'custom_imports/nilesoftShellMenu.nss'
	
	
	
}
item(title = "Reload" cmd= app.reload()  image = image.glyph(\uE045,27) col)
item(title = "Reload" cmd= app.reload() type= 'taskbar' image = image.glyph(\uE045,27) )
modify(find='"open"' image=icon.open_in_new_process)

import 'custom_imports/desktopicons.nss'
modify(find='"sort by"|"view"|"display settings"|"personalise"| new'   pos=bottom )   //desktop icons :-
//modify(find='"refresh"' pos=top)

//modify(find='"take ownership"' pos = top)






modify(find='edit with IDLE' image = \ue230)
modify(find='7-Zip' image = image.svgf('@app.directory\resources\svgfiles\7-Zip_Icon.svg') pos=3)
modify(find='"open"|"cut"|"undo copy"|"copy"|"paste"|"delete"|"rename"|"create shortcut"|"new"|"undo"|"redo"|"select all"|"invert selection"' POS='bottom')
modify(find='pin|unpin|restore previous|"take ownership"' pos=auto)
modify(find='notepad|sharex|visual studio' menu='apps')
modify(find='"open file location"' pos=5 sep=none)
modify(find='"properties"' sep=none)
menu(title='Apps' expanded=true image=icon.settings){
	import 'custom_imports/pro.nss'
	
}
modify(find='"paste into file"' image=icon.paste_shortcut )
