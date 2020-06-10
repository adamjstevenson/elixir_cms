defmodule CmsWeb.EpisodeControllerTest do
  use CmsWeb.ConnCase

  alias Cms.Content

  @create_attrs %{content: "some content", seconds_long: 42, slug: "some slug", title: "some title", video_url: "some video_url"}
  @update_attrs %{content: "some updated content", seconds_long: 43, slug: "some updated slug", title: "some updated title", video_url: "some updated video_url"}
  @invalid_attrs %{content: nil, seconds_long: nil, slug: nil, title: nil, video_url: nil}

  def fixture(:episode) do
    {:ok, episode} = Content.create_episode(@create_attrs)
    episode
  end

  describe "index" do
    test "lists all episodes", %{conn: conn} do
      conn = get(conn, Routes.episode_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Episodes"
    end
  end

  describe "new episode" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.episode_path(conn, :new))
      assert html_response(conn, 200) =~ "New Episode"
    end
  end

  describe "create episode" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.episode_path(conn, :create), episode: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.episode_path(conn, :show, id)

      conn = get(conn, Routes.episode_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Episode"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.episode_path(conn, :create), episode: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Episode"
    end
  end

  describe "edit episode" do
    setup [:create_episode]

    test "renders form for editing chosen episode", %{conn: conn, episode: episode} do
      conn = get(conn, Routes.episode_path(conn, :edit, episode))
      assert html_response(conn, 200) =~ "Edit Episode"
    end
  end

  describe "update episode" do
    setup [:create_episode]

    test "redirects when data is valid", %{conn: conn, episode: episode} do
      conn = put(conn, Routes.episode_path(conn, :update, episode), episode: @update_attrs)
      assert redirected_to(conn) == Routes.episode_path(conn, :show, episode)

      conn = get(conn, Routes.episode_path(conn, :show, episode))
      assert html_response(conn, 200) =~ "some updated content"
    end

    test "renders errors when data is invalid", %{conn: conn, episode: episode} do
      conn = put(conn, Routes.episode_path(conn, :update, episode), episode: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Episode"
    end
  end

  describe "delete episode" do
    setup [:create_episode]

    test "deletes chosen episode", %{conn: conn, episode: episode} do
      conn = delete(conn, Routes.episode_path(conn, :delete, episode))
      assert redirected_to(conn) == Routes.episode_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.episode_path(conn, :show, episode))
      end
    end
  end

  defp create_episode(_) do
    episode = fixture(:episode)
    {:ok, episode: episode}
  end
end
