class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.text :name
      t.references :insight, foreign_key: true
      t.date :due_on
      t.date :completed_on

      t.timestamps
    end
  end
end
