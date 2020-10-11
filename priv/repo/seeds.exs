# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     LiveChat.Repo.insert!(%LiveChat.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias LiveChat.Messaging
alias LiveChat.Room

{:ok, chat} = Room.create_chat(%{name: "alsdkjfalsdfj", transmission_id: "asdfasdf"})

# messages =
#   1..1_000
#   |> Enum.map(fn item ->
#     %{
#       chat_id: chat.id,
#       palyoad: Integer.to_string(item),
#       inserted_at: NaiveDateTime.utc_now |> NaiveDateTime.truncate(:second),
#       updated_at: NaiveDateTime.utc_now |> NaiveDateTime.truncate(:second)
#     }
#   end)

# Messaging.create_many_messages(messages)

# for nada <- 1..1_000 do
#   Messaging.create_message_batch(%{chat_id: chat.id})
# end
