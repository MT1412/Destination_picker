module Web.View.Static.Calculate where
import Web.View.Prelude

data CalculateView = CalculateView {woudsend :: Float, dummy :: Float}

instance View CalculateView where
    html CalculateView {woudsend, dummy}= [hsx|
        <div>
            <p>
            Hi there, this is your current time estimates in hours:
            </p>
            <div>
                Woudsend: {woudsend}
            </div>
            <div>
                dummy: {dummy}
            </div>
        </div>
|]