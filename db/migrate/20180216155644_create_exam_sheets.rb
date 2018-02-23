class CreateExamSheets < ActiveRecord::Migration[5.1]
  def change
    create_table :exam_sheets do |t|
      t.integer :exam_id
      t.string  :student_name

      t.timestamps
    end
  end
end
