fx_version 'cerulean'
games { 'rdr3' }

author 'rbfussell'
description "RF: Players Can Build"
version '0.0.0.pre-a'

client_scripts {
    'client/main.lua',
    'client/events.lua',
    'config/config.lua'
}

server_scripts {
    'server/main.lua',
    'server/note.lua',
    '@mysql-async/lib/MySQL.lua',
    'config/config.lua'
}

files {
    'config/note.js',
    'config/config.lua'
}

data_file 'DLC_ITYP_REQUEST' 'custom_objects/*/*.ytyp'

dependencies {
    'redem',
    'redemrp',
    'redemrp_inventory',
    'mysql-async'
}
