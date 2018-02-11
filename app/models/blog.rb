class Blog < ApplicationRecord
    validates :title, presence: true, length: { minimum: 1, maximum: 140 }
    validates :content, presence: true, length: { minimum: 1, maximum: 140 }
     belongs_to :user
     has_many :favorites, dependent: :destroy
     has_many :favorite_users, through: :favorites, source: :user 
    # has_many :users, through: :favorites
end