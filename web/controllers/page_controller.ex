defmodule PinglogServer.PageController do
  use PinglogServer.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
