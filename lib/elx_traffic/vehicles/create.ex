defmodule ElxTraffic.Vehicles.Create do
  @moduledoc """
  Create vehicle
  """
  alias ElxTraffic.Repo
  alias ElxTraffic.Vehicles.Vehicle

  def call(params) do
    params
    |> Vehicle.changeset()
    |> Repo.insert()
  end
end
