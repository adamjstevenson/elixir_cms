defmodule Cms.Content.Topic do
  use Ecto.Schema
  import Ecto.Changeset

  schema "topics" do
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(topic, attrs) do
    topic
    |> cast(attrs, [:text])
    |> validate_required([:text])
  end
end
