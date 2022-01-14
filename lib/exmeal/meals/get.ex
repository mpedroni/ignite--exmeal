defmodule Exmeal.Meals.Get do
  alias Exmeal.{Error, Meal, Repo}

  def by_id(id) when is_integer id do
    case Repo.get(Meal, id) do
      %Meal{} = meal -> {:ok, meal}
      _ -> {:error, Error.meal_not_found_error()}
    end
  end

  def by_id(_id), do: {:error, Error.meal_not_found_error()}
end
