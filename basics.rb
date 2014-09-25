require 'sinatra'

get '/hello' do
  "Hello World!"
end

get '/about' do
  "There is something about me!"
end

get '/hello/:name' do
  name_from_url = params[:name]
  "Hello, how are you, #{name_from_url.downcase}?"
end

get '/' do
  "What City?"
  erb :form
end
def search(input_city)
  timezones.each do |i|
    if i.include? input_city
      search_city = i
    end
    return search_city
  end
end


post '/timezone' do

  
  input_city = params [:message]
  timezones = Timezone::Zone.names
  find_zone = timezones.find { |e| /#{city}/ =~ e}
  timezone = Timezone::Zone.new :zone => find_zone
  show_time = timezone.time Time.now
  date_time = show_time.to_s.split('')
  time = date_time[1]
  sp_time = time.split(':')
  hours = sp_time[0]
  mins = sp_time[1]
  if hours.to_i >12
  	new_hours = hours.to_i -12
  	suffix = "PM"
  else
  	new_hours = hours
  	suffix = "AM"
  end
"The current time in #{params[:message]} is" + new_hours.to_s + mins.to_s + suffix
  
  
end