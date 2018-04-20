defmodule U.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :startup, name: __MODULE__)
  end

  def init(:startup) do
    children = [
      {Umbrellatest.StateWorker, []},
      {Umbrellatest.Another, []},
      {Umbrellatest.YetAnother, []},
      {Umbrellatest.AnotherOne, []}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

  # during hot code upgrade
  def init(:ok) do
    require Logger

    Logger.warn("calling supervisor init ")

    child = {Umbrellatest.AnotherOne, []}

    Supervisor.start_child(__MODULE__, child)

    children = [
      {Umbrellatest.AnotherOne, []}
    ]

    Supervisor.init(children, strategy: :one_for_one)
    |> IO.inspect()

    #Supervisor.init([child], strategy: :one_for_one)
  end
end
