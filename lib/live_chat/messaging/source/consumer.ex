defmodule LiveChat.Messaging.Source.Consumer do
  use ConsumerSupervisor

  alias LiveChat.Messaging.Source.{MessagesRecorder, Ingest}

  def start_link(:ok) do
    children = [
      worker(MessagesRecorder, [], restart: :transient)
    ]

    ConsumerSupervisor.start_link(children,
      strategy: :one_for_one,
      subscribe_to: [
        {
          Ingest,
          max_demand: 5, min_demand: 1
        }
      ]
    )
  end
end
