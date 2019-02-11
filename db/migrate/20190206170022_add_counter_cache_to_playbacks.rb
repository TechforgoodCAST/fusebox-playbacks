class AddCounterCacheToPlaybacks < ActiveRecord::Migration[5.2]
  def change
    add_column :playbacks, :comments_count, :integer, null: false, default: 0

    reversible do |dir|
      dir.up do
        Section.joins(:comments).group(:playback_id).count(:commentable_id).each do |id, count|
          Playback.find(id).update(comments_count: count)
          print '.'
        end
      end
    end
  end
end
