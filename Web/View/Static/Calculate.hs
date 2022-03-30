module Web.View.Static.Calculate where
import Web.View.Prelude
import IHP.HSX.ToHtml

data CalculateView = CalculateView {wayThereValues :: [Float], wayBackValues :: [Float], calculatedRoutes :: [(Float, Float, Float, Float)]}

instance View CalculateView where
    html CalculateView {wayThereValues, wayBackValues, calculatedRoutes}= [hsx|
        <div>
            <p>
            Hi, these are your current time estimates in hours:
            [routeWoudsend, routeSloten, routeLangweer, routeJoure, routeSneek, routeHeeg]
            </p>
            <div>
                The time estimates for all routes to get to the destination: {wayThereValues}
            </div>
            <div>
                The time estimates for all routes to get back: {wayBackValues}
            </div>
            <div>
                {calculatedRoutes}
            </div>
        </div>
|]