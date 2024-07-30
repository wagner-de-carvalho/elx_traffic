defmodule ElxTraffic.TrafficViolations.List do
  @moduledoc """
  List TrafficViolations
  """
  import Ecto.Query
  alias ElxTraffic.Repo
  alias ElxTraffic.TrafficViolations.TrafficViolation

  def call, do: Repo.all(TrafficViolation)

  def call(id) do
    TrafficViolation
    |> where([v], v.id == ^id)
    |> Repo.all()
  end
end
