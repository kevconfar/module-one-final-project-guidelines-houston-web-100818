# The original CLI from github

# require_relative '../config/environment'
# require 'tty-prompt'

# $prompt = TTY::Prompt.new

# $start_menu_choices = {
#   "Search haunts by name" => 0,
#   "Search haunts by location" => 1, 
#   "Search haunts by type of haunting" => 2,
#   "Exit" => 3
# }

# $type_of_haunting_menu_choices = { 
#   "Visual" => 1,
#   "Physical" => 2,
#   "Auditory" => 3,
#   "Back" => 4
# }

# def messages(name=nil)
#     {
#       start: "Pick your haunt: ",
#       location: "Where would you like to be scared? ",
#       type_of_haunting: "What kind of experience are you looking for? ",
#       move_on: "#{name}, are you ready to be scared!? ",
#       move_on_again: "Are you sure you can handle it?",
#       continue_message1: "Don't be a wuss. Let's do this anyway.",
#       continue_message2: "Let's get scared! ",
#       welcome: "Welcome to the Haunt. What's your name?",
#       input_error: "Sorry, please try again.",
#       exit: "OK, Scaredy Cat! Goodbye!",
#       haunt_search: "Enter the name of the haunted place you're looking: ",
#       location_search: "Enter the name of state you would like to explore: "
#     }
# end


# def response_choices
#     {
#       move_on_choices: %w(Yes No),
#       move_on_again_choices: %w(I\ was\ born\ ready Probably\ not),
#       next_or_back_choices: %w(Next\ review Back)
#     }
# end

# def welcome_get_name
#     name = $prompt.ask(messages[:welcome]) do |q|
#         q.required true
#         q.validate /\A\w+\Z/
#         q.modify   :capitalize
#     end
# end

# def move_on(name)
#     move_on = $prompt.select(messages(name)[:move_on], response_choices[:move_on_choices])
# end
  
# def exit?
#     puts messages[:exit]
#     exit
# end
  
# def continue_message
#     move_on_again = $prompt.select(messages[:move_on_again], response_choices[:move_on_again_choices])
#     if move_on_again == "Probably not"
#         print messages[:continue_message1]
#         return "scaredy cat"
#     else
#         print messages[:continue_message2]
#         return "good choice"
#     end
# end

# def launch_menu(menu_choice, message)
#     $prompt.select(message, menu_choice)
# end

# def find_by_state(input)
#     input = gets.chomp
# end
  
#   def launch_first_menu(name=nil)
#     start_choice = launch_menu($start_menu_choices, messages(name)[:start])
  
#     case start_choice
#     when 0
#         haunt_name = $prompt.select(messages[:haunt_search], filter: true) do |options|
#             Haunt.all.collect do |haunt|
#                 options.choice haunt.name
#             end
#         end
#         haunt_choice = Haunt.find_by(name: haunt_name).haunts.order("name")
#         haunt_search_printer(haunt_name)
#         launch_first_menu
#     when 1
#         location_name = $prompt.select(messages[:location_search], filter: true) do |options|
#             Haunt.all.collect do |state|
#                 options.choice state.name
#             end
#         end
#         location_choice = find_by_state(input)
#         location_search_printer(location_name)
#         launch_first_menu
#     when 2
#         type_of_haunting_choice = launch_menu($type_of_haunting_menu_choices, messages[:type_of_haunting])
#         launch_type_of_haunting_menu(type_of_haunting_choice)
#     when 3
#         exit
#     end
# end


#   # def launch_type_of_haunting_menu(type_of_haunting_choice)
#   #     case type_of_haunting_choice
#   #     when 0
#   #       visual_type = $prompt.select(messages[:type_of_haunting], filter: true) do |options|
#   #         Paranormal_Experience.all.collect do |description|
#   #           description.each do |word|
#   #             if word.includes?("orbs") || word.includes?("shadow") || word.includes?("figure") || word.includes?("lights") || word.includes?("items moving") || word.includes?("apparition")
#   #               options.choice visual.description
#   #        # Haunt.all.collect do |description|
#   #         #  options.choice description.visual
#   #             end
#   #           end
      
#   #       visual_choice = Paranormal_Experience.find_by(description: visual_type).haunts.order("name")
#   #       visual_haunting_printer(visual_type) 
#   #       launch_first_menu
#   #     when 1
#   #       auditory_haunting_printer(Paranormal_Experience.type_of_haunting_hash)
#   #       launch_first_menu
#   #     when 2
#   #       physical_haunting_printer(Paranormal_Experience.type_of_haunting_hash)
#   #       launch_first_menu
#   #     when 3
#   #       launch_first_menu
#   #     end

#   # end

#   # def physical_haunting_printer(type_of_haunting_hash)
#   #     type_of_haunting_hash.each do | physical |
#   #       message = "\nName: #{haunt[:name]}\nPlace: #{haunt[:state]}\nReview:\n#{review[:review]}\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
#   #       review_printer(message)
#   #     end
#   # end

#   # def auditory_haunting_printer
#   # end
#   # def visual_haunting_printer
#   # end

# def haunt_search_printer(name)
#     puts "\nHaunt: #{name}"
#     Haunt.each do |haunt|
#         message = "\nCity:\n#{haunt.city},\nState:\n#{haunt.state},\nDescription:\n#{haunt.description}\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
#         review_printer(message)
#     end
# end
  
# def location_search_printer(state)
#     puts "\nState: #{state}"
#     puts "\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
#     Haunt.each do |haunt|
#         message = "\nName:\n#{haunt.name},\nCity:\n#{haunt.city},\nDescription:\n#{haunt.description}\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
#         review_printer(message)
#     end
# end

# def review_printer(message)
#     next_or_back = $prompt.select(message, response_choices[:next_or_back_choices])
#     if next_or_back == "Back"
#         launch_first_menu
#     end
# end
  
# def run_program
#     name = welcome_get_name
#     yes_or_no = move_on(name)
  
#     if yes_or_no == "No"
#         exit?
#     else
#         name = continue_message
#         launch_first_menu(name)
#     end
# end
