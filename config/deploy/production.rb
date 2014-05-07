# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
# Don't declare `role :all`, it's a meta role
role :lb, %w{root@199.116.138.59}
role :www, %w{root@199.116.138.60}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
server '199.116.138.59', user: 'root', roles: %w{lb} #, my_property: :my_value
server '199.116.138.60', user: 'root', roles: %w{www} #, my_property: :my_value

##
# Proxy doesn't work. Instead, let db be manual deploy. 
#server '10.239.96.12', user: 'root', roles: %w{db},
#  ssh_options: {
#    proxy: Net::SSH::Proxy::Command.new('ssh 199.116.138.59 -W %h:%p'),
#  }

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
# and/or per server
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
# setting per server overrides global ssh_options
