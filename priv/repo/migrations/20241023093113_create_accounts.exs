defmodule LearnApi.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts, primary_key: false) do
      add :id, :string, primary_key: true
      add :email, :string
      add :hash_password, :string

      timestamps(type: :utc_datetime)
    end
  end
end