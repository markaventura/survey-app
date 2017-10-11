class CreateResponse < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.string :respondent_name
      t.integer :survey_id
      t.string :name

      t.timestamps
    end

    add_index :responses, :survey_id
  end
end
