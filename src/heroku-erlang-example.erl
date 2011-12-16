%% @author author <author@example.com>
%% @copyright YYYY author.

%% @doc heroku-erlang-example startup code

-module(heroku-erlang-example).
-author('author <author@example.com>').
-export([start/0, start_link/0, stop/0]).

ensure_started(App) ->
    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.

%% @spec start_link() -> {ok,Pid::pid()}
%% @doc Starts the app for inclusion in a supervisor tree
start_link() ->
    ensure_started(inets),
    ensure_started(crypto),
    ensure_started(mochiweb),
    application:set_env(webmachine, webmachine_logger_module, 
                        webmachine_logger),
    ensure_started(webmachine),
    heroku-erlang-example_sup:start_link().

%% @spec start() -> ok
%% @doc Start the heroku-erlang-example server.
start() ->
    ensure_started(inets),
    ensure_started(crypto),
    ensure_started(mochiweb),
    application:set_env(webmachine, webmachine_logger_module, 
                        webmachine_logger),
    ensure_started(webmachine),
    application:start(heroku-erlang-example).

%% @spec stop() -> ok
%% @doc Stop the heroku-erlang-example server.
stop() ->
    Res = application:stop(heroku-erlang-example),
    application:stop(webmachine),
    application:stop(mochiweb),
    application:stop(crypto),
    application:stop(inets),
    Res.
