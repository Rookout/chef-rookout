#
# Cookbook:: chef-rookout-agent
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

#Download the agent setup file
remote_file '/tmp/rookout_setup.sh' do
    source 'https://get.rookout.com'
    owner   'root'
    group   'root'
    mode '0755'
    action :create
  end
  
  #Start the agent 
  service 'rookout-agent' do
    action :nothing
  end
  
  #Install the agent as a service daemon
  execute 'install rookout agent' do
    user 'root'
    command 'sudo /tmp/rookout_setup.sh agent --token=#{default['rookout']['token']}'
    notifies :start, 'service[rookout-agent]', :immediately
  end 