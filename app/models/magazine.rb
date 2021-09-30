class Magazine < ActiveRecord::Base
    has_many :subscriptions
    has_many :readers, through: :subscriptions

    def email_list
        self.readers.map {|r| r.email}.join(";")
    end

    def self.most_popular
        self.all.max_by {|mag| mag.subscriptions.size}
                # max_by (Grabs instance associated with highest value)
    end
    
    # all_mags = Magazine.all
    # all_mags.map {|mag| mag.subscriptions.size}
    # => [5, 2, 3, 5, 0, 2, 3, 0]

#
end