class Author < Person
  def initialize(args)
    super
  end

  def self.author_info
    author = {
    name: "Liz", age: "32", gender: "female", color: "purple", spirit_animal: "dog", pet: "yes"}
  end

  def salutation
    "Goodbye!  Authored by: #{@name}."
  end

end