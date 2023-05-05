module API.Episodes exposing
  ( getRecent
  , Episodes
  , Episode
  )

import Http
import Json.Decode as Decode


getRecent :
  { onResponse : Result Http.Error Episodes -> msg
  }
  -> Cmd msg
getRecent options =
  Http.get
    { url = "/data/episodes.json"
    , expect = Http.expectJson options.onResponse decoder
    }

type alias Episodes =
  { count : Int
  , next : Maybe String
  , previous : Maybe String
  , results : List Episode
  }

decoder : Decode.Decoder Episodes
decoder =
  Decode.map4
    Episodes
    (Decode.field "count" Decode.int)
    (Decode.maybe (Decode.field "next" Decode.string))
    (Decode.maybe (Decode.field "previous" Decode.string))
    (Decode.field "results" (Decode.list episodeDecoder))

{-| Episode is a subset of full version from API.Episode. -}
type alias Episode =
  {
    number: Int
  , slug: String
  , title: String
  , created_at: String
  }

episodeDecoder : Decode.Decoder Episode
episodeDecoder =
  Decode.map4
    Episode
    (Decode.field "number" Decode.int)
    (Decode.field "slug" Decode.string)
    (Decode.field "title" Decode.string)
    (Decode.field "created_at" Decode.string)
