require 'rspec'
require 'dessert'
require 'chef'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:cookie) { Dessert.new("cookie", 10, "chef")}

  describe "#initialize" do
    it "sets a type" do
      expect(cookie.type).to eq('cookie')
    end

    it "sets a quantity" do
      expect(cookie.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(cookie.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("ice cream", "10", "chef") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cookie.add_ingredient("chocolate")
      cookie.add_ingredient("gummy worms")
      cookie.add_ingredient("coconut")
      expect(cookie.ingredients).to eq(["chocolate", "gummy worms", "coconut"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      cookie.add_ingredient("chocolate")
      cookie.add_ingredient("beans")
      expect(cookie.mix!).to include("chocolate")
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cookie.eat(3)
      expect(cookie.quantity).to eq(7)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cookie.eat(11) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(cookie.serve).to include("chef".titleize)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cookie)
      chef.bake(cookie)
    end
  end
end
