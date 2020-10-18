class AddLikeNumToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :like_num, :integer, default: 0
  end
end
