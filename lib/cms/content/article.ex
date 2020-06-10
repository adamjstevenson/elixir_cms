defmodule Cms.Content.Article do
  use Ecto.Schema
  import Ecto.Changeset
  alias Cms.Content.{Article, Entity}


  schema "articles" do
    field :content, :string
    field :slug, :string
    field :title, :string
    belongs_to :entity, Entity

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:title, :slug, :content, :entity_id])
    |> validate_required([:title, :slug, :content])
  end
end
