module Application.Helper.Controller where

import IHP.ControllerPrelude
import Application.Domain.CourseCalc
-- Here you can add functions which are available in all your controllers

heading :: Int = 270
winddirMinHeading winddir heading = (subtract heading) winddir

absdifference winddirMinHeading = 
    if (winddirMinHeading > 0) then winddirMinHeading else -winddirMinHeading

getcourse absdifference = if absdifference > 180 then (subtract absdifference) 360 else absdifference

matchspeedfactor course =
    if course < 30 then 5 --0.5
    else if course > 50 
        then 10 --1.0 
        else 8 --0.8

-- output winddir = matchspeedfactor (getcourse winddir)
output winddir = do
    let x :: Int = winddirMinHeading winddir heading
    let y :: Int = absdifference x
    let z :: Int = getcourse y
    matchspeedfactor z