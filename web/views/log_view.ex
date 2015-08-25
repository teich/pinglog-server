defmodule PinglogServer.LogView do
  use PinglogServer.Web, :view

  def render("index.json", %{logs: logs}) do
    %{data: render_many(logs, PinglogServer.LogView, "log.json")}
  end

  def render("show.json", %{log: log}) do
    %{data: render_one(log, PinglogServer.LogView, "log.json")}
  end

  def render("log.json", %{log: log}) do
    %{id: log.id,
      network: log.network,
      gateway: log.gateway,
      google: log.google,
      host: log.host}
  end
end
