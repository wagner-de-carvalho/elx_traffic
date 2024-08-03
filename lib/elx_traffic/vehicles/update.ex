defmodule ElxTraffic.Vehicles.Update do
  @moduledoc """
  Update vehicle
  """
  alias ElxTraffic.Repo

  alias ElxTraffic.Vehicles.Get
  alias ElxTraffic.Vehicles.Vehicle
  alias ElxTraffic.Repo

  def call(%{id: id} = params) do
    id
    |> Get.call()
    |> then(fn
      {:error, _} = error -> error
      vehicle -> update(vehicle, params)
    end)
  end

  defp update(vehicle, params) do
    vehicle
    |> Vehicle.changeset(params)
    |> Repo.update()
  end
end
