defmodule LiveChat.Messaging do
  @moduledoc """
  The Messaging context.
  """

  import Ecto.Query, warn: false
  alias LiveChat.Repo

  alias LiveChat.Messaging.MessageBatch

  @doc """
  Returns the list of message_batches.

  ## Examples

      iex> list_message_batches()
      [%MessageBatch{}, ...]

  """
  def list_message_batches do
    Repo.all(MessageBatch)
  end

  @doc """
  Gets a single message_batch.

  Raises `Ecto.NoResultsError` if the Message batch does not exist.

  ## Examples

      iex> get_message_batch!(123)
      %MessageBatch{}

      iex> get_message_batch!(456)
      ** (Ecto.NoResultsError)

  """
  def get_message_batch!(id), do: Repo.get!(MessageBatch, id)

  @doc """
  Creates a message_batch.

  ## Examples

      iex> create_message_batch(%{field: value})
      {:ok, %MessageBatch{}}

      iex> create_message_batch(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_message_batch(attrs \\ %{}) do
    %MessageBatch{}
    |> MessageBatch.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a message_batch.

  ## Examples

      iex> update_message_batch(message_batch, %{field: new_value})
      {:ok, %MessageBatch{}}

      iex> update_message_batch(message_batch, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_message_batch(%MessageBatch{} = message_batch, attrs) do
    message_batch
    |> MessageBatch.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a message_batch.

  ## Examples

      iex> delete_message_batch(message_batch)
      {:ok, %MessageBatch{}}

      iex> delete_message_batch(message_batch)
      {:error, %Ecto.Changeset{}}

  """
  def delete_message_batch(%MessageBatch{} = message_batch) do
    Repo.delete(message_batch)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking message_batch changes.

  ## Examples

      iex> change_message_batch(message_batch)
      %Ecto.Changeset{source: %MessageBatch{}}

  """
  def change_message_batch(%MessageBatch{} = message_batch) do
    MessageBatch.changeset(message_batch, %{})
  end

  alias LiveChat.Messaging.Message

  @doc """
  Returns the list of messages.

  ## Examples

      iex> list_messages()
      [%Message{}, ...]

  """
  def list_messages do
    Repo.all(Message)
  end

  @doc """
  Gets a single message.

  Raises `Ecto.NoResultsError` if the Message does not exist.

  ## Examples

      iex> get_message!(123)
      %Message{}

      iex> get_message!(456)
      ** (Ecto.NoResultsError)

  """
  def get_message!(id), do: Repo.get!(Message, id)

  @doc """
  Creates a message.

  ## Examples

      iex> create_message(%{field: value})
      {:ok, %Message{}}

      iex> create_message(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_message(attrs \\ %{}) do
    %Message{}
    |> Message.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a message.

  ## Examples

      iex> update_message(message, %{field: new_value})
      {:ok, %Message{}}

      iex> update_message(message, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_message(%Message{} = message, attrs) do
    message
    |> Message.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a message.

  ## Examples

      iex> delete_message(message)
      {:ok, %Message{}}

      iex> delete_message(message)
      {:error, %Ecto.Changeset{}}

  """
  def delete_message(%Message{} = message) do
    Repo.delete(message)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking message changes.

  ## Examples

      iex> change_message(message)
      %Ecto.Changeset{source: %Message{}}

  """
  def change_message(%Message{} = message) do
    Message.changeset(message, %{})
  end
end
