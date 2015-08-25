defmodule PinglogServer.PingControllerTest do
  use PinglogServer.ConnCase

  alias PinglogServer.Ping
  @valid_attrs %{gateway: "120.5", google: "120.5", host: "7488a646-e31f-11e4-aace-600308960662", network: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, ping_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing pings"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, ping_path(conn, :new)
    assert html_response(conn, 200) =~ "New ping"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, ping_path(conn, :create), ping: @valid_attrs
    assert redirected_to(conn) == ping_path(conn, :index)
    assert Repo.get_by(Ping, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, ping_path(conn, :create), ping: @invalid_attrs
    assert html_response(conn, 200) =~ "New ping"
  end

  test "shows chosen resource", %{conn: conn} do
    ping = Repo.insert! %Ping{}
    conn = get conn, ping_path(conn, :show, ping)
    assert html_response(conn, 200) =~ "Show ping"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, ping_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    ping = Repo.insert! %Ping{}
    conn = get conn, ping_path(conn, :edit, ping)
    assert html_response(conn, 200) =~ "Edit ping"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    ping = Repo.insert! %Ping{}
    conn = put conn, ping_path(conn, :update, ping), ping: @valid_attrs
    assert redirected_to(conn) == ping_path(conn, :show, ping)
    assert Repo.get_by(Ping, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    ping = Repo.insert! %Ping{}
    conn = put conn, ping_path(conn, :update, ping), ping: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit ping"
  end

  test "deletes chosen resource", %{conn: conn} do
    ping = Repo.insert! %Ping{}
    conn = delete conn, ping_path(conn, :delete, ping)
    assert redirected_to(conn) == ping_path(conn, :index)
    refute Repo.get(Ping, ping.id)
  end
end
