defmodule KitchenCalculator do
  def get_volume({_, vol}), do: vol

  def to_milliliter({:milliliter, _} = volume_pair), do: volume_pair

  def to_milliliter({:cup, vol}),
    do: {:milliliter, vol * 240}

  def to_milliliter({:fluid_ounce, vol}),
    do: {:milliliter, vol * 30}

  def to_milliliter({:teaspoon, vol}),
    do: {:milliliter, vol * 5}

  def to_milliliter({:tablespoon, vol}),
    do: {:milliliter, vol * 15}

  def from_milliliter(volume_pair, :milliliter),
    do: volume_pair

  def from_milliliter({_, volume}, :cup),
    do: {:cup, volume / 240}

  def from_milliliter({_, volume}, :fluid_ounce),
    do: {:fluid_ounce, volume / 30}

  def from_milliliter({_, volume}, :teaspoon),
    do: {:teaspoon, volume / 5}

  def from_milliliter({_, volume}, :tablespoon),
    do: {:tablespoon, volume / 15}

  def convert(volume_pair, unit), do: volume_pair |> to_milliliter() |> from_milliliter(unit)
end
