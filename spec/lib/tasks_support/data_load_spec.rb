require 'spec_helper'
require "#{Rails.root}/lib/tasks_support/data_loader"

describe DataLoader do

  it "should print command to load data dump in raw format" do
    filename = "/Users/example/some_sample_file.tsv"
    command = DataLoader.new(filename).command_to_load
    expected_command = "mongoimport --db t_test --collection raw_geodata --type tsv --file /Users/example/some_sample_file.tsv --fields geoid,name,asciiname,alternatenames,latitude,longitude,feature_class,feature_code,country_code,cc2,admin1,admin2,admin3,admin4,population,elevation,dem,timezone,modification_date"

    command.should eq expected_command
  end

end
