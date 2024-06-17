class RenameHandleNameColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :handle_name, :name
      
  end
end
