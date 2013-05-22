require 'test_helper'

describe Primer do # test/primer_test.rb:3:in `<main>': uninitialized constant Primer (NameError)
  it "should have an initial value in the primes array" do
    @primer = Primer.new
    @primer.num.must_equal 3
  end
end
