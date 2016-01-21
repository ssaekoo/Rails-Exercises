# == Schema Information
#
# Table name: polls
#
#  id         :integer          not null, primary key
#  title      :string
#  author_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Poll < ActiveRecord::Base
  validates :title, presence: true
  validates :author_id, presence: true

  belongs_to :user,
    foreign_key: :author_id,
    class_name: 'User'

  has_many :questions,
    foreign_key: :poll_id,
    class_name: 'Question'

  has_many :answer_choices,
    through: :questions,
    source: :answer_choices

  has_many :responses,
    through: :answer_choices,
    source: :responses

end
