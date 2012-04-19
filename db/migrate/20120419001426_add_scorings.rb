class AddScorings < ActiveRecord::Migration
  def up
    create_table :scorings do |t|
      t.integer :reason_id
      t.integer :user_id
      t.integer :vote
      t.timestamps
    end
  end

  def down
  end
end
