defmodule ElxTraffic.Vehicles do
  @moduledoc """
  Vehicles functions
  """
  alias ElxTraffic.Vehicles.Get
  alias ElxTraffic.Vehicles.List

  defdelegate get(id), to: Get, as: :call
  defdelegate list, to: List, as: :call
  defdelegate list(owner_id), to: List, as: :call
end
