defmodule LiveChat.Messaging.MessageBatch do
  use Ecto.Schema
  import Ecto.Changeset

  alias LiveChat.Room.Chat

  schema "message_batches" do
    field :uuid, :string
    field :next_message_batch_uuid, :string
    belongs_to :chat, Chat

    timestamps()
  end

  @doc false
  def changeset(message_batch, attrs) do
    message_batch
    |> cast(attrs, [:uuid, :next_message_batch_uuid, :chat_id])
    |> put_change(:uuid, :crypto.strong_rand_bytes(128) |> Base.url_encode64())
    |> validate_required([:uuid, :chat_id])
    |> unique_constraint(:uuid)
  end
end
