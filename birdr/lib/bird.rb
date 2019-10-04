class Bird < ActiveRecord::Base
  has_many :journalentries
  has_many :watchers, through: :journalentries
end