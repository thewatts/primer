require 'progress_bar'

puts "\n\n"
puts "============================================"
puts "==========> Welcome to PRIMER! <============"
puts "\n\n"

print "Enter your desired prime... "
desired_prime = gets.chomp.to_i

class Primer

  attr_accessor :primes
  attr_accessor :num
  attr_accessor :failure
  attr_reader   :desired_prime

  def initialize(desired_prime)
    @desired_prime = desired_prime
    @primes        = [2] # 2 is the first prime
    @num           = 3   # our starting number
    @failure       = false # innocent until proven otherwise
    @bar           = ProgressBar.new(desired_prime, :bar, :counter,
                                     :percentage, :elapsed)
  end

  def calculate
    puts "\n.... finding your prime .... \n"
    find_next_prime_number
    primes.last
  end

  def self.calculate(desired_prime)
    new(desired_prime).calculate
  end

  # in order to check if a number is a prime,
  # you can divide it by all the other primes that are less than itself
  # if it is not divisible by any of them => said number is a prime.
  def divide_by_prime_for_remainder
    # loop through our primes, which increase every time we find one
    primes.each do |prime|
      if (@num % prime) == 0
        @failure = true # means the num is not a prime
        break # therefore stop looping
      end
    end
    @failure
  end

  private

    # the length of our primes array will be the same as our desired prime.
    #   ex: if we have 3 primes in the array, [2,3,5] - our desired 3rd prime
    #   would be 5.
    # we want to keep looping until our primes.length is equal to our
    #   desired prime
    def find_next_prime_number
      @bar.increment!
      while primes.length < desired_prime and !@failure
        # failure = false # reset our failure flag for new numbers
        divide_by_prime_for_remainder
        unless @failure
          primes << @num unless @failure
          @bar.increment!
        end
        @num += 1 # increment
        @failure = false # reset flag
      end

    end

end

#   puts "\n\n================================"
#   puts "==         SOLUTION           =="
#   puts "You wanted to find prime number: #{desired_prime}"
#   puts "That prime is: #{ @primes[ desired_prime-1 ] }"
#   puts "================================"
# end

# def calc(num)
#   puts "NUM: #{num}"
#   @primes.inject(0) do |fail_count, prime|
#     fail_count + ( (num % prime) ? 1 : 0 )
#   end
# end

#prime(desired_prime)

puts "\n\nTHE ANSWER IS " + Primer.calculate(desired_prime).to_s
