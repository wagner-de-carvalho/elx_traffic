defmodule ElxTrafficWeb.Router do
  use ElxTrafficWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {ElxTrafficWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElxTrafficWeb do
    pipe_through :browser

    live("/", OwnersLive)
    live("/owners", OwnersLive)
    live("/owners/new", OwnersLive, :new)
    live("/traffic_violations", TrafficViolationsLive)
    live("/vehicles", VehiclesLive)

    # live "/articles", ArticleLive.Index, :index
    # live "/articles/new", ArticleLive.Index, :new
    # live "/articles/:id/edit", ArticleLive.Index, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElxTrafficWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:elx_traffic, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: ElxTrafficWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
