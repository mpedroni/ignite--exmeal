defmodule Exmeal.Meals.Update do
  alias Exmeal.{Error, Meal, Repo}

  def call(%{ "id" => id } = params) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.meal_not_found_error()}
      meal -> do_update(meal, params)
    end
  end

  def call(_params), do: {:error, Error.meal_not_found_error()}

  defp do_update(meal, params) do
    meal
    |> Meal.changeset(params)
    |> Repo.update()
  end
end
