defmodule U.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  # def init(:ok) do
  #   children = [
  #     {Umbrellatest.StateWorker, []},
  #     {Umbrellatest.Another, []},
  #   ]
  #
  #   Supervisor.init(children, strategy: :one_for_one)
  # end

  def init(args) do
    require Logger

    Logger.warn("calling supervisor init with #{args})")

    children = [
      {Umbrellatest.StateWorker, []},
      {Umbrellatest.Another, []},
      {Umbrellatest.YetAnother, []},
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
