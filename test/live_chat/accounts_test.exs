defmodule LiveChat.AccountsTest do
  use LiveChat.DataCase

  alias LiveChat.Accounts

  describe "apps" do
    alias LiveChat.Accounts.App

    @valid_attrs %{name: "some name", token: "some token"}
    @update_attrs %{name: "some updated name", token: "some updated token"}
    @invalid_attrs %{name: nil, token: nil}

    def app_fixture(attrs \\ %{}) do
      {:ok, app} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_app()

      app
    end

    test "list_apps/0 returns all apps" do
      app = app_fixture()
      assert Accounts.list_apps() == [app]
    end

    test "get_app!/1 returns the app with given id" do
      app = app_fixture()
      assert Accounts.get_app!(app.id) == app
    end

    test "create_app/1 with valid data creates a app" do
      assert {:ok, %App{} = app} = Accounts.create_app(@valid_attrs)
      assert app.name == "some name"
      assert app.token == "some token"
    end

    test "create_app/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_app(@invalid_attrs)
    end

    test "update_app/2 with valid data updates the app" do
      app = app_fixture()
      assert {:ok, %App{} = app} = Accounts.update_app(app, @update_attrs)
      assert app.name == "some updated name"
      assert app.token == "some updated token"
    end

    test "update_app/2 with invalid data returns error changeset" do
      app = app_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_app(app, @invalid_attrs)
      assert app == Accounts.get_app!(app.id)
    end

    test "delete_app/1 deletes the app" do
      app = app_fixture()
      assert {:ok, %App{}} = Accounts.delete_app(app)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_app!(app.id) end
    end

    test "change_app/1 returns a app changeset" do
      app = app_fixture()
      assert %Ecto.Changeset{} = Accounts.change_app(app)
    end
  end
end
