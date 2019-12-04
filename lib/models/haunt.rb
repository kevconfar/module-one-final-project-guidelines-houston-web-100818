class Haunt < ActiveRecord::Base

    has_many :paranormal_experiences

    def location_of_haunt
        line = " -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-"
        "\nLOCATION: #{self.city}, #{self.state} | NAME: #{self.name}\n#{line}\n"
    end
\
    def test_method
        num = self.id.to_i
        par_exp = ParanormalExperience.find_by_id(num)
        "\nName: #{Haunt.find_by_id(num).name} | Activity: #{par_exp.experience.split(", ").capitalize}"
    end

    def haunt_info
        line = " -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-"
        "\nName:  #{self.name}\nLocation:  #{self.city}, #{self.state}\nAbout: \n#{self.description}\n\n\n#{line}"
    end

    def name_location
        line = " -~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-"
        "\nName: #{self.name} | Location: #{self.city}, #{self.state}\n#{line}"
    end

    



end

