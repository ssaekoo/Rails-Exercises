# == Schema Information
#
# Table name: answer_choices
#
#  id          :integer          not null, primary key
#  question_id :integer
#  body        :string
#  created_at  :datetime
#  updated_at  :datetime
#

class AnswerChoice < ActiveRecord::Base
  validates :question_id, presence: true
  validates :body, presence: true

  belongs_to :question,
    foreign_key: :question_id,
    class_name: 'Question'

  has_one :poll,
    through: :question,
    source: :poll

  has_many :responses,
    foreign_key: :answer_id,
    class_name: 'Response'

end
