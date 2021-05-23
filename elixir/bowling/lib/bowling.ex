defmodule Bowling do
  @moduledoc """
    Creates a new game of bowling that can be used to store the results of
    the game
  """

  @strike 10
  @frames 10

  @pin_error_message "Pin count exceeds pins on the lane"

  defguardp negative_roll?(roll) when roll < 0
  defguardp over_roll?(roll) when roll > @strike
  defguardp invalid_frame?(r2, r1) when r1 + r2 > @strike
  defguardp spare?(r2, r1) when r1 + r2 == @strike
  defguardp strike?(r) when r == @strike
  defguardp extra_strike_bonus?(mult) when mult == 3

  defstruct frame: 1,
            # track rolls for the current frame
            rolls: [],
            # track multipliers from previous frames
            multipliers: {1, 1},
            # track the current score
            score: 0,
            # status of the game playing or finished
            status: :playing,
            # state of bonus either :none or :spare or :strike
            bonus: :none

  @doc """
    Creates a new game of bowling that can be used to store the results of
    the game
  """
  @spec start() :: %Bowling{}
  def start, do: %Bowling{}

  @doc """
    Records the number of pins knocked down on a single roll. Returns `any`
    unless there is something wrong with the given number of pins, in which
    case it returns a helpful message.
  """
  @spec roll(%Bowling{}, integer) :: %Bowling{} | {:error, String.t()}
  def roll(_, roll) when negative_roll?(roll), do: {:error, "Negative roll is invalid"}
  def roll(_, roll) when over_roll?(roll), do: {:error, @pin_error_message}

  def roll(%Bowling{status: :finished, bonus: :none}, _),
    do: {:error, "Cannot roll after game is over"}

  def roll(game = %Bowling{rolls: rolls}, roll), do: process(%{game | rolls: [roll | rolls]})

  # extra spare bonus
  defp process(game = %Bowling{rolls: [r], status: :finished, bonus: :spare}),
    do: %{game | score: game.score + r, bonus: :none}

  # extra strike bonus with previous strikes
  defp process(
         game = %Bowling{
           rolls: [_],
           multipliers: {cur_mult, _},
           status: :finished,
           bonus: :strike
         }
       )
       when extra_strike_bonus?(cur_mult),
       do: %{game | score: game.score + @frames}

  # extra roll on strike
  defp process(game = %Bowling{rolls: [_], status: :finished, bonus: :strike}),
    do: game

  # a strike on second roll when rolling strike bonus can't be a strike
  defp process(%Bowling{rolls: [r2, r1], status: :finished, bonus: :strike})
       when not strike?(r1) and strike?(r2),
       do: {:error, @pin_error_message}

  # when strike bonus rolls are not a valid frame
  defp process(%Bowling{rolls: [r2, r1], status: :finished, bonus: :strike})
       when not strike?(r1) and not strike?(r2) and invalid_frame?(r1, r2),
       do: {:error, @pin_error_message}

  # when strike bonus is a valid frame
  defp process(%Bowling{rolls: [r2, r1], status: :finished, bonus: :strike} = game),
    do: %{game | score: game.score + r1 + r2, bonus: :none}

  # when last frame is a stike, go into strike bonus
  defp process(%Bowling{rolls: [r], frame: @frames, multipliers: {m1, m2}} = game)
       when strike?(r),
       do: %{
         game
         | rolls: [],
           multipliers: {m2 + 1, 2},
           score: game.score + @strike * m1,
           status: :finished,
           bonus: :strike
       }

  # when current frame is a strike
  defp process(%Bowling{rolls: [r], multipliers: {m1, m2}} = game) when strike?(r),
    do: %{
      game
      | rolls: [],
        frame: game.frame + 1,
        multipliers: {m2 + 1, 2},
        score: game.score + @strike * m1,
        status: if(game.frame + 1 > @frames, do: :finished, else: :playing)
    }

  # frame accumulation, when first roll is not a strike
  defp process(%Bowling{rolls: [_]} = game), do: game

  # when a frame is invalid
  defp process(%Bowling{rolls: [r2, r1]}) when invalid_frame?(r2, r1),
    do: {:error, @pin_error_message}

  # when last frame is a spare, go into spare bonus
  defp process(%Bowling{rolls: [r2, r1], frame: @frames, multipliers: {m1, m2}} = game)
       when spare?(r2, r1),
       do: %{
         game
         | rolls: [],
           multipliers: {1, 1},
           score: game.score + r1 * m1 + r2 * m2,
           status: :finished,
           bonus: :spare
       }

  # when current frame is a spare
  defp process(%Bowling{rolls: [r2, r1], multipliers: {m1, m2}} = game) when spare?(r2, r1),
    do: %{
      game
      | rolls: [],
        frame: game.frame + 1,
        multipliers: {2, 1},
        score: game.score + r1 * m1 + r2 * m2,
        status: if(game.frame + 1 > @frames, do: :finished, else: :playing)
    }

  # when current frame is valid
  defp process(%Bowling{rolls: [r2, r1], multipliers: {m1, m2}} = game),
    do: %{
      game
      | rolls: [],
        frame: game.frame + 1,
        multipliers: {1, 1},
        score: game.score + r1 * m1 + r2 * m2,
        status: if(game.frame + 1 > @frames, do: :finished, else: :playing)
    }

  @doc """
    Returns the score of a given game of bowling if the game is complete.
    If the game isn't complete, it returns a helpful message.
  """
  @spec score(any) :: integer | String.t()
  def score(%Bowling{score: score, status: :finished, bonus: :none}), do: score
  def score(_), do: {:error, "Score cannot be taken until the end of the game"}
end
