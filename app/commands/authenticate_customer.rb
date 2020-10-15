class AuthenticateCustomer
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    if customer
      payload = {
        customer_id: customer.id,
        customer_email: customer.email,
        expired: 24.hours.from_now
      }
      JWT.encode(payload, Rails.application.secrets.secret_key_base) if customer
    end
  end

  private

  attr_accessor :email, :password

  def customer
    customer = Customer.find_by_email(email)
    return customer if customer && customer.authenticate(password) && customer.confirmed_at?

    errors.add :customer_authentication, 'invalid credentials'
    nil
  end
end
