class RemoveIsViolateFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :questions, :is_violate, :boolean
  end
end
