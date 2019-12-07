class AuthorizeApiRequest
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    customer
  end

  private

  attr_reader :headers

  def customer
    @customer ||= Customer.find(decoded_auth_token[0]['customer_id']) if decoded_auth_token
    @customer || errors.add(:token, 'Invalid token') && nil
  end

  def decoded_auth_token
    @decoded_auth_token ||= JWT.decode(http_auth_header, Rails.application.secrets.secret_key_base, false) if http_auth_header
  end

  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else
      errors.add(:token, 'Missing token')
    end
    nil
  end
end