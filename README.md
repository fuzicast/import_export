# ImportExport

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'import_export'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install import_export

## Usage

### Run rspec tests
    $ rake

### Test run import_export
    $ ruby -Ilib import_export

### Example
```
csv_importer = CSVImporter.new(input_file: './data/input.csv', header: 1)
json_exporter = JSONExporter.new(output_file: './output.json')
ImportExport.convert_data(importer: csv_importer, exporter: json_exporter)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/import_export/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
