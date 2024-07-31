defmodule ElxTraffic.Vehicles.Seize do
  @moduledoc """
  Seize Vehicle
  """
  alias ElxTraffic.Vehicles

  def call(id) do
    Vehicles.get(id)
    |> then(fn
      {:error, _} = error -> error
      vehicle -> seize(vehicle)
    end)
  end

  defp seize(%{status: :seized}), do: {:error, :already_seized}

  defp seize(vehicle) do
    %{id: vehicle.id, status: :seized, seize_date: DateTime.utc_now()}
    |> Vehicles.update()
  end
end
