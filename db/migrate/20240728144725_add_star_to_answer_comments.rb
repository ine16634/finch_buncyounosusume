class AddStarToAnswerComments < ActiveRecord::Migration[6.1]
  def change
    add_column :answer_comments, :star, :integer
  end
end
