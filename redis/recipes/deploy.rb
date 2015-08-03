node[:deploy].each do |application, deploy|
  Chef::Log.info("Restarting redis...")
  release_path = ::File.join(deploy[:deploy_to], 'current')

  execute "restart redis" do
    command "pkill -f redis-server; redis-server /etc/redis.conf"
    environment "RAILS_ENV" => 'staging'
  end
end
