module Web.FrontController where

import IHP.RouterPrelude
import Web.Controller.Prelude (WebApplication, InitControllerContext, initContext, StaticController (WelcomeAction, CalculateAction), setLayout, initAutoRefresh)
import Web.View.Layout (defaultLayout)

-- Controller Imports
import Web.Controller.Static

instance FrontController WebApplication where
    controllers = 
        [ startPage WelcomeAction,
        -- Generator Marker
        get "/CalculateAction" CalculateAction
        ]

instance InitControllerContext WebApplication where
    initContext = do
        setLayout defaultLayout
        initAutoRefresh