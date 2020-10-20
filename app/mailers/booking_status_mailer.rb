class BookingStatusMailer < ApplicationMailer
  add_template_helper ApplicationHelper

  def paid(customer_id, booking_id)
    @recipient = Customer.find(customer_id)
    @booking   = Booking.find(booking_id)
    @template  = EmailTemplate.active.type(:payment_paid).last

    check_attachment(@template)

    mail to: @recipient.email, subject: 'Pembayaran Sukses'
  end

  def modified(customer_id, booking_id)
    @recipient = Customer.find(customer_id)
    @booking   = Booking.find(booking_id)
    @template  = EmailTemplate.active.type(:booking_modified).last

    check_attachment(@template)

    mail to: @recipient.email, subject: 'Perubahan Booking'
  end

  def cancelled(customer_id, booking_id)
    @recipient = Customer.find(customer_id)
    @booking   = Booking.find(booking_id)
    @template  = EmailTemplate.active.type(:booking_cancelled).last

    check_attachment(@template)

    mail to: @recipient.email, subject: 'Pembatalan Booking'
  end

  def down_payment(customer_id, booking_id)
    @recipient = Customer.find(customer_id)
    @booking   = Booking.find(booking_id)
    @template  = EmailTemplate.active.type(:down_payment).last

    check_attachment(@template)

    mail to: @recipient.email, subject: 'Pembayaran DP'
  end

  def saving_progress(customer_id, booking_id)
    @recipient = Customer.find(customer_id)
    @booking   = Booking.find(booking_id)
    @template  = EmailTemplate.active.type(:savings_progress).last

    check_attachment(@template)

    mail to: @recipient.email, subject: 'Pembayaran Tabungan'
  end

  def completed(customer_id, booking_id)
    @recipient = Customer.find(customer_id)
    @booking   = Booking.find(booking_id)
    @template  = EmailTemplate.active.type(:booking_completed).last

    check_attachment(@template)

    mail to: @recipient.email, subject: 'Booking Selesai'
  end

  private

  def check_attachment(template)
    if template.attachment_file.present?
      attachments["#{File.basename(template.attachment_file.path)}"] = template.attachment_file.read
    end
  end
end
