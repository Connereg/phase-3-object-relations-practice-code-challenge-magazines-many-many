class Reader < ActiveRecord::Base
    has_many :subscriptions
    has_many :magazines, through: :subscriptions

    def subscribe(price, magazine)
        Subscription.create(price: price, magazine: magazine, reader: self)
    end

    def total_subscription_price
        self.subscriptions.map do |sub|
            sub.price
        end.sum
    end

    def cancel_subscription(magazine)
        sub_to_destroy = self.subscriptions.where("magazine_id = #{magazine.id}")
        sub_to_destroy[0].destroy
    end


end