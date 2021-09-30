class Subscription < ActiveRecord::Base
    belongs_to :magazine
    belongs_to :reader

    def print_detail
        "#{self.reader.name} subscribed to #{self.magazine.title} for #{self.price} dollars"
    end
end