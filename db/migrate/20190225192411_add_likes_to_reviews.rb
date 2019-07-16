class AddLikesToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :likes, :integer, default: 0
  end
end
