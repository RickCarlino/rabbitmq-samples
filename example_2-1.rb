# Example 2 - 1: Work Queues
#
#

require 'bunny'

msg  = ARGV.empty? ? "Hello World!" : ARGV.join(" ")

connection = Bunny.new

connection.start

channel = connection.create_channel

queue   = channel.queue('my_queue1')

queue.publish(msg, :persistent => true)
puts " Sent '#{msg}' to the queue '#{queue.name}'"