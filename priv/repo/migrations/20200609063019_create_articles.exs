defmodule Cms.Repo.Migrations.CreateArticles do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :title, :string
      add :slug, :string
      add :content, :text
      add :entity_id, references(:entities, on_delete: :nothing)

      timestamps()
    end

    create index(:articles, [:entity_id])
    create unique_index(:articles, [:slug])
  end
end
