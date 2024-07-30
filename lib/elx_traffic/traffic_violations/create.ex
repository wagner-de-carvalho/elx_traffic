defmodule ElxTraffic.TrafficViolations.Create do
  @moduledoc """
  Create Traffic Violation
  """
  alias ElxTraffic.Repo
  alias ElxTraffic.TrafficViolations.TrafficViolation

  def call(params) do
    params
    |> TrafficViolation.changeset()
    |> Repo.insert()
  end
end
