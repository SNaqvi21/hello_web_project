require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  # configure :development do
  #   register Sinatra::Reloader

  post '/sort-names' do
    names = params[:names]
    names.split(",").sort.join(",")
  end


  post '/submit' do
    name = params[:name]
    message = params[:message]
    "Thanks #{name}, you sent this message: #{message}"
  end

  get '/names' do
    result = params[:names] 
    return result
    # names = "Julia, Mary, Karim"
  end

  get '/' do
    return "Hello World!"  
  end

  get '/hello' do

    name = params[:name]
    return "Hello #{name}"
  end

  get '/posts' do
    name = params[:name]
    cohort_name = params[:cohort_name]

    return "Hello #{name} you are studying the #{cohort_name} cohort!"
  end

  post '/posts' do

    title = params[:title]

    return "Post was created with title: #{title}"
  end
end
#Example when Sinatra receives a request
# GET /

class Application < Sinatra::Base 
  # ...

  post '/' do
    # This route is not executed (the method doesn't match).
  end

  get '/hello' do
    # This route is not executed (the path doesn't match).    
    name = params[:name]
    return "Hello #{name}"
  end

  get '/' do
    # This route matches! The code inside the block will be executed now.
  end

  get '/' do
    # This route matches too, but will not be executed.
    # Only the first one matching (above) is.
  end
end

# ROUTES 
# GET / => executes some code
# GET 
# # Declares a route that responds to a request with:
#   #  - a GET method
#   #  - the path /
# get '/' do
#     # This Ruby block between the do and end associated 
#     # with a method and path is called a "route" or "route 
#     # block". The code in this block is executed only is 
#     # the received request matches the method and path.

#     # When Sinatra received a request, it looks through all
#     # the route blocks configured in that class, and 
#     # execute the code of the first one matching the request.
#     # The code here is executed when a request is received,
#     # and need to send a response. 

#     # We can simply return a string which
#     # will be used as the response content.
#     # Unless specified, the response status code
#     # will be 200 (OK).
#     return 'Some response data'
#   end
# end