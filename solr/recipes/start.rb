node[:deploy].each do |application, deploy|
  Chef::Log.info("Starting solr...")
  release_path = ::File.join(deploy[:deploy_to], 'current')

  execute "start solr" do
    cwd release_path
    command 'bundle exec rake sunspot:solr:start'
    environment 'RAILS_ENV' => 'staging'
  end
end
