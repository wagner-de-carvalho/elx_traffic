defmodule ElxTraffic.Vehicles.List do
  @moduledoc """
  List all vehicles
  """
  import Ecto.Query
  alias ElxTraffic.Repo
  alias ElxTraffic.Vehicles.Vehicle

  def call, do: Repo.all(Vehicle)

  def call(owner_id) do
    Vehicle
    |> where([v], v.owner_id == ^owner_id)
    |> Repo.all()
  end
end
