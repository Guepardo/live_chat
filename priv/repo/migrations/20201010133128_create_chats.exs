defmodule LiveChat.Repo.Migrations.CreateChats do
  use Ecto.Migration

  def change do
    create table(:chats) do
      add :name, :string
      add :transmission_id, :string

      timestamps()
    end

  end
end
