defmodule Umbrellatest.StateWorker do
  use GenServer

  @vsn 4

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

  def code_change(4, state, extra) do
    require Logger

    Logger.warn("changing code version #{vsn}")
    {:ok, "now version 4"}
  end

  def code_change(vsn, state, extra) do
    require Logger

    Logger.warn("changing code version #{vsn}")
    {:ok, "some old version"}
  end
end
