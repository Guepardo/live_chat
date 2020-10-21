defmodule LiveChatWeb.FallBackController do
  use LiveChatWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(LiveChatWeb.ChangesetView, "error.json", changeset: changeset)
  end
end
