require 'pry'


def escape(got)
  if got == "UP"
    login
  end
end


def welcome_screen
  system "clear"
  puts asciiart
  puts
end

def login
  puts "Are you already a Birdr?"
  puts "(Y)es/(N)o"
  response = gets.chomp.capitalize
  escape(response)
  response = invalid_response(response)
  if response == "N" || response == "NO"
    system "clear"
    puts "Great, Welcome to the club\n"
    puts "What will be on the front of your journal? "
    create_watcher
  elsif response == "Y" || response == "YES"
    system "clear"
    puts "Select your journal by name please (case sensitive)"
    watchername = gets.chomp
    escape(watchername)
    is_watcher(watchername)
  end
end

def invalid_response(response)
  while (response != "Y" && response != "YES") && (response != "N" && response != "NO")  
     puts "Invalid response. Please choose either \'Y\' for yes or \'N\' for no."
    response = gets.chomp.capitalize
    escape(response)
  end
  response
end

def is_watcher(watchername)
  if Watcher.find_by(name: watchername)
  nameholder = Watcher.find_by(name: watchername)
    system "clear"
    puts "#{watchername}'s journal is ready to be changed'"
    main_menu(nameholder)
  else
    while !Watcher.find_by(name: watchername)
      puts "Journal not found, maybe you forgot, or never made one"
      puts "Lets make it now"
      create_watcher

    end
    system "clear"
    puts "Hello #{watchername}, what would you like to do today?"
    main_menu(nameholder)
  end
end

def create_watcher
  puts "Enter a journal title"
  watchername = gets.chomp.capitalize
  escape(watchername)
  puts "Tell me your favorite bird"
  favorite = gets.chomp.capitalize
  escape(favorite)
if Bird.find_by(commonname: favorite)
  else
    puts "this bird is unknown to our kind, please inform us about it? (Y/N)"
    say = gets.chomp.capitalize
    escape(say)
    if say == "Y" 
        add_bird_helper()
        puts "thanks for the tip"
    else
      puts "ok, maybe next time"
    end
  end
  puts "Tell me your age"
  age = gets.chomp.capitalize
  escape(age)
  puts "Tell me your catchphrase"
  phrase = gets.chomp.capitalize
  escape(phrase)
  while Bird.find_by(commonname: watchername)
    puts "Sorry, somebody already has a journal under that name."
    puts "Please choose a different journal title"
    watchername = gets.chomp.capitalize
    escape(watchername)
  end
  new_watcher = Watcher.create(name: watchername, fav: favorite, age: age, catchphrase: phrase) 
  join_birds_and_watchers(new_watcher)
  system "clear"
  puts "Welcome #{watchername}!."
  main_menu(new_watcher)
end

def join_birds_and_watchers(watcher)
  system "clear"
  puts "Please enter the names of any birds you have seen (one at a time please).
        Press enter after entering each bird."
  puts "when finished exit with \"quit\", \"exit\", or \"done\"."
  bird = gets.chomp.capitalize
  escape(bird)
  while bird != "done" && bird != "d" && bird != "exit" && bird != "e" && bird != "!" && bird != "!!!" && bird != "q" && bird != "quit" #&& choice != "N"
    bird = gets.chomp.capitalize #check_bird(bird)
    escape(bird)
    if Bird.find_by(commonname: bird.split(/ |\_/).map(&:capitalize).join(" "))
    birdobj = Bird.find_by(commonname: bird.split(/ |\_/).map(&:capitalize).join(" "))
    Journalentry.create(watcher_id: watcher.id, bird_id: birdobj.id)
    #bird = gets.chomp.downcase
    else
    #  bird = gets.chomp.downcase
    end
  end
end

def check_bird(name)
  while !Bird.find_by(commonname: name)
    name = gets.chomp.capitalize
    escape(name)
  end
  name
end

