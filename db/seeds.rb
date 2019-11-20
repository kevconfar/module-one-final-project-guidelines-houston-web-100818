require 'nokogiri'
require 'open-uri'
require_relative '../config/environment'
require_relative 'seeds_helper'

# uses final haunt hash, done one state at  a time in order, creates a Paranormal_Experience based on the descriptions.
state_arr.each do |state|
    final_haunt_hash["#{state}"].each do |hash|
        arr = []
        desc = hash[:description].split(/\W+/)
        activities.each do |key, values|
            matches = desc & values
            if matches.length > 0
                arr << key.to_s
            end
        end
        exp = arr.uniq.join(" ")
        Paranormal_Experience.find_or_create_by({ experience: "#{exp}" }).save
    end
end

# href_arr.each do |state_href|
#     href = "#{state_href}"
#     haunt_hasher("#{href}").each do |one, two|
#         two.each do |hash|
#             arr = []
#             desc = hash[:description].split(/\W+/)
#             activities.each do |key, values|
#                 matches = desc & values
#                 if matches.length > 0
#                     arr << key.to_s
#                 end
#             end
#             exp = arr.uniq.join(" ")
#             # if !exp == ""
#             Paranormal_Experience.find_or_create_by({ experience: "#{exp}" }).save
#             # else
#             #     blank = "nil"
#             #     Paranormal_Experience.find_or_create_by({ experience: "#{blank}" })
#             # end
#         end
#     end
# end




# Haunt.all.each do |haunt|
#     desc = haunt.description.split(/\W+/)
#     arr = []
#     activities.each do |key, values|
#         matches = desc & values
#         if matches.length > 0
#             arr << key.to_s
#         end
#     end
#     exp = arr.uniq.join(" ")
#     Paranormal_Experience.find_or_create_by({ experience: "#{exp}" })
# end



# href_arr.each do |state_href|
#     href = "#{state_href}"
#     haunt_hasher("#{state_href}").each do |one, two|
#         two.each do |hash|
#             arr = []
#             desc = hash[:description].split(/\W+/)
#             activities.each do |key, values|
#                 matches = desc & values
#                 if matches.length > 0
#                     arr << key.to_s
#                 end
#             end
#             exp = arr.join(" ")
#             Paranormal_Experience.find_or_create_by({ experience: "#{exp}" })
#         end
#     end
# end

        
        

