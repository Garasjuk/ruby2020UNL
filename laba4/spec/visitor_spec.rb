require "rspec"
require_relative "../visitor"

describe Product do
  it "add data Product" do
    product = Product.new(:name =>"Phon", :price => 200)
    expect(product.name).to eq("Phon")
    #product.name.should include("Phon")
    expect(product.price).to eq(200)
    # product.price == 200

  end

  it "add data Order" do
    product = Product.new(:name =>"Phone", :price => 100)
    order = Order.new
    order.add(product)
    # expect(order.elements).to eq(:name =>"Phone", :price => 100)
    # printer = Printer.new
    # order.printer elements.should include(product)

  end


end
