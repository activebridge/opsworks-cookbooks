node[:deploy].each do |application, deploy|
  Chef::Log.info("Restarting redis...")
  release_path = ::File.join(deploy[:deploy_to], 'current')

  execute "restart redis" do
    command "kill -9 `cat /var/run/redis/redis.pid`; redis-server /etc/redis.conf"
  end
end
