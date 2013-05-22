require 'progress_bar'

module Primer
  class Calculation

    attr_accessor :primes
    attr_accessor :num
    attr_accessor :failure
    attr_reader   :desired_prime

    def initialize
      @output        = Primer::Message.new
      @primes        = [2]   # 2 is the first prime
      @num           = 3     # our starting number
      @failure       = false # innocent until proven otherwise
    end

    def start
      @output.welcome
      @output.start_prompt
    end

    def run(desired_prime)
      unless desired_prime.downcase == "exit"
        @desired_prime = desired_prime.to_i
        @bar           = ProgressBar.new(@desired_prime, :bar, :counter,
                                         :percentage, :elapsed)
        calculate
      else
        finish
      end
    end

    def calculate
      @output.searching(@desired_prime)
      find_next_prime_number
      @output.solution(@desired_prime, primes.last)
      continue
    end

    def continue
      @output.continue
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

    def finish
      @output.exit
      exit
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
end

# puts "\n\nTHE ANSWER IS " + Primer.calculate(desired_prime).to_s