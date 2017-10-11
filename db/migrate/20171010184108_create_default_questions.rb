class CreateDefaultQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :default_questions do |t|
      t.string :question

      t.timestamps
    end
  end
end
