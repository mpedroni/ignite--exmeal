defmodule Exmeal.Meals.Delete do
  alias Exmeal.{Error, Repo}
  alias Exmeal.Meals.Get

  def call(id) when is_integer id do
    IO.inspect(id)
    with {:ok, meal} <- Get.by_id(id),
     {:ok, _deleted_meal} = result <- Repo.delete(meal)
    do
      result
    else _ -> Error.meal_not_found_error()
    end
  end

  def call(_id), do: {:error, Error.meal_not_found_error()}
end
