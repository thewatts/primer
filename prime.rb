require 'progress_bar'

puts "\n\n"
puts "============================================"
puts "=======> Welcome to PRIMER! <========="
puts "\n\n"

print "Enter your desired prime... "
desired_prime = gets.chomp.to_i

class Primer

  attr_accessor :primes
  attr_accessor :num
  attr_reader   :max

  def initialize(max)
    @max = max
    @primes = [2]
    @num = 3
  end

  def calculate
    unless max_is_prime?
      find_next_prime_number
    end

    primes.last
  end

  def self.calculate(max)
    new(max).calculate
  end

  private

    # def current_num_is_prime?
    #   false
    # end

    def find_next_prime_number
      failure = false

      while @primes.length <= max and !failure
        @primes.each do |prime|
          # puts "#{prime}"
          puts "==> #{num}"
          if (@num % prime) == 0
            failure = true
          end
        end

        unless failure
          @primes << @num
          @num = @num + 1
        end
      end
    end

    def max_is_prime?
      max == 1
    end



end

@bar = ProgressBar.new(desired_prime, :bar, :counter, :percentage, :elapsed)

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

puts Primer.calculate(desired_prime)
