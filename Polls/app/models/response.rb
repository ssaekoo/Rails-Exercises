# == Schema Information
#
# Table name: responses
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  question_id :integer
#  answer_id   :integer
#  created_at  :datetime
#  updated_at  :datetime

class Response < ActiveRecord::Base
  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :answer_id, presence: true
  validates :user_id, uniqueness: { scope: :question_id }
  validate :user_is_not_valid_user, :answer_is_not_valid_answer, :question_is_not_valid_question

  def user_is_not_valid_user
    errors.add(:response_user, "does not exist") unless User.exists?(user_id)
  end

  def answer_is_not_valid_answer
    errors.add(:answer, "does not exist") unless AnswerChoice.exists?(answer_id)
  end

  def question_is_not_valid_question
    errors.add(:question, "does not exist") unless Question.exists?(question_id)
  end

  belongs_to :question,
    foreign_key: :question_id,
    class_name: 'Question'

  belongs_to :user,
    foreign_key: :user_id,
    class_name: 'User'

  belongs_to :answer,
    foreign_key: :answer_id,
    class_name: 'AnswerChoice'

  has_one :poll,
    through: :question,
    source: :poll

  has_one :designer,
    through: :poll,
    source: :user

  has_many :sibling_responses,
    through: :question,
    source: :responses

  def singling_yourself_out
    sibling_responses.where{ id != self.id }
  end

end
