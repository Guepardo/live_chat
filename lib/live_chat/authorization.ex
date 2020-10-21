defmodule LiveChat.Authorization do
  alias LiveChat.Authorization.Cache

  def grant_user_access_to_chat(user_uuid, chat_uuid) do
    get_cache_key(user_uuid, chat_uuid)
    |> Cache.put(true)
  end

  def user_has_chat_access?(user_uuid, chat_uuid) do
    cache_key = get_cache_key(user_uuid, chat_uuid)

    case Cache.get(cache_key) do
      {:ok, true} ->
        :ok

      _ ->
        :no_access
    end
  end

  defp get_cache_key(user_uuid, chat_uuid), do: "#{user_uuid}-#{chat_uuid}"
end
