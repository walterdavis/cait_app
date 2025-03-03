class OrderMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.new_order.subject
  #

  helper :application

  def new_order(order)
    @order = order

    mail to: "cait@caitlin-davis.com", bcc: "waltd@mac.com", subject: "New Custom Order"
  end
end
