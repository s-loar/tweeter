class AddDefaultToLikes < ActiveRecord::Migration[6.1]
  def change
    change_column_default :tweets, :likes, 0
  end
end
