class Post < ApplicationRecord
  validates :title,presence:true,length:{minimum:5,maximum:100}
  validates :body,presence:true

  has_many :comments, dependent: :destroy
  has_many :post_tags
  has_many :tags, through: :post_tags
end
