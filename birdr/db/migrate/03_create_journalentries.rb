class CreateJournalentries < ActiveRecord::Migration[5.2]
    def change
   create_table :journalentries do |column|
  column.integer :watcher_id
  column.integer :bird_id
    end
end
end