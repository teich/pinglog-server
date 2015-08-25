defmodule PinglogServer.Router do
  use PinglogServer.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # scope "/", PinglogServer do
  #   pipe_through :browser
  #   resources "/pings", PingController, only: [:index]
  #   resources "/logs", LogController
  # end

  scope "/api", PinglogServer do
    pipe_through :api
    resources "/logs", LogController, only: [:index, :create]
  end
end
