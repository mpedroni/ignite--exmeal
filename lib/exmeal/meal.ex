defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @required_params [:description, :date, :calories]

  schema "meals" do
    field :description, :string
    field :date, :date
    field :calories, :integer, default: 0

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end

end
