module Web.View.Static.Calculate where
import Web.View.Prelude

data CalculateView = CalculateView {value :: Float}

instance View CalculateView where
    html CalculateView {value}= [hsx|
        <div>
            <p>
            Hi there, this is your current time estimate in hours:
            </p>
            <div>
                {value}
            </div>
        </div>
|]