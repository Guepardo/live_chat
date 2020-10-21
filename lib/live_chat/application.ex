defmodule LiveChat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  alias LiveChat.Messaging.Source.{Ingest, Consumer, MessagesBatchScheduler}

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      LiveChat.Repo,
      # Start the endpoint when the application starts
      LiveChatWeb.Endpoint,
      # Starts a worker by calling: LiveChat.Worker.start_link(arg)
      # {LiveChat.Worker, arg},
      {Ingest, []},
      {Consumer, :ok},
      # {MessagesBatchScheduler, :ok},
      {Cachex, name: :cache}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveChat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    LiveChatWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
