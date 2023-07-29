module API.Episode exposing (get, Episode)

import Http
import Json.Decode exposing (Decoder, int, list, succeed, string)
import Json.Decode.Pipeline exposing (required)

get :
  { slug : String
  , onResponse : Result Http.Error Episode -> msg
  } -> Cmd msg
get options =
  Http.get
    { url = "/data/episodes/" ++ options.slug ++ ".json"
    , expect = Http.expectJson options.onResponse decoder
    }

{-| Episode is an object contains full detailed fields about the screencast
entry.
-}
type alias Episode =
  { number: Int
  , slug: String
  , title: String
  , description: String
  , note: String
  , tags: List String
  , created_at: String
  }

decoder : Decoder Episode
decoder =
  succeed Episode
    |> required "number" int
    |> required "slug" string
    |> required "title" string
    |> required "description" string
    |> required "note" string
    |> required "tags" (list string)
    |> required "created_at" string
