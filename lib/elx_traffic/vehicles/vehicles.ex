defmodule ElxTraffic.Vehicles do
  @moduledoc """
  Vehicles functions
  """
  alias ElxTraffic.Vehicles.Create
  alias ElxTraffic.Vehicles.Delete
  alias ElxTraffic.Vehicles.Get
  alias ElxTraffic.Vehicles.List
  alias ElxTraffic.Vehicles.Update

  defdelegate create(params), to: Create, as: :call
  defdelegate get(id), to: Get, as: :call
  defdelegate list, to: List, as: :call
  defdelegate list(owner_id), to: List, as: :call
  defdelegate delete(id), to: Delete, as: :call
  defdelegate update(params), to: Update, as: :call
end
