require "import_export/version"
require_relative './item'
require_relative './csv_importer'
require_relative './json_exporter'
require_relative './item_mapping'

module ImportExport
  include CSVImporter
  include ItemMapping
  def self.csv_to_json(input_file, output_file)
    file_content = CSVImporter.import(input_file)
    item_array = ItemMapping.from_csv(file_content, header: 1)
  end
end
