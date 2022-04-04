module Application.Helper.Controller where

import Application.Domain.Calculation
import Application.Domain.Data
import IHP.ControllerPrelude
import Data.Time
-- Here you can add functions which are available in all your controllers

type CalculatedRoute = (String, TimeOfDay, TimeOfDay, TimeOfDay, TimeOfDay)

output :: Int -> Int -> [CalculatedRoute]
output winddir windStr = map calculateRoutes allRouteData where
    calculateRoutes routeData = do
        let speedFactor = getBftTimeFactor windStr
        let routeName = getRouteName routeData
        let waytheretime = (*speedFactor) (calcWayThereTime winddir (getRoute routeData))
        let waybacktime = (*speedFactor) (calcWayBackTime winddir (getRoute routeData))
        let totaltime = (+waybacktime) waytheretime
        let lunchtime = (+9.25) waytheretime
        (routeName, convertToTime waytheretime, convertToTime waybacktime, convertToTime totaltime, convertToTime lunchtime)

sortedOutput :: Int -> Int -> [CalculatedRoute]
sortedOutput winddir windStr = do
    let unsorted = output winddir windStr
    sortBy fn unsorted where
        fn = (\(_, _, _, a, _) (_, _, _, b, _) -> compare (absDiff6_5Hours a) (absDiff6_5Hours b))