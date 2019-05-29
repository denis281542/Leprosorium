
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'


def init_db
	@db = SQlite3::Database.new 'leprosorium.db'
	@db.results_as_hash = true
end

#before do
#	init_db
#end

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/new' do
  erb :new
end

post '/new' do
  content = params[:content]

  if content.length <= 0	
  	@error = 'Type post text'
  	return erb :new
  end

  erb "You typed: #{content}"
end