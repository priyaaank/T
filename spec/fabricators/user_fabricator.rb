Fabricator(:user) do
  first_name "Gregory"
  last_name  "House"
  email { sequence(:email) { |i| "gregory_house_#{i}@mailinator.com" } }
  password "p@ssw0rd"
  password_confirmation "p@ssw0rd"
  after_create { |user| user.confirm! }
end
