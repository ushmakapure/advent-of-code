
def find_blank()
    subscriptions = Subscription.where('created_at > ? and stripe_subscription_id is not null', 1.month.ago)
    result = []
    subscriptions.each do |subscription|
        subscription.account.social_profiles.each do |sp|
            if sp.instagram? && sp.linkinbio_enabled && sp.keen_read_key.blank? 
                result << sp
            end 
        end
    end 
    return result
end 

def fix(empty)
    empty.each do |sp| 
        KeenHelper.create_access_key(sp.keen_access_key_body)
    end
end 

KeenHelper.create_access_key(empty.keen_access_key_body)
