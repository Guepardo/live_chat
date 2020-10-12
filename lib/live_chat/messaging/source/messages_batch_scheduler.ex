defmodule LiveChat.Messaging.Source.MessagesBatchScheduler do
  use GenServer

  alias LiveChat.Room
  alias LiveChat.Messaging.Source.MessagesBatchCreator

  @ticker_in_seconds 4950

  def start_link(_args) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  # CALLBACKS

  def init(args) do
    next_ticker()
    {:ok, args}
  end

  def handle_info(:ticker, state) do
    start_messages_batch_creators()
    next_ticker()
    {:noreply, state}
  end

  def handle_info(_, state) do
    {:noreply, state}
  end

  defp next_ticker() do
    Process.send_after(self(), :ticker, @ticker_in_seconds)
  end

  defp start_messages_batch_creators do
    Room.list_chats()
    |> Enum.map(fn chat ->
      MessagesBatchCreator.start(chat)
    end)
  end
end
