class RemoveIsDisplayFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :questions, :is_display, :boolean
  end
end
