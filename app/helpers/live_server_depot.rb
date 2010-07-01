# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'singleton'
class LiveServerDepot
  include Singleton



  def servers()
#    return @live_servers
    Server.find(:all)
  end
  
  def update_servers(s)
    puts 'received', s["name"]
    server = Server.new
    server.alias = s["name"]
    server.private_ip = s["private_ip"]
    server.public_ip = s["public_ip"]
    server.private_name = s["private_name"]
    server.public_name = s["public_name"]
    server.status = s["status"]
    server.type = s["type"]
#    server.accounts
#    server.save

    self.add_server(server)
  end

  def add_server(server)
    puts "adding server #{server.alias}"
    current_server = @live_servers.find {|s| s.alias==server.alias}
    if current_server
      puts "alredy exists #{@live_servers}"
    else
      @live_servers << server
#      save to db
      server.save unless Server.find_by_alias(server.alias)
      puts "servers count:#{@live_servers.size}"
    end
  end

  def shutdown_by_alias(a)
    puts "trying to remove #{a} in #{@live_servers.size}"
    @live_servers.remove {|s| s.alias==a}
  end

  def find_by_alias(a)
    puts "trying to find #{a} in #{@live_servers.size}"
    server = @live_servers.find {|s| s.alias==a}
    if not server
      server = Server.find_by_alias(a)
    end
  end
  
  private
  def initialize
    puts 'initializing....'
    @live_servers = []
  end
end
