defmodule Channels.Router do
  use Channels.Web, :router

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

  scope "/", Channels do
    pipe_through :browser # Use the default browser stack

    get "/screen", PageController, :index
    get "/", PageController, :vote
  end

  # Other scopes may use custom stacks.
  # scope "/api", Channels do
  #   pipe_through :api
  # end
end
