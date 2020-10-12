defmodule LiveChatWeb.ClientApi.ChatController do
  use LiveChatWeb, :controller

  alias LiveChat.Messaging

  def show(conn, params) do
    json(conn, %{})
  end
end
