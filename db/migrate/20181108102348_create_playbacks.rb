class CreatePlaybacks < ActiveRecord::Migration[5.2]
  def change
    create_table :playbacks do |t|
      t.string :organisation_name
      t.string :project_name
      t.string :author_name
      t.string :period
      t.string :logo_url
      t.text :description
      t.text :notes

      t.timestamps
    end
  end
end
