class Post < ApplicationRecord
	belongs_to :user
	attachment :post_image
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	validates :body,
	presence: true,
	length: {maximum: 140}
	validates :place_name, presence: true
	validates :difficult, presence: true
end
