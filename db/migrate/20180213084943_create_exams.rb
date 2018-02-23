
class CreateExams < ActiveRecord::Migration[5.1]
  def change
    create_table :exams do |t|
      t.string  :title
      t.integer :user_id
      t.integer :pass_limit_percent, :default => 50
      t.integer :allowed_time_in_minutes
      t.string  :share_digest

      t.timestamps
    end
  end
end
