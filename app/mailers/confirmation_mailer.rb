class ConfirmationMailer < ApplicationMailer
  def account(customer_id)
    @recipient = Customer.find(customer_id)
    @template  = EmailTemplate.active.type(:email_confirmation).last

    check_attachment(@template)

    mail to: @recipient.email, subject: 'Konfirmasi Akun'
  end

  private

  def check_attachment(template)
    if template.attachment_file.present?
      attachments["#{File.basename(template.attachment_file.path)}"] = template.attachment_file.read
    end
  end
end
