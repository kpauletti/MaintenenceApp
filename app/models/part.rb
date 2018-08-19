class Part < ApplicationRecord
  def self.search(search_term)
    where("LOWER(name) LIKE :search_term", search_term: "%#{search_term.downcase}%")
  end
end
