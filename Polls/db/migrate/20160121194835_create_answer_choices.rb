class CreateAnswerChoices < ActiveRecord::Migration
  def change
    create_table :answer_choices do |t|
      t.integer :question_id
      t.string :body
    end
    add_index :answer_choices, :question_id
  end
end
