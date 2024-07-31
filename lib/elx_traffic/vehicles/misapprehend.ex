defmodule ElxTraffic.Vehicles.Misapprehend do
  @moduledoc """
  Misapprehend vehicle
  """
  alias ElxTraffic.Vehicles

  def call(id) do
    Vehicles.get(id)
    |> then(fn
      {:error, _} = error -> error
      vehicle -> misapprehend(vehicle)
    end)
  end

  defp misapprehend(%{status: :regular}), do: {:error, :not_seized}

  defp misapprehend(vehicle) do
    %{id: vehicle.id, status: :regular, seize_date: nil}
    |> Vehicles.update()
  end
end
