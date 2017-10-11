class User < ApplicationRecord

  include Authenticatable
  include TokenProcessor

  attr_accessor :current_token


  has_many :access_tokens, dependent: :destroy
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles

  validates :email, presence: true, uniqueness: true

  def self.find_by_credentials(creds)
    user = self.find_by(email: creds.fetch(:email, ''))
    user if user.present? && user.valid_password?(creds.fetch(:password, ''))
  end

end
