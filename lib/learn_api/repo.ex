defmodule LearnApi.Repo do
  use Ecto.Repo,
    otp_app: :learn_api,
    adapter: Ecto.Adapters.Postgres
end
