class Haunt < ActiveRecord::Base

    has_many :paranormal_experiences
    
    def self.names
        Haunt.all.each do |haunt|
         haunt.name
        end.uniq
     end

    states = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Oklahoma", "Oregon", "Pennsylvania", "Island", "Carolina", "Colorado", "Connecticut", "Delaware", "D.C.", 
    "Florida", "Georgia", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Helena", "Nebraska", "Nevada", "England", "NH", "CT", "ME", "Hampshire", "Dakota", "Tennessee", "TX", "Utah", "Vermont", "Hawaii", "Idaho", "Illinois", 
    "Indiana", "Iowa", "Kansas", "Jersey", "Mexico", "NY", "NC", "Ohio", "Virginia", "State", "Wisconsin", "Wyoming"]
    
    def self.states
       Haunt.all.each do |haunt|
        haunt.state
       end.uniq
    end

#     def self.states_array
#         ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Oklahoma", "Oregon", "Pennsylvania", "Island", "Carolina", "Colorado", "Connecticut", "Delaware", "D.C.", 
#     "Florida", "Georgia", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Helena", "Nebraska", "Nevada", "England", "NH", "CT", "ME", "Hampshire", "Dakota", "Tennessee", "TX", "Utah", "Vermont", "Hawaii", "Idaho", "Illinois", 
#     "Indiana", "Iowa", "Kansas", "Jersey", "Mexico", "NY", "NC", "Ohio", "Virginia", "State", "Wisconsin", "Wyoming"]
        
#     end	
    
#     def self.haunt_by_state
#         states = Haunt.all.select do | haunt |
#           words = haunt.state.split(" ").collect do | word |
#             word.downcase.gsub(/[^0-9A-Za-z]/,'')
#           end
#           words.include?("state") && !(words & Haunt.states_array).empty?
#         end
    
#         states.collect do | state |
#           state = Haunt.all.where(id: state[:state])[0][:name]
#           { name: name, state: state, haunt: haunt.state }
#         end
#       end

#   def self.state?(states_word=nil)
#     new_states_array = self.states_array
#     new_states_array = [states_word.downcase] if states_word

#     states_haunt_array = Haunt.all.select do | haunt |
#       states_array = haunt.state.split(" ").collect do | word |
#         word.downcase.gsub(/[^0-9A-Za-z]/,'')
#       end
#       !(states_array & new_states_array).empty?
#     end
#     self.state_array_to_hash(haunt_by_state)
#   end

#   def self.state_array_to_hash(haunt_by_state)
#     states_haunt_hash = {}
#     haunt_by_state.each do | haunt |
#       if !states_haunt_hash[haunt.state]
#         states_haunt_hash[haunt.state.name] = [{"state" => haunt.state}]
#       else
#         states_haunt_hash[haunt.state.name] << {"state" => haunt.state}
#       end
#     end
#     states_haunt_hash
#   end
    def find_by_state(state)
        Haunt.all.select do |state|
            haunt.state.find do | state | 
                state == Haunt.state
            end
        end.uniq
        
    end

  
    def self.find_haunts_for_state(state)
        haunts_for_state = self.all.find_by_name(state).haunts.uniq.map do |haunt|
          haunt.name
        end
    end

    # def self.find_by_state
    #     array = Haunt.states
    #     array.map do | state|
    #   end
    # end

      def self.filter_by_state(state)
        includes(:haunt).where(haunts: {state: state})
      end

#     # def self.states
#     #     Haunt.all.map do | haunt |
#     #         haunt.state.split(" ").collect do | word |
#     #             word.gsub(/[^0-9A-Za-z]/,'')
#     #         end
#     #     end.uniq
#     # end

#     # - Get a list of all the haunts by a specific state
#   def states
#     Haunt.all.select do |haunt|
#       haunt.state == self
#     end
#   end

# #- Get a list of all the galleries that 
# # a specific artist has paintings in
#   def states
#     Haunts.all.select do | haunt |
#       haunt.states.find do | state |
#         state.haunt == self
#       end 
#     end
#   end

    

end

