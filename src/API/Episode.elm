module API.Episode exposing (get, Episode)

import Http
import Json.Decode as Decode


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
  {
    number: Int
  , slug: String
  , title: String
  , description: String
  , note: String
  , tags: List String
  , created_at: String
  }

decoder : Decode.Decoder Episode
decoder =
  Decode.map7
    Episode
    (Decode.field "number" Decode.int)
    (Decode.field "slug" Decode.string)
    (Decode.field "title" Decode.string)
    (Decode.field "description" Decode.string)
    (Decode.field "note" Decode.string)
    (Decode.field "tags" (Decode.list Decode.string))
    (Decode.field "created_at" Decode.string)
