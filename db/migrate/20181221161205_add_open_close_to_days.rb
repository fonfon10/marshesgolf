class AddOpenCloseToDays < ActiveRecord::Migration[5.1]
  def change
    add_column :days, :open_close_id, :integer
  end
end
