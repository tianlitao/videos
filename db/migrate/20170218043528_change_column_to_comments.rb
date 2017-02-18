class ChangeColumnToComments < ActiveRecord::Migration
  def change
    change_column_default :comments, :user_id, 0
  end
end
