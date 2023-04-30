module Pages.Episodes.CurriedFunction exposing (page)

import Components.Sidebar
import Html as H exposing (Html)
import Html.Attributes as A
import View exposing (View)


page : View msg
page =
  Components.Sidebar.view
    { page =
      { title = "Curried function - Until"
      , body =
        [ H.p [ A.class "breadcrumbs" ]
          [ H.span [] [ H.text "/" ]
          , H.span [] [ H.a
            [ A.href "/episodes"
            , A.class "disabled"
            , A.disabled True
            ] [ H.text "episodes" ]]
          , H.span [] [ H.text "/" ]
          , H.span [] [ H.text "curried-function" ]
          ]
        , H.div []
          [ H.h1 [] [ H.text "Curried function" ]
          , H.span [ A.class "number" ] [ H.text "#0" ]
          , H.span [ A.class "date" ] [ H.text "2023-05-01" ]
          ]
        , H.ul [ A.class "tags" ]
          [
            H.li [] [ H.span [ A.class "tag" ] [ H.text "Elm" ] ]
          , H.li [] [ H.span [ A.class "tag" ] [ H.text "REPL" ] ]
          ]
        , H.div []
          [
            H.div [ A.class "description" ]
              [
                H.p [] [ H.text "I've just started reading a book about Elm." ]
              , H.blockquote [ A.cite "https://pragprog.com/titles/jfelm/programming-elm/" ]
                  [ H.p []
                    [
                      H.text
                      "Create curried functions, partially apply arguments"
                    ]
                  ]
              , H.figcaption []
                [
                  H.text "—"
                , H.a [ A.href "https://pragprog.com/titles/jfelm/programming-elm/" ] [ H.cite [] [ H.text "Programming Elm" ] ]
                ]
              ]
          , H.div [ A.class "screencast" ] [
              H.h3 [] [ H.text "Screencast" ]
            , H.video [ A.class "video", A.controls True, A.width 770 ]
              [
                H.source [ A.src "/video/curried-function-20230501.ogv" ] []
              ]
            ]
          , H.div [ A.class "text" ]
            [ H.h3 [] [ H.text "Note" ]
            , H.pre []
              [
                H.code [ A.class "language-zsh" ] [
                  H.text """% elm repl
...
> sayHello greeting name = greeting ++ ", " ++ name ++ "!"
<function> : String -> String -> String
> sayHello "Hello" "Yasha"
"Hello, Yasha!" : String
> hoi = sayHello "Hoi"
<function> : String -> String
> hoi "Yasha"
"Hoi, Yasha!" : String
"""
                ]
              ]
            ]
          ]
        ]
      }
    }
