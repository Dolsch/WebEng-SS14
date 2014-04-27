class AddNameToUser < ActiveRecord::Migration

  def up
    execute << SQL
      DELETE FROM users
    SQL
  end

  def change
    add_column :users, :name, :string
  end
end
