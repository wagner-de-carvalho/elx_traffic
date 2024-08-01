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
    <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
      <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
          <tr>
            <th scope="col" class="px-6 py-3">
              Name
            </th>
            <th scope="col" class="px-6 py-3">
              E-mail
            </th>
            <th scope="col" class="px-6 py-3">
              Phone
            </th>
            <th scope="col" class="px-6 py-3">
              Action
            </th>
          </tr>
        </thead>
        <tbody>
          <tr :for={owner <- @owners} class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
            <th
              scope="row"
              class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white"
            >
              <%= owner.name %>
            </th>
            <td class="px-6 py-4">
              <%= owner.email %>
            </td>
            <td class="px-6 py-4">
              <%= owner.phone %>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    """
  end
end
