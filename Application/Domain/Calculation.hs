module Application.Domain.Calculation where

import IHP.ControllerPrelude
import Application.Domain.Data
import Data.Time

getRouteName :: RouteData -> String
getRouteName (routeName, _) = routeName
getRoute :: RouteData -> Route
getRoute (_, route) = route

getDistanceKM :: Section -> Float
getDistanceKM (_, distanceKM, _) = distanceKM
getHeading :: Section -> Int
getHeading (_, _, heading) = heading

absdifference :: Int -> Int -> Int
absdifference winddir heading = abs ((subtract heading) winddir)

getcourse :: Int -> Int
getcourse absdifference = if absdifference > 180 then (subtract absdifference) 360 else absdifference

matchspeed :: Int -> Float -- output speed in km/h
matchspeed course = if (course >= 60) then 5.0 else
    if (course < 60 && course >= 50) then 4.6 else
    if (course < 50 && course >= 40) then 4.0 else
    if (course < 40 && course >= 30) then 3.3 
    else 2.5

getSpeed :: Int -> Int -> Float
getSpeed winddir heading = matchspeed (getcourse (absdifference winddir heading))

calcSectionTime :: Int -> Section -> Float
calcSectionTime winddirection section = (/getSpeed winddirection (getHeading section)) (getDistanceKM section)

routeTimes :: Route -> Int -> [Float]
routeTimes route winddir = map callSectionTime route where
        callSectionTime section = calcSectionTime winddir section

sumRouteTime :: [Float] -> Float
sumRouteTime routeTimes = sum routeTimes

calcWayThereTime :: Int -> Route -> Float
calcWayThereTime winddir route = sumRouteTime (routeTimes route winddir)

calcWayBackTime :: Int -> Route -> Float
calcWayBackTime winddir route = if winddir > 180 
    then calcWayThereTime ((subtract 180) winddir) route 
    else calcWayThereTime ((+180) winddir) route

getBftTimeFactor :: Int -> Float
getBftTimeFactor windStr = case windStr of 
    1 -> 2.50
    2 -> 1.52
    3 -> 1.00
    4 -> 0.86
    5 -> 0.81
    6 -> 0.79
    _ -> 1.00

floatToDiff :: Float -> DiffTime
floatToDiff float = secondsToDiffTime (round (float * 3600))

convertToTime :: Float -> TimeOfDay
convertToTime float = timeToTimeOfDay (floatToDiff float)

absDiff6_5Hours :: TimeOfDay -> DiffTime
absDiff6_5Hours time= abs ((subtract 23400) (timeOfDayToTime time))