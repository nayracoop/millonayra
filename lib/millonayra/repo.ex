defmodule Millonayra.Repo do
  use Ecto.Repo,
    otp_app: :millonayra,
    adapter: Ecto.Adapters.Postgres
end
