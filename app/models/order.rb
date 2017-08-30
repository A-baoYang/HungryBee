class Order < ApplicationRecord

    has_many :comments
    belongs_to :user
    has_many :votes, as: :voteable
    validates :name, presence: true
    validates :phone, presence: true
    validates :description, presence: true

    def up_votes
        self.votes.where(vote: true).length
    end
    
    def down_votes
        self.votes.where(vote: false).length
    end

    def total_votes
        up_votes - down_votes
    end
end
