defmodule Cms.Repo.Migrations.CreateEpisodes do
  use Ecto.Migration

  def change do
    create table(:episodes) do
      add :title, :string
      add :slug, :string
      add :content, :text
      add :seconds_long, :integer
      add :video_url, :string
      add :entity_id, references(:entities, on_delete: :nothing)

      timestamps()
    end

    create index(:episodes, [:entity_id])
    create unique_index(:episodes, [:slug])
  end
end
