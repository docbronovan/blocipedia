class Droptable < ActiveRecord::Migration
  def change
    drop_table :users_wikis
  end
end
