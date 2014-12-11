require_relative './object_mapping'

module ItemMapping
  include ObjectMapping

  def self.encode_objects(data)
    item_array = []
    data.each do |row|
      params = {
        id: row[0],
        desc: row[1],
        price: row[2],
        cost: row[3],
        price_type: row[4],
        quantity_on_hand: row[5],
      }
      if row.length > 6
        modifiers = Hash[*row[6..-1].flatten]
        params[:modifiers] = modifiers.map { |k,v| [ k => v ] }
      end
      item = Item.new(params)
      item_array.push(item)
    end
    item_array
  end

  def self.decode_objects(objects)
    data_output = []
    objects.each do |object|
      object_as_hash = {
        id: object.id,
        desc: object.desc,
        price: object.price.format,
        cost: object.cost.format,
        price_type: object.price_type,
        quantity_on_hand: object.quantity_on_hand,
        modifiers: object.modifiers
      }
      data_output.push(object_as_hash)
    end
    data_output
  end
  
end
