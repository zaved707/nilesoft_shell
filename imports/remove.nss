// check the docs at https://nilesoft.org/docs/configuration/properties#_filter-properties
remove(find = '"Tools"')
//remove (find='"Edit in Notepad"')
remove (find='"Add to favourites"')
//remove(find='"new"')
remove(find='"undo delete"|"Undo Rename"')
remove(find='"troubleshoot compatibility"')
remove(find='"share"')
remove(find='"send to"')
remove(find='"copy as path"')
//remove(find='"open with visual studio"')

remove(find = 'Open Git')
remove(find='"give access to"')
remove(find='"extract all"')
remove(find='VLC')
remove(find='cast to device')
remove(find='"nilesoft shell"')
remove(find= '"pin to start"')
remove(find= 'Portal')
remove(find= '"include in library"')


// Pattern	                Matches any string that ...   	                        Would match     	Would not match
//  'foo'	        contains the literal string foo anywhere.	                foo, foobar, afoobar	fo, f oo, bar
// '"foo"'	        contains the literal string foo as a whole word only.	    foo, foo/bar, some foo bar	foobar, foofoo, bar
// '*foo'	        ends with the literal string foo.	                        foo, barfoo, bar/foo	foobar, fooo, foo
// 'foo*'	        starts with the literal string foo.	                        foo, foobar, foo/bar	foobar, fo, yeti
// '!foo'	        does not contain the literal string foo anywhere.	        fobar, fo, kung-fu	foo, foobar, barfoo/bar
// '!"foo"'        does not contain the word foo	                            fobar, kung fu bar, foobar	foo, kung foo bar, barfoo/bar
// '!*foo'	        does not contain a word ending on foo	                    foobar, fooo-fo	foo, foo bar, bar/foo
// 'foo*!'	        does not contain a word starting with foo	                myFooBar, barFoo	foo, foobar, fo-fooo

// For dynamic items the following syntax allows to match against file extensions:


// Pattern	Matches any file extension ...	Would match	Would not match
// '.exe'	equal to .exe	setup.exe, notepad.exe	install.bat, shell.nss, shell.ex_, file without an extension.
// '!.exe'	not equal to .exe	setup.exe.zip, video.mp4, shell.ex_, file without an extension.	setup.exe, shell.exe
// '.exe|.dll'	equal to either .exe or .dll	shell.exe, shell.dll	shell.zip, shell.nss, file without an extension.
// In	mi	Specifies the existing submenu where the modify target is located.
// Syntax
// in = "New"
// in = "Sort By"
