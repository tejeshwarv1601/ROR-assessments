class InvalidEmailError < StandardError; end
class WeakPasswordError < StandardError; end
class UnderAgeError < StandardError; end


class UserValidator
  attr_accessor :user_data

  def initialize(user_data)
    @user_data = user_data
  end
  def validate
    unless @user_data[:email].include?('@')
      raise InvalidEmailError, "Email '#{@user_data[:email]}' is not valid and missing @"
    end
    
    if @user_data[:password].length < 8
      raise WeakPasswordError, "password is too short"
    end

    if @user_data[:age]<18
      raise UnderAgeError, "User is under age and must above 18 to access this site."
    end

    puts "validation success valid user found"
  end
end

valid_user_input = {
  email: "tejeshwar@kpit.com",
  password: "12345667789",
  age: 25 
}

invalid_user_input = {
  email: "tejeshwar@kpit.com",
  password: "123456",
  age: 12
}

valid_validator = UserValidator.new(valid_user_input)
invalid_validator = UserValidator.new(invalid_user_input)

valid_validator.validate
invalid_validator.validate
