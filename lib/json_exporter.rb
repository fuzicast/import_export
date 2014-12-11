require 'json'
require_relative './file_exporter'

class JSONExporter < FileExporter
  attr_accessor :output_file, :data

  def initialize(output_file:)
    @output_file = File.expand_path(output_file)
  end

  def export(data)
    File.open(self.output_file, 'w') do |f|
      f.write(data.to_json)
    end
  end
end
