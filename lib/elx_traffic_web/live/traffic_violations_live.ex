defmodule ElxTrafficWeb.TrafficViolationsLive do
  @moduledoc """
  Traffic Violations Live
  """
  use ElxTrafficWeb, :live_view
  alias ElxTraffic.TrafficViolations

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    traffic_violations = TrafficViolations.list()

    socket =
      assign(socket, traffic_violations: traffic_violations, page_title: "Traffic violations")

    {:ok, socket}
  end
end
