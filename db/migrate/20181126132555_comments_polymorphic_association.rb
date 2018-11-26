class CommentsPolymorphicAssociation < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :step_id, :commentable_id
    add_column :comments, :commentable_type, :string
  end
end
