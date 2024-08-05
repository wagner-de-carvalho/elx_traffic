defmodule ElxTrafficWeb.VehiclesLive do
  @moduledoc """
  Vehicles Live
  """
  use ElxTrafficWeb, :live_view
  alias ElxTraffic.Vehicles

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    vehicles = Vehicles.list()

    socket = socket |> stream(:vehicles, vehicles)

    {:ok, socket}
  end

  @impl Phoenix.LiveView
  def handle_event("toggle-status", %{"id" => id}, socket) do
    vehicle = Vehicles.get(id)

    {:ok, vehicle} =
      case vehicle.status do
        :regular -> Vehicles.seize(id)
        :seized -> Vehicles.misapprehend(id)
      end

    {:noreply, stream_insert(socket, :vehicles, vehicle, at: 0)}
  end

  @impl Phoenix.LiveView
  def handle_params(%{"id" => id}, _, socket) do
    vehicles = Vehicles.list(id)

    {:noreply, assign(socket, vehicles: vehicles)}
  end

  @impl Phoenix.LiveView
  def handle_params(_, _, socket) do
    {:noreply, socket}
  end
end
