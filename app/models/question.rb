class Question < ApplicationRecord

  QUESTIONS_MAX_SIZE = 2

  belongs_to :survey

  validate :max_questions

  def max_questions
    errors.add(:questions, 'too much') if associated_questions_valid?
  end

  def associated_questions_valid?
    custom_questions = survey.questions.where(default_question: false)
    custom_questions.count >= QUESTIONS_MAX_SIZE
  end

end
