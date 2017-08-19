# Script 15.2 - server2.rb

# Include the library:
require 'socket'

# Create the object:
server = TCPServer.open(11000)

# Print a message:
STDOUT.puts 'The server is running. Press Control + C to terminate.'

# Run continuously:
loop do
  
  # Each connection is a new thread:
  Thread.new(server.accept) do |client|
    
    # Greet the client:
    client.print 'Connected!'
    client.print 'Enter a command ("quit" to terminate): '
  
    # Get the input:
    while input = client.gets
      
      # Drop the newline:
      input.chomp!
      
      # Terminate?
      break if input == 'quit'
      
      # Print some messages:
      STDOUT.puts "#{client.peeraddr[2]}:#{client.peeraddr[1]} entered: '#{input}'"
      client.puts "You entered '#{input}'."
      client.print 'Enter a command ("quit" to terminate): '
      client.flush
      
    end # End of while loop.
    
    # Close the connection:
    client.puts 'Terminating the connection...'
    client.flush
    client.close
    
  end # End of Thread.new

end # End of loop. 