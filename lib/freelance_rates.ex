defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount * discount / 100
    |> (&(before_discount - &1)).()
  end

  def monthly_rate(hourly_rate, discount) do
    daily_rate(hourly_rate) * 22
    |> apply_discount(discount)
    |> ceil
    |> Kernel.trunc()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    apply_discount(hourly_rate, discount)
    |> daily_rate()
    |> (&(budget / &1)).()
    |> Float.floor(1)
  end
end
