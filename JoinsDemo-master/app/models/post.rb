# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  author_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base

  validates :title, :body, :author_id, :presence => true

  belongs_to :author, :class_name => "User"
  has_many :comments, :foreign_key => :post_id
end
