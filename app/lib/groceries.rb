class Grocery
  def initialize(grocery_list)
    @items = grocery_list
  end

  def items
    @items
  end

  def go_shopping(txt_file_name, csv_file_name)
    items_needed
    response = grab_random_item
    random_item_response
    puts butter_reminder
    add_butter
    save_list(txt_file_name, csv_file_name)
    read_from_csv
  end

  def self.get_list
    @items = IO.read("grocery_list.txt").chomp.split(", ")
    @items.map! { |item| item.downcase }
  end

  def items_needed
    puts "Time to go to the grocery store. Items to buy:"
    @items.each_index do |i| 
      puts "Item #{i+1} -- #{@items[i]}"
    end
  end

  def random_item
    @random_item ||= @items.sample
  end

  def grab_random_item
    puts "Did you grab the #{random_item}?"
    @answer = gets.chomp.downcase
  end

  def random_item_response
    if @answer == "yes"  
      puts "Great." 
        @items.delete(random_item)
    else 
      puts "Oh no!"
    end
    @items
  end

  def butter_reminder
    "Oh yeah, don't forget the butter!"
  end

  def add_butter
    @items << "butter"
    return
  end

  def create_new_txt(txt_file_name)
    IO.write("new_grocery_list.txt", @items)
  end

  def create_csv(csv_file_name)
    CSV.open(csv_file_name, "w" ) do |csv|
      csv << ["Item Number", "Item Name"]
      @items.each_index do |i| 
        csv << ["#{i+1}", @items[i]]
      end
    end
  end

  def save_list(txt_file_name, csv_file_name)
    create_new_txt(txt_file_name)
    create_csv(csv_file_name)
  end

  def read_from_csv
    csv_data= []
    CSV.foreach('groceries_including_butter.csv') {|row| 
      csv_data << row[0] + " " + row[1]}
    puts "Okay, here's the updated list:"
    csv_data.shift
    csv_data
    puts csv_data
  end

end