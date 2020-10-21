defmodule LiveChat.Authorization.Cache do
  @cache_name :cache
  # @default_ttl :timer.seconds(216_000)
  @default_ttl :timer.seconds(30)

  def get(key) do
    Cachex.get(@cache_name, key)
  end

  def put(key, value) do
    Cachex.put(@cache_name, key, value, ttl: @default_ttl)
  end
end
