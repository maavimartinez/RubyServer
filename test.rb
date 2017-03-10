require 'socket'

server = TCPServer.new 2000
loop do
  Thread.start(server.accept) do |client|
    loop do
      request = client.gets
      puts 'Requested entered:'
      puts request
      client.puts request
      client.puts "Time is #{Time.now}"
    end
    client.close
  end
end