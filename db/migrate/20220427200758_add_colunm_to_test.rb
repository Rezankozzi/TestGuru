class AddColunmToTest < ActiveRecord::Migration[7.0]
  def change
    change_table :tests do |t|
      t.references :user, foreign_key: true
    end
  end
end
