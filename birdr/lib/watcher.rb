class Watcher < ActiveRecord::Base
  has_many :journalentries
  has_many :birds, through: :journalentries


  def add_bird(guy, bird)
    Journalentry.create(watcher_id: guy.id, bird_id: bird.id)
  end


  # def delete_favorite(bird)
  #   Favorite.find_by(bird_id: bird.id).destroy
  # end
end