class CreateExamShares < ActiveRecord::Migration[5.1]
  def change
    create_table :exam_shares do |t|
      t.integer    :exam_id
      t.string     :share_digest
      t.string     :email
      t.boolean    :one_time_use   , :default => true 
      t.timestamps
    end
  end
end
