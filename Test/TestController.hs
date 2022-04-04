module Test.TestController where

import Test.HUnit
    ( assertEqual, runTestTTAndExit, Counts, Test(TestList, TestCase) )
import Application.Helper.Controller
import Application.Domain.Calculation
import Data.Time

-- checkOutput :: Test
-- checkOutput =
--     TestCase $ assertEqual [] (1) (output 90 2)

-- output :: Int -> Int -> [CalculatedRoute]
-- output winddir windStr = map calculateRoutes allRouteData where
--     calculateRoutes routeData = do
--         let speedFactor = getBftTimeFactor windStr
--         let routeName = getRouteName routeData
--         let waytheretime = (*speedFactor) (calcWayThereTime winddir (getRoute routeData))
--         let waybacktime = (*speedFactor) (calcWayBackTime winddir (getRoute routeData))
--         let totaltime = (+waybacktime) waytheretime
--         let lunchtime = (+9.25) waytheretime
--         (routeName, convertToTime waytheretime, convertToTime waybacktime, convertToTime totaltime, convertToTime lunchtime)


-- checkSortedOutput :: Test
-- checkSortedOutput =
--     TestCase $ assertEqual [] (1) (output 90 2)

-- sortedOutput :: Int -> Int -> [CalculatedRoute]
-- sortedOutput winddir windStr = do
--     let unsorted = output winddir windStr
--     sortBy fn unsorted where
--         fn = (\(_, _, _, a, _) (_, _, _, b, _) -> compare (absDiff6_5Hours a) (absDiff6_5Hours b))

-- test data
-- end test data

main :: IO ()
main = runTestTTAndExit $ TestList [
    -- checkOutput,
    -- checkSortedOutput
    ]