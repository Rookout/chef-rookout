#
# Cookbook:: chef-rookout-agent
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

#Download the agent setup file
remote_file "#{node['rookout']['java_rook_path']}" do
    source "http://repository.sonatype.org/service/local/artifact/maven/redirect?r=central-proxy&g=com.rookout&a=rook&v=#{node['rookout']['java_rook_version']}"
    owner   'root'
    group   'root'
    mode '0755'
    action :create
  end
