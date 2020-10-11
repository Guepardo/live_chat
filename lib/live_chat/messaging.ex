defmodule LiveChat.Messaging do
  @moduledoc """
  The Messaging context.
  """

  import Ecto.Query, warn: false
  alias LiveChat.Repo

  alias LiveChat.Messaging.MessageBatch

  def list_message_batches do
    Repo.all(MessageBatch)
  end

  def get_message_batch!(id), do: Repo.get!(MessageBatch, id)

  @spec get_latest_messages_batch_from_chat(any) :: any
  def get_latest_messages_batch_from_chat(id) do
    MessageBatch
    |> where(chat_id: ^id)
    |> order_by(desc: :id)
    |> limit(1)
    |> Repo.one()
  end

  def create_message_batch(attrs \\ %{}) do
    %MessageBatch{}
    |> MessageBatch.changeset(attrs)
    |> Repo.insert()
  end

  def update_message_batch(%MessageBatch{} = message_batch, attrs) do
    message_batch
    |> MessageBatch.changeset(attrs)
    |> Repo.update()
  end

  def delete_message_batch(%MessageBatch{} = message_batch) do
    Repo.delete(message_batch)
  end

  def change_message_batch(%MessageBatch{} = message_batch) do
    MessageBatch.changeset(message_batch, %{})
  end

  alias LiveChat.Messaging.Message

  def list_messages do
    Repo.all(Message)
  end

  def get_message!(id), do: Repo.get!(Message, id)

  def create_message(attrs \\ %{}) do
    %Message{}
    |> Message.changeset(attrs)
    |> Repo.insert()
  end

  def create_many_messages(attrs \\ []) do
    Repo.insert_all(Message, attrs)
  end

  def update_message(%Message{} = message, attrs) do
    message
    |> Message.changeset(attrs)
    |> Repo.update()
  end

  def bind_messages_to_batch(message_batch_id) do
    from(m in Message, where: is_nil(m.message_batch_id))
    |> Repo.update_all(set: [message_batch_id: message_batch_id])
  end

  def delete_message(%Message{} = message) do
    Repo.delete(message)
  end

  def change_message(%Message{} = message) do
    Message.changeset(message, %{})
  end
end
