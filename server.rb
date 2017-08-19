# Script 15.1 - server.rb

# Include the library:
require 'socket'

# Create the object:
server = TCPServer.open(11000)

# Print a message:
STDOUT.puts 'The server is running. Press Control + C to terminate.'

while client = server.accept
  
  # Send the client the message:
  client.puts 'Hello, Socket World!'

  # Close the connection:
  client.close
  
end