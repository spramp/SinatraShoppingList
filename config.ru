require 'sinatra/base'

require('./controllers/application')
require('./controllers/home')
require('./controllers/items')
require('./controllers/user')
require('./models/item')
require('./models/account')

map('/') { run HomeController }
map('/users') { run UserController }
map('/items') { run ItemsController }
