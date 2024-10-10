﻿settings
{
	priority=1
	exclude.where = !process.is_explorer
	showdelay = 200
	// Options to allow modification of system items
	modify.remove.duplicate=1
	tip.enabled=true
}

import 'imports/theme.nss'
import 'imports/images.nss'

import 'imports/modify.nss'

menu(mode="multiple" title=title.more_options image=icon.more_options)
{
}

import 'imports/terminal.nss'
import 'imports/develop.nss'
import 'imports/taskbar.nss'

// ----------------------------------------
// Disabled imports
// import 'imports/file-manage.nss'
// import 'imports/goto.nss'
// ----------------------------------------