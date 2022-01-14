defmodule Exmeal.Meals.Delete do
  alias Exmeal.{Error, Meal, Repo}

  def call(id) when is_integer id do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.meal_not_found_error()}
      meal -> Repo.delete(meal)
    end
  end

  def call(_id), do: {:error, Error.meal_not_found_error()}
end
