defmodule LiveChat.Messaging.Message do
  use Ecto.Schema
  import Ecto.Changeset

  alias LiveChat.Room.Chat
  alias LiveChat.Messaging.MessageBatch

  schema "messages" do
    field :payload, :string
    belongs_to :chat, Chat
    belongs_to :message_batch, MessageBatch

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:payload, :chat_id, :message_batch_id])
    |> validate_required([:payload, :chat_id])
  end
end
