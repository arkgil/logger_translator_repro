defmodule LoggerTranslatorRepro do
  @moduledoc false

  use Application

  @behaviour :supervisor3

  @impl Application
  def start(_, _) do
    :supervisor3.start_link(__MODULE__, nil)
  end

  @impl :supervisor3
  def init(_) do
    children = [
      {__MODULE__.Server, {Agent, :start_link, [fn -> %{} end, [name: __MODULE__.Server]]},
       :permanent, 5000, :worker, []}
    ]

    {:ok, {{:one_for_one, 3, 5000}, children}}
  end

  @impl :supervisor3
  def post_init(_) do
    children = [
      {__MODULE__.Server, {Agent, :start_link, [fn -> %{} end, [name: __MODULE__.Server]]},
       :permanent, 5000, :worker, []}
    ]

    {:ok, {{:one_for_one, 3, 5000}, children}}
  end
end
