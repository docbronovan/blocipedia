class CreateThroughTable < ActiveRecord::Migration
  def change
    create_table :users_wikis, id: false do |t|
      t.references :user
      t.references :wiki
    end
  end
end
