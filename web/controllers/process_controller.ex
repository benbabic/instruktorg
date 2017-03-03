defmodule Instruktorg.ProcessController do
  use Instruktorg.Web, :controller

  alias Instruktorg.Process, as: Proc

  def index(conn, _params) do
    processes = Repo.all(Proc)
    render(conn, "index.html", processes: processes)
  end

  def new(conn, _params) do
    changeset = Proc.changeset(%Proc{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"process" => process_params}) do
    changeset = Proc.changeset(%Proc{}, process_params)

    case Repo.insert(changeset) do
      {:ok, _process} ->
        conn
        |> put_flash(:info, "Process created successfully.")
        |> redirect(to: process_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    process = Repo.get!(Proc, id)
    render(conn, "show.html", process: process)
  end

  def edit(conn, %{"id" => id}) do
    process = Repo.get!(Proc, id)
    changeset = Proc.changeset(process)
    render(conn, "edit.html", process: process, changeset: changeset)
  end

  def update(conn, %{"id" => id, "process" => process_params}) do
    process = Repo.get!(Proc, id)
    changeset = Proc.changeset(process, process_params)

    case Repo.update(changeset) do
      {:ok, process} ->
        conn
        |> put_flash(:info, "Process updated successfully.")
        |> redirect(to: process_path(conn, :show, process))
      {:error, changeset} ->
        render(conn, "edit.html", process: process, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    process = Repo.get!(Proc, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(process)

    conn
    |> put_flash(:info, "Process deleted successfully.")
    |> redirect(to: process_path(conn, :index))
  end
end
