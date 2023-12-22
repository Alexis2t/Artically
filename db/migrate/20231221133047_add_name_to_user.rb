class AddNameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nickname, :string, default: "", null: false
  end
end
