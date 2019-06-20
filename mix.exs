defmodule Splitwise.MixProject do
  use Mix.Project

  def project do
    [
      app: :splitwise,
      version: "0.1.0",
      elixir: "~> 1.4",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "Splitwise",
      source_url: "https://github.com/matiasdelgado/splitwise",
      docs: [
        extras: [
          {"README.md", [title: "Overview"]}
        ],
        main: "readme"
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:oauth2, "~>1.0"},
      {:poison, "~> 3.0", optional: true},
      {:httpoison, "~> 1.5"},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false}
    ]
  end
end
