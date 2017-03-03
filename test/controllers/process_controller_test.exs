defmodule Instruktorg.ProcessControllerTest do
  use Instruktorg.ConnCase

  alias Instruktorg.Process
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, process_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing processes"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, process_path(conn, :new)
    assert html_response(conn, 200) =~ "New process"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, process_path(conn, :create), process: @valid_attrs
    assert redirected_to(conn) == process_path(conn, :index)
    assert Repo.get_by(Process, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, process_path(conn, :create), process: @invalid_attrs
    assert html_response(conn, 200) =~ "New process"
  end

  test "shows chosen resource", %{conn: conn} do
    process = Repo.insert! %Process{}
    conn = get conn, process_path(conn, :show, process)
    assert html_response(conn, 200) =~ "Show process"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, process_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    process = Repo.insert! %Process{}
    conn = get conn, process_path(conn, :edit, process)
    assert html_response(conn, 200) =~ "Edit process"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    process = Repo.insert! %Process{}
    conn = put conn, process_path(conn, :update, process), process: @valid_attrs
    assert redirected_to(conn) == process_path(conn, :show, process)
    assert Repo.get_by(Process, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    process = Repo.insert! %Process{}
    conn = put conn, process_path(conn, :update, process), process: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit process"
  end

  test "deletes chosen resource", %{conn: conn} do
    process = Repo.insert! %Process{}
    conn = delete conn, process_path(conn, :delete, process)
    assert redirected_to(conn) == process_path(conn, :index)
    refute Repo.get(Process, process.id)
  end
end
