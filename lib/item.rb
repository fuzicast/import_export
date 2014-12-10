require 'monetize'
require 'pry'
require 'json'

class Item
  attr_accessor :id, :desc, :price, :cost, :price_type, :quantity_on_hand, :modifiers

  def initialize(id:, desc:, price: nil, cost: nil, price_type:, quantity_on_hand: nil, modifiers: nil)
    @id = id.to_i
    @desc = desc
    @price = Monetize.parse(price)
    @cost = Monetize.parse(cost)
    @price_type = price_type
    @quantity_on_hand = quantity_on_hand.to_i
    @modifiers = modifiers
  end


end
