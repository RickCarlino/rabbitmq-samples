# Example 2-2: A simple worker on a task queue

require 'bunny'

connection = Bunny.new

connection.start

channel = connection.create_channel

queue   = channel.queue('my_queue1')


queue.subscribe(:ack => true, :block => true) do |delivery_info, properties, body|
  puts "Message: #{body}"
  # Let's pretend that this job worker has some really 'expensive' task to do.
  # We will sleep for 1 second for every period in the message.
  sleep body.count(".").to_i
  puts "Finishing the job."

  channel.ack(delivery_info.delivery_tag)
end