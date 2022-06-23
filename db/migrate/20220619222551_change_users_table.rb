class ChangeUsersTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :password, :password_digest
  end
end


# rename_column :table_name, :old_column, :new_column

# change_table :table_name do |t|
#   t.change :column_name, :column_type, {options}
# end

