defmodule ElxTraffic.Owners.Create do
  @moduledoc """
  Create Owner
  """
  alias ElxTraffic.Owners.Owner
  alias ElxTraffic.Repo

  def call(params) do
    params
    |> Owner.changeset()
    |> Repo.insert()
  end
end
