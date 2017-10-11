class CreateResponseQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :response_questions do |t|
      t.integer :response_id
      t.integer :question_id
      t.string :question
      t.string :answer
      t.boolean :default_question, defualt: true

      t.timestamps
    end

    add_index :response_questions, :response_id
    add_index :response_questions, :question_id
  end
end
