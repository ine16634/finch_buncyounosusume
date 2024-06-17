class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      
      t.integer "user_id"
      t.integer "category_id"
      t.text :question_content
      t.string :body
      t.boolean "is_solve"
      t.boolean "is_violate"
      t.boolean "is_display"
      
      t.timestamps
    end
  end
end
