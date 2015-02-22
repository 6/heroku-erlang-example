%% @author author <author@example.com>
%% @copyright YYYY author.

%% @doc heroku_erlang_example startup code

-module(heroku_erlang_example).
-author('author <author@example.com>').
-export([start/0, start_link/0, stop/0]).

%% @spec start_link() -> {ok,Pid::pid()}
%% @doc Starts the app for inclusion in a supervisor tree
start_link() ->
    application:set_env(webmachine, webmachine_logger_module, 
                        webmachine_logger),
    application:ensure_all_started(webmachine),
    heroku_erlang_example_sup:start_link().

%% @spec start() -> ok
%% @doc Start the heroku_erlang_example server.
start() ->
    application:set_env(webmachine, webmachine_logger_module, 
                        webmachine_logger),
    application:ensure_all_started(webmachine),
    application:start(heroku_erlang_example).

%% @spec stop() -> ok
%% @doc Stop the heroku_erlang_example server.
stop() ->
    application:stop(heroku_erlang_example).
