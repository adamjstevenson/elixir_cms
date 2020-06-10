defmodule Cms.Repo.Migrations.CreateEntities do
  use Ecto.Migration

  def change do
    create table(:entities) do
      add :is_published, :boolean, default: false, null: false
      add :is_premium, :boolean, default: false, null: false
      add :requires_login, :boolean, default: false, null: false
      add :view_count, :integer, default: 0

      timestamps()
    end

  end
end
