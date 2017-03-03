defmodule Instruktorg.PageController do
  use Instruktorg.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
