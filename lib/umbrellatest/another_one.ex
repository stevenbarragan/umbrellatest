defmodule Umbrellatest.AnotherOne do
  use GenServer

  def start_link(_args) do
    GenServer.start_link(__MODULE__, :ok, name: :__MODULE__)
  end

  def init(:ok) do
    {:ok, "Another one"}
  end

  def fetch do
    GenServer.call(__MODULE__, :fetch)
  end

  def handle_call(:fetch, _from, state) do
    {:reply, state, state}
  end
end
