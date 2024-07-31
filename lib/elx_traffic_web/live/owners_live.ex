defmodule ElxTrafficWeb.OwnersLive do
  @moduledoc """
  Owners
  """
  use ElxTrafficWeb, :live_view
  alias ElxTraffic.Owners

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    owners = Owners.list()
    socket = assign(socket, owners: owners)
    {:ok, socket}
  end

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <h1>Owners</h1>
    <div>
      <ul>
        <li :for={owner <- @owners}>
          <div>
            <div>
              <span>Name: <%= owner.name %></span>
            </div>
            <div>
              <span>E-mail: <%= owner.email %></span>
            </div>
            <div>
              <span>Phone: <%= owner.phone %></span>
            </div>
          </div>
        </li>
      </ul>
    </div>
    """
  end
end
