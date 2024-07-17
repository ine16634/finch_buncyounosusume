class CreateAnswerComments < ActiveRecord::Migration[6.1]
  def change
    create_table :answer_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :answer_id

      t.timestamps
    end
  end
end
