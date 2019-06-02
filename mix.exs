defmodule ServerlessElixirDemo.MixProject do
  use Mix.Project

  def project do
    [
      app: :serverless_elixir_demo,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:erllambda, "~> 2.0"},
      {:mix_erllambda, "~> 1.0"},
      {:jiffy, "~> 0.15.2"}
    ]
  end
end
