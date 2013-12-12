require 'progress_bar'

module Primer
  class Calculation

    attr_accessor :primes, :num, :failure
    attr_reader   :desired_prime, :output

    def initialize
      @output        = Primer::Message.new
      @primes        = [2]   # 2 is the first prime
      @num           = 3     # our starting number
      @failure       = false # innocent until proven otherwise
    end

    def start
      output.welcome
      output.start_prompt
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
      self.reset
      output.searching(@desired_prime)
      find_next_prime_number
      output.solution(@desired_prime, primes.last)
      continue
    end

    def continue
      output.continue
    end

    def self.calculate(desired_prime)
      new(desired_prime).calculate
    end

    def finish
      @output.exit
      exit
    end

    def reset
      @primes = [2]
      @num    = 3
    end

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

    def divide_by_prime_for_remainder
      primes.each do |prime|
        if (@num % prime) == 0
          @failure = true # means the num is not a prime
          break # therefore stop looping
        end
      end
      @failure
    end
  end
end
