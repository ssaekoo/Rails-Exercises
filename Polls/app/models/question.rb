# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  poll_id    :integer
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  validates :poll_id, presence: true

  belongs_to :poll,
    foreign_key: :poll_id,
    class_name: 'Poll'

  has_many :answer_choices,
    foreign_key: :question_id,
    class_name: 'AnswerChoice'

  has_many :responses,
    foreign_key: :question_id,
    class_name: 'Response'

end
