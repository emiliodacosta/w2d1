class MonsterError < StandardError
end
class BestFriendError < StandardError
end

require "byebug"
# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError
    puts "#{str} is not an integer"
    return nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  begin
    reaction(maybe_fruit)
  rescue MonsterError => error
    # debugger
    if maybe_fruit == "coffee"
      retry
    else
      puts error.message
    end

    # puts "How did you know I like coffee!?!"
    # reaction
  end
end

def reaction(maybe_fruit)
  #debugger
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    # debugger
    puts MonsterError.new("#{maybe_fruit}'s don't count, but you gave me a coffee, so try again")
    feed_me_a_fruit
  else
    raise MonsterError.new("#{maybe_fruit}'s don't count")
  end
end


# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
    raise BestFriendError.new("C'mon man - you don't even know your besties name!?") if name.length <= 0
    raise BestFriendError.new("Whoa! You don't even know your besties fav pastime!?") if fav_pastime.length <= 0
    raise BestFriendError.new("Only #{yrs_known}!? You can't be besties!") if yrs_known < 5
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
