# EXAMPLE 1 - 2:
#
# Getting a message off of a queue.

require "bunny"

#Create connection object
connection = Bunny.new

#Start the connection
connection.start

# Create a channel (incase it hasn't been made already)
channel   = connection.create_channel

# Create or lookup the 'hello' queue for the channel
queue     = channel.queue("hello")

puts "Will now wait for messages on the #{queue.name} queue."

# FYI: Passing a `block: true` option stops the script from exiting prematurely.
queue.subscribe(:block => true) do |delivery_info, properties, body|
  puts "New message: #{body}"

  # cancel the consumer to exit
  delivery_info.consumer.cancel
end