namespace :geonames do
  namespace :data do

    require "#{Rails.root}/lib/tasks_support/data_loader"
    logger = Logger.new(STDOUT)

    desc "Load the data from a provided filename to a intermediate collection in mongodb from where data will be funneled to core collection"
    task :load_from, [:file_name_with_path] => ['environment:load_mongoid_config'] do |task, args|
      logger.info "Starting data load. This may take some time."
      filename = args[:file_name_with_path]
      command = DataLoader.new(filename).command_to_load
      logger.info `#{command}`
      logger.info "Date load complete"
    end

  end
end
