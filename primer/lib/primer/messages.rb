class Messages

  def initialize
    welcome
  end

  def welcome
    puts "Welcome to Primer!"
  end

  def searching(desired_prime)
    puts "... searching for prime number #{desired_prime}"
  end

  def solution(desired_prime, solved_prime)
    puts "HAPPY DAY!"
    puts "You wanted prime number #{desired_prime} and we found it!"
    puts "Prime number #{desired_prime} is ... #{solved_prime} !!!"
  end

end