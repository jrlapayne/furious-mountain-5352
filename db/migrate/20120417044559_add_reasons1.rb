class AddReasons1 < ActiveRecord::Migration
  def up
    create_table :reasons do |t|
      t.integer :topic_id
      t.string :question
      t.boolean :question_approved
      t.string :title
      t.text :content
      t.integer :score, :null => 0
      t.boolean :is_pro
      t.timestamps
    end
  end

  def down
  end
end
