defmodule LearnApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :string, primary_key: true
      add :full_name, :string
      add :gender, :string
      add :biography, :text
      add :account_id, references(:accounts, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:users, [:account_id, :full_name])
  end
end
