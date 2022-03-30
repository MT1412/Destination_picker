module Web.View.Static.Calculate where
import Web.View.Prelude
import IHP.HSX.ToHtml

data CalculateView = CalculateView {calculatedRoutes :: [(String, Float, Float, Float, Float)]}

instance View CalculateView where
    html CalculateView {calculatedRoutes}= [hsx|
        <div>
            <p>
            Hi, these are your current time estimates in hours:
            [routeWoudsend, routeSloten, routeLangweer, routeJoure, routeSneek, routeHeeg]
            </p>
            <div>
                {calculatedRoutes}
            </div>
        </div>
|]