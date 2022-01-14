defmodule Exmeal.Meals.Update do
  alias Exmeal.{Error, Meal, Repo}

  def call(%{ "id" => id } = params) when is_integer(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.meal_not_found_error()}
      meal -> do_update(meal, params)
    end
  end

  def call(_meal), do: {:error, Error.meal_not_found_error()}

  defp do_update(meal, params) do
    meal
    |> Meal.changeset(params)
    |> Repo.update()
  end
end
