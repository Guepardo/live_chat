defmodule LiveChatWeb.ClientApi.ChatView do
  use LiveChatWeb, :view

  def render("show.json", %{messages_batch: messages_batch}) do
    messages =
      messages_batch.messages
      |> Enum.map(fn message ->
        %{
          inserted_at: message.inserted_at,
          payload: message.payload
        }
      end)

    %{
      next_message_batch_uuid: messages_batch.next_message_batch_uuid,
      inserted_at: messages_batch.inserted_at,
      chat_id: messages_batch.chat_id,
      messages: messages
    }
  end
end
