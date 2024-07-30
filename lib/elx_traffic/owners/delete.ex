defmodule ElxTraffic.Owners.Delete do
  @moduledoc """
  Delete Owner
  """
  alias ElxTraffic.Owners.Get
  alias ElxTraffic.Repo

  def call(id) do
    id
    |> Get.call()
    |> then(fn
      {:error, _} = error -> error
      owner -> Repo.delete(owner)
    end)
  end
end
