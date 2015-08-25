defmodule PinglogServer.PingController do
  use PinglogServer.Web, :controller

  alias PinglogServer.Ping

  plug :scrub_params, "ping" when action in [:create, :update]

  def index(conn, _params) do
    pings = Repo.all(Ping)
    render(conn, "index.html", pings: pings)
  end

  def new(conn, _params) do
    changeset = Ping.changeset(%Ping{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"ping" => ping_params}) do
    changeset = Ping.changeset(%Ping{}, ping_params)

    case Repo.insert(changeset) do
      {:ok, _ping} ->
        conn
        |> put_flash(:info, "Ping created successfully.")
        |> redirect(to: ping_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    ping = Repo.get!(Ping, id)
    render(conn, "show.html", ping: ping)
  end

  def edit(conn, %{"id" => id}) do
    ping = Repo.get!(Ping, id)
    changeset = Ping.changeset(ping)
    render(conn, "edit.html", ping: ping, changeset: changeset)
  end

  def update(conn, %{"id" => id, "ping" => ping_params}) do
    ping = Repo.get!(Ping, id)
    changeset = Ping.changeset(ping, ping_params)

    case Repo.update(changeset) do
      {:ok, ping} ->
        conn
        |> put_flash(:info, "Ping updated successfully.")
        |> redirect(to: ping_path(conn, :show, ping))
      {:error, changeset} ->
        render(conn, "edit.html", ping: ping, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    ping = Repo.get!(Ping, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(ping)

    conn
    |> put_flash(:info, "Ping deleted successfully.")
    |> redirect(to: ping_path(conn, :index))
  end
end
