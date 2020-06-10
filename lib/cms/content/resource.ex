defmodule Cms.Content.Resource do
  use Ecto.Schema
  import Ecto.Changeset
  alias Cms.Content.{Entity, Resource}

  schema "resources" do
    field :content, :string
    field :slug, :string
    field :title, :string
    field :url, :string
    belongs_to :entity, Entity

    timestamps()
  end

  @doc false
  def changeset(resource, attrs) do
    resource
    |> cast(attrs, [:title, :slug, :content, :url, :entity_id])
    |> validate_required([:title, :slug, :content, :url])
  end
end
