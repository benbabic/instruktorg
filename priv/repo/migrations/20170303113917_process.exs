defmodule Instruktorg.Repo.Migrations.Process do
  use Ecto.Migration

  def up do
    create table(:process) do
      add :name,     :string
      add :steps,    :string
      add :category, :string

      timestamps()
    end
  end

  def down do
    drop table(:process)
  end
end
