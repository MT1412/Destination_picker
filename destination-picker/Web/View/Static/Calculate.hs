module Web.View.Static.Calculate where
import Web.View.Prelude

data CalculateView = CalculateView {wayThereValues :: [Float], wayBackValues :: [Float]}

instance View CalculateView where
    html CalculateView {wayThereValues, wayBackValues}= [hsx|
        <div>
            <p>
            Hi there, these are your current time estimates in hours:
            [routeWoudsend, routeSloten, routeLangweer, routeJoure, routeSneek, routeHeeg]
            </p>
            <div>
                The time estimates for all routes to get to the destination: {wayThereValues}
            </div>
            <div>
                The time estimates for all routes to get back: {wayBackValues}
            </div>
        </div>
|]