class RenameBodyColumnToQuestions < ActiveRecord::Migration[6.1]
  def change
    rename_column :questions, :body, :title
  end
end
