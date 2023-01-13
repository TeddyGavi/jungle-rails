require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do 
  
  it "should return a valid product given all validations passed" do
    @category = Category.new
    
    new_product = Product.new(
      name: 'New Product',
      description: 'A new Product',
      # image: '#{plante1.jpg}',
      price_cents: 30000,
      quantity: 1,
      category: @category
    
    )
  expect(new_product).to be_valid
  end

  it "should return a invalid product given no product name" do
    @category = Category.new
    
    new_product = Product.new(
      description: 'A new Product',
      # image: '#{plante1.jpg}',
      price_cents: 30000,
      quantity: 1,
      category: @category
    
    )
  expect(new_product).to_not be_valid
  end

  it "should return a invalid product given no product price" do
    @category = Category.new
    
    new_product = Product.new(
      name: "test",
      description: 'A new Product',
      # image: '#{plante1.jpg}',
      quantity: 1,
      category: @category
    
    )
  expect(new_product).to_not be_valid
  end


  it "should return a invalid product given no quantity" do
    @category = Category.new
    
    new_product = Product.new(
      name: "test",
      description: 'A new Product',
      # image: '#{plante1.jpg}',
      category: @category,
      price: 9000,
    
    )
  expect(new_product).to_not be_valid
  end

  it "should return a invalid product given no category" do
    @category = Category.new
    
    new_product = Product.new(
      name: "test",
      description: 'A new Product',
      # image: '#{plante1.jpg}',
      quantity: 1,
      price: 9000,
    
    )
  expect(new_product).to_not be_valid
  end


  end
end
