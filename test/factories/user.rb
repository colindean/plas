Factory.sequence :email do |n|
  "username#{n}@example.com"
end

Factory.sequence :handle do |n|
  "handle#{n}"
end

Factory.define :user do |f|
  f.email { Factory.next :email }
  f.handle { Factory.next :handle }
  f.given_name 'Robert'
  f.family_name 'User'
  f.password 'P4ssw0rD'
end

