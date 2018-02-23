class CreateQuestionSheets < ActiveRecord::Migration[5.1]
  def change
    create_table :question_sheets do |t|
      t.integer :choosen_answer
      t.integer :question_id
      t.integer :exam_sheet_id

      t.timestamps
    end
  end
end
