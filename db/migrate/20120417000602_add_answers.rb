class AddAnswers < ActiveRecord::Migration
  def up
    create_table :answers do |t|
      t.string :content
      t.boolean :is_correct
      t.integer :reason_id
      t.timestamps
    end
  end

  def down
  end
end
