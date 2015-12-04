require 'sinatra/base'

require('./controllers/application')
require('./controllers/task')
require('./models/task')

map('/') { run TaskController }
