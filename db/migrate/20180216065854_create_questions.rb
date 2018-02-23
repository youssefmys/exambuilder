class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string  :title
      t.string  :first_answer
      t.string  :second_answer
      t.string  :third_answer
      t.string  :fourth_answer
      t.integer :marks
      t.integer :exam_id
      t.integer :right_answer

      t.timestamps
    end
  end
end
