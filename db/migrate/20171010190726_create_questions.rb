class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :question
      t.integer :survey_id
      t.boolean :default_question, default: false

      t.timestamps
    end

    add_index :questions, :survey_id
  end
end
