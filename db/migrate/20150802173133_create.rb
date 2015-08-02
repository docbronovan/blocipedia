class Create < ActiveRecord::Migration
  def change
    create_table :users_wikis, id: false do |t|
      t.references :users
      t.references :wikis
    end
  end
end