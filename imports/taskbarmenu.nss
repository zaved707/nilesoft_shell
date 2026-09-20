menu(title='Nilesoft Shell' image = image.glyph(\uE249,18)  sep=both type='taskbar' )
{
	import '@app.directory/custom_imports/nilesoftShellMenu.nss'
}
import '@app.directory/imports/images.nss'
// item(title='Hello, World!' cmd=msg('Hello @user.name') type= 'taskbar')
item (title = 'Taskbar Settings' image= icon.taskbar_settings cmd = ('ms-settings:taskbar') type= 'taskbar')
//item(title = 'Open Windhawk' cmd= 'windhawk' image= image.res('@app.directory/resources/images/windhawk.png')type= 'taskbar')