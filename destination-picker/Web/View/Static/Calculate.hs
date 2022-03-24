module Web.View.Static.Calculate where
import Web.View.Prelude

data CalculateView = CalculateView {value :: Int}

instance View CalculateView where
    html CalculateView {value}= [hsx|
        <div>
            <p>
            Hi there, this is CalculateView
            </p>
            <div>
                {value}
            </div>
        </div>
|]