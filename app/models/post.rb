class Post < ApplicationRecord
    paginates_per 5

    belongs_to :user
    has_many :comments
    belongs_to :category


end
