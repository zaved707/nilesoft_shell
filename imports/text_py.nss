//this uses python in the backend hence text_py.nss
$full=sel.path()+' .txt'
item(title='Newfile Txt' type='*' position=top  dir=app.directory() cmd='python_scripts\createtext.py' arg=full)

$full2=sel.path()+' .py'
item(title='Newfile Py' type='*' position=top  dir=app.directory() cmd='python_scripts\createtext.py' arg=full2)