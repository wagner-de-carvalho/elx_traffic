defmodule ElxTraffic.Owners.Update do
  @moduledoc """
  Update Owner
  """
  alias ElxTraffic.Owners.Get
  alias ElxTraffic.Owners.Owner

  def call(%{id: id} = params) do
    id
    |> Get.call()
    |> then(fn
      {:error, _} = error -> error
      owner -> update(owner, params)
    end)
  end

  defp update(owner, params) do
    owner
    |> Owner.changeset(params)
    |> Repo.update()
  end
end
