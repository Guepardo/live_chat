defmodule LiveChat.MessagingTest do
  use LiveChat.DataCase

  alias LiveChat.Messaging

  describe "chats" do
    alias LiveChat.Messaging.Chat

    @valid_attrs %{name: "some name", transmission_id: "some transmission_id"}
    @update_attrs %{name: "some updated name", transmission_id: "some updated transmission_id"}
    @invalid_attrs %{name: nil, transmission_id: nil}

    def chat_fixture(attrs \\ %{}) do
      {:ok, chat} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Messaging.create_chat()

      chat
    end

    test "list_chats/0 returns all chats" do
      chat = chat_fixture()
      assert Messaging.list_chats() == [chat]
    end

    test "get_chat!/1 returns the chat with given id" do
      chat = chat_fixture()
      assert Messaging.get_chat!(chat.id) == chat
    end

    test "create_chat/1 with valid data creates a chat" do
      assert {:ok, %Chat{} = chat} = Messaging.create_chat(@valid_attrs)
      assert chat.name == "some name"
      assert chat.transmission_id == "some transmission_id"
    end

    test "create_chat/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messaging.create_chat(@invalid_attrs)
    end

    test "update_chat/2 with valid data updates the chat" do
      chat = chat_fixture()
      assert {:ok, %Chat{} = chat} = Messaging.update_chat(chat, @update_attrs)
      assert chat.name == "some updated name"
      assert chat.transmission_id == "some updated transmission_id"
    end

    test "update_chat/2 with invalid data returns error changeset" do
      chat = chat_fixture()
      assert {:error, %Ecto.Changeset{}} = Messaging.update_chat(chat, @invalid_attrs)
      assert chat == Messaging.get_chat!(chat.id)
    end

    test "delete_chat/1 deletes the chat" do
      chat = chat_fixture()
      assert {:ok, %Chat{}} = Messaging.delete_chat(chat)
      assert_raise Ecto.NoResultsError, fn -> Messaging.get_chat!(chat.id) end
    end

    test "change_chat/1 returns a chat changeset" do
      chat = chat_fixture()
      assert %Ecto.Changeset{} = Messaging.change_chat(chat)
    end
  end

  describe "message_batches" do
    alias LiveChat.Messaging.MessageBatch

    @valid_attrs %{uuid: "some uuid"}
    @update_attrs %{uuid: "some updated uuid"}
    @invalid_attrs %{uuid: nil}

    def message_batch_fixture(attrs \\ %{}) do
      {:ok, message_batch} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Messaging.create_message_batch()

      message_batch
    end

    test "list_message_batches/0 returns all message_batches" do
      message_batch = message_batch_fixture()
      assert Messaging.list_message_batches() == [message_batch]
    end

    test "get_message_batch!/1 returns the message_batch with given id" do
      message_batch = message_batch_fixture()
      assert Messaging.get_message_batch!(message_batch.id) == message_batch
    end

    test "create_message_batch/1 with valid data creates a message_batch" do
      assert {:ok, %MessageBatch{} = message_batch} = Messaging.create_message_batch(@valid_attrs)
      assert message_batch.uuid == "some uuid"
    end

    test "create_message_batch/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messaging.create_message_batch(@invalid_attrs)
    end

    test "update_message_batch/2 with valid data updates the message_batch" do
      message_batch = message_batch_fixture()
      assert {:ok, %MessageBatch{} = message_batch} = Messaging.update_message_batch(message_batch, @update_attrs)
      assert message_batch.uuid == "some updated uuid"
    end

    test "update_message_batch/2 with invalid data returns error changeset" do
      message_batch = message_batch_fixture()
      assert {:error, %Ecto.Changeset{}} = Messaging.update_message_batch(message_batch, @invalid_attrs)
      assert message_batch == Messaging.get_message_batch!(message_batch.id)
    end

    test "delete_message_batch/1 deletes the message_batch" do
      message_batch = message_batch_fixture()
      assert {:ok, %MessageBatch{}} = Messaging.delete_message_batch(message_batch)
      assert_raise Ecto.NoResultsError, fn -> Messaging.get_message_batch!(message_batch.id) end
    end

    test "change_message_batch/1 returns a message_batch changeset" do
      message_batch = message_batch_fixture()
      assert %Ecto.Changeset{} = Messaging.change_message_batch(message_batch)
    end
  end

  describe "messages" do
    alias LiveChat.Messaging.Message

    @valid_attrs %{palyoad: "some palyoad"}
    @update_attrs %{palyoad: "some updated palyoad"}
    @invalid_attrs %{palyoad: nil}

    def message_fixture(attrs \\ %{}) do
      {:ok, message} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Messaging.create_message()

      message
    end

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Messaging.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Messaging.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      assert {:ok, %Message{} = message} = Messaging.create_message(@valid_attrs)
      assert message.palyoad == "some palyoad"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messaging.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      assert {:ok, %Message{} = message} = Messaging.update_message(message, @update_attrs)
      assert message.palyoad == "some updated palyoad"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Messaging.update_message(message, @invalid_attrs)
      assert message == Messaging.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Messaging.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Messaging.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Messaging.change_message(message)
    end
  end
end
