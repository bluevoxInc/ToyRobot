defmodule ToyRobot.AgentRobot do

  def place do
    {:ok, state} = ToyRobot.place
    {:ok, pid} = Agent.start(fn -> state end, name: __MODULE__)
    pid
  end

  def report do
    Agent.get(__MODULE__, fn state -> ToyRobot.report(state) end) # or &(ToyRobot.report(&1))
  end

  def move, do: Agent.update(__MODULE__, &(ToyRobot.move(&1)))

  def left, do: Agent.update(__MODULE__, &(ToyRobot.left(&1)))

  def right, do: Agent.update(__MODULE__, &(ToyRobot.right(&1)))
end
