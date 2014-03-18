# EXAMPLE 2:
#
# Work queues

# This example builds off of the previous one...

require "bunny"

puts 'Creating a connection object.'
connection = Bunny.new

puts 'connecting to it'
connection.start

puts 'Creating a channel'
channel    = connection.create_channel

puts 'Creating a task_queue'
queue      = channel.queue("task_queue", :durable => true)

iterations = ARGV.empty? ? 5 : ARGV[0].to_i

puts "Simulating the creation of #{iterations} tasks"
iterations.times do |iter|
  Thread.new do
    sleep 0.2 * iter # Let's stagger the incoming tasks
    queue.publish("Iteration number #{iter}", :persistent => true)
    puts "Created task number #{iter} in a seperate thread."
  end
end

puts 'waiting for jobs to finish'
sleep iterations * 0.25

puts 'Closing connection'
connection.close