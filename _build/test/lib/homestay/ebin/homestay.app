{application,homestay,
             [{compile_env,[{homestay,['Elixir.HomestayWeb.Gettext'],error},
                            {homestay,[dev_routes],error}]},
              {optional_applications,[]},
              {applications,[kernel,stdlib,elixir,logger,runtime_tools,
                             bcrypt_elixir,phoenix,phoenix_ecto,ecto_sql,
                             postgrex,phoenix_html,phoenix_live_view,floki,
                             phoenix_live_dashboard,swoosh,finch,
                             telemetry_metrics,telemetry_poller,gettext,jason,
                             dns_cluster,bandit,resend,live_svelte,
                             json_diff_ex,live_json,timex]},
              {description,"homestay"},
              {modules,['Elixir.Homestay','Elixir.Homestay.Accounts',
                        'Elixir.Homestay.Accounts.Role',
                        'Elixir.Homestay.Accounts.User',
                        'Elixir.Homestay.Accounts.UserNotifier',
                        'Elixir.Homestay.Accounts.UserRole',
                        'Elixir.Homestay.Accounts.UserToken',
                        'Elixir.Homestay.AccountsFixtures',
                        'Elixir.Homestay.Application',
                        'Elixir.Homestay.DataCase','Elixir.Homestay.Homes',
                        'Elixir.Homestay.Homes.Home',
                        'Elixir.Homestay.Homes.Homeowner',
                        'Elixir.Homestay.HomesFixtures',
                        'Elixir.Homestay.Mailer','Elixir.Homestay.Release',
                        'Elixir.Homestay.Repo','Elixir.HomestayWeb',
                        'Elixir.HomestayWeb.CaraLive',
                        'Elixir.HomestayWeb.ConfirmLive',
                        'Elixir.HomestayWeb.ConnCase',
                        'Elixir.HomestayWeb.CoreComponents',
                        'Elixir.HomestayWeb.Endpoint',
                        'Elixir.HomestayWeb.ErrorHTML',
                        'Elixir.HomestayWeb.ErrorJSON',
                        'Elixir.HomestayWeb.Gettext',
                        'Elixir.HomestayWeb.HomeLive.FormComponent',
                        'Elixir.HomestayWeb.HomeLive.Index',
                        'Elixir.HomestayWeb.HomeLive.Show',
                        'Elixir.HomestayWeb.HomeownerLive.FormComponent',
                        'Elixir.HomestayWeb.HomeownerLive.Index',
                        'Elixir.HomestayWeb.HomeownerLive.Show',
                        'Elixir.HomestayWeb.Layouts',
                        'Elixir.HomestayWeb.Layouts.App',
                        'Elixir.HomestayWeb.NumbersLive',
                        'Elixir.HomestayWeb.PageController',
                        'Elixir.HomestayWeb.PageHTML',
                        'Elixir.HomestayWeb.PageLive',
                        'Elixir.HomestayWeb.PrivasiLive',
                        'Elixir.HomestayWeb.Router',
                        'Elixir.HomestayWeb.SyaratLive',
                        'Elixir.HomestayWeb.Telemetry',
                        'Elixir.HomestayWeb.UserAuth',
                        'Elixir.HomestayWeb.UserComponent',
                        'Elixir.HomestayWeb.UserConfirmationInstructionsLive',
                        'Elixir.HomestayWeb.UserConfirmationLive',
                        'Elixir.HomestayWeb.UserForgotPasswordLive',
                        'Elixir.HomestayWeb.UserLive.FormComponent',
                        'Elixir.HomestayWeb.UserLive.HomeFormComponent',
                        'Elixir.HomestayWeb.UserLive.Index',
                        'Elixir.HomestayWeb.UserLive.Profile',
                        'Elixir.HomestayWeb.UserLoginLive',
                        'Elixir.HomestayWeb.UserRegistrationLive',
                        'Elixir.HomestayWeb.UserResetPasswordLive',
                        'Elixir.HomestayWeb.UserSessionController',
                        'Elixir.HomestayWeb.UserSettingsLive',
                        'Elixir.Inspect.Homestay.Accounts.User']},
              {registered,[]},
              {vsn,"0.1.0"},
              {mod,{'Elixir.Homestay.Application',[]}}]}.