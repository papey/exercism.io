defmodule Zipper do
  @type t :: %Zipper{focus: BinTree.t(), context: []}
  defstruct [:focus, context: []]

  @doc """
  Get a zipper focused on the root node.
  """
  @spec from_tree(BinTree.t()) :: Zipper.t()
  def from_tree(bin_tree), do: %Zipper{focus: bin_tree}

  @doc """
  Get the complete tree from a zipper.
  """
  @spec to_tree(Zipper.t()) :: BinTree.t()
  def to_tree(%Zipper{context: [], focus: f}), do: f
  def to_tree(zipper), do: up(zipper) |> to_tree()

  @doc """
  Get the value of the focus node.
  """
  @spec value(Zipper.t()) :: any
  def value(%Zipper{focus: nil}), do: nil
  def value(zipper), do: zipper.focus.value

  @doc """
  Get the left child of the focus node, if any.
  """
  @spec left(Zipper.t()) :: Zipper.t() | nil
  def left(%Zipper{focus: %BinTree{left: nil}}), do: nil

  def left(zipper) do
    %Zipper{
      focus: zipper.focus.left,
      context:
        [{:left, %BinTree{value: value(zipper), right: zipper.focus.right}}] ++ zipper.context
    }
  end

  @doc """
  Get the right child of the focus node, if any.
  """
  @spec right(Zipper.t()) :: Zipper.t() | nil
  def right(%Zipper{focus: %BinTree{right: nil}}), do: nil

  def right(zipper) do
    %Zipper{
      focus: zipper.focus.right,
      context:
        [{:right, %BinTree{value: value(zipper), left: zipper.focus.left}}] ++ zipper.context
    }
  end

  @doc """
  Get the parent of the focus node, if any.
  """
  @spec up(Zipper.t()) :: Zipper.t() | nil
  def up(%Zipper{context: []}), do: nil

  def up(%Zipper{focus: f, context: [{dir, tree} | rest]}),
    do: %Zipper{focus: %{tree | dir => f}, context: rest}

  @doc """
  Set the value of the focus node.
  """
  @spec set_value(Zipper.t(), any) :: Zipper.t()
  def set_value(zipper, value), do: %{zipper | focus: %{zipper.focus | value: value}}

  @doc """
  Replace the left child tree of the focus node.
  """
  @spec set_left(Zipper.t(), BinTree.t() | nil) :: Zipper.t()
  def set_left(zipper, left), do: %{zipper | focus: %{zipper.focus | left: left}}

  @doc """
  Replace the right child tree of the focus node.
  """
  @spec set_right(Zipper.t(), BinTree.t() | nil) :: Zipper.t()
  def set_right(zipper, right), do: %{zipper | focus: %{zipper.focus | right: right}}
end
