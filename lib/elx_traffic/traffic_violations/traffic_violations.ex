defmodule ElxTraffic.TrafficViolations do
  @moduledoc """
  TrafficViolation functions
  """
  alias ElxTraffic.TrafficViolations.Create
  alias ElxTraffic.TrafficViolations.Get
  alias ElxTraffic.TrafficViolations.List

  defdelegate create(params), to: Create, as: :call
  defdelegate get(id), to: Get, as: :call
  defdelegate list, to: List, as: :call
  defdelegate list(id), to: List, as: :call
end
