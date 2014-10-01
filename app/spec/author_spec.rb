require 'spec_helper'
require './lib/person'
require './lib/author'


describe "Author" do
  describe "salutation" do 
    it "says goodbye to the user from the author" do
      @author = Author.new( {name: "Liz"})
      expect(@author.salutation).to eq("Goodbye!  Authored by: Liz.")
    end
  end
end