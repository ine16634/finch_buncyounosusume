class AddCategoryMethodToquestions < ActiveRecord::Migration[6.1]
  def change
    
    add_column :questions, :category_method, :integer
    
  end
end
