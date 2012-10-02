module Users
  class UserResponseEntity < Grape::Entity
    expose :first_name
    expose :last_name
    expose :email
  end
end
