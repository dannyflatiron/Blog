class SecretMessageMailer < ApplicationMailer

    def secret_message(receiver, sender, message)
        @receiver = receiver
        @sender = sender
        @message = message

        mail(to: "masterdesignsnyc@gmail.com", 
            subject: "Classified Message from #{@sender.username}",
            reply_to: @sender.email
        )
    end

end
