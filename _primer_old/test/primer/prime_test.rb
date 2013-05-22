require 'test_helper'

class Prime
  describe Prime do

    # before do
    #   @prime = Prime.new(desired_prime)
    # end

    it "should be true" do
      assert true
    end

    it "should require non-zero value" do
    end

    it "should return 2 if user desires the 1st prime" do
      prime = Prime.new(1)
      prime_solution = 2
      message = Message.new
      prime.calculate.must_equal message.solution(1, prime_solution)
    end

  end
end