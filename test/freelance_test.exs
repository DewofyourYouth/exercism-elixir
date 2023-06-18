defmodule FreelancerRatesTest do
  use ExUnit.Case
  doctest FreelancerRates

  describe "daily rate" do
    test "calculates daily rate" do
      assert FreelancerRates.daily_rate(10) == 80.0
    end
  end

  describe "apply discount" do
    test "applies a discount" do
      assert FreelancerRates.apply_discount(100, 50) == 50.0
      assert FreelancerRates.apply_discount(150, 10) == 135.0
    end
  end

  describe "days in budget" do
    test "calculates days in budget" do
      assert FreelancerRates.days_in_budget(1600, 50, 0.0) == 4
    end

    test "always returns a float" do
      assert FreelancerRates.days_in_budget(520, 65, 0.0) === 1.0
    end

    test "rounds down to one decimal place" do
      assert FreelancerRates.days_in_budget(4410, 55, 0.0) == 10.0
      assert FreelancerRates.days_in_budget(4480, 55, 0.0) == 10.1
    end

    test "applies a discount" do
      assert FreelancerRates.days_in_budget(480, 60, 20) == 1.2
    end
  end
end
