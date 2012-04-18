class RenameTopics < ActiveRecord::Migration
  def up
    rename_table :topics, :ts
  end

  def down
  end
end
