defmodule ElxTraffic.Owners.List do
  @moduledoc """
  List Owners
  """
  alias ElxTraffic.Owners.Owner
  alias ElxTraffic.Repo

  def call, do: Repo.all(Owner)
end
