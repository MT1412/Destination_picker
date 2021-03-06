module Application.Domain.Data where

import IHP.ControllerPrelude

type RouteData = (String, Route)
type Route = [Section]
type Section = (String, Float, Int)

allRouteData :: [RouteData]
allRouteData = [woudsend, sloten, langweer, joure, sneek, heeg]

woudsend :: RouteData
woudsend = ("Woudsend", routeWoudsend)
sloten :: RouteData
sloten = ("Sloten", routeSloten)
langweer :: RouteData
langweer = ("Langweer", routeLangweer)
joure :: RouteData
joure = ("Joure", routeJoure)
sneek :: RouteData
sneek = ("Sneek", routeSneek)
heeg :: RouteData
heeg = ("Heeg", routeHeeg)

routeWoudsend :: Route
routeWoudsend = [ih1, kv1, we1, we2, wo1]
routeSloten :: Route
routeSloten = [ih1, kv1, we1, we2, wo2, ie1, ie2, sl1, sl2, sl3]
routeLangweer :: Route
routeLangweer = [ih1, kv2, kv3, ja1, ja2, ja3, lw1, lw2, lw3]
routeJoure :: Route
routeJoure = [ih1, kv2, kv3, ja1, ja2, ja3, lw4, lw5, no1, jo1, jo2, jo3]
routeSneek :: Route
routeSneek = [ih1, kv2, kv3, ja1, ja2, ja3, lw6, lv1, lv2, wb1, wv1, wv2, wv3, wv4, wv5, wv6, wv7]
routeHeeg :: Route
routeHeeg = [ih1, kv2, pm1, je1, je2, je3, je4, he1, he2, he3]

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

wo2 :: Section
wo2 = ("woudsend", 0.320, 193)
ie1 :: Section
ie1 = ("ie", 0.820, 177)
ie2 :: Section
ie2 = ("ie-slotermeer", 0.310, 160)
sl1 :: Section
sl1 = ("slotermeer", 3.100, 171)
sl2 :: Section
sl2 = ("sloten", 0.590, 152)
sl3 :: Section
sl3 = ("sloten", 0.180, 167)

kv2 :: Section
kv2 = ("koevordermeerZ-N", 3.150, 002)
kv3 :: Section
kv3 = ("koevorder-Janesloot", 0.750, 053)
ja1 :: Section
ja1 = ("janeslootWest", 0.640, 090)
ja2 :: Section
ja2 = ("janeslootEast", 0.240, 105)
ja3 :: Section
ja3 = ("janesloot-wielen", 0.150, 050)
lw1 :: Section
lw1 = ("langweerderwielen1", 1.000, 121)
lw2 :: Section
lw2 = ("langweerderwielen2", 0.270, 215)
lw3 :: Section
lw3 = ("langweer", 0.150, 265)

lw4 :: Section
lw4 = ("langweerderwielen4", 2.070, 087)
lw5 :: Section
lw5 = ("langweerderwielenToBridge", 1.090, 045)
no1 :: Section
no1 = ("noorderOudeWegToJoustersluis", 0.760, 048)
jo1 :: Section
jo1 = ("joustersluis", 0.240, 082)
jo2 :: Section
jo2 = ("zijlroede", 1.140, 106)
jo3 :: Section
jo3 = ("joure", 0.510, 142)

lw6 :: Section
lw6 = ("langweerderwielen", 0.520, 040)
lv1 :: Section
lv1 = ("langweerdervaart", 0.300, 300)
lv2 :: Section
lv2 = ("langweerdervaart", 3.020, 320)
wb1 :: Section
wb1 = ("witteBrekken", 2.230, 344)
wv1 :: Section
wv1 = ("woudvaart", 0.300, 000)
wv2 :: Section
wv2 = ("woudvaart", 0.260, 333)
wv3 :: Section
wv3 = ("woudvaart", 0.150, 292)
wv4 :: Section
wv4 = ("woudvaartToBridge", 0.430, 344)
wv5 :: Section
wv5 = ("woudvaart", 0.350, 324)
wv6 :: Section
wv6 = ("woudvaart", 0.290, 335)
wv7 :: Section
wv7 = ("woudvaart", 0.220, 306)

pm1 :: Section
pm1 = ("prinsesMargriet", 0.480, 359)
je1 :: Section
je1 = ("jeltesloot", 0.870, 272)
je2 :: Section
je2 = ("jeltesloot", 2.430, 264)
je3 :: Section
je3 = ("jeltesloot", 0.760, 286)
je4 :: Section
je4 = ("jeltesloot", 1.400, 255)
he1 :: Section
he1 = ("heegermeer-heeg", 0.180, 330)
he2 :: Section
he2 = ("heeg", 0.150, 300)
he3 :: Section
he3 = ("heeg", 0.080, 343)