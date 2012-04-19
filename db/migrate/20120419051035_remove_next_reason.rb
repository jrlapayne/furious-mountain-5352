class RemoveNextReason < ActiveRecord::Migration
  def up
    remove_column :quizactivities, :next_reason
  end

  def down
  end
end
