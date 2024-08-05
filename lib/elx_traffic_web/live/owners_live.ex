defmodule ElxTrafficWeb.OwnersLive do
  @moduledoc """
  Owners
  """
  use ElxTrafficWeb, :live_view
  alias ElxTraffic.Owners

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    owners = Owners.list()
    socket = assign(socket, owners: owners, page_title: "Owners")
    {:ok, socket}
  end
end
