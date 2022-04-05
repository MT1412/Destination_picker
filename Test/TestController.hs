module Test.TestController where

import Test.HUnit
    ( assertEqual, runTestTTAndExit, Counts, Test(TestList, TestCase) )
import Application.Helper.Controller
import Application.Domain.Calculation
import Data.Time

getTotalDiffTime :: CalculatedRoute -> DiffTime
getTotalDiffTime (_, _, _, totalTime, _) = timeOfDayToTime totalTime
getName :: CalculatedRoute -> String
getName (name, _, _, _, _) = name

reduceToNames :: [CalculatedRoute] -> [String]
reduceToNames sortedoutput = map getName sortedoutput

checkOutputWoudsend :: Test
checkOutputWoudsend =
    TestCase $ assertEqual [] 10697 (getTotalDiffTime (head (output 90 3)))
checkOutputLangweer :: Test
checkOutputLangweer =
    TestCase $ assertEqual [] 18171 (getTotalDiffTime ((output 90 3)!!1))


checkSortedOutputWest1 :: Test
checkSortedOutputWest1 =
    TestCase $ assertEqual [] ["Woudsend", "Langweer", "Sloten", "Heeg", "Joure", "Sneek"] (reduceToNames (sortedOutput 270 1))
checkSortedOutputNorthEast2 :: Test
checkSortedOutputNorthEast2 =
    TestCase $ assertEqual [] ["Sloten","Heeg","Langweer","Joure","Sneek","Woudsend"] (reduceToNames (sortedOutput 45 2))

main :: IO ()
main = runTestTTAndExit $ TestList [
    checkOutputWoudsend,
    checkOutputLangweer,
    checkSortedOutputWest1,
    checkSortedOutputNorthEast2
    ]