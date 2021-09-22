defmodule FreelancerRates do
  @billable_hours_per_day 8.0
  @billable_days_per_mounth 22

  def daily_rate(hourly_rate), do: hourly_rate * @billable_hours_per_day

  def apply_discount(before_discount, discount),
    do: before_discount - before_discount * (discount / 100)

  def monthly_rate(hourly_rate, discount),
    do:
      (daily_rate(hourly_rate) * @billable_days_per_mounth)
      |> apply_discount(discount)
      |> ceil()

  def days_in_budget(budget, hourly_rate, discount),
    do: (budget / apply_discount(daily_rate(hourly_rate), discount)) |> Float.floor(1)
end
