defmodule ElxTraffic.Vehicles.Vehicle do
  @moduledoc """
  Vehicle struct
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias ElxTraffic.Owners.Owner
  alias ElxTraffic.TrafficViolations.TrafficViolation

  @fields ~w/brand license_plate model owner_id seize_date status/a
  @required @fields -- [:seize_date]

  @timestamps_opts [type: :utc_datetime]

  schema "vehicles" do
    field :license_plate, :string
    field :brand, :string
    field :model, :string
    field :register_date, :utc_datetime
    field :seize_date, :utc_datetime
    field :status, Ecto.Enum, values: [:regular, :seized], default: :regular

    belongs_to :owner, Owner
    has_many :traffic_violations, TrafficViolation

    timestamps(type: :utc_datetime)
  end

  def changeset(vehicle \\ %__MODULE__{}, attrs) do
    vehicle
    |> cast(attrs, @fields)
    |> validate_required(@required)
    |> validate_length(:license_plate, max: 7)
    |> validate_length(:brand, max: 20)
    |> validate_length(:model, max: 20)
    |> unique_constraint(:license_plate)
    |> validate_format(:license_plate, ~r/[A-Z]{3}[0-9][0-9A-Z][0-9]{2}/)
    |> foreign_key_constraint(:owner_id)
  end
end
