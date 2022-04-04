module Test.TestController where

import Test.HUnit
    ( assertEqual, runTestTTAndExit, Counts, Test(TestList, TestCase) )
import Application.Helper.Controller
import Data.Time

checkWinddirMinHeadingPositive :: Test
checkWinddirMinHeadingPositive =
  TestCase $ assertEqual [] 20 (winddirMinHeading 310 290)
checkWinddirMinHeadingNegative :: Test
checkWinddirMinHeadingNegative =
  TestCase $ assertEqual [] (-20) (winddirMinHeading 290 310)

checkabsdifferencePositive :: Test
checkabsdifferencePositive =
    TestCase $ assertEqual [] 60 (absdifference 60)
checkabsdifferenceNegative :: Test
checkabsdifferenceNegative =
    TestCase $ assertEqual [] 60 (absdifference (-60))

checkGetCourseSub180 :: Test
checkGetCourseSub180 =
    TestCase $ assertEqual [] 165 (getcourse 165)
checkGetCourseOver180 :: Test
checkGetCourseOver180 =
    TestCase $ assertEqual [] 135 (getcourse 225)

checkMatchSpeedSub30TWA :: Test
checkMatchSpeedSub30TWA =
    TestCase $ assertEqual [] 2.5 (matchspeed 18)
checkMatchSpeed30_40TWA :: Test
checkMatchSpeed30_40TWA =
    TestCase $ assertEqual [] 3.3 (matchspeed 32)
checkMatchSpeed40_50TWA :: Test
checkMatchSpeed40_50TWA =
    TestCase $ assertEqual [] 4.0 (matchspeed 46)
checkMatchSpeed50_60TWA :: Test
checkMatchSpeed50_60TWA =
    TestCase $ assertEqual [] 4.6 (matchspeed 54)
checkMatchSpeedOver60TWA :: Test
checkMatchSpeedOver60TWA =
    TestCase $ assertEqual [] 5.0 (matchspeed 130)

checkGetSpeedSub30TWA :: Test
checkGetSpeedSub30TWA =
    TestCase $ assertEqual [] 2.5 (getSpeed 90 95)
checkGetSpeed30_40TWA :: Test
checkGetSpeed30_40TWA =
    TestCase $ assertEqual [] 3.3 (getSpeed 90 125)
checkGetSpeedOver60TWA :: Test
checkGetSpeedOver60TWA =
    TestCase $ assertEqual [] 5.0 (getSpeed 90 270)


checkGetDistanceKM :: Test
checkGetDistanceKM =
    TestCase $ assertEqual [] 2.000 (getDistanceKM testSection2)

checkGetHeading :: Test
checkGetHeading =
    TestCase $ assertEqual [] 342 (getHeading testSection1)

checkCalcSectionTimeDownwind :: Test
checkCalcSectionTimeDownwind =
    TestCase $ assertEqual [] 0.20 (calcSectionTime 164 testSection1)
checkCalcSectionTimeUpwind :: Test
checkCalcSectionTimeUpwind =
    TestCase $ assertEqual [] 0.40 (calcSectionTime 0 testSection1)

checkRouteTimes :: Test
checkRouteTimes =
    TestCase $ assertEqual [] [0.20, 0.40] (routeTimes testRoute 80)

checkSumRouteTimes :: Test
checkSumRouteTimes =
    TestCase $ assertEqual [] 0.6 (sumRouteTime [0.2, 0.4])

checkCalcWayThereTime :: Test
checkCalcWayThereTime =
    TestCase $ assertEqual [] 0.6 (calcWayThereTime 65 testRoute)

checkCalcWayBackTime :: Test
checkCalcWayBackTime =
    TestCase $ assertEqual [] 1.0 (calcWayBackTime 65 testRoute)

checkGetBftTimeFactor1 :: Test
checkGetBftTimeFactor1 =
    TestCase $ assertEqual [] 2.5 (getBftTimeFactor 1)
checkGetBftTimeFactor2 :: Test
checkGetBftTimeFactor2 =
    TestCase $ assertEqual [] 1.52 (getBftTimeFactor 2)
