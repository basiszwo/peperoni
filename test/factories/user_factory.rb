Factory.sequence :email do |n|
  "user#{n}@test.local"
end

Factory.define :user do |user|
  user.email                  { Factory.next :email }
  user.username               { "my username" }
  user.password               { "secretpassword" }
  user.password_confirmation  { |u| u.password }
end

Factory.define :frontend_user do |user|
  user.email                  { Factory.next :email }
  user.username               { "frontend username" }
  user.password               { "secretpassword" }
  user.password_confirmation  { |u| u.password }
  user.status                 { 'active' }
end

Factory.define :backend_user do |user|
  user.email                  { Factory.next :email }
  user.username               { "backend username" }
  user.password               { "secretpassword" }
  user.password_confirmation  { |u| u.password }
  user.status                 { 'active' }
end