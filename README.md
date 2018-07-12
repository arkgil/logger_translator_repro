Repository to reproduce the error of `Logger.Translator` using `supervisor3`.

## Version matrix

| OTP | Elixir | reproducible  |
|-----|--------|---------------|
| 19.3| 1.5.3  | no            |
| 20.3| 1.5.3  | no            |
| 19.3| 1.6.6  | yes           |
| 20.3| 1.6.6  | yes           |

## Run

```
mix deps.get
iex -S mix
```

and see the errors in the console.

## Output

Look for the error like the one below:

```
15:35:56.711 [error] :gen_event handler Logger.ErrorHandler installed at :error_logger
** (exit) an exception was raised:
    ** (FunctionClauseError) no function clause matching in Logger.Translator.child_info/2
        (logger) lib/logger/translator.ex:320: Logger.Translator.child_info(:debug, [name: LoggerTranslatorRepro.Server, mfargs: {Agent, :start_link, [#Function<0.78284505/0 in LoggerTranslatorRepro.init/1>, [name: LoggerTranslatorRepro.Server]]}, restart_type: :permanent, shutdown: 5000, child_type: :worker])
        (logger) lib/logger/translator.ex:240: Logger.Translator.report_supervisor_progress/2
        (logger) lib/logger/erlang_handler.ex:104: Logger.ErlangHandler.translate/6
        (logger) lib/logger/erlang_handler.ex:97: Logger.ErlangHandler.translate/5
        (logger) lib/logger/error_handler.ex:93: Logger.ErrorHandler.log_event/6
        (logger) lib/logger/error_handler.ex:33: Logger.ErrorHandler.handle_event/2
        (stdlib) gen_event.erl:574: :gen_event.server_update/4
        (stdlib) gen_event.erl:556: :gen_event.server_notify/4
```
