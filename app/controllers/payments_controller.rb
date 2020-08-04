class PaymentsController < ApplicationController
    def success

    end

    def webhook
        payment_id= params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        mushroom_id = payment.metadata.mushroom_id
        user_id = payment.metadata.user_id
    
        p "mushroom id " + mushroom_id
        p "user id " + user_id
    
        status 200
    end
    
end
