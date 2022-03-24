module Application.Domain.CourseCalc where

import Application.Domain.Constants

-- getdifference heading winddirection = if heading > winddirection 
--         then heading - winddirection 
--         else winddirection - heading

-- getcourse heading winddirection = if (getdifference heading winddirection) > 180
--         then 360 - (getdifference heading winddirection)
--         else (getdifference heading winddirection)

-- getspeedfactor course = if course < beat_closehauledAngle
--     then courseSpeedFactorBeat
--     else if course > closehauled_normalAngle
--         then courseSpeedFactorNormal
--         else courseSpeedFactorClosehauled