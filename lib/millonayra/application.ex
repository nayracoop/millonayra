defmodule Millonayra.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MillonayraWeb.Telemetry,
      # Start the Ecto repository
      Millonayra.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Millonayra.PubSub},
      # Start Finch
      {Finch, name: Millonayra.Finch},
      # Start the Endpoint (http/https)
      MillonayraWeb.Endpoint
      # Start a worker by calling: Millonayra.Worker.start_link(arg)
      # {Millonayra.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Millonayra.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MillonayraWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
