require 'spec_helper'
require 'item_mapping'
require 'item'

I18n.enforce_available_locales = false
mock_data = [[111022,'Bagel','$3.45','$2.00','system','9855','Cream Cheese','$1.00']]
item_object = Item.new(
  id: mock_data[0][0],
  desc: mock_data[0][1],
  price: mock_data[0][2],
  cost: mock_data[0][3],
  price_type: mock_data[0][4],
  quantity_on_hand: mock_data[0][5],
  modifiers: [[Hash[*mock_data[0][6..7].flatten]]]
)
json_data = [{
  id: 111022,
  desc: "Bagel",
  price: "$3.45",
  cost: "$2.00",
  price_type: "system",
  quantity_on_hand: 9855,
  modifiers: [[{"Cream Cheese" => "$1.00"}]],
}]

describe ItemMapping do
  it 'should be able to encode object' do
    item = ItemMapping.encode_objects(mock_data)[0]
    expect(item.id).to eql item_object.id
    expect(item.desc).to eql item_object.desc
    expect(item.price.format).to eql item_object.price.format
    expect(item.cost.format).to eql item_object.cost.format
    expect(item.price_type).to eql item_object.price_type
    expect(item.quantity_on_hand).to eql item_object.quantity_on_hand
    expect(item.modifiers).to eql item_object.modifiers
  end

  it 'shoud be able to decode object' do
    data_output = ItemMapping.decode_objects([item_object])
    expect(data_output).to eql json_data
  end
end

