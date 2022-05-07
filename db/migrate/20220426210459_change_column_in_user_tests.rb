class ChangeColumnInUserTests < ActiveRecord::Migration[7.0]
  def change
    rename_column(:user_tests, :status, :progress)
    change_column(:user_tests, :progress, :integer, default: 0)
  end
end
