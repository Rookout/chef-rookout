# Run controller
docker_image ‘rookout/controller’ do
 action :pull
end

docker_container ‘controller’ do
 repo ‘rookout/controller’
 port ‘7486:7486’
 env ‘ROOKOUT_TOKEN=#{node['rookout']['controller_token']}’
 action :run
end
