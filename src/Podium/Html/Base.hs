{-# LANGUAGE OverloadedStrings #-}

module Podium.Html.Base where

import Podium.Html.NewPost

import Control.Monad
import Lucid

container :: Monad m => HtmlT m () -> HtmlT m ()
container body =
  body_ (div_ [class_ "container"]
         (do h1_ "Podium"
             div_ [class_ "posts"] body))

baseHtml :: Monad m => HtmlT m () -> HtmlT m ()
baseHtml body =
  doctypehtml_
    (do head_ (do meta_ [charset_ "utf-8"]
                  meta_ [name_ "viewport"
                        ,content_ "width=device-width, initial-scale=1"]
                  link_ [href_ "//fonts.googleapis.com/css?family=Open+Sans"
                        ,rel_ "stylesheet"
                        ,type_ "text/css"]
                  link_ [href_ "//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.1.0/css/bootstrap.min.css"
                        ,rel_ "stylesheet"
                        ,type_ "text/css"]
                  title_ "Podium")
        body_ (do newPost
                  container body))
