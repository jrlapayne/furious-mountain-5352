class QuizActivities < ActiveRecord::Migration
  def up
    create_table :quizactivities do |t|
      t.integer :topic_id
      t.integer :user_id
      t.integer :reason_id
      t.integer :next_reason
      t.boolean :is_correct
      t.timestamps
    end
  end

  def down
  end
end
