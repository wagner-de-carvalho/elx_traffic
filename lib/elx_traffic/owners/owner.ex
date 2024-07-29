defmodule ElxTraffic.Owners.Owner do
  @moduledoc """
  Owner struct
  """
  use Ecto.Schema
  import Ecto.Changeset

  @timestamps_opts [type: :utc_datetime]

  @fields ~w/email name phone/a

  schema "owners" do
    field :name, :string
    field :email, :string
    field :phone, :string
    timestamps(type: :utc_datetime)
  end

  def changeset(struct \\ %__MODULE__{}, attrs) do
    struct
    |> cast(attrs, @fields)
  end
end
