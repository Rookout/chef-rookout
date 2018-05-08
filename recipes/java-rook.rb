#
# Cookbook:: chef-rookout
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

#Download the agent setup file
directory "#{node['rookout']['java_rook_path']}" do
  owner 'root'
  group 'root'
  mode '0755'
  recursive 'true'
  action :create
end

remote_file "#{node['rookout']['java_rook_path']}/rook.jar" do
    source "http://repository.sonatype.org/service/local/artifact/maven/redirect?r=central-proxy&g=com.rookout&a=rook&v=#{node['rookout']['java_rook_version']}"
    owner   'root'
    group   'root'
    mode '0755'
    action :create
  end
