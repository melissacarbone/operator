defmodule Operator.Router do
  use Operator.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Operator.Locale
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Operator do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/emails", EmailController, only: [:index, :new]
    get "/emails/preview", EmailController, :preview
    post "/emails/send", EmailController, :send
  end

  # Other scopes may use custom stacks.
  # scope "/api", Operator do
  #   pipe_through :api
  # end
end
