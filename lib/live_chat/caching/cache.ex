defmodule LiveChat.Cache do
  @cache_name :cache

  def get(key) do
    Cachex.get(@cache_name, key)
  end

  def set(key, value) do
    Cachex.set(@cache_name, key, value)
  end
end
