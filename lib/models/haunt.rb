class Haunt < ActiveRecord::Base

    has_many :paranormal_experiences

    def haunt_activity
        output = ""
        num = self.id.to_i
        exp = ParanormalExperience.find_by_id(num)
        if exp.experience == ""
            output << "Much about this haunt is unknown. Proceed with caution."
        else
            x = exp.experience.titleize
            y = x.split(" ")
            if y.length == 1
                output << "#{y[0]} activity as been reported"
            elsif y.length == 2
                output << "#{y[0]} and #{y[1].downcase} activity have been reported."
            else
                output << "#{y[0]}, #{y[1].downcase}, and #{y[2].downcase} activity has been reported."
            end
        end
        output
    end
        
        
    def location_of_haunt
        line = " -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-"
        "\nLOCATION: #{self.city}, #{self.state} | NAME: #{self.name}\n#{line}\n"
    end

    def test_method
        num = self.id.to_i
        par_exp = ParanormalExperience.find_by_id(num)
        "\nName: #{Haunt.find_by_id(num).name} | Activity: #{par_exp.experience.split(", ").capitalize}"
    end

    def haunt_info
        spacer = "                                         "
        divider = "=><= =><==><= =><==><= =><==><= =><==><= =><==><= =><==><= =><==><= =><==><= =><==><= =><==><= =><==><= =><==><= =><==><= =><==><= =><==><= =><==><= =><="
        line = " -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-"
        "#{divider}\n#{divider}\n\n#{spacer}WARNING: #{self.haunt_activity.upcase}\n\nNAME: #{self.name}\nLOCATION: #{self.city}, #{self.state}\n\n   #{self.description}\n\n#{line}\n\n\n\n\n\n\n\n\n"
    end

    def name_location
        line = " -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-"
        "\nName: #{self.name} | Location: #{self.city}, #{self.state}\n#{line}"
    end

    



end

