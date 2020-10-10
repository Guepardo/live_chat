defmodule LiveChatWeb.ClientApi.MessageController do
  use LiveChatWeb, :controller

  def index(conn, params) do
    send_resp(conn, 200, "ok")
  end
end
