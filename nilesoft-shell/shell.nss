settings
{
	priority=1
	exclude.where = !process.is_explorer
	showdelay = 200
	// Options to allow modification of system items
	modify.remove.duplicate=1
	tip.enabled=true
}

import 'extras/imports/theme.nss'
import 'extras/imports/images.nss'

import 'extras/imports/modify.nss'

menu(mode="multiple" title=title.more_options image=icon.more_options)
{
}

import 'extras/imports/develop.nss'
import 'extras/imports/taskbar.nss'

// ----------------------------------------
// Disabled modules
// import 'extras/imports/file-manage.nss'
// import 'extras/imports/goto.nss'
// ----------------------------------------