def main_menu(new_watcher)
  puts "1. Add a new bird"
  puts "2. View my seen birds"
  puts "3. View my favorite bird"
  puts "4. View the most seen birds"
  puts "5. View most popular bird"
  puts  "6. View my favorite bird's color"
  puts  "7. View all birds seen so far by our community"
  puts  "8. View all birds seen so far by our community in latin"
  puts "9. Exit"
  puts "10. (change journal data)"
  selection = gets.chomp.capitalize
  escape(selection)
  change_screen(selection.to_i,new_watcher)
end


def secret_menu(new_watcher)
  puts "1. Delete a new bird"
  puts "2. Update or correct a bird's data"
  puts "3. Delete all birds"
  puts "4. Delete user"
  puts "5. Delete all users"
  puts  "6. Update a users data"
  puts "7. Exit"
  selection = gets.chomp.capitalize
  escape(selection)
  secret_change_screen(selection.to_i,new_watcher)
end

def add_bird_helper(xself = Watcher.find_by(name: "Admin"))
  puts "Enter the bird's name"
  watchername = gets.chomp.capitalize
  escape(watchername)
  puts "What do they eat"
  favorite = gets.chomp.capitalize
  escape(favorite)
  puts "What is their scientific name"
  age = gets.chomp.capitalize
  escape(age)
  puts "What is its dominant color of the form \"#xxxxxx\""
  phrase = gets.chomp.capitalize
  escape(phrase)
  chars = phrase.chars
  hex = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f",  "A", "B", "C", "D", "E", "F"]
  while chars[0] != "#" || chars.length != 7 
    count = 1
    if !(hex.include?(chars[count]))
      puts  "format invalid, remember 0-F, like #ABC123"
      puts "What is its dominant color of the form \"#xxxxxx\""
      phrase = gets.chomp.capitalize
      escape(phrase)
      chars = phrase.chars
    end
    count+=1
    if !(hex.include?(chars[count]))
      puts  "format invalid, remember 0-F, like #ABC123"
      puts "What is its dominant color of the form \"#xxxxxx\""
      phrase = gets.chomp.capitalize
      escape(phrase)
      chars = phrase.chars
    end
    count+=1
    if !(hex.include?(chars[count]))
      puts  "format invalid, remember 0-F, like #ABC123"
      puts "What is its dominant color of the form \"#xxxxxx\""
      phrase = gets.chomp.capitalize
      escape(phrase)
      chars = phrase.chars

    end
    count+=1
    if !(hex.include?(chars[count]))
      puts  "format invalid, remember 0-F, like #ABC123"
      puts "What is its dominant color of the form \"#xxxxxx\""
      phrase = gets.chomp.capitalize
      escape(phrase)
      chars = phrase.chars

    end
    count+=1
    if !(hex.include?(chars[count]))
      puts  "format invalid, remember 0-F, like #ABC123"
      puts "What is its dominant color of the form \"#xxxxxx\""
      phrase = gets.chomp.capitalize
      escape(phrase)
      chars = phrase.chars

    end
    count+=1
    if !(hex.include?(chars[count]))
        puts  "format invalid, remember 0-F, like #ABC123"
        puts "What is its dominant color of the form \"#xxxxxx\""
        phrase = gets.chomp.capitalize
        escape(phrase)
        chars = phrase.chars
      end
      count+=1
    end

  chicken = Bird.create(commonname: watchername, diet: favorite, sciname:age, color: phrase)
      xself.add_bird(xself, chicken)
      puts "Thank you!"
end

def viewing_birds(you)
names = []
  you.birds.each do |key| names << key.commonname end
    puts names
    names
end



def update_age(guy)
  puts "name?"
  choice = gets.chomp.capitalize
  escape(choice)
  guy[:catchphrase] = choice
  guy.update_attributes(catchphrase: choice)
end

def update_phrase(guy)
  puts "catchphrase?"
choice = gets.chomp.capitalize
escape(choice)
guy[:age] = choice.to_i

guy.update_attributes(age: choice)
end

def update_favorite(guy)
  puts "favorite?"
choice = gets.chomp.capitalize
escape(choice)
guy[:favorite] = choice

guy.update_attributes(favorite: choice)
end

