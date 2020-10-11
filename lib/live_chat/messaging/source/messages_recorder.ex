defmodule LiveChat.Messaging.Source.MessagesRecorder do
  alias LiveChat.Messaging

  def start_link(batch_messages) do
    Task.start_link(fn ->
      current_date = NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)

      messages =
        :queue.to_list(batch_messages)
        |> Enum.map(fn message ->
          message
          |> Map.put(:inserted_at, current_date)
          |> Map.put(:updated_at, current_date)
        end)

      Messaging.create_many_messages(messages)
    end)
  end
end
