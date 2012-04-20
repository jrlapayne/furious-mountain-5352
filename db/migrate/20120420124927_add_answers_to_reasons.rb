class AddAnswersToReasons < ActiveRecord::Migration
  def change
     add_column :reasons, :correct_answer, :string
     add_column :reasons, :wrong_answer1, :string
     add_column :reasons, :wrong_answer2, :string
     add_column :reasons, :wrong_answer3, :string
     add_column :reasons, :wrong_answer4, :string
  end
end
