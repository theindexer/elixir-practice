defmodule CocktailsWeb.Router do
  use CocktailsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CocktailsWeb do
    pipe_through :browser

    live "/", CocktailsLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", CocktailsWeb do
  #   pipe_through :api
  # end
end
