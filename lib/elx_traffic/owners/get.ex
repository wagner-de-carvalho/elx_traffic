defmodule ElxTraffic.Owners.Get do
  @moduledoc """
  Get Owner
  """
  alias ElxTraffic.Owners.Owner
  alias ElxTraffic.Repo

  def call(id) do
    Repo.get(Owner, id)
    |> then(fn
      nil -> {:error, :not_found}
      owner -> owner
    end)
  end
end
