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

-- route reverse??

winddirMinHeading winddir heading = (subtract heading) winddir

absdifference winddirMinHeading = 
    if (winddirMinHeading > 0) then winddirMinHeading else -winddirMinHeading

getcourse absdifference = if absdifference > 180 then (subtract absdifference) 360 else absdifference

-- maybe replace numbers by global constants or multiply by base speed in function ??
matchspeed course = -- speed currently
    if course < 30 then 3.2 --0.5
    else if course > 50 
        then 6.0 --1.0
        else 5.0 --0.8

getSpeed winddir heading = do
    let difference :: Int = winddirMinHeading winddir heading
    let absdiff :: Int = absdifference difference
    let course :: Int = getcourse absdiff
    matchspeed course

calcSectionTime :: Int -> Section -> Float
calcSectionTime winddirection section = do
    let heading :: Int = getHeading section
    let speed :: Float = getSpeed winddirection heading
    let distance :: Float = getDistanceKM section
    let time :: Float = (/speed) distance
    time

-- routeTimes :: [Section] -> [Float]
routeTimes route winddir = map callSectionTime route where
        callSectionTime section = calcSectionTime winddir section

-- sumRouteTime :: [Float] -> Float
sumRouteTime routeTimes = sum routeTimes

output winddir = sumRouteTime (routeTimes routeWoudsend winddir)