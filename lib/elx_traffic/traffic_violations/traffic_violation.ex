defmodule ElxTraffic.TrafficViolations.TrafficViolation do
  @moduledoc """
  Traffic Violation
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias ElxTraffic.Vehicles.Vehicle

  @fields ~w/description fine_amount occurrence_date vehicle_id/a
  @required @fields -- [:occurrence_date]

  schema "traffic_violations" do
    field :description, :string
    field :fine_amount, :decimal
    field :occurrence_date, :utc_datetime

    belongs_to :vehicle, Vehicle
  end

  def changeset(traffic_violation \\ %__MODULE__{}, attrs) do
    traffic_violation
    |> cast(attrs, @fields)
    |> validate_required(@required)
    |> validate_number(:fine_amount,
      greater_than_or_equal_to: 0,
      message: "the amount must be positive"
    )
  end
end
