#
# Cookbook:: chef-rookout-agent
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

remote_file '/tmp/rookout_setup.sh' do
  source 'https://get.rookout.com'
  owner   'root'
  group   'root'
  mode '0755'
  action :create
end

service 'rookout-agent' do
  action :nothing
end

execute 'install rookout agent' do
  user 'root'
  command 'sudo /tmp/rookout_setup.sh agent --token=e1cdd753550a597d33beb78ed10cd318837113b85b895f9f515f4b958d5f4c51'
  notifies :start, 'service[rookout-agent]', :immediately
end 