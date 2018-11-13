class AddSourceToPlaybacks < ActiveRecord::Migration[5.2]
  def change
    add_column :playbacks, :source, :string
  end
end
