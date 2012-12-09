class DataLoader
  
  def initialize(filename, filetype = "tsv")
    @fields = ["geoid","name","asciiname","alternatenames","latitude","longitude",
               "feature_class","feature_code","country_code","cc2","admin1","admin2",
               "admin3","admin4","population","elevation","dem","timezone","modification_date"]
    @db_name = Mongoid::Config.sessions["default"]["database"]
    @collection_name = "raw_geodata"
    @file_type = filetype
    @filename = filename
  end

  def command_to_load
    "mongoimport --db #{@db_name} --collection #{@collection_name} --type #{@file_type} --file #{@filename} --fields #{@fields.join(",")}"
  end

end
