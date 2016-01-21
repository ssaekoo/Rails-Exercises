# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  user_name  :string
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true

  has_many :responses_made,
    foreign_key: :user_id,
    class_name: 'Response'

  has_many :polls,
    foreign_key: :poll_id,
    class_name: 'Poll'

  has_many :questions,
    through: :polls,
    source: :questions

  has_many :answer_choices,
    through: :questions,
    source: :answer_choices

  has_many :responses_of_design,
    through: :answer_choices,
    source: :responses

end
