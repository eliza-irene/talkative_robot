require 'spec_helper'
require './lib/person'


describe "Person" do
  let(:person) { Person.new( { name: "Liz", age: 32, gender: "female", color: "purple", spirit_animal: "dolphin", pet: "yes"} ) }


  subject { person }

  it { should respond_to(:name) }
  it { should respond_to(:age) }
  it { should respond_to(:gender) }
  it { should respond_to(:color) }
  it { should respond_to(:spirit_animal) }
  it { should respond_to(:pet) }



  describe "age_gender_greeting" do
    context "@age >= 21" do
      it "returns correct statement" do
        expected_message = "Hi Ms. Liz who is 32 years old. You're old enough to drink! Yes!"
        expect(person.age_gender_greeting).to eq(expected_message)
      end
    end

    context "@age >= 21" do
      it "returns correct statement" do
        person = Person.new( { name: "Lizzy", age: 12, gender: "female" } )
        expected_message = "Hi Ms. Lizzy who is 12 years old. You're not old enough to drink."
        expect(person.age_gender_greeting).to eq(expected_message)
      end
    end

    context "@age >= 21" do
      it "returns correct statement" do
        person = Person.new( { name: "Bob", age: 32, gender: "male" } )
        expected_message = "Hi Mr. Bob who is 32 years old. You're old enough to drink! Yes!"
        expect(person.age_gender_greeting).to eq(expected_message)
      end
    end
    
    context "@age >= 21" do
      it "returns correct statement" do
        person = Person.new( { name: "Bobby", age: 12, gender: "male" } )
        expected_message = "Hi Mr. Bobby who is 12 years old. You're not old enough to drink."
        expect(person.age_gender_greeting).to eq(expected_message)
      end
    end
  end

  describe "until_75_statement" do
    context "@age < 75" do
      it "returns correct statement" do
        expected_message = "You will be 75 years old in 43 years!"
        expect(person.until_75_statement).to eq(expected_message)
      end
    end
    
    context "@age < 75" do
      it "returns correct statement" do
        person = Person.new( { age: 77} )
        expected_message = "2 years ago you turned 75! Wow, you're up there!"
        expect(person.until_75_statement).to eq(expected_message)
      end
    end

    context "@age == 75" do
      it "returns correct statement" do
        person = Person.new( { age: 75} )
        expected_message = "You're exactly 75 years old!"
        expect(person.until_75_statement).to eq(expected_message)
      end 
    end
  end
 
  describe "first_initial" do
    it "returns the first initial" do
      expected_message = "L"
      expect(person.first_initial).to eq(expected_message)
    end
  end

end

  # describe "first_initial_preference" do
  #   context "cool_with_first_initial == 'no'" do
  #     it "changes @name to initial" do
  #       person.first_initial_preference
  #       expect(person.name).to eq(person.first_initial)
  #     end
  #   end

  #     it "returns proper message" do
  #       expected_message = "Okay, I'll call you L."
  #       expect(person.first_initial_preference).to eq(expected_message)
  #     end

  #   context "cool_with_first_initial == 'yes'" do
  #     it "does not change @name to initial" do
  #       person.first_initial_preference
  #       expect(person.name).to not_eq(person.first_initial)
  #     end
  #   end
    
  #     it "returns proper message" do
  #       expected_message = "Don't worry about it, I'll call you Liz"
  #       expect(person.first_initial_preference).to eq(expected_message)
  #   end
  # end

