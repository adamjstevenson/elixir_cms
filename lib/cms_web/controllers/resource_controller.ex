defmodule CmsWeb.ResourceController do
  use CmsWeb, :controller

  alias Cms.Content
  alias Cms.Content.Resource

  def index(conn, _params) do
    resources = Content.list_resources()
    render(conn, "index.html", resources: resources)
  end

  def new(conn, _params) do
    changeset = Content.change_resource(%Resource{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"resource" => resource_params}) do
    case Content.create_resource(resource_params) do
      {:ok, resource} ->
        conn
        |> put_flash(:info, "Resource created successfully.")
        |> redirect(to: Routes.resource_path(conn, :show, resource))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    resource = Content.get_resource!(id)
    render(conn, "show.html", resource: resource)
  end

  def edit(conn, %{"id" => id}) do
    resource = Content.get_resource!(id)
    changeset = Content.change_resource(resource)
    render(conn, "edit.html", resource: resource, changeset: changeset)
  end

  def update(conn, %{"id" => id, "resource" => resource_params}) do
    resource = Content.get_resource!(id)

    case Content.update_resource(resource, resource_params) do
      {:ok, resource} ->
        conn
        |> put_flash(:info, "Resource updated successfully.")
        |> redirect(to: Routes.resource_path(conn, :show, resource))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", resource: resource, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    resource = Content.get_resource!(id)
    {:ok, _resource} = Content.delete_resource(resource)

    conn
    |> put_flash(:info, "Resource deleted successfully.")
    |> redirect(to: Routes.resource_path(conn, :index))
  end
end
