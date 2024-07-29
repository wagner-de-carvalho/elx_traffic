defmodule ElxTraffic.Repo.Migrations.CreateOwner do
  use Ecto.Migration

  def change do
    create table("owners") do
      add :name, :string, null: false, size: 30
      add :email, :string, null: false, size: 255
      add :phone, :string, null: false, size: 15
      timestamps(type: :utc_datetime)
    end

    create unique_index("owners", [:email])
  end
end
