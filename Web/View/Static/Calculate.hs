module Web.View.Static.Calculate where
import Web.View.Prelude
import IHP.HSX.ToHtml

type RouteInfo = (String, Float, Float, Float, Float)
getRouteName :: RouteInfo -> String
getRouteName (routeName, _, _, _, _) = routeName
getWayThereTime :: RouteInfo -> Float
getWayThereTime (_, wayThereTime, _, _, _) = wayThereTime
getWayBackTime :: RouteInfo -> Float
getWayBackTime (_, _, wayBackTime, _, _) = wayBackTime
getTotalSailTime :: RouteInfo -> Float
getTotalSailTime (_, _, _, totalSailTime, _) = totalSailTime
getLunchTime :: RouteInfo -> Float
getLunchTime (_, _, _, _, lunchTime) = lunchTime

getSrc :: RouteInfo -> String
getSrc route = "/routeImages/" ++ (getRouteName route) ++ ".png"

data CalculateView = CalculateView {calculatedRoutes :: [(String, Float, Float, Float, Float)]}

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
                <p>The way there will take {getWayThereTime route} hours. </p>
                <p>You will arrive there around {getLunchTime route}. </p>
                <p>The way back will take {getWayBackTime route} hours. </p>
                <p>The total sail time will be around {getTotalSailTime route} hours. </p>
            </div>
            <img class="routeimage" src={getSrc route}>
        </div>   
    </div>
|]