class AddIncludeRetroToInsight < ActiveRecord::Migration[5.2]
  def change
    add_column :insights, :include_retro, :boolean
  end
end