def update_name(guy)
  puts "name?"
choice = gets.chomp.capitalize
escape(choice)
guy[:name] = choice
if !Watcher.find_by(name: choice)
guy.update_attributes(name: choice)
else
puts "User already exists enter a different name"
end
end


def update_bird_sciname(guy)
  puts "sciname?"
  choice = gets.chomp.capitalize
  escape(choice)
  guy[:sciname] = choice
  guy.update_attributes(sciname: choice)
end

def update_bird_color(guy)
  puts "color?"
choice = gets.chomp.capitalize
escape(choice)

chars = choice.chars
hex = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f",  "A", "B", "C", "D", "E", "F"]
while chars[0] != "#" || chars.length != 7 
  count = 1
  if !(hex.include?(chars[count]))
    puts  "format invalid, remember 0-F, like #ABC123"
    puts "What is its dominant color of the form \"#xxxxxx\""
    phrase = gets.chomp.capitalize
    escape(phrase)
    chars = phrase.chars
  end
  count+=1
  if !(hex.include?(chars[count]))
    puts  "format invalid, remember 0-F, like #ABC123"
    puts "What is its dominant color of the form \"#xxxxxx\""
    phrase = gets.chomp.capitalize
    escape(phrase)
    chars = phrase.chars
  end
  count+=1
  if !(hex.include?(chars[count]))
    puts  "format invalid, remember 0-F, like #ABC123"
    puts "What is its dominant color of the form \"#xxxxxx\""
    phrase = gets.chomp.capitalize
    escape(phrase)
    chars = phrase.chars

  end
  count+=1
  if !(hex.include?(chars[count]))
    puts  "format invalid, remember 0-F, like #ABC123"
    puts "What is its dominant color of the form \"#xxxxxx\""
    phrase = gets.chomp.capitalize
    escape(phrase)
    chars = phrase.chars

  end
  count+=1
  if !(hex.include?(chars[count]))
    puts  "format invalid, remember 0-F, like #ABC123"
    puts "What is its dominant color of the form \"#xxxxxx\""
    phrase = gets.chomp.capitalize
    escape(phrase)
    chars = phrase.chars

  end
  count+=1
  if !(hex.include?(chars[count]))
      puts  "format invalid, remember 0-F, like #ABC123"
      puts "What is its dominant color of the form \"#xxxxxx\""
      phrase = gets.chomp.capitalize
      escape(phrase)
      chars = phrase.chars
    end
    count+=1
  end

guy[:color] = choice

guy.update_attributes(age: choice)
end

def update_bird_diet(guy)
  puts "diet?"
choice = gets.chomp
escape(choice)
guy[:diet] = choice

guy.update_attributes(favorite: choice)
end

def update_bird_name(guy)
  puts "name?"
choice = gets.chomp
escape(choice)
guy[:commonname] = choice
if !Bird.find_by(commonname: choice)
guy.update_attributes(commonname: choice)
else
puts "Bird already exists enter a different name"
end
end

def view_most_seen_birds(watcher)

  hash_of_birds = {}
  Journalentry.all.each do |go|
   if  hash_of_birds["#{seen(go)}"]  == nil 
            hash_of_birds["#{seen(go)}"] = 1
   else
    hash_of_birds["#{seen(go)}"] += 1
   end
  end
puts "#{largest_hash_key(hash_of_birds)[0]}"
# binding.pry

end

def seen(join)
  join.bird.commonname
end

def view_favorite_bird(you)
  puts you.fav 
  you.fav
end
def view_favorite_bird_no_puts(you)
  you.fav

end
def view_favoritest_bird(you)
  hash_of_birds = {}
  Watcher.all.each do |go|
   if  hash_of_birds["#{view_favorite_bird_no_puts(go)}"]  == nil 
            hash_of_birds["#{view_favorite_bird_no_puts(go)}"] = 1
   else
    hash_of_birds["#{view_favorite_bird_no_puts(go)}"] += 1
   end
  end
puts "#{largest_hash_key(hash_of_birds)[0]}"
# binding.pry
end

