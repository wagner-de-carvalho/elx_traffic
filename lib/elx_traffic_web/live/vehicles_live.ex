defmodule ElxTrafficWeb.VehiclesLive do
  @moduledoc """
  Vehicles Live
  """
  use ElxTrafficWeb, :live_view
  alias ElxTraffic.Vehicles

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    vehicles = Vehicles.list()
    socket = assign(socket, vehicles: vehicles, page_title: "Vehicles")
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
        <tbody>
          <div :for={vehicle <- @vehicles}>
            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
              <th
                scope="row"
                class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white"
              >
                <%= vehicle.license_plate %>
              </th>
              <td class="px-5 py-3">
                <%= vehicle.brand %>
              </td>
              <td class="px-5 py-3">
                <%= vehicle.model %>
              </td>
              <td class="px-5 py-3">
                <%= vehicle.register_date %>
              </td>
              <td class="px-5 py-3">
                <%= vehicle.seize_date %>
              </td>
              <td class="px-5 py-3">
                <div :if={vehicle.status == :regular}>
                  <img src={~p"/images/check.svg"} height="18" width="20" />
                </div>

                <div :if={vehicle.status == :seized}>
                  <img src={~p"/images/x-mark.svg"} height="18" width="20" />
                </div>
              </td>
              <td class="px-6 py-3">
                <div :if={vehicle.status == :regular}>
                  <.link patch={~p"/vehicles?#{[id: vehicle]}&seize=true"}>
                    <img src={~p"/images/lock-closed.svg"} height="18" width="20" />
                  </.link>
                </div>

                <div :if={vehicle.status == :seized}>
                  <.link patch={~p"/vehicles?#{[id: vehicle]}&misapprehend=true"}>
                    <img src={~p"/images/lock-open.svg"} height="18" width="20" />
                  </.link>
                </div>
              </td>
            </tr>
          </div>
        </tbody>
      </table>
    </div>
    """
  end

  @impl Phoenix.LiveView
  def handle_params(%{"id" => id, "seize" => _seize}, _, socket) do
    Vehicles.seize(id)
    vehicles = Vehicles.list(id)

    {:noreply, assign(socket, vehicles: vehicles)}
  end

  @impl Phoenix.LiveView
  def handle_params(%{"id" => id, "misapprehend" => _}, _, socket) do
    Vehicles.misapprehend(id)
    vehicles = Vehicles.list(id)

    {:noreply, assign(socket, vehicles: vehicles)}

    {:noreply, socket}
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
