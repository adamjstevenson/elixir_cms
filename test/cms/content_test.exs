defmodule Cms.ContentTest do
  use Cms.DataCase

  alias Cms.Content

  describe "entities" do
    alias Cms.Content.Entity

    @valid_attrs %{is_premium: true, is_published: true, requires_login: true, view_count: 42}
    @update_attrs %{is_premium: false, is_published: false, requires_login: false, view_count: 43}
    @invalid_attrs %{is_premium: nil, is_published: nil, requires_login: nil, view_count: nil}

    def entity_fixture(attrs \\ %{}) do
      {:ok, entity} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_entity()

      entity
    end

    test "list_entities/0 returns all entities" do
      entity = entity_fixture()
      assert Content.list_entities() == [entity]
    end

    test "get_entity!/1 returns the entity with given id" do
      entity = entity_fixture()
      assert Content.get_entity!(entity.id) == entity
    end

    test "create_entity/1 with valid data creates a entity" do
      assert {:ok, %Entity{} = entity} = Content.create_entity(@valid_attrs)
      assert entity.is_premium == true
      assert entity.is_published == true
      assert entity.requires_login == true
      assert entity.view_count == 42
    end

    test "create_entity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_entity(@invalid_attrs)
    end

    test "update_entity/2 with valid data updates the entity" do
      entity = entity_fixture()
      assert {:ok, %Entity{} = entity} = Content.update_entity(entity, @update_attrs)
      assert entity.is_premium == false
      assert entity.is_published == false
      assert entity.requires_login == false
      assert entity.view_count == 43
    end

    test "update_entity/2 with invalid data returns error changeset" do
      entity = entity_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_entity(entity, @invalid_attrs)
      assert entity == Content.get_entity!(entity.id)
    end

    test "delete_entity/1 deletes the entity" do
      entity = entity_fixture()
      assert {:ok, %Entity{}} = Content.delete_entity(entity)
      assert_raise Ecto.NoResultsError, fn -> Content.get_entity!(entity.id) end
    end

    test "change_entity/1 returns a entity changeset" do
      entity = entity_fixture()
      assert %Ecto.Changeset{} = Content.change_entity(entity)
    end
  end

  describe "articles" do
    alias Cms.Content.Article

    @valid_attrs %{content: "some content", slug: "some slug", title: "some title"}
    @update_attrs %{content: "some updated content", slug: "some updated slug", title: "some updated title"}
    @invalid_attrs %{content: nil, slug: nil, title: nil}

    def article_fixture(attrs \\ %{}) do
      {:ok, article} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_article()

      article
    end

    test "list_articles/0 returns all articles" do
      article = article_fixture()
      assert Content.list_articles() == [article]
    end

    test "get_article!/1 returns the article with given id" do
      article = article_fixture()
      assert Content.get_article!(article.id) == article
    end

    test "create_article/1 with valid data creates a article" do
      assert {:ok, %Article{} = article} = Content.create_article(@valid_attrs)
      assert article.content == "some content"
      assert article.slug == "some slug"
      assert article.title == "some title"
    end

    test "create_article/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_article(@invalid_attrs)
    end

    test "update_article/2 with valid data updates the article" do
      article = article_fixture()
      assert {:ok, %Article{} = article} = Content.update_article(article, @update_attrs)
      assert article.content == "some updated content"
      assert article.slug == "some updated slug"
      assert article.title == "some updated title"
    end

    test "update_article/2 with invalid data returns error changeset" do
      article = article_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_article(article, @invalid_attrs)
      assert article == Content.get_article!(article.id)
    end

    test "delete_article/1 deletes the article" do
      article = article_fixture()
      assert {:ok, %Article{}} = Content.delete_article(article)
      assert_raise Ecto.NoResultsError, fn -> Content.get_article!(article.id) end
    end

    test "change_article/1 returns a article changeset" do
      article = article_fixture()
      assert %Ecto.Changeset{} = Content.change_article(article)
    end
  end

  describe "episodes" do
    alias Cms.Content.Episode

    @valid_attrs %{content: "some content", seconds_long: 42, slug: "some slug", title: "some title", video_url: "some video_url"}
    @update_attrs %{content: "some updated content", seconds_long: 43, slug: "some updated slug", title: "some updated title", video_url: "some updated video_url"}
    @invalid_attrs %{content: nil, seconds_long: nil, slug: nil, title: nil, video_url: nil}

    def episode_fixture(attrs \\ %{}) do
      {:ok, episode} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_episode()

      episode
    end

    test "list_episodes/0 returns all episodes" do
      episode = episode_fixture()
      assert Content.list_episodes() == [episode]
    end

    test "get_episode!/1 returns the episode with given id" do
      episode = episode_fixture()
      assert Content.get_episode!(episode.id) == episode
    end

    test "create_episode/1 with valid data creates a episode" do
      assert {:ok, %Episode{} = episode} = Content.create_episode(@valid_attrs)
      assert episode.content == "some content"
      assert episode.seconds_long == 42
      assert episode.slug == "some slug"
      assert episode.title == "some title"
      assert episode.video_url == "some video_url"
    end

    test "create_episode/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_episode(@invalid_attrs)
    end

    test "update_episode/2 with valid data updates the episode" do
      episode = episode_fixture()
      assert {:ok, %Episode{} = episode} = Content.update_episode(episode, @update_attrs)
      assert episode.content == "some updated content"
      assert episode.seconds_long == 43
      assert episode.slug == "some updated slug"
      assert episode.title == "some updated title"
      assert episode.video_url == "some updated video_url"
    end

    test "update_episode/2 with invalid data returns error changeset" do
      episode = episode_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_episode(episode, @invalid_attrs)
      assert episode == Content.get_episode!(episode.id)
    end

    test "delete_episode/1 deletes the episode" do
      episode = episode_fixture()
      assert {:ok, %Episode{}} = Content.delete_episode(episode)
      assert_raise Ecto.NoResultsError, fn -> Content.get_episode!(episode.id) end
    end

    test "change_episode/1 returns a episode changeset" do
      episode = episode_fixture()
      assert %Ecto.Changeset{} = Content.change_episode(episode)
    end
  end

  describe "resources" do
    alias Cms.Content.Resource

    @valid_attrs %{content: "some content", slug: "some slug", title: "some title", url: "some url"}
    @update_attrs %{content: "some updated content", slug: "some updated slug", title: "some updated title", url: "some updated url"}
    @invalid_attrs %{content: nil, slug: nil, title: nil, url: nil}

    def resource_fixture(attrs \\ %{}) do
      {:ok, resource} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_resource()

      resource
    end

    test "list_resources/0 returns all resources" do
      resource = resource_fixture()
      assert Content.list_resources() == [resource]
    end

    test "get_resource!/1 returns the resource with given id" do
      resource = resource_fixture()
      assert Content.get_resource!(resource.id) == resource
    end

    test "create_resource/1 with valid data creates a resource" do
      assert {:ok, %Resource{} = resource} = Content.create_resource(@valid_attrs)
      assert resource.content == "some content"
      assert resource.slug == "some slug"
      assert resource.title == "some title"
      assert resource.url == "some url"
    end

    test "create_resource/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_resource(@invalid_attrs)
    end

    test "update_resource/2 with valid data updates the resource" do
      resource = resource_fixture()
      assert {:ok, %Resource{} = resource} = Content.update_resource(resource, @update_attrs)
      assert resource.content == "some updated content"
      assert resource.slug == "some updated slug"
      assert resource.title == "some updated title"
      assert resource.url == "some updated url"
    end

    test "update_resource/2 with invalid data returns error changeset" do
      resource = resource_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_resource(resource, @invalid_attrs)
      assert resource == Content.get_resource!(resource.id)
    end

    test "delete_resource/1 deletes the resource" do
      resource = resource_fixture()
      assert {:ok, %Resource{}} = Content.delete_resource(resource)
      assert_raise Ecto.NoResultsError, fn -> Content.get_resource!(resource.id) end
    end

    test "change_resource/1 returns a resource changeset" do
      resource = resource_fixture()
      assert %Ecto.Changeset{} = Content.change_resource(resource)
    end
  end

  describe "topics" do
    alias Cms.Content.Topic

    @valid_attrs %{text: "some text"}
    @update_attrs %{text: "some updated text"}
    @invalid_attrs %{text: nil}

    def topic_fixture(attrs \\ %{}) do
      {:ok, topic} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_topic()

      topic
    end

    test "list_topics/0 returns all topics" do
      topic = topic_fixture()
      assert Content.list_topics() == [topic]
    end

    test "get_topic!/1 returns the topic with given id" do
      topic = topic_fixture()
      assert Content.get_topic!(topic.id) == topic
    end

    test "create_topic/1 with valid data creates a topic" do
      assert {:ok, %Topic{} = topic} = Content.create_topic(@valid_attrs)
      assert topic.text == "some text"
    end

    test "create_topic/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_topic(@invalid_attrs)
    end

    test "update_topic/2 with valid data updates the topic" do
      topic = topic_fixture()
      assert {:ok, %Topic{} = topic} = Content.update_topic(topic, @update_attrs)
      assert topic.text == "some updated text"
    end

    test "update_topic/2 with invalid data returns error changeset" do
      topic = topic_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_topic(topic, @invalid_attrs)
      assert topic == Content.get_topic!(topic.id)
    end

    test "delete_topic/1 deletes the topic" do
      topic = topic_fixture()
      assert {:ok, %Topic{}} = Content.delete_topic(topic)
      assert_raise Ecto.NoResultsError, fn -> Content.get_topic!(topic.id) end
    end

    test "change_topic/1 returns a topic changeset" do
      topic = topic_fixture()
      assert %Ecto.Changeset{} = Content.change_topic(topic)
    end
  end
end
