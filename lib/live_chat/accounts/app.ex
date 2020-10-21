defmodule LiveChat.Accounts.App do
  use Ecto.Schema
  import Ecto.Changeset

  schema "apps" do
    field :name, :string
    field :token, :string

    timestamps()
  end

  @doc false
  def changeset(app, attrs) do
    app
    |> cast(attrs, [:name, :token])
    |> validate_required([:name, :token])
  end
end
