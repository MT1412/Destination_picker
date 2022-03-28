module Web.View.Static.Calculate where
import Web.View.Prelude

data CalculateView = CalculateView {values :: [Float]}

instance View CalculateView where
    html CalculateView {values}= [hsx|
        <div>
            <p>
            Hi there, this is your current time estimates in hours:
            </p>
            <div>
                {values}
            </div>
        </div>
|]