class MultiTNameChange < ActiveRecord::Migration
  def up
    rename_column :quizactivities, :topic_id, :t_id
    rename_column :quizzes, :topic_id, :t_id
    rename_column :reasons, :topic_id, :t_id
  end

  def down
  end
end
