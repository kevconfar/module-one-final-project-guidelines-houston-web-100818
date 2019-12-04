
require_relative '../config/environment'
require 'tty-prompt'

$prompt = TTY::Prompt.new


$start_menu_choices = {
  "Search haunts by name" => 0,
  "Search haunts by state" => 1, 
  "Search haunts by type of haunting" => 2,
  "Exit" => 3
}

$state_menu_choices = { 
  "Choose from our list" => 0,
  "Type the state you want" => 1,
  "Back" => 2
}

$type_of_haunting_menu_choices = { 
  "Visual" => 1,
  "Physical" => 2,
  "Auditory" => 3,
  "Back" => 4
}

def messages(name=nil)
    {
      start: "Pick your haunt: ",
      state: "Where would you like to be scared? ",
      type_of_haunting: "What kind of experience are you looking for? ",
      move_on: "#{name}, are you ready to be scared!? ",
      move_on_again: "Are you sure you can handle it?",
      continue_message1: "Don't be a wuss. Let's do this anyway.",
      continue_message2: "Let's get scared! ",
      welcome: "Welcome to the Haunt. What's your name?",
      input_error: "Sorry, please try again.",
      exit: "OK, Scaredy Cat! Goodbye!",
      haunt_search: "Enter the name of the haunted place you're looking for: ",
      state_search: "Enter the name of state you would like to explore: ",
      type_search: "Select from below to read about the paranormal activity experienced: "
    }
end


def response_choices
    {
      move_on_choices: %w(Yes No),
      move_on_again_choices: %w(I\ was\ born\ ready Probably\ not),
      next_or_back_choices: %w(Next\ haunt Back)
    }
end

def welcome_get_name
    name = $prompt.ask(messages[:welcome]) do |q|
        q.required true
        q.validate /\A\w+\Z/
        q.modify   :capitalize
    end
end

def move_on(name)
    move_on = $prompt.select(messages(name)[:move_on], response_choices[:move_on_choices])
end

  def exit?
    puts messages[:exit]
    exit
  end
  
def continue_message
    move_on_again = $prompt.select(messages[:move_on_again], response_choices[:move_on_again_choices])
    if move_on_again == "Probably not"
        print messages[:continue_message1]
        return "scaredy cat"
    else
        print messages[:continue_message2]
        return "good choice"
    end
end

def launch_menu(menu_choice, message)
    $prompt.select(message, menu_choice)
end

  
def launch_first_menu(name=nil)
  start_choice = launch_menu($start_menu_choices, messages(name)[:start])

    case start_choice
    when 0
      haunt_name = $prompt.select(messages[:haunt_search], filter: true) do |options|
        Haunt.all.map do |haunt|
          options.choice haunt.name
        end
      end
          
      haunt_choice = Haunt.find_by(name: haunt_name)
      haunt_search_printer(haunt_name, haunt_choice)
      launch_first_menu
    when 1
      state_name = $prompt.select(messages[:state], filter: true) do |options|
       Haunt.all.map do |haunt|
            options.choice haunt.state
          
        end
      end

      state_choice = Haunt.filter_by_state(state_name)
      state_search_printer(state_name, state_choice)
      launch_first_menu
      # state_choice = launch_menu($state_menu_choices, messages[:state])
      # launch_state_menu(state_choice)
    when 2
      type_of_haunting_choice = launch_menu($type_of_haunting_menu_choices, messages[:type_of_haunting])
      launch_type_of_haunting_menu(type_of_haunting_choice)
    when 3
        exit
    end
  end

  # def launch_state_menu(state_choice)
  #   case state_choice
  #   when 0
  #     our_state_hash = Haunt.state?
  #     state_printer(our_state_hash)
  #     launch_first_menu
  #   when 1
  #     your_state_word = $prompt.ask(messages[:state_search]) do |q|
  #       q.required true
  #     end
  #     your_state_hash = Haunt.state?(your_state_word)
  #     if your_state_hash.empty? == true
  #       puts messages[:input_error]
  #       launch_state_menu(state_choice)
  #     end
  #     state_printer(your_state_hash)
  #     launch_first_menu
  #   when 2
  #     launch_first_menu
  #   end
  # end





