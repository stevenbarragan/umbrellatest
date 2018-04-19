defmodule UmbrellatestWeb.PageController do
  use UmbrellatestWeb, :controller

  def index(conn, _params) do
    state = Umbrellatest.StateWorker.fetch()

    conn
    |> put_status(:ok)
    |> text(state)
  end

  def show(conn, %{"id" => "1"}) do
    state = Umbrellatest.Another.fetch()

    conn
    |> put_status(:ok)
    |> text(state)

  end
end

