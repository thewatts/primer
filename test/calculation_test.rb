require 'test_helper'

# test "asdf" do
#   primer = Primer.new
#   assert_equal primer.num, 3
# end

describe Primer::Calculation do

  before do
    @primer = Primer::Calculation.new
  end

  it "should start with the correct values" do
    @primer.num.must_equal 3, "Must start with 3 as our @num"
    @primer.primes[0].must_equal 2,
      "Need to start our app with the first prime!"
    @primer.failure.must_equal false
    @primer.desired_prime.must_be_nil
  end

  it "sending a non prime through should cause failure to be true" do
    @primer.num = 4
    @primer.divide_by_prime_for_remainder
    @primer.failure.must_equal true
  end

  it "should correctly find the next prime number" do
    desired_prime = "1"
    @primer.run(desired_prime)
    @primer.find_next_prime_number
    @primer.primes.length.must_equal @primer.desired_prime
    @primer.primes.last.must_equal 2
  end

  it "should correctly solve Euler #7 " do
    skip
    desired_prime = "10001"
    @primer.run(desired_prime)
    @primer.find_next_prime_number
    @primer.primes.length.must_equal @primer.desired_prime
    @primer.primes.last.must_equal 104743
  end


end