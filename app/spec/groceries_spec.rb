require 'spec_helper'
require './lib/groceries'


describe "Grocery" do
  let(:grocery_list) { Grocery.new( [ "cheddar cheese", "wine", "croissants", "avocado", "tomato" ] ) }

  describe "random_item" do 
    context "assign random item" do
      it "states a random item that is assigned to the variable" do
        expect(grocery_list.items.include?(grocery_list.random_item)).to be_truthy
      end
    end

    context "second time it runs" do
      it "grabs prior assignment" do
        first_random_item = grocery_list.random_item
        second_random_item = grocery_list.random_item
        expect(second_random_item).to eq(first_random_item)
      end
    end
  end

  describe "add_butter" do
    context "@items << 'butter'" do
      it "returns grocery list with butter added" do
        # grocery_list = grocery_list.add_butter
        expect(grocery_list.add_butter).to eq(grocery_list)
      end
    end
  end

  describe"butter_reminder"
      it "returns butter message" do
        expected_message = "Oh yeah, don't forget the butter!"
        expect(grocery_list.butter_reminder).to eq(expected_message)    
  end
end

