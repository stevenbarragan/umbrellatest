defmodule Umbrellatest.StateWorker do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    {:ok, "pants"}
  end

  def fetch do
    GenServer.call(__MODULE__, :fetch)
  end

  def handle_call(:fetch, _from, state) do
    {:reply, state, state}
  end
end
