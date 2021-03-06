defmodule Tunk.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
	import Supervisor.Spec, warn: false
	children = [
		worker(Tunk.Router, [])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
	opts = [strategy: :one_for_one, name: Tunk.Supervisor]
	Tunk.Config.load(Fig.Loader.Env)

	IO.puts("Tunk has started...")
	Supervisor.start_link(children, opts)
  end
end
