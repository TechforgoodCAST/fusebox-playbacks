class AddConfidenceToSections < ActiveRecord::Migration[5.2]
  def change
    add_column :sections, :confidence, :integer
  end
end
