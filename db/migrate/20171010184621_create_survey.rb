class CreateSurvey < ActiveRecord::Migration[5.1]
  def change
    create_table :surveys do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end

    add_index :surveys, :slug, unique: true
  end
end
