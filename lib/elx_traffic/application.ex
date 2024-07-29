defmodule ElxTraffic.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ElxTrafficWeb.Telemetry,
      ElxTraffic.Repo,
      {DNSCluster, query: Application.get_env(:elx_traffic, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ElxTraffic.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: ElxTraffic.Finch},
      # Start a worker by calling: ElxTraffic.Worker.start_link(arg)
      # {ElxTraffic.Worker, arg},
      # Start to serve requests, typically the last entry
      ElxTrafficWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElxTraffic.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElxTrafficWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
