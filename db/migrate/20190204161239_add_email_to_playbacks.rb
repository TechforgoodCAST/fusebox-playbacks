class AddEmailToPlaybacks < ActiveRecord::Migration[5.2]
  def change
    add_column :playbacks, :email, :string
  end
end
