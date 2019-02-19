class AddHelpfulToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :helpful, :integer
  end
end
