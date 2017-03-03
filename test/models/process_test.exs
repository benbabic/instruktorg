defmodule Instruktorg.ProcessTest do
  use Instruktorg.ModelCase

  alias Instruktorg.Process

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Process.changeset(%Process{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Process.changeset(%Process{}, @invalid_attrs)
    refute changeset.valid?
  end
end