def color_print(watchername)
  bird = view_favorite_bird(watchername)
  if Bird.find_by(commonname: bird)
  bird = Bird.find_by(commonname: bird)
  letters = bird.color.chars
  else
bird = "FAILURECASE"
letters = bird.chars
  end
  hex = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f",  "A", "B", "C", "D", "E", "F"]
  falsish  = 0
  if letters[0] != "#" || letters.length != 7 
    falsish = 1
  end
    count = 1
    if !(hex.include?(letters[count]))
      falsish = 1
    end
    count+=1

    if !(hex.include?(letters[count]))
      falsish = 1
    end
    count+=1

    if !(hex.include?(letters[count]))
      falsish = 1
    end
    count+=1

    if !(hex.include?(letters[count]))
      falsish = 1
    end
    count+=1

    if !(hex.include?(letters[count]))
      falsish = 1
    end
    count+=1

    if !(hex.include?(letters[count]))
      falsish = 1
    end
    count+=1

    if (falsish == 1) 
        colorvar = "#" +(rand(16).to_s(16).capitalize +  rand(16).to_s(16).capitalize +  rand(16).to_s(16).capitalize+  rand(16).to_s(16).capitalize +  rand(16).to_s(16).capitalize +  rand(16).to_s(16).capitalize)
        puts Rainbow("██████████").color(colorvar)  
        else
        puts Rainbow("██████████").color(bird.color)
    end
end


def update_user(xself)
  puts "Please enter the journal name"
hasinfo = gets.chomp
escape(hasinfo)
  if Watcher.find_by(name: hasinfo)
guy =  Watcher.find_by(name: hasinfo)
puts "Please choose what to change about the journal info (\"name\", \"age\", \"phrase\" or \"favorite\")"
choice = gets.chomp.downcase
escape(choice)
  else
    update_user(xself)
  end 

if choice != "name" && choice != "age" && choice != "phrase" && choice != "favorite"    
puts "Please try again  (\"name\", \"age\", \"phrase\" or \"favorite\")" 
update_self(xself)
end

if choice == "name"
  update_name(guy)
end

if choice == "age"
update_age(guy)
end

if choice == "phrase"
update_phrase(guy)
end

if choice == "favorite"
update_favorite(guy)
end
end


def all_birds_common_names(backup)
  index = 0
  output = ""
  while Journalentry.all[index]
  output = output +  "#{Journalentry.all[index].bird.commonname}, "
if index% 9 == 0
  output = output + "\n"
end
index+=1
end
puts output
end

def all_birds_common_names_helper_to_clear()
  index = 0
  output = []
  while Journalentry.all[index]
  output << Journalentry.all[index].bird
index+=1
end
output
end

def all_users_helper_to_clear()
  index = 0
  output = []
  while Journalentry.all[index]
  output << Journalentry.all[index].watcher
index+=1
end
output
end

def all_birds_sci_names(backup)
  index = 0
  output = ""
while Journalentry.all[index]
output = output +  "#{Journalentry.all[index].bird.sciname}, "
if index% 9 == 0
  output = output + "\n"
end
index+=1
end
puts output
end


  def largest_hash_key(hash)
    hash.max_by{|k,v| v}
  end



def secret_change_screen(selection, new_watcher)
  case selection
  when 1
delete_bird()
secret_menu(new_watcher)
  when 2
    update_bird(new_watcher)
    secret_menu(new_watcher)
  when 3
    delete_all_birds()
    secret_menu(new_watcher)
  when 4
    delete_user()
    secret_menu(new_watcher)
  when 5
    delete_all_users()
    secret_menu(new_watcher)
  when 6
    update_user(new_watcher)
    secret_menu(new_watcher)
  when 7
    secret_menu(new_watcher)
  end
end



def update_self(xself)
  guy =  Watcher.find_by(name: xself.name)
  puts "Please choose what to change about your journal info (\"name\", \"age\", \"phrase\" or \"favorite\")"
  choice = gets.chomp.downcase
  escape(choice)

