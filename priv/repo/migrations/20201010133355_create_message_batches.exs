defmodule LiveChat.Repo.Migrations.CreateMessageBatches do
  use Ecto.Migration

  def change do
    create table(:message_batches) do
      add :uuid, :string
      add :next_message_batch_uuid, :string
      add :chat_id, references(:chats, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:message_batches, [:uuid])
    create index(:message_batches, [:chat_id])
  end
end
