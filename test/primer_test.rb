require "minitest/autorun"

class PrimerTest < Minitest::Unit::Test

  describe "when initialized" do
    it "should have an initial value in the primes array" do
      @primer = Primer.new
      @primer.num.must_equal 3
    end
  end

end