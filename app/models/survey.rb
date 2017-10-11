class Survey < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :questions, dependent: :destroy
  has_many :responses, dependent: :destroy

end


