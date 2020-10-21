defmodule LiveChatWeb.ManagerApi.ChatController do
  use LiveChatWeb, :controller

  alias LiveChat.Authorization
  alias LiveChat.Room
  alias LiveChat.Room.Chat

  action_fallback LiveChatWeb.FallBackController

  def grant_access(conn, %{"uuid" => uuid, "user_uuid" => user_uuid} = _params) do
    Authorization.grant_user_access_to_chat(user_uuid, uuid)
    json(conn, %{})
  end

  def create(conn, params) do
    with {:ok, %Chat{}} <- Room.create_chat(params) do
      conn
      |> put_status(:created)
      |> json(%{status: :ok, message: "created"})
    end
  end

  def inactive(coon, params) do
    json(coon, %{})
  end

  def history(coon, params) do
    json(coon, %{})
  end
end
