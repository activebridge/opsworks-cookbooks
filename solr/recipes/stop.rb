node[:deploy].each do |application, deploy|
  Chef::Log.info("Stoping solr...")
  release_path = ::File.join(deploy[:deploy_to], 'current')

  execute "stop solr" do
    cwd release_path
    command 'bundle exec rake sunspot:solr:stop'
    environment 'RAILS_ENV' => 'staging'
  end
end
