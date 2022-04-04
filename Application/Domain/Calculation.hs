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
getcourse absdifference
    |(absdifference > 180) = (subtract absdifference) 360
    |otherwise = absdifference

matchspeed :: Int -> Float -- output speed in km/h
matchspeed course 
    |(course < 30) = 2.5
    |(course < 40 && course >= 30) = 3.3 
    |(course < 50 && course >= 40) = 4.0
    |(course < 60 && course >= 50) = 4.6
    |otherwise = 5.0

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
calcWayBackTime winddir route
    |(winddir > 180) = calcWayThereTime ((subtract 180) winddir) route 
    |otherwise = calcWayThereTime ((+180) winddir) route

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