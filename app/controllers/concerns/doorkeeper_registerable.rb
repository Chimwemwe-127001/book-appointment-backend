module DoorkeeperRegisterable
  extend ActiveSupport::Concern

  def generate_refresh_token
    loop do
      token = SecureRandom.hex(32)
      break token unless Doorkeeper::AccessToken.exists?(refresh_token: token)
    end
  end

  def render_user(user, client_app, token_type='Bearer')
      access_token = Doorkeeper::AccessToken.create!(resource_owner_id: user.id, 
                                                      application_id: client_app.id, 
                                                      expires_in: Doorkeeper.configuration.access_token_expires_in.to_i, 
                                                      refresh_token: generate_refresh_token,
                                                      scopes: '')
    {
      id: user.id,
      email: user.email,
      role: user.role,
      access_token: access_token.token,
      token_type: token_type,
      expires_in: access_token.expires_in,
      refresh_token: access_token.refresh_token,
      created_at: access_token.created_at.to_time,
    }

  end
end