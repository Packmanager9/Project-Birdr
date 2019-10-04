class CreateBirds  < ActiveRecord::Migration[5.2]
    def change
   create_table :birds do |column|
  column.string :commonname
  column.string :diet
  column.string :sciname
  column.text :color
    end
end
end