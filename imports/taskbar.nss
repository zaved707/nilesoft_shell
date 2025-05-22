menu(type="taskbar" pos=0 title=app.name image=\uE249)
{
	item(title="config" image=\uE10A cmd='"@app.cfg"')
	item(title="manager" image=\uE0F3 admin cmd='"@app.exe"')
	item(title="directory" image=\uE0E8 cmd='"@app.dir"')
	item(title="version\t"+@app.ver vis=label col=1)
	item(title="docs" image=\uE1C4 cmd='https://nilesoft.org/docs')
}
menu(where=@(this.count == 0) type='taskbar' image=icon.settings expanded=true)
{
	item(title=title.taskbar_Settings sep=both image=inherit cmd='ms-settings:taskbar')
	//item(vis=key.shift() title=title.exit_explorer cmd=command.restart_explorer)
}