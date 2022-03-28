module Application.Helper.Controller where

import IHP.ControllerPrelude
-- Here you can add functions which are available in all your controllers

type Route = [Section]
type Section = (String, Float, Int)
getDistanceKM :: Section -> Float
getDistanceKM (_, distanceKM, _) = distanceKM
getHeading :: Section -> Int
getHeading (_, _, heading) = heading

ih1 :: Section
ih1 = ("Idskenhuister", 0.920, 290)
kv1 :: Section
kv1 = ("KoevorderToWelle", 1.000, 323)
we1 :: Section
we1 = ("WelleEast", 2.000, 276)
we2 :: Section
we2 = ("WelleWest", 1.250, 276)
wo1 :: Section
wo1 = ("Woudsend", 0.130, 195)

routeWoudsend :: Route
routeWoudsend = [ih1, kv1, we1, we2, wo1]

routeDummy :: Route
routeDummy = [ih1, kv1]

allRoutes :: [Route]
allRoutes = [routeWoudsend, routeDummy]

winddirMinHeading :: Int -> Int -> Int
winddirMinHeading winddir heading = (subtract heading) winddir

absdifference :: Int -> Int
absdifference winddirMinHeading = 
    if (winddirMinHeading > 0) then winddirMinHeading else -winddirMinHeading

getcourse :: Int -> Int
getcourse absdifference = if absdifference > 180 then (subtract absdifference) 360 else absdifference

-- maybe replace numbers by global constants or multiply by base speed in function ??
matchspeed :: Int -> Float
matchspeed course =
    if course < 30 then 3.2 --0.5
    else if course > 50 
        then 6.0 --1.0
        else 5.0 --0.8

getSpeed :: Int -> Int -> Float
getSpeed winddir heading = do
    let difference = winddirMinHeading winddir heading
    let absdiff = absdifference difference
    let course = getcourse absdiff
    matchspeed course

calcSectionTime :: Int -> Section -> Float
calcSectionTime winddirection section = do
    let heading = getHeading section
    let speed = getSpeed winddirection heading
    let distance = getDistanceKM section
    let time = (/speed) distance
    time

routeTimes :: Route -> Int -> [Float]
routeTimes route winddir = map callSectionTime route where
        callSectionTime section = calcSectionTime winddir section

sumRouteTime :: [Float] -> Float
sumRouteTime routeTimes = sum routeTimes

output :: Int -> [Float]
output winddir= map timeEstimate allRoutes where
    timeEstimate route = sumRouteTime (routeTimes route winddir)

reverseOutput :: Int -> [Float]
reverseOutput winddir = if winddir > 180 then output ((subtract 180) winddir) else output ((+180) winddir)

-- reverse output --> run output again with opposite winddirection

-- woudsendTime winddir = sumRouteTime (routeTimes routeWoudsend winddir)
-- dummyTime winddir = sumRouteTime (routeTimes routeDummy winddir)