module Test.TestController where

import Test.HUnit
    ( assertEqual, runTestTT, Counts, Test(TestList, TestCase) )
import Application.Helper.Controller

-- TODO add invalid input tests
checkdifference :: Test
checkdifference =
  TestCase $ assertEqual [] 20 (winddirMinHeading 310 290)

checkabsdifferencePositive :: Test
checkabsdifferencePositive =
    TestCase $ assertEqual [] 60 (absdifference 60)

checkabsdifferenceNegative :: Test
checkabsdifferenceNegative =
    TestCase $ assertEqual [] 60 (absdifference (-60))

checkCourseSub180 :: Test
checkCourseSub180 =
    TestCase $ assertEqual [] 165 (getcourse 165)

checkCourseOver180 :: Test
checkCourseOver180 =
    TestCase $ assertEqual [] 135 (getcourse 225)

checkSpeedMatchBeat :: Test
checkSpeedMatchBeat =
    TestCase $ assertEqual [] 3.2 (matchspeed 25)

checkSpeedMatchUpwind :: Test
checkSpeedMatchUpwind =
    TestCase $ assertEqual [] 5.0 (matchspeed 40)

checkSpeedMatchNormal :: Test
checkSpeedMatchNormal =
    TestCase $ assertEqual [] 6.0 (matchspeed 130)

checkGetBeatSpeedFromInput :: Test
checkGetBeatSpeedFromInput =
    TestCase $ assertEqual [] 3.2 (getSpeed 90 95)

checkGetUpwindSpeedFromInput :: Test
checkGetUpwindSpeedFromInput =
    TestCase $ assertEqual [] 5.0 (getSpeed 90 125)

checkGetNormalSpeedFromInput :: Test
checkGetNormalSpeedFromInput =
    TestCase $ assertEqual [] 6.0 (getSpeed 90 270)

checkSectionTime :: Test
checkSectionTime =
    TestCase $ assertEqual [] 0.2 (calcSectionTime 60 testSection1)

checkRouteTimes :: Test
checkRouteTimes =
    TestCase $ assertEqual [] [0.2, 0.4] (routeTimes testRoute 80)

checkSumRouteTimes :: Test
checkSumRouteTimes =
    TestCase $ assertEqual [] 0.6 (sumRouteTime [0.2, 0.4]) -- Apparently this is 0.6000000000000001

-- checkOutput :: Test
-- checkOutput =
--     TestCase $ assertEqual [] 0.88333327 (output 65)

-- test data
testSection1 :: Section
testSection1 = ("firstSection", 1.200, 342)
testSection2 :: Section
testSection2 = ("secondSection", 2.400, 220)
testRoute :: Route
testRoute = [testSection1, testSection2]

main :: IO Counts
main = runTestTT $ TestList [
    checkdifference,
    checkabsdifferenceNegative,
    checkabsdifferencePositive,
    checkCourseOver180,
    checkCourseSub180,
    checkSpeedMatchBeat,
    checkSpeedMatchNormal,
    checkSpeedMatchUpwind,
    checkGetBeatSpeedFromInput,
    checkGetNormalSpeedFromInput,
    checkGetUpwindSpeedFromInput,
    checkSectionTime,
    checkRouteTimes,
    checkSumRouteTimes
    -- checkOutput
    ]