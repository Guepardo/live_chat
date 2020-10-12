defmodule LiveChatWeb.ClientApi.MessageController do
  use LiveChatWeb, :controller

  alias LiveChat.Messaging
  alias LiveChat.Repo

  def show(conn, %{"chat_id" => chat_id, "id" => uuid} = _params) do
    messages_batch = get_message_batch(uuid, chat_id)
    |> Repo.preload(:messages)

    render(conn, "show.json", %{
      messages_batch: messages_batch
    })
  end

  defp get_message_batch(uuid, chat_id) do
    case Messaging.get_message_batch(uuid) do
      messages_batch when not is_nil(messages_batch) ->
        messages_batch

      _ ->
        Messaging.get_latest_messages_batch_from_chat(chat_id)
    end
  end
end
