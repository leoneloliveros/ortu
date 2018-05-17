class Post < ApplicationRecord
  belongs_to :user
  has_many :pictures, as: :pictureable
end
