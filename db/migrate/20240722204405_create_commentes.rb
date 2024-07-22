class CreateCommentes < ActiveRecord::Migration[6.1]
  def change
    create_table :commentes do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :potin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
