defmodule ElxTraffic.Owners do
  @moduledoc """
  Owners functions
  """
  alias ElxTraffic.Owners.Create
  alias ElxTraffic.Owners.Delete
  alias ElxTraffic.Owners.Get
  alias ElxTraffic.Owners.List
  alias ElxTraffic.Owners.Update

  defdelegate create(params), to: Create, as: :call
  defdelegate delete(id), to: Delete, as: :call
  defdelegate get(id), to: Get, as: :call
  defdelegate list, to: List, as: :call
  defdelegate update(params), to: Update, as: :call
end
