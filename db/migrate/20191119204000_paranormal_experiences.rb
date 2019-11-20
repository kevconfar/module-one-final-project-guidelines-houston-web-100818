class ParanormalExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :paranormal_experiences do |t|
      t.string :experience
    end
  end
end
