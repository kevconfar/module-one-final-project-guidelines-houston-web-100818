require 'nokogiri'
require 'open-uri'
require_relative '../config/environment'


def hrefs 
    html = open("https://www.hauntedrooms.com/haunted-places")
    doc = Nokogiri::HTML(html)

    return doc.css('div.entry-content li a').map { |link| link['href'] }
end

def href_arr # creates an array of urls that will be plugged into the other methods
    arr = []
    hrefs.each do |state|
        str = "https://www.hauntedrooms.com"
        str += "#{state}"
        arr << str
    end
    arr
end

def state_name(state_href) # gets state name
  href = "#{state_href}"

  html = open("#{href}")
  doc = Nokogiri::HTML(html)

  arr = doc.css(".entry-title").text.split(" ")
  state = arr.last
  
  if state == "TX" 
    state = "Texas"
  elsif state == "D.C." || state == "Island" || state == "Dakota" || state == "State"
    state = arr[-2..-1].join(" ")
  elsif state == "Virginia"
    if arr[-2] == "West"
      state = "West Virginia"
    else
      state = "Virginia"
    end
  end

  state
end


def haunt_info(state_href) # creates an array for each haunt with subarrays for its name and city
    haunt_names = []

    href = "#{state_href}"

    html = open("#{href}")
    doc = Nokogiri::HTML(html)

    places = doc.css(".section-title-main")

    places.each do |index|
        arr = []
        haunt = index.text[3..-1]
        haunt_names << haunt.split(", ")
    end

    haunt_names[0..-2]
end

def descriptions(state_href) # creates an array of descriptions (each description is 1 index)

    href = "#{state_href}"

    html = open("#{href}")
    doc = Nokogiri::HTML(html)

    unparsed_info = doc.css(".page-inner p")

    paragraph = ""
    x = unparsed_info[3..-1]
    x.each do |index|
        description = index.text
        if !description.empty?
            paragraph << description
        else
            paragraph << "*"
        end
    end

  h_description = paragraph.split("*")
  last = h_description.pop.split(".")
  h_description += [last[0..-3].join(".")]
  h_description
end

def activities 
{
  :visual => ["orbs", "shadow", "shadows", "figure", "figures", "light", "lights", "apparition", "apparitions", "shape", "shapes", "sighting", "sightings", "appears", "appearance", "appearances", "floating", "float", "floats", "seen"],
  :auditory => ["sound", "whipser", "sounds", "bang", "bangs", "laugh", "laughing", "laughs", "cry", "crying", "cries", "hear", "heard", "hearing", "laughs", "whipsers", "whipsering", "screams", "screaming", "scream", "seen", "seen"],
  :physical => ["thrown", "throw", "threw", "cold", "hot", "scratched", "scratch", "scratches", "bit", "bitten", "bite", "biting", "bites", "lights on", "lights off", "poltergeist", "possess", "possessed", "possession", "touch", "touched", "touches", "bruised"]
}
end


def haunt_hasher(state_href) # creates a hash of every haunt in a state

    haunt_hash = {}
    href = "#{state_href}"

    info = haunt_info(href)
    state = state_name(href)
    about = descriptions(href)
        
    info.each do |haunt| # Added .lstrip to Names to get rid of leading whitespace.
        if haunt.length == 3
            if !haunt_hash[state]
                haunt_hash[state] = [{ :name => haunt[0].to_s.lstrip, :city => haunt[1].to_s, :state => state.to_s, :description => about[info.index(haunt)].to_s }]
                
            else
                haunt_hash[state] << { :name => haunt[0].to_s.lstrip, :city => haunt[1].to_s, :state => state.to_s, :description => about[info.index(haunt)].to_s }
            end
        else
            if !haunt_hash[state]
                haunt_hash[state] = [{ :name => haunt[0].to_s.lstrip, :city => haunt[1].to_s, :state => state.to_s, :description => about[info.index(haunt)].to_s }]
            else
                haunt_hash[state] << { :name => haunt[0].to_s.lstrip, :city => haunt[1].to_s, :state => state.to_s, :description => about[info.index(haunt)].to_s }
            end
        end
    end 

    haunt_hash
end

def final_haunt_hash # creates a hash of every state and their haunts
    hash = {}

    href_arr.each do |state_href|
        href = "#{state_href}"
        merger = haunt_hasher(href) 
        hash.merge!(merger)
    end

    hash
end

def state_list # puts states into an array
  arr = []
  href_arr.each do |state_href|
    state = state_name("#{state_href}")

    if state == "TX" 
      state = "Texas"
    elsif state == "D.C." || state == "Island" || state == "Dakota" || state == "State"
      state = arr[-2..-1].join(" ")
    elsif state == "Virginia"
      if arr[-2] == "West"
        state = "West Virginia"
      else
          state = "Virginia"
      end
    end
  end
end

  