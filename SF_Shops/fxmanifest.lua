fx_version 'adamant'
game 'gta5'

ui_page "ui.html"

client_scripts {
	'locale.lua',
    'config.lua',
    'client.lua',	
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'locale.lua',
	'config.lua',
	'server.lua',
}
 
 
files {
    'ui.html',
	'style.css',
	'img/*.png',
	'img/*.jpg',
	'font.otf',
	'index.js',
}