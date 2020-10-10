class ConfirmationJob < ApplicationJob
  queue_as 'b2b-api-confirmation'

  def perform(confirmation_type, customer_id, resource_id)
    ConfirmationMailer.send(confirmation_type, customer_id, resource_id).deliver
  end
end
