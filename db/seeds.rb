require 'nokogiri'
require 'open-uri'
require_relative '../config/environment'
require_relative 'seeds_helper'

#Seeds Haunts into the database
href_arr.each do |state_href|
    href = "#{state_href}"
    haunt_hasher("#{state_href}").each do |one, two|
        two.each do |hash|
            Haunt.find_or_create_by({ name: "#{hash[:name]}", city: "#{hash[:city]}", state: "#{hash[:state]}", description: "#{hash[:description]}"})
        end
    end
end

#Seeds Paranormal_Experiences into the database
Haunt.all.each do |haunt|
    arr = []
    activities.each do |key, value|
        desc = haunt.description
        descrip = desc.split(/\W+/)
        matches = descrip & value
        if matches.length > 0
            arr << key.to_s
        end
    end
    exp = arr.uniq.join(" ")
    ParanormalExperience.create(experience: "#{exp}")
end




        
        

