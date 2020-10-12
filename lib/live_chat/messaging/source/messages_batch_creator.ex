defmodule LiveChat.Messaging.Source.MessagesBatchCreator do
  alias LiveChat.Room.Chat
  alias LiveChat.Messaging

  require Logger

  def start(%Chat{} = chat) do
    Task.async(fn ->
      create_batch(chat)
    end)
  end

  defp create_batch(chat) do
    latest_batch = Messaging.get_latest_messages_batch_from_chat(chat.id)

    args = %{
      uuid: latest_batch.next_message_batch_uuid,
      next_message_batch_uuid: :crypto.strong_rand_bytes(128) |> Base.url_encode64(),
      chat_id: chat.id
    }

    case Messaging.create_message_batch(args) do
      {:ok, messages_batch} ->
        bind_messages_to_batch(messages_batch)

      _ ->
        Logger.error("System can't create MessageBatches!")
    end
  end

  defp bind_messages_to_batch(messages_batch) do
    Messaging.bind_messages_to_batch(messages_batch.id, messages_batch.chat_id)
  end
end
