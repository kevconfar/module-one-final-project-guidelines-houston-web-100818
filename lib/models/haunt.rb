class Haunt < ActiveRecord::Base

    has_many :paranormal_experiences
    # has_many :ghost_hunters, through: :paranormal_experiences

    # def location_of_haunt
    #     line = " -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-"
    #     "\n           NAME: #{self.name} | LOCATION: #{self.city}, #{self.state}\n\n #{self.description}\n\n\n#{line}\n\n"
    # end

    def location_of_haunt
        line = " -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-"
        "\nNAME: #{self.name} | LOCATION: #{self.city}, #{self.state}\n#{line}\n"
    end

    # def haunt_by_experience
    #     line = " -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-"
    #     arr = []
    #     self.all.collect do |haunt|
    #         if haunt.id.to_i == self.id.to_i
    #             arr << "\nNAME:  #{haunt.name}\nLOCATION:  #{haunt.city}, #{haunt.state}\nABOUT: \n#{haunt.description}\n\n\n#{line}"
    #         end
    #     end
    #     arr
    # end

    def test_method
        num = self.id.to_i
        par_exp = ParanormalExperience.find_by_id(num)
        "\nName: #{Haunt.find_by_id(num).name} | Activity: #{par_exp.experience.split(", ").capitalize}"
    end

    def haunt_by_experience
        line = " -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-"
        arr = []
        self.all.collect do |v_haunt|
            if v_haunt.id.to_i == self.id.to_i


            end
        end
        arr
    end

    def haunt_info
        line = " -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-"
        "\nName:  #{self.name}\nLocation:  #{self.city}, #{self.state}\nAbout: \n#{self.description}\n\n\n#{line}"
    end

    def name_location
        line = " -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-"
        "\nName: #{self.name} | Location: #{self.city}, #{self.state}\n#{line}"
    end

    def self.vis_array
        ParanormalExperience.all.collect do |exp|
            if 




    # def vis_haunt
    #     num = self.id.to_i # ParanormalExperience ID number
    #     if !self.experience == ""
    #         x = self.experience.split(" ") # Creates array ["Visual", "Auditory", "Physical"]
    #         x.each do |index|
    #             if index == "Visual"
    #                 output = Haunt.find_by_id(num)
    #                 return ouput.haunt_info
    #             end
    #         end
    #     end
    # end
                

    # def haunt_exp
    #     num = self.id
    #     h = Haunt.find_by_id(num)
    #     h.haunt_info
    # end

    # def haunts_by_state

    # end

    # def visual_haunts
    #     line = " -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-"

    #     arr = []
    #     ParanormalExperience.all.each do |h|
    #         exp = h.experience
    #         if exp.include? "Visual"
    #             Haunt.all.collect do |haunt|
    #                 if h.id.to_i == haunt.id.to_i
    #                     arr << "\nName:  #{haunt.name}\nLocation:  #{haunt.city}, #{haunt.state}\nAbout: \n#{haunt.description}\n\n\n#{line}"
    #                 end
    #             end
    #         end
    #     end
    #     arr
    # end


    # def visual_haunt
    #     haunt = self
    #     line = " -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-"
    #     ParanormalExperience.all.each do |exp|
    #         if exp.id.to_i == haunt.id.to_i
    #             if exp.experience.include? "Visual"
    #                 return "\nName:  #{haunt.name}\nLocation:  #{haunt.city}, #{haunt.state}\nAbout: \n#{haunt.description}\n\n\n#{line}"
    #             end
    #         end
    #     end
    # end

    # def visual_checker
    #     num = self.id.to_i
    #     if self.experience.include? "visual"
    #         x = Haunt.find_by_id("#{num}")
    #         return location_of_haunt(x)
    #     end
    # end

    # def self.all_visual_haunts
    #     # arr = []
    #     self.all.collect do |exp|
    #         if exp.experience.include? "visual"
    #             exp
    #         end
    #     end
    # end

    




    def final_solution
        num = self.id.to_i
        haunt = Haunt.find_by_id(num)
        act = self.experience.split(" ").capitalize
        "#{num}.  Name: #{haunt.name} | Activity: #{act.join(", ")} "
    end

        


                




end

