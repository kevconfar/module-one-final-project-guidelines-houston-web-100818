class ParanormalExperiences < ActiveRecord::Migration[5.2]
  def change
    t.text :experience, array: true, default: []
  end
end
