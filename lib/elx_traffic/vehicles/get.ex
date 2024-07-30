defmodule ElxTraffic.Vehicles.Get do
  @moduledoc """
  Get vehicle
  """
  alias ElxTraffic.Repo
  alias ElxTraffic.Vehicles.Vehicle

  def call(id) do
    Repo.get(Vehicle, id)
    |> then(fn
      nil -> {:error, :not_found}
      vehicle -> vehicle
    end)
  end
end
