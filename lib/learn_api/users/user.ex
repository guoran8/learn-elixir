defmodule LearnApi.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, autogenerate: false}
  schema "users" do
    field :full_name, :string
    field :gender, :string
    field :biography, :string
    field :account_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:full_name, :gender, :biography])
    |> validate_required([:full_name, :gender, :biography])
  end
end