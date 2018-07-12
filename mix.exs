defmodule LoggerTranslatorRepro.MixProject do
  use Mix.Project

  def project do
    [
      app: :logger_translator_repro,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {LoggerTranslatorRepro, []},
      extra_applications: [:sasl, :logger]
    ]
  end

  defp deps do
    [
      {:supervisor3, "~> 1.1.6"}
    ]
  end
end
