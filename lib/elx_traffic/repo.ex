defmodule ElxTraffic.Repo do
  use Ecto.Repo,
    otp_app: :elx_traffic,
    adapter: Ecto.Adapters.Postgres
end
