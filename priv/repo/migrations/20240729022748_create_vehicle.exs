defmodule ElxTraffic.Repo.Migrations.CreateVehicle do
  @moduledoc false
  use Ecto.Migration

  def change do
    create table(:vehicles) do
      add :license_plate, :string, null: false, size: 7
      add :brand, :string, null: false, size: 20
      add :model, :string, null: false, size: 20
      add :status, :string, null: false, default: "regular"
      add :register_date, :utc_datetime, null: false, default: fragment("now()")
      add :seize_date, :utc_datetime
      add :owner_id, references(:owners, on_delete: :delete_all)
      timestamps(type: :utc_datetime)
    end

    create unique_index(:vehicles, [:license_plate])
  end
end
