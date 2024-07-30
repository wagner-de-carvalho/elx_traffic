defmodule ElxTraffic.Vehicles.Delete do
  @moduledoc """
  Delete vehicle
  """

  alias ElxTraffic.Vehicles.Get
  alias ElxTraffic.Repo

  def call(id) do
    id
    |> Get.call()
    |> then(fn
      {:error, _} = error -> error
      vehicle -> Repo.delete(vehicle)
    end)
  end
end