checkGetBftTimeFactor3 :: Test
checkGetBftTimeFactor3 =
    TestCase $ assertEqual [] 1.00 (getBftTimeFactor 3)
checkGetBftTimeFactor4 :: Test
checkGetBftTimeFactor4 =
    TestCase $ assertEqual [] 0.86 (getBftTimeFactor 4)
checkGetBftTimeFactor5 :: Test
checkGetBftTimeFactor5 =
    TestCase $ assertEqual [] 0.81 (getBftTimeFactor 5)
checkGetBftTimeFactor6 :: Test
checkGetBftTimeFactor6 =
    TestCase $ assertEqual [] 0.79 (getBftTimeFactor 6)
checkGetBftTimeFactorOther :: Test
checkGetBftTimeFactorOther =
    TestCase $ assertEqual [] 1.00 (getBftTimeFactor 20)

checkFloatToDiff :: Test
checkFloatToDiff =
    TestCase $ assertEqual [] 5400 (floatToDiff 1.5)

checkConvertToTime :: Test
checkConvertToTime =
    TestCase $ assertEqual [] 5400 (timeOfDayToTime (convertToTime 1.5)) -- somehow time will not work

checkGetRouteName :: Test
checkGetRouteName =
    TestCase $ assertEqual [] "testRouteName" (getRouteName testRouteData)

checkGetRoute :: Test
checkGetRoute =
    TestCase $ assertEqual [] testRoute (getRoute testRouteData)

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

checkAbsDiff6_5Hours7Hours :: Test
checkAbsDiff6_5Hours7Hours =
    TestCase $ assertEqual [] 1800 (absDiff6_5Hours (timeToTimeOfDay 25200))
checkAbsDiff6_5Hours5Hours :: Test
checkAbsDiff6_5Hours5Hours =
    TestCase $ assertEqual [] 5400 (absDiff6_5Hours (timeToTimeOfDay 18000))

-- checkSortedOutput :: Test
-- checkSortedOutput =
--     TestCase $ assertEqual [] (1) (output 90 2)

-- sortedOutput :: Int -> Int -> [CalculatedRoute]
-- sortedOutput winddir windStr = do
--     let unsorted = output winddir windStr
--     sortBy fn unsorted where
--         fn = (\(_, _, _, a, _) (_, _, _, b, _) -> compare (absDiff6_5Hours a) (absDiff6_5Hours b))

-- test data
testSection1 :: Section
testSection1 = ("firstSection", 1.000, 342)
testSection2 :: Section
testSection2 = ("secondSection", 2.000, 220)
testRoute :: Route
testRoute = [testSection1, testSection2]
testRouteData :: RouteData
testRouteData = ("testRouteName", testRoute)
-- end test data

main :: IO ()
main = runTestTTAndExit $ TestList [
    checkWinddirMinHeadingPositive,
    checkWinddirMinHeadingNegative,
    checkabsdifferencePositive,
    checkabsdifferenceNegative,
    checkGetCourseSub180,
    checkGetCourseOver180,
    checkMatchSpeedSub30TWA,
    checkMatchSpeed30_40TWA,
    checkMatchSpeed40_50TWA,
    checkMatchSpeed50_60TWA,
    checkMatchSpeedOver60TWA,
    checkGetSpeedSub30TWA,
    checkGetSpeed30_40TWA,
    checkGetSpeedOver60TWA,
    checkGetDistanceKM,
    checkGetHeading,
    checkCalcSectionTimeDownwind,
    checkCalcSectionTimeUpwind,
    checkRouteTimes,
    checkSumRouteTimes,
    checkCalcWayThereTime,
    checkCalcWayBackTime,
    checkGetBftTimeFactor1,
    checkGetBftTimeFactor2,
    checkGetBftTimeFactor3,
    checkGetBftTimeFactor4,
    checkGetBftTimeFactor5,
    checkGetBftTimeFactor6,
    checkGetBftTimeFactorOther,
    checkFloatToDiff,
    checkConvertToTime,
    checkGetRouteName,
    checkGetRoute,
    -- checkOutput,
    checkAbsDiff6_5Hours7Hours,
    checkAbsDiff6_5Hours5Hours
    -- checkSortedOutput
    ]