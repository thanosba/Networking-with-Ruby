
# Include the library:
require 'open-uri'

# Start a block:
begin

  # Open the resource, providing basic authentication:
  open('http://www.dmcinsights.com/ruby/ruby_test.php', :http_basic_authentication => ['Chicago', 'Bears']) { |http|
  
    # Display some information about the page:
    puts "Content-type: #{http.content_type}"
    puts "Status: #{http.status[1]}"
    puts '--------------'
  
    # Display the page's content:
    puts http.read

  }

rescue => e
  puts "The connection could not be made: #{e.message}"
end 
