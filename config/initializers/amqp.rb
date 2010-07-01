# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'eventmachine'
require 'amqp'
require 'mq'
require 'json'

puts "starting server status queue listener..."
Thread.new { EM.run }
#AMQP.connect(:host => "192.168.8.128", :user => "guest", :pass => "guest", :vhost => "/")
AMQP.start(:host => "192.168.8.128", :user => "guest", :pass => "guest", :vhost => "/") do
  def log *args
    p [ Time.now, *args ]
  end
#  amq = MQ.new
  MQ.queue('server_status_queue').bind(MQ.direct('bime'), :key=>'server_status').subscribe{ |header, body|
    log header
    log body
    begin
#    parse the json
      j = JSON.parse(body)
      log j["name"], j["private_ip"], j["public_ip"]
      LiveServerDepot.instance.update_servers(j)
    rescue Exception => e
      puts "#{ e } (#{ e.class })!"
    end
  }
end
