#
# Cookbook:: chef-rookout
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

#Download the controller setup file
remote_file '/tmp/rookout_setup.sh' do
    source 'https://get.rookout.com'
    owner   'root'
    group   'root'
    mode '0755'
    action :create
  end
  


  #Install the controller as a service daemon
  execute 'install rookout controller' do
    user 'root'
    command "sudo /tmp/rookout_setup.sh controller --token=#{node['rookout']['controller_token']}"
  end 
  

#Start the controller 
service 'rookout-controller' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :restart ]
end