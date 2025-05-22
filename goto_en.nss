// Menu for saving paths for quick navigation

// ───── Menu "Go to" ─────
menu(
   type='drive|dir|back.drive|back.dir|file|desktop'
   title="Go to..."
   pos='top'
   image=\uE14A) 
   {
    $num = 1  // Counter for the record number in the registry
    $regPath = 'HKEY_CURRENT_USER\Software\Nilesoft\Shell'  // Main registry storage path    
    $name = "path" // Name of the key in the registry    
    
    item(
        title="Add current path"
        image=icon.new_folder
        vis=if(num<=5 and sel!=reg.get(regPath, name+'1') and sel!=reg.get(regPath, name+'2') and sel!=reg.get(regPath, name+'3') and sel!=reg.get(regPath, name+'4') and sel!=reg.get(regPath, name+'5'), 'normal', 'disable') 
        
        
        /* Write the value sel (selected) to the registry 
           the next path will be a new record, the old one will remain */
        cmd=reg.set(regPath, name+num, sel, reg.sz) & {num+=1} )
	
      // ───── Additional menu "path" ─────
     menu(
        title="Copy path"
        where=sel.count>0  
        mode='multiple' 
        sep='after'
        image=\uE1BD
        )
        {          
            item(title="Copy (@sel.count) items selected" where=sel.count > 1 cmd=command.copy(sel(false, "\n")))
            item(title=@sel.path tip=sel.path cmd=command.copy(sel.path) image=\uE26D mode='single')
            item(title=sel.parent where=@sel.parent.len>3 cmd=@command.copy(sel.parent) image=\uE26C mode='single')
        }
    

    // ───── Clearing paths in the registry ─────
    item(
        title="Clear"
        // Visible only if at least one path
        where=(reg.exists(regPath, name+'1') or reg.exists(regPath, name+'2') or reg.exists(regPath, name+'3') or reg.exists(regPath, name+'4') or reg.exists(regPath, name+'5'))  
        pos='bottom'
        sep='before'
        image=\uE0CE    
        
        // Resets the counter and registry         
        cmd = {num=1} & for(i=1, i<=5) {reg.delete(regPath, name+i )} )     


       
    // ───── Accessing paths and opening in the current window if possible ─────

    /* Structure:

    $path = get path from reg key
    
    item(title = full path / short path if long
         cmd = open cur or new window OR delete if shift pressed
         where = only if exist in regPath
         image = folder or delete
         tip = full path from reg
        )
    */
    $shift = keys.shift()
    $image_key = if(shift, icon.delete, "\uE1F4")  // shift - remove icon; else folder
    $menu_status = if(shift, "\tremove")

    $path01=reg.get(regPath, name+'1')
	item(title=if(
                  len(path.location.name(path01))==1, 
                  path01 + menu_status, 
                  '...\' + path.location.name(path01) + '\' + path.title(path01) + menu_status) 
		 
         cmd=if(
                window.name=='CabinetWClass' and !shift, 
                command.navigate(path01), 
                path01) &            
             if(
                shift, reg.delete(regPath, name+'1'))
         
         where=path.exists(path01) 
         image=image_key 
         tip=path01
        )

    $path02=reg.get(regPath, name+'2')
	item(title=if(
                  len(path.location.name(path02))==1, 
                  path02 + menu_status, 
                  '...\' + path.location.name(path02) + '\' + path.title(path02) + menu_status) 
		 
         cmd=if(
                window.name=='CabinetWClass' and !shift, 
                command.navigate(path02), 
                path02) &            
             if(
                shift, reg.delete(regPath, name+'2'))
         
         where=path.exists(path02) 
         image=image_key 
         tip=path02
        )

    $path03=reg.get(regPath, name+'3')
	item(title=if(
                  len(path.location.name(path03))==1, 
                  path03 + menu_status, 
                  '...\' + path.location.name(path03) + '\' + path.title(path03) + menu_status) 
		 
         cmd=if(
                window.name=='CabinetWClass' and !shift, 
                command.navigate(path03), 
                path03) &            
             if(
                shift, reg.delete(regPath, name+'3'))
         
         where=path.exists(path03) 
         image=image_key 
         tip=path03
        )
    
    $path04=reg.get(regPath, name+'4')
	item(title=if(
                  len(path.location.name(path04))==1, 
                  path04 + menu_status, 
                  '...\' + path.location.name(path04) + '\' + path.title(path04) + menu_status) 
		 
         cmd=if(
                window.name=='CabinetWClass' and !shift, 
                command.navigate(path04), 
                path04) &            
             if(
                shift, reg.delete(regPath, name+'4'))
         
         where=path.exists(path04) 
         image=image_key 
         tip=path04
        )
    
    $path05=reg.get(regPath, name+'5')
	item(title=if(
                  len(path.location.name(path05))==1, 
                  path05 + menu_status, 
                  '...\' + path.location.name(path05) + '\' + path.title(path05) + menu_status) 
		 
         cmd=if(
                window.name=='CabinetWClass' and !shift, 
                command.navigate(path05), 
                path05) &            
             if(
                shift, reg.delete(regPath, name+'5'))        
         
         where=path.exists(path05) 
         image=image_key 
         tip=path05
        )   
}  
