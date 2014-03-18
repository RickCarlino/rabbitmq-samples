# EXAMPLE 1 - 1:
#
# Publishing a simple message
#
# TIP: Install the management plugin to 
# follow along visually https://www.rabbitmq.com/management.html
require "bunny"

puts 'Create a new connection.'
connection = Bunny.new(:hostname => "localhost")

puts 'Connect.'
connection.start

puts 'Create a channel.'
channel    = connection.create_channel

puts 'Create a queue so that you have something to publish messages to.'
queue      = channel.queue("hello")

puts 'saying "hello, world!" on the "hello" queue.'
channel.default_exchange.publish("Hello World!", :routing_key => queue.name)

puts 'Closing up shop.'
connection.close