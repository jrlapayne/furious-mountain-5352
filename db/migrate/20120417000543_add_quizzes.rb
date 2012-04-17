class AddQuizzes < ActiveRecord::Migration
  def up
    create_table :quizzes do |t|
      t.integer :topic_id
      t.timestamps
    end
  end

  def down
  end
end
