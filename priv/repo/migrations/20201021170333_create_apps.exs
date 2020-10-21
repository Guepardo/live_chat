defmodule LiveChat.Repo.Migrations.CreateApps do
  use Ecto.Migration

  def change do
    create table(:apps) do
      add :name, :string
      add :token, :string

      timestamps()
    end

  end
end
