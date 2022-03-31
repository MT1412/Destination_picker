module Web.View.Static.Calculate where
import Web.View.Prelude
import IHP.HSX.ToHtml
import Data.Time

type RouteInfo = (String, TimeOfDay, TimeOfDay, TimeOfDay, TimeOfDay)
getRouteName :: RouteInfo -> String
getRouteName (routeName, _, _, _, _) = routeName
getWayThereTime :: RouteInfo -> TimeOfDay
getWayThereTime (_, wayThereTime, _, _, _) = wayThereTime
getWayBackTime :: RouteInfo -> TimeOfDay
getWayBackTime (_, _, wayBackTime, _, _) = wayBackTime
getTotalSailTime :: RouteInfo -> TimeOfDay
getTotalSailTime (_, _, _, totalSailTime, _) = totalSailTime
getLunchTime :: RouteInfo -> TimeOfDay
getLunchTime (_, _, _, _, lunchTime) = lunchTime

getSrc :: RouteInfo -> String
getSrc route = "/routeImages/" ++ (getRouteName route) ++ ".png"

data CalculateView = CalculateView {calculatedRoutes :: [(String, TimeOfDay, TimeOfDay, TimeOfDay, TimeOfDay)]}

instance View CalculateView where
    html CalculateView {calculatedRoutes}= [hsx|
        <div>
            <div>
                {forEach calculatedRoutes renderRoute}
            </div>
        </div>
|]

renderRoute :: RouteInfo -> Html
renderRoute route = [hsx|
    <div class="routeinfoblock">
        <h2 class="routetitle">{getRouteName route}</h2>
        <div class="routeinfocontent">
            <div class="routeinfotext">
                <p>The way there will take {formatTime defaultTimeLocale "%H:%M" (getWayThereTime route)} hours. </p>
                <p>You will arrive there around {formatTime defaultTimeLocale "%H:%M" (getLunchTime route)}. </p>
                <p>The way back will take {formatTime defaultTimeLocale "%H:%M" (getWayBackTime route)} hours. </p>
                <p>The total sail time will be around {formatTime defaultTimeLocale "%H:%M" (getTotalSailTime route)} hours. </p>
            </div>
            <img class="routeimage" src={getSrc route}>
        </div>   
    </div>
|]