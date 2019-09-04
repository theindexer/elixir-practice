defmodule CocktailsWeb.PageController do
  use CocktailsWeb, :controller


  def index(conn, _params) do
    conn
    |> live_render(CocktailsWeb.CocktailsLive, session: %{})
  end
end
