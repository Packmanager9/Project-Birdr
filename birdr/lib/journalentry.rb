class Journalentry < ActiveRecord::Base
  belongs_to :watcher
  belongs_to :bird
end