require 'spec_helper'
require 'csv_importer'
require 'pry'

describe CSVImporter do
  let(:mock_data) { [[111022,'Bagel','$3.45','$2.00','system','9855','Cream Cheese','$1.00']] }
  it "should require a filename" do
    expect {CSVImporter.new}.to raise_error(ArgumentError)
    csv_importer = CSVImporter.new(input_file: 'test.txt')
    expect(csv_importer.input_file).to eql(File.expand_path('test.txt'))
  end

  it "should return data from file" do
    allow(CSV).to receive(:read) { mock_data }
    expect(CSVImporter.new(input_file: 'test.txt').import).to eql mock_data
  end
end
