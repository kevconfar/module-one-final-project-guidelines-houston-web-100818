# require_relative 'seeds_helper'
require_relative '../config/environment'




state_href.each do |h|
    href = "#{h}"
    puts state_name(href)
end

