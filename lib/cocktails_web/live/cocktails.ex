defmodule CocktailsWeb.CocktailsLive do
  use Phoenix.LiveView


  {_, drinks} = Toml.decode(File.read!("assets/static/recipe_list.toml"))
  @drinks drinks["drinks"]

  def render(assigns) do
    Phoenix.View.render(CocktailsWeb.CocktailsView, "index.html", assigns)
  end

  def mount(opts, socket) do
    socket = assign(socket, :drinks, @drinks)
             |> assign(:filter, %{query: "", spirits: ""})
    {:ok, socket}
  end

  def handle_event("search", %{"value" => query}, socket) do
    filter = socket.assigns.filter
    filter = %{filter | query: query}
    socket = assign(socket, :filter, filter)
             |> assign(:drinks, filter_drinks(filter))
    {:noreply, socket}
  end

  def handle_event("search-spirits", %{"value" => query}, socket) do
    filter = socket.assigns.filter
    filter = %{filter | spirits: query}
    socket = assign(socket, :filter, filter)
             |> assign(:drinks, filter_drinks(filter))
    {:noreply, socket}
  end

  defp filter_drinks(filter) do
    Enum.filter(@drinks, fn drink -> String.contains?(String.downcase(drink["name"]), filter.query) end)
    |> Enum.filter(fn drink -> drink["spirits"]
    |> Enum.map(fn s -> s["name"] end)
    |> Enum.any?(fn spirit -> String.contains?(String.downcase(spirit), filter.spirits) end) end)
  end
end
