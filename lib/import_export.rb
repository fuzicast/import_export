require_relative "./import_export/version"
require_relative './item'
require_relative './item_mapping'

module ImportExport

  # Use dependency injection so this method is easier to test
  def self.convert_data(importer:, exporter:)
    file_content = importer.import
    objects = ItemMapping.encode_objects(file_content)
    data = ItemMapping.decode_objects(objects)
    exporter.export(data)
  end
end
