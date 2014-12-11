require 'spec_helper'
require 'json_exporter'
require 'pry'

describe JSONExporter do
  let(:mock_data) { [[111022,'Bagel','$3.45','$2.00','system','9855','Cream Cheese','$1.00']] }
  it "should require a filename" do
    expect {JSONExporter.new}.to raise_error(ArgumentError)
    json_exporter = JSONExporter.new(output_file: 'test.txt')
    expect(json_exporter.output_file).to eql(File.expand_path('test.txt'))
  end

  it "should be able to export json data to a file" do
    allow(File).to receive(:open) { mock_data.to_json }
    expect(JSONExporter.new(output_file: 'test.txt').export(mock_data)).to eql mock_data.to_json
  end
end