def launch_type_of_haunting_menu(type_of_haunting_choice)
    
  case type_of_haunting_choice
  when 0
    our_visual_hash = Haunts.visual_haunt?
    visual_printer(our_visual_hash)
    launch_first_menu
  when 1
    our_auditory_hash = Haunt.auditory_haunt?
    auditory_printer(our_auditory_hash)
    launch_first_menu
  when 2
    our_physical_hash = Haunt.physical_haunt?
    physical_printer(our_physical_hash)
    launch_first_menu
  when 3
    launch_first_menu
  end
 end

def visual_printer(visual_hash)
  visual_hash.each do | haunt, paranormal_experience_array |
    paranormal_experience_array.each do | content |
      message = "\nName: #{name}\n\nState: #{state}\n\nCity: #{city}\n\nDescription:\n#{paranormal_experience["content"]}\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
      review_printer(message)
    end
  end
end 

def auditory_printer(auditory_hash)
  auditory_hash.each do | haunt, description_array |
    description_array.each do | description |
      message = "\nName: #{haunt.name}\n\nState: #{haunt.state}\n\nCity: #{haunt.city}\n\nDescription:\n#{haunt.description}\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
      review_printer(message)
    end
  end
end 

def physical_printer(physical_hash)
  physical_hash.each do | haunt, description_array |
    description_array.each do | description |
      message = "\nName: #{haunt.name}\n\nState: #{haunt.state}\n\nCity: #{haunt.city}\n\nDescription:\n#{haunt.description}\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
      review_printer(message)
    end
  end
end 

# def state_printer(state_hash)
#   state_hash.each do | haunt, states_array |
#     states_array.each do | haunt |
#       message = "\nName: #{haunt[:name]}\nState: #{haunt[:state]}\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
#       review_printer(message)
#     end
#   end
# end
# case start_choice
# when 0
#   bar_name = $prompt.select(messages[:bar_search], filter: true) do |options|
#     Bar.all.collect do |bar|
#       options.choice bar.name
#     end
#   end
#   bar_reviews = Bar.find_by(name: bar_name).reviews.order("rating")
#   bar_search_printer(bar_name, bar_reviews)
#   launch_first_menu
# def state_search_printer(state, haunt_array)
#   puts "\nState: #{name}"
#   puts "\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
#   haunt_array.each do |haunt|
#     message = "\nName: #{haunt[:name]}\nState:\n#{haunt[:state]}\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
#     review_printer(message)
#   end
# end
  def haunt_search_printer(name, haunt)
    puts "\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
    puts "\nName: #{name}"
    puts "\nState: #{haunt[:state]}"
    puts "\nCity: #{haunt[:city]}"
    puts "\nDescription: \n#{haunt[:description]}"
    puts "\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
    Haunt.names.each do |haunt|
      message = "\nwow" #"\nName: #{haunt[:name]},\nState: #{haunt[:state]},\nCity: #{haunt[:city]},\nDescription: \n#{haunt[:description]}\n\n\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
      review_printer(message)
    end
    
  end
  
  def state_search_printer(state, haunt)
    Haunt.states.each do |haunt|
      message = "\nName: #{haunt[:name]},\nState: #{haunt[:state]},\nCity: #{haunt[:city]},\nDescription: \n#{haunt[:description]}\n\n\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
    end
    puts "\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
    puts "\nState: #{state}"
    puts "\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
    Haunt.states.each do |haunt|
      message = "\nName: #{haunt[:name]},\nState: #{haunt[:state]},\nCity: #{haunt[:city]},\nDescription: \n#{haunt[:description]}\n\n\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
      review_printer(message)
    
    end
    
    
  end

  def review_printer(message)
    next_or_back = $prompt.select(message, response_choices[:next_or_back_choices])
    if next_or_back == "Back"
      launch_first_menu
    end
  end
  
  def run_program
    name = welcome_get_name
    yes_or_no = move_on(name)
  
    if yes_or_no == "No"
      exit?
    else
      name = continue_message
      launch_first_menu(name)
    end
  end
  
