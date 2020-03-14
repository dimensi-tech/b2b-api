class ConfirmationJob < ApplicationJob
  queue_as 'b2b-api-confirmation'

  def perform(customer_id)
    ConfirmationMailer.account(customer_id).deliver
  end
end
