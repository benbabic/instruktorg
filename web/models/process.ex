defmodule Instruktorg.Process do
  use Ecto.Schema

  import Ecto.Changeset

  schema "process" do
    field :name,     :string
    field :steps,    :map
    field :category, :string

    timestamps
  end

  def changeset(process, params \\ %{}) do
    process
      |> cast(params, [:name, :steps, :category])
      |> validate_required([:name])
  end
end
