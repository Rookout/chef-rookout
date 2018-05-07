#
# Cookbook:: chef-rookout
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
  


  #Install the agent as a service daemon
  execute 'install rookout agent' do
    user 'root'
    command "sudo /tmp/rookout_setup.sh agent"
  end 
  

  #Install the config file
  file '/etc/rookout/agent-config.json' do
    content "{
      \"LoginInformation\": {
          \"TOKEN\": \"#{node['rookout']['agent_token']}\"
        }
      }"
    mode '0644'
  end

#Start the agent 
service 'rookout-agent' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :restart ]
end