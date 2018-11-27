class RemoveForeignKeyFromCommentsSteps < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :comments, :steps
  end
end
