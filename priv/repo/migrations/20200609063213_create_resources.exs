defmodule Cms.Repo.Migrations.CreateResources do
  use Ecto.Migration

  def change do
    create table(:resources) do
      add :title, :string
      add :slug, :string
      add :content, :text
      add :url, :string
      add :entity_id, references(:entities, on_delete: :nothing)

      timestamps()
    end

    create index(:resources, [:entity_id])
    create unique_index(:resources, [:slug])
  end
end
