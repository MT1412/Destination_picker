module Test.TestController where

import Test.HUnit
    ( assertEqual, runTestTT, Counts, Test(TestList, TestCase) )
import Application.Helper.Controller

-- TODO add invalid input tests

speedfactorcheckupwind :: Test
speedfactorcheckupwind =
  TestCase $ assertEqual [] 0.5 (speedFactorSection 290)

speedfactorcheckclosehauled :: Test
speedfactorcheckclosehauled =
    TestCase $ assertEqual [] 0.8 (speedFactorSection 305)

speedfactorchecknormal :: Test
speedfactorchecknormal =
    TestCase $ assertEqual [] 1 (speedFactorSection 60)

main :: IO Counts
main = runTestTT $ TestList [speedfactorcheckupwind, speedfactorcheckclosehauled, speedfactorchecknormal]