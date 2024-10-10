menu(mode="single" title='&Develop' sep=sep.bottom image=\uE26E)
{
	// Open in WezTerm
	item(title="Open WezTerm here" tip=tip_run_admin admin=has_admin cmd='wezterm-gui.exe' args='start --cwd "@sel.dir"')

	// Editors
	menu(title='Editors' mode="single" image=\uE17A)
	{
		item(title='Visual Studio Code' image=[\uE272, #22A7F2] cmd='code' args='"@sel.path"')
		item(title='NeoVim' image="..\\icons\\nvim.svg" cmd='wezterm-gui.exe' args='start --cwd "@sel.dir" nvim "@sel.path"')
		item(type='file' mode="single" title='Notepad' image='@sys.bin\notepad.exe' cmd='@sys.bin\notepad.exe' args='"@sel.path"')
	}


	// File system
	menu(type='file|dir|drive|namespace|back|desktop' mode="single" title='File system' image=\uE043)
	{
		item(type='file|dir|back.dir|drive|desktop' title='Take Ownership' image=[\uE194,#f00] admin
			cmd args='/K takeown /f "@sel.path" @if(sel.type==1,null,"/r /d y") && icacls "@sel.path" /grant *S-1-5-32-544:F @if(sel.type==1,"/c /l","/t /c /l /q")')
		menu(type='file|dir|back.dir|desktop' mode="single" title='Attributes')
		{
			$atrr = io.attributes(sel.path)
			item(title='Hidden' checked=io.attribute.hidden(atrr)
				cmd args='/c ATTRIB @if(io.attribute.hidden(atrr),"-","+")H "@sel.path"' window=hidden)
			
			item(title='System' checked=io.attribute.system(atrr)
				cmd args='/c ATTRIB @if(io.attribute.system(atrr),"-","+")S "@sel.path"' window=hidden)
				
			item(title='Read-Only' checked=io.attribute.readonly(atrr)
				cmd args='/c ATTRIB @if(io.attribute.readonly(atrr),"-","+")R "@sel.path"' window=hidden)
				
			item(title='Archive' checked=io.attribute.archive(atrr)
				cmd args='/c ATTRIB @if(io.attribute.archive(atrr),"-","+")A "@sel.path"' window=hidden)
			separator
			item(title="CREATED" keys=io.dt.created(sel.path, 'y/m/d') cmd=io.dt.created(sel.path,2000,1,1))
			item(title="MODIFIED" keys=io.dt.modified(sel.path, 'y/m/d') cmd=io.dt.modified(sel.path,2000,1,1))
			item(title="ACCESSED" keys=io.dt.accessed(sel.path, 'y/m/d') cmd=io.dt.accessed(sel.path,2000,1,1))
		}
		separator
		menu(separator="after" title=title.copy_path image=icon.copy_path)
		{
			item(mode="single" title=@sel.path tip=sel.path cmd=command.copy(sel.path))
			item(mode="single" type="~file" separator=before where=@sel.parent.len>3 title=sel.parent cmd=@command.copy(sel.parent))
			item(mode="single" type='file|dir|back.dir' separator=before title=sel.file.name cmd=command.copy(sel.file.name))
		}
	}
}
