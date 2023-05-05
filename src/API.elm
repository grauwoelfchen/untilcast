module API exposing (Data(..), toMessage)

import Http

type Data value
  = Loading
  | Success value
  | Failure Http.Error

{-| Converts an error to string message.
See https://github.com/elm/http/blob/\
81b6fdc67d8e5fb25644fd79e6b0edbe2e14e474/src/Http.elm#L558-L563

  API.toMessage httpError -- "bad status: 400"
-}
toMessage : Http.Error -> String
toMessage httpError =
  case httpError of
    Http.BadUrl _ ->
      "bad url"
    Http.Timeout ->
      "timeout"
    Http.NetworkError ->
      "network error"
    Http.BadStatus code ->
      if code == 404 then
        "Not found"
      else
        "bad status: " ++ (String.fromInt code)
    Http.BadBody _ ->
      "bad body"
