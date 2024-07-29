defmodule ElxTraffic.Owners.Owner do
  @moduledoc """
  Owner struct
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias ElxTraffic.Vehicles.Vehicle

  @fields ~w/email name phone/a
  @required @fields

  @timestamps_opts [type: :utc_datetime]

  schema "owners" do
    field :name, :string
    field :email, :string
    field :phone, :string

    has_many :vehicles, Vehicle

    timestamps(type: :utc_datetime)
  end

  def changeset(struct \\ %__MODULE__{}, attrs) do
    struct
    |> cast(attrs, @fields)
    |> validate_required(@required)
    |> validate_length(:name, max: 30)
    |> validate_length(:email, max: 255)
    |> validate_length(:phone, max: 15)
    |> unique_constraint(:license_plate)
  end
end
