class InsufficientFundsError < StandardError; end

class BankAccount
  def initialize(balance = 0)
    @balance = balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise InsufficientFundsError, "Not enough Funds" if amount > @balance
    @balance -= amount
  end

  def check_balance
    puts "Current Balance: #{balance}"
    @balance
  end

  private
  attr_accessor :balance

end


class SavingsAccount < BankAccount
  def add_interest(rate)
    interest = @balance * rate
    deposit(interest)
  end
end

puts " Test Bank account "
account = BankAccount.new(1000)
puts "account balance = #{account.check_balance}"
account.deposit(5000)
puts "account new balance = #{account.check_balance}"
account.withdraw(1000)
puts "account new balance = #{account.check_balance}"

puts " Test savings account "
savings = SavingsAccount.new(1000)
savings.add_interest(0.5)
savings.check_balance()