module Application.Helper.Controller where

import IHP.ControllerPrelude
-- Here you can add functions which are available in all your controllers

heading :: Int = 270
winddirMinHeading winddir heading = (subtract heading) winddir

absdifference winddirMinHeading = 
    if (winddirMinHeading > 0) then winddirMinHeading else -winddirMinHeading

getcourse absdifference = if absdifference > 180 then (subtract absdifference) 360 else absdifference

-- maybe replace numbers by global constants
matchspeedfactor course =
    if course < 30 then 0.5
    else if course > 50 
        then 1.0
        else 0.8

output winddir = do
    let difference :: Int = winddirMinHeading winddir heading
    let absdiff :: Int = absdifference difference
    let course :: Int = getcourse absdiff
    matchspeedfactor course