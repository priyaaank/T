namespace :environment do

  desc "Load mongoid config for a environment"
  task :load_mongoid_config do 
    Mongoid.load!("./config/mongoid.yml", :development)
  end

end
