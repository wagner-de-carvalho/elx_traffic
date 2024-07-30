defmodule ElxTraffic.TrafficViolations.Get do
  @moduledoc """
  Get Traffic Violation
  """
  alias ElxTraffic.Repo
  alias ElxTraffic.TrafficViolations.TrafficViolation

  def call(id) do
    TrafficViolation
    |> Repo.get(id)
    |> then(fn
      nil -> {:error, :not_found}
      traffic_violation -> traffic_violation
    end)
  end
end
