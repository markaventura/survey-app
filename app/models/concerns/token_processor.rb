module TokenProcessor
  extend ActiveSupport::Concern

  def set_access_token attributes={}
    self.current_token = generated_token
    self.access_tokens.create(attributes.merge({token: self.current_token}))
  end

  def generated_token
    SecureRandom.urlsafe_base64(32).tr('lIO0', 'sxyz')
  end

  def destroy_token
    token = self.access_tokens.find_by(token: self.current_token)
    if token.present?
      token.destroy
    else
      false
    end
  end

end
