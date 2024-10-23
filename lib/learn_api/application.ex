defmodule LearnApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LearnApiWeb.Telemetry,
      LearnApi.Repo,
      {DNSCluster, query: Application.get_env(:learn_api, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: LearnApi.PubSub},
      # Start a worker by calling: LearnApi.Worker.start_link(arg)
      # {LearnApi.Worker, arg},
      # Start to serve requests, typically the last entry
      LearnApiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LearnApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LearnApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
