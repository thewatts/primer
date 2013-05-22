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


# def prime(desired_prime)
#   # create our array of primes
#   @primes = [2]
#   num = 3
#   return @primes[0] if desired_prime == 1

#   puts "\n.... finding your prime .... \n"

#   while (@primes.length <= desired_prime)
#     fail_count = 0
#     @primes.each do |prime|
#       if (num % prime) == 0
#         fail_count += 1
#       end
#     end

#     if fail_count > 0
#       num += 1
#     else
#       @primes << num
#       num += 1
#       @bar.increment!
#     end

#   end
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
