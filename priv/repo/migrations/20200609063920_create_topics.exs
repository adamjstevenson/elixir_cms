defmodule Cms.Repo.Migrations.CreateTopics do
  use Ecto.Migration

  def change do
    create table(:topics) do
      add :text, :string

      timestamps()
    end

  end
end
