class TicketNumberMailer < ActionMailer::Base
  default from: 'cinema@dayzee.com'

  def send_number(number, email)
    @number = number
    mail(to: email, subject: "This is your number ")
  end

end