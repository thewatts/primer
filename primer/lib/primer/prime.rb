module Primer
  class Prime

    # start with the user's desired prime
    def initialize(desired_prime)
      @messages      = Messages.new
      @desired_prime = desired_prime
      @primes        = [2] # our initial array of primes
      @num           = 3   # our starting number
      # calculate
    end

    def calculate
      # give the folks a heads up that we're doin' work!
      @messages.searching(@desired_prime)

      # if we want the first, that's easy
      solution(@primes[0]) if @desired_prime == 1

      # otherwise, start looping through numbers
      # checking for prime status
      while (@primes.length <= @desired_prime)
        unless validate_prime(@num) > 0
          primes << @num
        end
        @num += 1
      end
    end

    # find out if the number at hand is really a prime number
    # by using modulus against our valid primes
    def validate_prime(num)
      fail_count = 0
      @primes.each do |prime|
        if (@num % prime) == 0
          fail_count += 1
        end
      end
      fail_count # if fail_count > 0, it's *not* a prime
    end

    # output our solution and verbiage
    def solution(solved_prime)
      @messages.solution(@desired_prime, solved_prime)
    end

  end
end