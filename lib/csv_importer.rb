require_relative 'file_importer'
require 'csv'

class CSVImporter < FileImporter
  attr_accessor :input_file, :header

  def initialize(input_file:, header: nil)
    @input_file = File.expand_path(input_file)
    @header = header
  end

  def import
    begin
      file_content = CSV.read(self.input_file)
    rescue Exception => e
      puts "Unable to read from file: #{self.input_file}. Error => " + e.to_s
    end
    if self.header == 1
      file_content.shift
    end
    file_content
  end
end
