class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :skill_name
      t.string :description

      t.timestamps
    end
  end
end
