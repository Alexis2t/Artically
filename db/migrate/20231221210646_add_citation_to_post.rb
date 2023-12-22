class AddCitationToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :citation, :text
  end
end