if choice != "name" && choice != "age" && choice != "phrase" && choice != "favorite"    
  puts "Please try again  (\"name\", \"age\", \"phrase\" or \"favorite\")" 
  update_self(xself)
end

  if choice == "name"
    update_name(guy)
end

if choice == "age"
  update_age(guy)
end

if choice == "phrase"
update_phrase(guy)
end

if choice == "favorite"
update_favorite(guy)
end
end


def update_bird(xself)
  puts "Please pick a bird by name, (case sensitive)"
entry = gets.chomp
  escape(entry)
  guy =  Bird.find_by(commonname: entry)
  puts "Please choose what to change about your bird choice (\"name\", \"diet\", \"color\" or \"sciname\")"
  choice = gets.chomp.downcase
  escape(choice)

if choice != "sciname" && choice != "name" && choice != "diet" && choice != "color"    
  puts "Please try again  (\"name\", \"age\", \"phrase\" or \"favorite\")" 
  update_self(xself)
end

  if choice == "color"
    update_bird_color(guy)
end

if choice == "diet"
  update_bird_diet(guy)
end

if choice == "name"
update_bird_name(guy)
end

if choice == "sciname"
update_bird_sciname(guy)
end
end





def delete_user()
  puts "Enter the name of the journal to delete:"
  name = gets.chomp
  escape(name)
  if Watcher.find_by(name: name)
  guy = Watcher.find_by(name: name)
  id = guy.id

  entry = Journalentry.where(watcher_id: id).destroy_all
  #entry = Journalentry.all.where do |entries| entries.watcher.id == guy.id end

    #entry.all.each do |que_to_destroy| que_to_destroy.destroy end
  guy.destroy
  else
    puts "no such user known"
    delete_user()
  end
  end



  def delete_bird()
    puts "Enter the name of the bird to delete:"
    name = gets.chomp
    escape(name)
    if Bird.find_by(commonname: name)
    guy = Bird.find_by(commonname: name)
    id = guy.id
    entry = Journalentry.where(bird_id: id).destroy_all
    #entry = Journalentry.all.where do |entries| entries.bird.id == guy.id end
    #entry.all.each do |que_to_destroy| que_to_destroy.destroy end
    guy.destroy
    else
      puts "no such bird known"
      delete_bird()
    end
    end

    def delete_all_birds()
      guy = all_birds_common_names_helper_to_clear()
      Journalentry.all.each do |entry| entry.destroy end
      guy.each do |bird| bird.destroy end
      end
      

    def delete_all_users()
      guy = all_users_helper_to_clear()
      Journalentry.all.each do |entry| entry.destroy end
      guy.each do |user| user.destroy end
      end
      





def change_screen(selection,new_watcher)
  case selection
  when 0
    if new_watcher.name == "Admin"
        puts "Welcome, birdr administrator!"
        secret_menu(new_watcher)
    else
      main_menu(new_watcher)
      end
  when 1
    puts "Add a new bird you saw"
    add_bird_helper(new_watcher)
    main_menu(new_watcher)
  when 2
    puts "View birds"
    viewing_birds(new_watcher)
    main_menu(new_watcher)
  when 3
    puts "View favorite birds"
    view_favorite_bird(new_watcher)
   main_menu(new_watcher)
  when 4
    puts "View most seen birds"
    view_most_seen_birds(new_watcher)
    main_menu(new_watcher)
  when 5
    system "clear"
    puts "View most popular bird!"
    view_favoritest_bird(new_watcher)
    main_menu(new_watcher)
  when 6 
    system "clear"
    puts "Your favorite birds color is!"
    color_print(new_watcher)
    main_menu(new_watcher)
  when 7 
    system "clear"
    all_birds_common_names(new_watcher)
    main_menu(new_watcher)
  when 8 
    system "clear"
    all_birds_sci_names(new_watcher)
    main_menu(new_watcher)
  when 9
  system "clear"
  puts "Goodbye!"
when 10
system "clear"
puts "You will now update your own journal"
update_self(new_watcher)
end

end