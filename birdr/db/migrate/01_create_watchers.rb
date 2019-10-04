class CreateWatchers < ActiveRecord::Migration[5.2]
    def change
   create_table :watchers do |column|
  column.string :name
  column.string :fav
  column.integer :age
  column.text :catchphrase
    end
end
end