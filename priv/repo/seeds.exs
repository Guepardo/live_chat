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

{:ok, chat} =
  Room.create_chat(%{name: "alsdkjfalsdfj", transmission_id: "asdfasdf"})

for nada <- 1..1_000 do
  Messaging.create_message_batch(%{chat_id: chat.id})
end
