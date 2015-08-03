node[:deploy].each do |application, deploy|
  Chef::Log.info("Restarting solr...")
  release_path = ::File.join(deploy[:deploy_to], 'current')

  execute "restart solr" do
    cwd release_path
    command 'bundle exec rake sunspot:solr:restart'
    environment 'RAILS_ENV' => 'staging'
  end
end
