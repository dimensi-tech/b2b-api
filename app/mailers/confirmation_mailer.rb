class ConfirmationMailer < ApplicationMailer
  add_template_helper ApplicationHelper

  def account(customer_id, _resource_id)
    @recipient = Customer.find(customer_id)
    @template  = EmailTemplate.active.type(:email_confirmation).last

    check_attachment(@template)

    mail to: @recipient.email, subject: 'Konfirmasi Akun'
  end

  def booking(customer_id, resource_id)
    @recipient = Customer.find(customer_id)
    @booking   = Booking.find(resource_id)
    @template  = EmailTemplate.active.type(:booking_confirmation).last

    check_attachment(@template)

    mail to: @recipient.email, subject: 'Konfirmasi Booking'
  end

  def booking_partner(partner_id, resource_id)
    @recipient = Partner.find(partner_id)
    @booking   = Booking.find(resource_id)
    @template  = EmailTemplate.active.type(:booking_partner_confirmation).last

    check_attachment(@template)

    mail to: @recipient.email, subject: 'Booking Baru'
  end

  private

  def check_attachment(template)
    if template.attachment_file.present?
      attachments["#{File.basename(template.attachment_file.path)}"] = template.attachment_file.read
    end
  end
end
