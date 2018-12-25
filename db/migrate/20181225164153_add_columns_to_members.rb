class AddColumnsToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :sign_in_count, :integer
    add_column :members, :current_sign_in_at, :datetime
    add_column :members, :last_sign_in_at, :datetime
    add_column :members, :current_sign_in_ip, :string
    add_column :members, :last_sign_in_ip, :string
  end
end
