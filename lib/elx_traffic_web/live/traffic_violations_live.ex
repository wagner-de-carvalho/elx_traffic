defmodule ElxTrafficWeb.TrafficViolationsLive do
  @moduledoc """
  Traffic Violations Live
  """
  use ElxTrafficWeb, :live_view
  alias ElxTraffic.TrafficViolations

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    traffic_violations = TrafficViolations.list()
    socket = assign(socket, traffic_violations: traffic_violations)
    {:ok, socket}
  end

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
      <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
          <tr>
            <th scope="col" class="px-6 py-3">
              Occurrence Date
            </th>
            <th scope="col" class="px-6 py-3">
              Fine Amount
            </th>
            <th scope="col" class="px-6 py-3">
              Description
            </th>
            <th scope="col" class="px-6 py-3">
              Action
            </th>
          </tr>
        </thead>
        <tbody>
          <tr
            :for={traffic_violation <- @traffic_violations}
            class="bg-white border-b dark:bg-gray-800 dark:border-gray-700"
          >
            <th
              scope="row"
              class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white"
            >
              <%= traffic_violation.occurrence_date %>
            </th>
            <td class="px-6 py-4">
              <%= traffic_violation.fine_amount %>
            </td>
            <td class="px-6 py-4">
              <%= traffic_violation.description %>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    """
  end
end
