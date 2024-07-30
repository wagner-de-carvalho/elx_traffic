defmodule ElxTraffic.Repo.Migrations.TrafficViolation do
  @moduledoc false
  use Ecto.Migration

  @utc_datetime "timezone('utc', now())"

  def change do
    create table(:traffic_violations) do
      add :vehicle_id, :integer, null: false
      add :description, :string, null: false
      add :fine_amount, :decimal, null: false
      add :occurrence_date, :utc_datetime, default: fragment(@utc_datetime)
    end
  end
end
