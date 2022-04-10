class CreateUserTests < ActiveRecord::Migration[7.0]
  def change
    create_table :user_tests do |t|
      t.string :status, default: 'in progress'
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      t.datetime :started_at
      t.datetime :finished_at, default: 0
    end
  end
end
