defmodule LiveChat.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :palyoad, :string
      add :message_batch_id, references(:message_batches, on_delete: :nothing)

      timestamps()
    end

    create index(:messages, [:message_batch_id])
  end
end
