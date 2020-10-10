defmodule LiveChat.Room.Chat do
  use Ecto.Schema
  import Ecto.Changeset

  alias LiveChat.Messaging.MessageBatch
  schema "chats" do
    field :name, :string
    field :transmission_id, :string
    has_many :message_batches, MessageBatch

    timestamps()
  end

  @doc false
  def changeset(chat, attrs) do
    chat
    |> cast(attrs, [:name, :transmission_id])
    |> validate_required([:name, :transmission_id])
  end
end
