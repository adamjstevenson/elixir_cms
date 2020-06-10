defmodule Cms.Content.Entity do
  use Ecto.Schema
  import Ecto.Changeset

  schema "entities" do
    field :is_premium, :boolean, default: false
    field :is_published, :boolean, default: false
    field :requires_login, :boolean, default: false
    field :view_count, :integer, default: 0

    timestamps()
  end

  @doc false
  def changeset(entity, attrs) do
    entity
    |> cast(attrs, [:is_published, :is_premium, :requires_login, :view_count])
    |> validate_required([:is_published, :is_premium, :requires_login, :view_count])
  end
end
