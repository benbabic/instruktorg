defmodule Instruktorg.Process do
  use Ecto.Schema

  schema "process" do
    field :name,     :string
    field :steps,    :map
    field :category, :string
  end
end
