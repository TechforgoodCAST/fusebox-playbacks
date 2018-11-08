class CreateInsights < ActiveRecord::Migration[5.2]
  def change
    create_table :insights do |t|
      t.string :name
      t.string :certainty
      t.text :description
      t.text :successes
      t.text :improvements
      t.text :learnings
      t.text :notes
      t.references :section, foreign_key: true
      t.references :playback, foreign_key: true

      t.timestamps
    end
  end
end
