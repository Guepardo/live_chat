defmodule LiveChat.Messaging.Source.Ingest do
  use GenStage

  @max_batch_size 10_000

  def start_link(_) do
    GenStage.start(__MODULE__, :ok, name: __MODULE__)
  end

  def add(message) do
    GenStage.cast(__MODULE__, {:add, message})
  end

  # CALLBACKS

  def init(:ok) do
    {:producer, {:queue.new(), 0}, dispatcher: GenStage.BroadcastDispatcher}
  end

  def handle_cast({:add, message}, {queue, pending_demand}) do
    dispatch_messages(:queue.in(message, queue), pending_demand, [])
  end

  def handle_demand(incoming_demand, {queue, pending_demand}) do
    dispatch_messages(queue, incoming_demand + pending_demand, [])
  end

  defp dispatch_messages(queue, 0, messages) do
    {:noreply, messages, {queue, 0}}
  end

  defp dispatch_messages(queue, demand, messages) do
    case get_batched_messages(queue) do
      {:ok, {batched_messages, remaing_queue}} ->
        dispatch_messages(remaing_queue, demand - 1, [batched_messages | messages])

      {:empty} ->
        {:noreply, messages, {queue, demand}}
    end
  end

  defp get_batched_messages(queue) do
    queue_len = :queue.len(queue)

    cond do
      queue_len == 0 ->
        {:empty}

      queue_len < @max_batch_size ->
        {:ok, :queue.split(queue_len, queue)}

      queue_len > @max_batch_size ->
        {:ok, :queue.split(@max_batch_size, queue)}
    end
  end
end
