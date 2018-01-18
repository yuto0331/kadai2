class Blog < ApplicationRecord
    validates :title, presence: true, length: { minimum: 1, maximum: 140 }
    validates :content, presence: true, length: { minimum: 1, maximum: 140 }
end