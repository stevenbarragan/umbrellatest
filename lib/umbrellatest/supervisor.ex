defmodule U.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :startup, name: __MODULE__)
  end

  def init(:startup) do
    children = [
      {Umbrellatest.StateWorker, []},
      {Umbrellatest.Another, []},
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

  # during hot code upgrade
  def init(:ok) do
    require Logger

    Logger.warn("calling supervisor init ")

    Supervisor.start_child(__MODULE__, {Umbrellatest.YetAnother, []})
  end
end
