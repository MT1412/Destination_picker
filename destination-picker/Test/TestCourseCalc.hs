module Test.TestCourseCalc where

import Test.HUnit
    ( assertEqual, runTestTT, Counts, Test(TestList, TestCase) )
import Application.Domain.CourseCalc

-- TODO add invalid input tests

differenceheadinghigh :: Test
differenceheadinghigh =
  TestCase $ assertEqual [] 10 (getdifference 275 265)

differencewinddirectionhigh :: Test
differencewinddirectionhigh = 
    TestCase $ assertEqual [] 10 (getdifference 255 265)

coursenormaldifference :: Test
coursenormaldifference =
  TestCase $ assertEqual [] 10 (getcourse 255 265)

courselargedifference :: Test
courselargedifference = 
    TestCase $ assertEqual [] 35 (getcourse 355 30)

speedfactorBeat :: Test
speedfactorBeat =
    TestCase $ assertEqual [] 0.5 (getspeedfactor 25)

speedfactorCloseHauled :: Test
speedfactorCloseHauled =
    TestCase $ assertEqual [] 0.8 (getspeedfactor 43)

speedfactorNormal :: Test
speedfactorNormal =
    TestCase $ assertEqual [] 1 (getspeedfactor 135)

main :: IO Counts
main = runTestTT $ TestList [differenceheadinghigh, differencewinddirectionhigh, coursenormaldifference, courselargedifference, speedfactorBeat, speedfactorCloseHauled, speedfactorNormal]