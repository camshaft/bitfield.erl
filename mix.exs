defmodule Bitfield.Mixfile do
  use Mix.Project

  def project do
    [app: :bitfield,
     version: "1.0.0",
     elixir: "~> 1.0",
     description: "Simple bitfields for erlang/elixir",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package,
     deps: deps]
  end

  def application do
    [applications: []]
  end

  defp deps do
    [{:excheck, "~> 0.2.3", only: [:dev, :test]},
     {:triq, github: "krestenkrab/triq", only: [:dev, :test]}]
  end

  defp package do
    [files: ["lib", "src", "mix.exs", "README*"],
     contributors: ["Cameron Bytheway"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/camshaft/bitfield.erl"}]
  end
end
