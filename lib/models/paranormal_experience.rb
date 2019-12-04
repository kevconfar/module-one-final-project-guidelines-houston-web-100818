
class ParanormalExperience < ActiveRecord::Base

    belongs_to :haunt

    def self.visual_array
        ["orbs", "shadow", "figure", "light", "items moving", "apparition", "shape", "orb", "shapes", "writing", "appears"]
    end

    def self.auditory_array
        ["sound", "whisper", "scream", "voice", "voices", "screams", "whispers", "sounds", "bang", "bangs", "laugh", "laughing", "cry", "crying", "hear"]
    end

    def self.physical_array
        ["thrown", "throw", "cold", "hot", "scratched", "bit", "bitten", "bite", "biting", "scratches", "threw", "lights on", "lights off", "poltergeist", "touch", "scratch", "possess", "possessed", "possession"]
    end

    def self.visual_exp
        visual_exp = ["orbs", "shadow", "figure", "light", "items moving", "apparition", "shape", "orb", "shapes", "writing", "appears"]
        visiualHaunts = []

        Haunt.all.each do |haunt|
            visual_exp.each do |word|
                if haunt.description.include? (word)
                    visualHaunts << haunt
                end
            end
        end
        visualHaunts.uniq
    end
    
    



    # def self.visual_haunt?
    #     new_visual_array = self.visual_array

    #     visual_paranormal_experience_array = ParanormalExperience.all.select do | content |
    #         paranormal_experience_array = paranormal_experience.content.split(" ").collect do | word |
    #             word.downcase.gsub(/[^0-9A-Za-z]/,'')
    #         end
    #         !(paranormal_experience_array & new_visual_array).empty?
    #     end
    #     self.visual_array_to_hash(visual_paranormal_experience_array)
    #   end

    #   def self.visual_array_to_hash(visual_paranormal_experience_array)
    #     visual_paranormal_experience_hash = {}
    #     visual_paranormal_experience_array.each do | content |
    #       if !visual_paranormal_experience_hash[content.haunt.name]
    #         visual_paranormal_experience_hash[content.haunt.name] = [{"content" => paranormal_experience.content}]
    #       else
    #         visual_paranormal_experience_hash[content.haunt.name] << {"content" => paranormal_experience.content}
    #       end
    #     end
    #     visual_paranormal_experience_hash
    #   end
  
end