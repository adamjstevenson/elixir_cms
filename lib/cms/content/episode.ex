defmodule Cms.Content.Episode do
  use Ecto.Schema
  import Ecto.Changeset
  alias Cms.Content.{Entity, Episode}

  schema "episodes" do
    field :content, :string
    field :seconds_long, :integer
    field :slug, :string
    field :title, :string
    field :video_url, :string
    belongs_to :entity, Entity

    timestamps()
  end

  @doc false
  def changeset(episode, attrs) do
    episode
    |> cast(attrs, [:title, :slug, :content, :seconds_long, :video_url, :entity_id])
    |> validate_required([:title, :slug, :content, :seconds_long, :video_url])
  end
end
