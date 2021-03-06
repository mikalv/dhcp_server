defmodule DHCPServer.Mixfile do
  use Mix.Project

  def project do
    [
      app: :dhcp_server,
      version: "0.7.0",
      elixir: "~> 1.8",
      compilers: [:elixir_make] ++ Mix.compilers(),
      package: package(),
      description: description(),
      make_clean: ["clean"],
      erlc_options: [{:parse_transform}],
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      applications: [:logger]
    ]
  end

  def deps do
    [
      {:elixir_make, "~> 0.5", runtime: false},
      {:ex_doc, "~> 0.19", only: :dev}
    ]
  end

  defp description do
    """
    Configure a linux network interface to act as a DHCP Server.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "COPYING", "src", "c_src/*.[ch]", "Makefile"],
      maintainers: ["Connor Rigby"],
      licenses: ["GPLv2"],
      links: %{"GitHub" => "https://github.com/FarmBot-Labs/dhcp_server"}
    ]
  end
end
