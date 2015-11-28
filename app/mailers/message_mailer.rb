class MessageMailer < ApplicationMailer
  def new_message(message)
    @message = message    
    mail(to: message.owner_email, subject: "Message from #{message.name}")
  end
end