class AddAdminToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin, :boolean, null: false, default: false
    remove_column :users, :role, :string, default: 'client', null: false
    add_column :users, :is_specialist, :boolean, null: false, default: false
  end
end
