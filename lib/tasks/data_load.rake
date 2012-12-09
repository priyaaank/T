namespace :geonames do
  namespace :data do

    logger = Logger.new(STDOUT)

    desc "Load the data from a provided filename to a intermediate collection in mongodb from where data will be funneled to core collection"
    task :load_from, [:file_name_with_path] => ['environment:load_mongoid_config'] do |task, args|
      require "#{Rails.root}/lib/tasks_support/data_loader"
      logger.info "Starting data load. This may take some time."
      filename = args[:file_name_with_path]
      command = DataLoader.new(filename).command_to_load
      logger.info `#{command}`
      logger.info "Date load complete"
    end

    desc "Migrate the data from intermediate collection to the core place collection. Data transformation is done as part of this process"
    task :migrate_to_core do
      require "#{Rails.root}/lib/tasks_support/data_migrator"
      logger.info "Data migration has been started. It may take a while"
      DataMigrator.new.migrate
      logger.info "Data migration is done!"
    end

  end
end
