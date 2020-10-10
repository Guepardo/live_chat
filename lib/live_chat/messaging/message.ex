defmodule LiveChat.Messaging.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :palyoad, :string
    field :message_batch_id, :id

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:palyoad])
    |> validate_required([:palyoad])
  end
end
