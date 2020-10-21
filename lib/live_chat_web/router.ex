defmodule LiveChatWeb.Router do
  use LiveChatWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug CORSPlug, origin: "*"
    plug :accepts, ["json"]
  end

  scope "/", LiveChatWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api/", LiveChatWeb.ClientApi do
    pipe_through :api

    resources "/chats", ChatController, only: [:show] do
      resources("/messages", MessageController, only: [:show])
    end
  end

  scope "/adm_api/", LiveChatWeb.ManagerApi do
    scope "/user" do
      get "/:uuid/grant", UserController, :grant
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", LiveChatWeb do
  #   pipe_through :api
  # end
end
