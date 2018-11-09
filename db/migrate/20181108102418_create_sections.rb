class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.string :name
      t.text :description
      t.references :playback, foreign_key: true

      t.timestamps
    end
  end
end
