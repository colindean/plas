Factory.define :registration_transfer do |f|
  f.association :to_user, :factory => :user
  f.association :from_user, :factory => :user
  f.association :by_user, :factory => :user
  f.association :registration, :factory => :registration
end

