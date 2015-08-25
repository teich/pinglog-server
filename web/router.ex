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

  scope "/api", PinglogServer do
    pipe_through :api # Use the default browser stack

    resources "/pings", PingController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PinglogServer do
  #   pipe_through :api
  # end
end
