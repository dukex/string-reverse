require 'rubygems'
require 'sinatra'

get '/' do
  haml :index
end

post '/' do
  @string = params[:text].to_s.reverse
  haml :index
end
