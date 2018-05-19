class Post < ApplicationRecord
  belongs_to :user
  has_many :pictures, as: :pictureable
  has_many :comments, as: :commentable
end
