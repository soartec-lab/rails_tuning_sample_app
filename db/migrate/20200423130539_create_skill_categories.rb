class CreateSkillCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :skill_categories do |t|
      t.string :name
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
