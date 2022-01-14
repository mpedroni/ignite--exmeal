defmodule Exmeal.Meals.Get do
  alias Exmeal.{Error, Meal, Repo}

  def by_id(id) when is_integer id do
    case Repo.get(Meal, id) do
      {:error, _reason} -> {:error, Error.meal_not_found_error()}
      meal -> {:ok, meal}
    end
  end

  def by_id(_id), do: {:error, Error.meal_not_found_error()}
end
