=begin

  This is the original file, which I wrote out just to get the main piece working.
  I have since tried to break it down and made it more readable, as well as
  place it into some sort of structure...

=end

require 'progress_bar'

puts "\n\n"
puts "============================================"
puts "=======> Welcome to PRIMER! <========="
puts "\n\n"

print "Enter your desired prime... "
desired_prime = gets.chomp.to_i

@bar = ProgressBar.new(desired_prime, :bar, :counter, :percentage, :elapsed)

class Primer

  attr_accessor :primes
  attr_accessor :num
  attr_reader   :desired_prime

  def initialize(desired_prime)
    @desired_prime = desired_prime
    @primes = [2]
    @num = 3
  end

  def calculate
    find_next_prime_number
    primes.last
  end

  def self.calculate(desired_prime)
    new(desired_prime).calculate
  end

  private

    def find_next_prime_number

      # innocent until proven otherwise
      failure = false

      while primes.length < desired_prime and !failure

        failure = false
        primes.each do |prime|
          if (@num % prime) == 0
            # number is not a prime. sad day
            failure = true
            @num += 1
          end
        end

        unless failure
          primes << @num
          @num += 1
        end

        failure = false
      end
    end
end

puts "\n\nTHE ANSWER IS " + Primer.calculate(desired_prime).to_s
