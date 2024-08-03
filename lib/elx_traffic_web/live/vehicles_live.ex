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
  def render(assigns) do
    ~H"""
    <div class="w-full relative overflow-x-auto shadow-md sm:rounded-lg">
      <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
          <tr>
            <th scope="col" class="px-4 py-3">
              License Plate
            </th>
            <th scope="col" class="px-4 py-3">
              Brand
            </th>
            <th scope="col" class="px-4 py-3">
              Model
            </th>
            <th scope="col" class="px-4 py-3">
              Register Date
            </th>
            <th scope="col" class="px-4 py-3">
              Seize Date
            </th>
            <th scope="col" class="px-4 py-3">
              Status
            </th>
            <th scope="col" class="px-4 py-3">
              Action
            </th>
          </tr>
        </thead>
        <tbody id="vehicles" phx-update="stream">
          <tr
            :for={{vehicle_id, vehicle} <- @streams.vehicles}
            id={vehicle_id}
            class="bg-white border-b dark:bg-gray-800 dark:border-gray-700"
          >
            <td scope="row" class="px-6 py-4 text-left">
              <%= vehicle.license_plate %>
            </td>
            <td class="px-5 py-3 text-left">
              <%= vehicle.brand %>
            </td>
            <td class="px-5 py-3 text-left">
              <%= vehicle.model %>
            </td>
            <td class="px-5 py-3 text-left">
              <%= if not is_nil(vehicle.register_date),
                do: Timex.format!(vehicle.register_date, "{0D}-{0M}-{YYYY}") %>
            </td>
            <td class="px-5 py-3 text-left">
              <%= if not is_nil(vehicle.seize_date),
                do: Timex.format!(vehicle.seize_date, "{0D}-{0M}-{YYYY}") %>
            </td>
            <td class="px-5 py-3 status text-left">
              <%= vehicle.status %>
            </td>
            <td class="text-center">
              <button phx-click="toggle-status" phx-value-id={vehicle.id}>
                <img
                  src={
                    ~p"/images/#{if vehicle.status == :seized, do: "lock-closed.svg", else: "lock-open.svg"}"
                  }
                  height="18"
                  width="20"
                />
              </button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    """
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
