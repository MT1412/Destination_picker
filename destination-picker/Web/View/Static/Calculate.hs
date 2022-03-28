module Web.View.Static.Calculate where
import Web.View.Prelude

data CalculateView = CalculateView {wayThereValues :: [Float], wayBackValues :: [Float]}

instance View CalculateView where
    html CalculateView {wayThereValues, wayBackValues}= [hsx|
        <div>
            <p>
            Hi there, this is your current time estimates in hours:
            </p>
            <div>
                The time estimates for all routes to get to the destination [Woudsend, dummy route]: {wayThereValues}
            </div>
            <div>
                The time estimates for all routes to get back [Woudsend, dummy route]: {wayBackValues}
            </div>
        </div>
|]