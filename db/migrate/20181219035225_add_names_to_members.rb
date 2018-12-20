class AddNamesToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :firstname, :string
    add_column :members, :lastname, :string
    remove_column :members, :name, :string
  end
end
