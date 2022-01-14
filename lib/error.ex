defmodule Exmeal.Error do
  @keys [:status, :result]

  @enforce_keys @keys

  alias __MODULE__, as: Error

  defstruct @keys

  def build(status, result) do
    %Error{
      status: status,
      result: result
    }
  end

  def meal_not_found_error, do: build(:not_found, "Meal not found")
end
