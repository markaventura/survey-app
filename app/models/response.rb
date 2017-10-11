class Response < ApplicationRecord

  belongs_to :survey
  has_many :response_questions
  
end
