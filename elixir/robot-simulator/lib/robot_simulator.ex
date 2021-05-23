defmodule RobotSimulator do
  @dir [:north, :south, :east, :west]
  @right %{:north => :east, :east => :south, :south => :west, :west => :north}
  @left %{:north => :west, :west => :south, :south => :east, :east => :north}
  @forward %{:north => {0, 1}, :east => {1, 0}, :south => {0, -1}, :west => {-1, 0}}

  defstruct direction: :north, x: 0, y: 0

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0})

  def create(direction, _) when direction not in @dir, do: {:error, "invalid direction"}

  def create(direction, {x, y}) when is_integer(x) and is_integer(y),
    do: %RobotSimulator{direction: direction, x: x, y: y}

  def create(_, _), do: {:error, "invalid position"}

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    Enum.reduce_while(String.to_charlist(instructions), robot, fn
      ?R, robot ->
        {:cont, %{robot | direction: Map.fetch!(@right, robot.direction)}}

      ?L, robot ->
        {:cont, %{robot | direction: Map.fetch!(@left, robot.direction)}}

      ?A, robot ->
        {dx, dy} = Map.fetch!(@forward, robot.direction)
        {:cont, %{robot | x: robot.x + dx, y: robot.y + dy}}

      _, _ ->
        {:halt, {:error, "invalid instruction"}}
    end)
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(%RobotSimulator{direction: dir}), do: dir

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(%RobotSimulator{x: x, y: y}), do: {x, y}
end
