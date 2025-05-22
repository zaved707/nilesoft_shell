$app1 = 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\IrfanView\IrfanView 64 4.70.lnk'
$app2 = '@sys.bin\calc.exe'
item(title='Test' type='*' commands {
	cmd = msg('Hi') wait='true',
	cmd = app1, 
	cmd = app2, } )

