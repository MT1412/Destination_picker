module Web.Controller.Static where
    
import Web.Controller.Prelude
import Web.View.Static.Welcome
import Web.View.Static.Calculate
import Application.Helper.Controller

instance Controller StaticController where
    action WelcomeAction = render WelcomeView

    action CalculateAction = do
        let windDirection :: Int = param "winddirection"
        let windStrength :: Int = param "windstrength"
        let calculatedRoutes :: [CalculatedRoute] = output windDirection windStrength
        render CalculateView {calculatedRoutes}