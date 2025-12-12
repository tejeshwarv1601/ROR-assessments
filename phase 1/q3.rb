module Timestampable
  attr_accessor :created_at, :updated_at

  def initialize
    @created_at = Time.now
    @updated_at = Time.now
  end
end

class Product
  include Timestampable
  attr_accessor :name

  def initialize(name)
    super()
    @name = name
  end
end

puts "Product test"
product = Product.new("Ruby")

puts " Name : #{product.name}"
puts " Created at : #{product.created_at}"
puts " updated at : #{product.updated_at}"