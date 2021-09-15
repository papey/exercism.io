defmodule Lasagna do
  @expected_minutes_in_oven 40
  @minutes_per_layer 2

  def expected_minutes_in_oven, do: @expected_minutes_in_oven

  def remaining_minutes_in_oven(elapsed), do: @expected_minutes_in_oven - elapsed

  def preparation_time_in_minutes(layers), do: layers * @minutes_per_layer

  def total_time_in_minutes(layers, elapsed), do: preparation_time_in_minutes(layers) + elapsed

  def alarm(), do: "Ding!"
end
