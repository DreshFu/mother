defmodule FridayProjectWeb.Router do
  use FridayProjectWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, html: {FridayProjectWeb.Layouts, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", FridayProjectWeb do
    pipe_through(:browser)

    get("/", PageController, :home)
    live("/first_dev_experiences", FirstDevExperienceLive.Index, :index)
    live("/first_dev_experiences/new", FirstDevExperienceLive.Index, :new)
    live("/first_dev_experiences/:id/edit", FirstDevExperienceLive.Index, :edit)

    live("/first_dev_experiences/:id", FirstDevExperienceLive.Show, :show)
    live("/first_dev_experiences/:id/show/edit", FirstDevExperienceLive.Show, :edit)

    live("/second_dev_experiences", SecondDevExperienceLive.Index, :index)
    live("/second_dev_experiences/new", SecondDevExperienceLive.Index, :new)
    live("/second_dev_experiences/:id/edit", SecondDevExperienceLive.Index, :edit)

    live("/second_dev_experiences/:id", SecondDevExperienceLive.Show, :show)
    live("/second_dev_experiences/:id/show/edit", SecondDevExperienceLive.Show, :edit)

    live "/tuesdays", TuesdayLive.Index, :index
    live "/tuesdays/new", TuesdayLive.Index, :new
    live "/tuesdays/:id/edit", TuesdayLive.Index, :edit

    live "/tuesdays/:id", TuesdayLive.Show, :show
    live "/tuesdays/:id/show/edit", TuesdayLive.Show, :edit

    resources("/third_dev_experiences", ThirdDevExperienceController)

    resources("/parties", PartyController)
    resources "/statictuesdays", StaticTuesdayController
    resources "/wednesdays", WednesdayController

  end

  # Other scopes may use custom stacks.
  # scope "/api", FridayProjectWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:friday_project, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through(:browser)

      live_dashboard("/dashboard", metrics: FridayProjectWeb.Telemetry)
      forward("/mailbox", Plug.Swoosh.MailboxPreview)
    end
  end
end
