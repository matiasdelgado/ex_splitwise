defmodule ExSplitwise.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_splitwise,
      version: "0.2.1",
      elixir: "~> 1.4",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "ex_splitwise",
      source_url: "https://github.com/matiasdelgado/ex_splitwise",
      docs: docs(),
      package: package(),
      description: "Simple Elixir SDK for the Splitwise API",
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ExSplitwise.Application, []},
      env: [http: HTTPoison, oauth_client: ExSplitwise.OAuth2]
    ]
  end

  defp package do
    [
     maintainers: ["Matias Delgado"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/matiasdelgado/ex_splitwise",
              "Docs" => "https://hexdocs.pm/ex_splitwise/"}
     ]
  end

  defp docs do
    [
      extras: [
        {"README.md", [title: "Overview"]}
      ],
      main: "readme"
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:oauth2, "~>1.0"},
      {:poison, "~> 3.0", optional: true},
      {:httpoison, "~> 1.5"},
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:mox, "~> 0.5", only: :test},
      {:excoveralls, "~> 0.11.1", only: :test}
    ]
  end
end
