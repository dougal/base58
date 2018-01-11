require 'test/unit'
require 'base58'

class TestBase58 < Test::Unit::TestCase

EXAMPLES =  {
  :flickr => {
              "6hKMCS" => 3471391110,
              "6hDrmR" => 3470152229,
              "6hHHZB" => 3470988633,
              "6hHKum" => 3470993664,
              "6hLgFW" => 3471485480,
              "6hBRKR" => 3469844075,
              "6hGRTd" => 3470820062,
              "6hCuie" => 3469966999,
              "6hJuXN" => 3471139908,
              "6hJsyS" => 3471131850,
              "6hFWFb" => 3470641072,
              "6hENdZ" => 3470417529,
              "6hEJqg" => 3470404727,
              "6hGNaq" => 3470807546,
              "6hDRoZ" => 3470233089,
              "6hKkP9" => 3471304242,
              "6hHVZ3" => 3471028968,
              "6hNcfE" => 3471860782,
              "6hJBqs" => 3471161638,
              "6hCPyc" => 3470031783,
              "6hJNrC" => 3471198710,
              "6hKmkd" => 3471305986,
              "6hFUYs" => 3470635346,
              "6hK6UC" => 3471257464,
              "6hBmiv" => 3469744991,
              "6hKex1" => 3471283122,
              "6hFHQj" => 3470597870,
              "6hCA2n" => 3469986263,
              "6hBTgt" => 3469849157,
              "6hHEss" => 3470976734,
              "6hLows" => 3471508478,
              "6hD95z" => 3470094097,
              "6hKjcq" => 3471298806,
              "6hGEbd" => 3470780680,
              "6hKSNS" => 3471408510,
              "6hG8hv" => 3470676761,
              "6hEmj6" => 3470330361,
              "6hGjpn" => 3470714163,
              "6hEsUr" => 3470352537,
              "6hJEhy" => 3471171272,
              "6hKBHn" => 3471357731,
              "6hG3gi" => 3470659871,
              "6hFJTT" => 3470601441,
              "6hLZDs" => 3471626624,
              "6hGdL7" => 3470695182,
              "6hBpi4" => 3469755057,
              "6hEuFV" => 3470358539,
              "6hGVw1" => 3470832288,
              "6hLdm1" => 3471474232,
              "6hFcCK" => 3470496279,
              "6hDZmR" => 3470259877,
              "6hG8iX" => 3470676845,
              "6hFZZL" => 3470652242,
              "6hJ79u" => 3471063156,
              "6hMsrS" => 3471716780,
              "6hGH3G" => 3470790336,
              "6hKqD3" => 3471320476,
              "6hKxEY" => 3471344136,
              "6hHVF1" => 3471027922,
              "6hKDSQ" => 3471365008,
              "6hKwHs" => 3471340916,
              "6hH4s6" => 3470858973,
              "6hGmKB" => 3470722065,
              "6hEzdi" => 3470373757,
              "6hJQwJ" => 3471205734,
              "6hHd6a" => 3470888035,
              "6hH1j3" => 3470848414,
              "6hNP1u" => 3471981064,
              "6hFWge" => 3470639683,
              "6hFpmP" => 3470535723,
              "6hCgQZ" => 3469925109,
              "6hFJSm" => 3470601352,
              "6hEd9v" => 3470302893,
              "6hDwuF" => 3470169503,
              "6hCVSX" => 3470053055,
              "6hCUgr" => 3470047631,
              "6hEsqR" => 3470350937,
              "6hBmKg" => 3469746485,
              "6hDvUx" => 3470167523,
              "6hJUi7" => 3471218400,
              "6hF39e" => 3470464349,
              "6hH43K" => 3470857619,
              "6hGSC5" => 3470822548,
              "6hFz1s" => 3470568182,
              "6hFaKZ" => 3470489971,
              "6hD65K" => 3470084015,
              "6hBAVk" => 3469794165,
              "6hLkWA" => 3471499786,
              "6hHi7q" => 3470904928,
              "6hHdDF" => 3470889921,
              "6hHcCo" => 3470886482,
              "6hGQQf" => 3470816526,
              "6hLAfo" => 3471547914,
              "6hBDEV" => 3469803421,
              "6hL4BE" => 3471444864,
              "6hL2TT" => 3471439077,
              "6hKcxb" => 3471276404,
              "6hD1vg" => 3470068617,
              "6hLtTT" => 3471526541,
              "6hHXtw" => 3471033984,
              "6hHCQj" => 3470971274,
              "6hFrXx" => 3470544465,
              "6hMVkJ" => 3471807252,
              "6hDv6V" => 3470164819,
              "6hD1gR" => 3470067839,
              "6hShWW" => 3472660386,
              "6hK4tb" => 3471249260,
              "6hLzrQ" => 3471545214,
              "6hBTAe" => 3469850245,
              "6hLABq" => 3471549134,
              "6hGbN7" => 3470688570,
              "6hFtro" => 3470549444,
              "6hRRAQ" => 3472575120,
              "6hFViL" => 3470636466,
              "6hFkLP" => 3470523659,
              "6hNAKc" => 3471939809,
              "6hLLNE" => 3471583426,
              "6hJstp" => 3471131533,
              "6hHxv3" => 3470953336,
              "6hLToQ" => 3471605592,
              "6hJ74F" => 3471062877,
              "6hGjCA" => 3470714930,
              "6hCQoD" => 3470034593,
              "6hCqxX" => 3469954397,
              "6hCbg8" => 3469906325,
              "6hJwGw" => 3471145750,
              "6hP2Tt" => 3472024389,
              "6hHDuy" => 3470973492,
              "6hGRpq" => 3470818450,
              "6hDx8F" => 3470171649,
              "6hLhxU" => 3471488378,
              "6hFrkd" => 3470542358,
              "6hPc3D" => 3472055197,
              "6hJV29" => 3471220838,
              "6hCc3c" => 3469908939,
              "6hLycA" => 3471541024,
              "6hLd75" => 3471473424,
              "6hKJ1m" => 3471378900,
              "6hHgEG" => 3470900072,
              "6hFNfm" => 3470612720,
              "6hFsaF" => 3470545169,
              "6hERqV" => 3470428313,
              "6hEnYK" => 3470335967,
              "6hDGeT" => 3470202285,
              "6hFDZo" => 3470584940,
              "6hMvPE" => 3471728136,
              "6hKTro" => 3471410628,
              "6hKfXG" => 3471287918,
              "6hKeuU" => 3471283000,
              "6hHFYj" => 3470981830,
              "6hHDzj" => 3470973768,
              "6hCozt" => 3469947757,
              "6hKB8D" => 3471355775,
              "6hCtrc" => 3469964097,
              "6hDXcx" => 3470252609,
              "6hCxSR" => 3469979041,
              "6hC1Vk" => 3469874901,
              "6hKmaS" => 3471305444,
              "6hK9fn" => 3471265337,
              "6hFDH6" => 3470583995,
              "6hEB7c" => 3470380131,
              "6hC1E2" => 3469874013,
              "6hBZnx" => 3469869693,
              "6hBXNz" => 3469864417,
              "6hQKjm" => 3472358868,
              "6hHn4j" => 3470918204,
              "6hHiQ2" => 3470907341,
              "6hHhHb" => 3470903580,
              "6hGnBc" => 3470724941,
              "6hG6Ht" => 3470671481,
              "6hDvh6" => 3470165409,
              "6hCGtp" => 3470007957,
              "6hCnzi" => 3469944383,
              "6hMxEY" => 3471734360,
              "6hG9sL" => 3470680720,
              "6hCarn" => 3469903555,
              "6hLsdE" => 3471520902,
              "6hKnDa" => 3471310391,
              "6hKn2L" => 3471308338,
              "6hGpfH" => 3470730481,
              "6hRkJS" => 3472474666,
              "6hFEV3" => 3470588052,
              "6hE7VV" => 3470285343,
              "6hSSAq" => 3472773572,
              "6hNTtQ" => 3471996106,
              "6hMAuK" => 3471743859,
              "6hJ95H" => 3471069665,
              "6hHZ39" => 3471039240,
              "6hByNi" => 3469787029,
              "6hLLnb" => 3471581948,
              "6hHYoQ" => 3471037076,
              "6hHCLm" => 3470971044,
              "6hFHkC" => 3470596206,
              "6hDKq4" => 3470212967,
              "6hRapC" => 3472439910,
              "6hKJBs" => 3471380936,
              "6hHids" => 3470905278,
              "6hEJ8R" => 3470403775,
              "6hMY3L" => 3471816360,
              "6hFRAC" => 3470623988,
              "6hEP9c" => 3470420615,
              "6hEqVR" => 3470345891,
              "6hHGBX" => 3470984013,
              "6hEzFB" => 3470375341,
              "6hDnRp" => 3470140429,
              "6hDdQH" => 3470110113,
              "6hCK7B" => 3470016843,
              "6hCxvH" => 3469977815,
              "6hC4v4" => 3469883585,
              "6hC15g" => 3469872055,
              "6hGHRA" => 3470793056,
              "6hGCGL" => 3470775724,
              "6hGbuW" => 3470687574,
              "6hT7FY" => 3472820990,
              "6hMFHs" => 3471761416,
              "6hJybH" => 3471150749,
              "6hGEFs" => 3470782376,
              "6hCBnX" => 3469990821,
              "6hNJZt" => 3471967549,
              "6hMxUV" => 3471735169,
              "6hLoGG" => 3471509072,
              "6hJdy5" => 3471084708,
              "6hGnwp" => 3470724663,
              "6hGkhZ" => 3470717157,
              "6hG7yd" => 3470674308,
              "6hDAqF" => 3470182727,
              "6hPQVJ" => 3472182628,
              "6hHyqy" => 3470956440,
              "6hFG6k" => 3470592013,
              "6hTavC" => 3472830482,
              "6hJjzU" => 3471104998,
              "6hFE7r" => 3470585349,
              "6hNQU7" => 3471987422,
              "6hJYSj" => 3471233782,
              "6hFVRB" => 3470638313,
              "6hEeQt" => 3470308575,
              "6hBmnK" => 3469745237,
              "6hP9VU" => 3472048078,
              "6hJeDp" => 3471088381,
              "6hHV4d" => 3471025846,
              "6hFXmS" => 3470643374,
              "6hBgEn" => 3469729381,
              "6hNDjB" => 3471948475,
              "6hKEkd" => 3471366538,
              "6hJDq6" => 3471168345,
              "6hHbCG" => 3470883136,
              "6hCgN2" => 3469924937,
              "6hQa3S" => 3472243594,
              "6hLphv" => 3471511033,
              "6hHoqd" => 3470922780,
              "6hGT2W" => 3470823932,
              "6hEd6V" => 3470302743,
              "6hNac3" => 3471853844,
              "6hHzYe" => 3470961641,
              "6hRDAC" => 3472534740,
              "6hJ2bu" => 3471046452,
              "6hGRPN" => 3470819864,
              "6hFS6P" => 3470625681,
              "6hG8Yn" => 3470679073,
              "6hFSGB" => 3470627699,
              "6hFQhL" => 3470619588,
              "6hF4VT" => 3470470361,
              "6hE7vD" => 3470283935,
              "6hBeKa" => 3469722931,
              "6hPLs1" => 3472167564,
              "6hHcKm" => 3470886886,
              "6hG9KW" => 3470681716,
              "6hE8E4" => 3470287787,
              "6hNp1U" => 3471900352,
              "6hJ29T" => 3471046359,
              "6hHPLb" => 3471008038,
              "6hGWGq" => 3470836256,
              "6hEipV" => 3470320607,
              "6hMB8U" => 3471746014,
              "6hKWyr" => 3471421129,
              "6hKLxb" => 3471387416,
              "6hJstE" => 3471131548,
              "6hHk3k" => 3470911419,
              "6hPSdE" => 3472186974,
              "6hPfEY" => 3472067396,
              "6hGVSS" => 3470833498,
              "6hFVX4" => 3470638629,
              "6hFQRa" => 3470621467,
              "6hCsKK" => 3469961809,
              "6hJbdY" => 3471076872,
              "6hE2ok" => 3470266691,
              "6hCrc8" => 3469956553,
              "6hRgwS" => 3472460514,
              "6hPhLY" => 3472074472,
              "6hLTK1" => 3471606762,
              "6hHh5u" => 3470901452,
              "6hDiBB" => 3470126173,
              "6hD678" => 3470084095,
              "6hKMXC" => 3471392198,
              "6hBohi" => 3469751649,
              "6hJXRV" => 3471230395,
              "6hFzad" => 3470568690,
              "6hCCbH" => 3469993533,
              "6hLpoA" => 3471511386,
              "6hKZQN" => 3471432170,
              "6hG3Ax" => 3470660987,
              "6hT7kf" => 3472819788,
              "6hKrzq" => 3471323630,
              "6hHMHM" => 3471001171,
              "6hHL9q" => 3470995872,
              "6hBUkR" => 3469852775,
              "6hRRLf" => 3472575666,
              "6hJFUg" => 3471176707,
              "6hBML2" => 3469830629,
              "6hS9eE" => 3472631080,
              "6hPD3o" => 3472142646,
              "6hKWhL" => 3471420220,
              "6hJMpr" => 3471195219,
              "6hHzVA" => 3470961488,
              "6hGvu9" => 3470751444,
              "6hGkTu" => 3470719158,
              "6hF7bv" => 3470477937,
              "6hDzQp" => 3470180739,
              "6hQ2Mo" => 3472219148,
              "6hM7Tn" => 3471650979,
              "6hJWDp" => 3471226305,
              "6hJpX5" => 3471123046,
              "6hNLTn" => 3471973923,
              "6hGuRu" => 3470749318,
              "6hG1CM" => 3470654389,
              "6hEMDx" => 3470415589,
              "6hCYpx" => 3470061557,
              "6hCSTr" => 3470042991,
              "6hBnJr" => 3469749801,
              "6hRZSh" => 3472602928,
              "6hRtVW" => 3472502220,
              "6hDzc2" => 3470178571,
              "6hCMan" => 3470023731,
              "6hRfUj" => 3472458394,
              "6hLdME" => 3471475720,
              "6hE69P" => 3470279363,
              "6hDgaa" => 3470117911,
              "6hDeKg" => 3470113161,
              "6hKSis" => 3471406804,
              "6hKwYj" => 3471341778,
              "6hJ4Ro" => 3471055436,
              "6hHTug" => 3471020571,
              "6hHSH2" => 3471017947,
              "6hHCE6" => 3470970681,
              "6hG5R5" => 3470668558,
              "6hFaBX" => 3470489505,
              "6hL13o" => 3471432842,
              "6hJtQr" => 3471136117,
              "6hHpg3" => 3470925612,
              "6hGinv" => 3470710691,
              "6hFQXR" => 3470621855,
              "6hCKN6" => 3470019133,
              "6hJme9" => 3471110522,
              "6hGUY8" => 3470830439,
              "6hEDPM" => 3470389271,
              "6hBg1c" => 3469727167,
              "6hNyoj" => 3471931870,
              "6hNdQu" => 3471866108,
              "6hMNAK" => 3471784575,
              "6hHkvV" => 3470913019,
              "6hDHLi" => 3470207413,
              "6hCwUk" => 3469975763,
              "6hCd2a" => 3469912243,
              "6hPeRd" => 3472064626,
              "6hP4SL" => 3472031076,
              "6hJQFC" => 3471206250,
              "6hJLVJ" => 3471193612,
              "6hJAJT" => 3471159343,
              "6hJ8Mi" => 3471068655,
              "6hJ6o5" => 3471060580,
              "6hH667" => 3470864484,
              "6hH5RU" => 3470863718,
              "6hC2jx" => 3469876247,
              "6hPm75" => 3472085672,
              "6hN8ud" => 3471848112,
              "6hLD4g" => 3471557361,
              "6hGAr2" => 3470768083,
              "6hFVQH" => 3470638261,
              "6hDxtV" => 3470172823,
              "6hPNwj" => 3472174542,
              "6hKTB7" => 3471411192,
              "6hJdfQ" => 3471083708,
              "6hRvdq" => 3472506540,
              "6hNpN9" => 3471902976,
              "6hMd75" => 3471668536,
              "6hLkks" => 3471497748,
              "6hHkYn" => 3470914553,
              "6hGZgY" => 3470844930,
              "6hGorv" => 3470727743,
              "6hG941" => 3470679342,
              "6hC6xK" => 3469890469,
              "6hTA5N" => 3472913142,
              "6hNzGE" => 3471936298,
              "6hN3F1" => 3471831918,
              "6hLdgN" => 3471473988,
              "6hFyvS" => 3470566524,
              "6hCxUM" => 3469979153,
              "6hCmje" => 3469940145,
              "6hC87z" => 3469895737,
              "6hC4mV" => 3469883113,
              "6hQXaJ" => 3472398736,
              "6hP6Tw" => 3472037848,
              "6hLx7r" => 3471537361,
              "6hFvYh" => 3470557964,
              "6hEPWM" => 3470423317,
              "6hDKDT" => 3470213769,
              "6hBrcn" => 3469761455,
              "6hBkh4" => 3469741543,
              "6hMdbq" => 3471668788,
              "6hK3cE" => 3471244996,
              "6hJSUj" => 3471213714,
              "6hJvFs" => 3471142324,
              "6hHVMu" => 3471028298,
              "6hHUZG" => 3471025642,
              "6hHeVT" => 3470894225,
              "6hFqjr" => 3470538949,
              "6hETNt" => 3470436291,
              "6hEPkX" => 3470421297,
              "6hCVrB" => 3470051585,
              "6hCE2V" => 3469999751,
              "6hNe3j" => 3471866794,
              "6hKjmA" => 3471299338,
              "6hHbMp" => 3470883641,
              "6hGWJ7" => 3470836354,
              "6hGn3F" => 3470723055,
              "6hFoKL" => 3470533690,
              "6hETWx" => 3470436759,
              "6hPaH5" => 3472050698,
              "6hNFFf" => 3471956400,
              "6hNnyp" => 3471895451,
              "6hM7ra" => 3471649459,
              "6hHof7" => 3470922194,
              "6hH8KM" => 3470873455,
              "6hGbCG" => 3470688024,
              "6hDXaB" => 3470252497,
              "6hDSF2" => 3470237383,
              "6hDfq8" => 3470115415,
              "6hCqqR" => 3469953985,
              "6hPpj7" => 3472096462,
              "6hMSHG" => 3471798434,
              "6hKyF6" => 3471347507,
              "6hK33v" => 3471244465,
              "6hJwva" => 3471145091,
              "6hGX9e" => 3470837753,
              "6hFWeR" => 3470639603,
              "6hD8oF" => 3470091783,
              "6hCopg" => 3469947165,
              "6hC9L8" => 3469901279,
              "6hBhS4" => 3469733423,
              "6hMQXy" => 3471792510,
              "6hLoRU" => 3471509606,
              "6hKCib" => 3471359692,
              "6hKder" => 3471278739,
              "6hHYPy" => 3471038510,
              "6hD4hz" => 3470077973,
              "6hPgTS" => 3472071508,
              "6hNXii" => 3472008951,
              "6hKYzE" => 3471427928,
              "6hKSr2" => 3471407243,
              "6hG4fB" => 3470663195,
              "6hFyz2" => 3470566707,
              "6hFoMT" => 3470533813,
              "6hC5V4" => 3469888341,
              "6hBZmZ" => 3469869661,
              "6hPXKU" => 3472205606,
              "6hHVwm" => 3471027420,
              "6hCzFH" => 3469985123,
              "6hCvsM" => 3469970917,
              "6hChKr" => 3469928151,
              "6hBv6F" => 3469774581,
              "6hPf62" => 3472065427,
              "6hNS4s" => 3471991328,
              "6hNPXe" => 3471984239,
              "6hLguh" => 3471484804,
              "6hJ5zB" => 3471057885,
              "6hHr6j" => 3470931776,
              "6hLBUx" => 3471553491,
              "6hLi1P" => 3471489939,
              "6hKQ35" => 3471399184,
              "6hKK67" => 3471382540,
              "6hHUcT" => 3471022985,
              "6hGPjm" => 3470811428,
              "6hF5ti" => 3470472183,
              "6hDZPz" => 3470261427,
              "6hC17D" => 3469872193,
              "6hR7R3" => 3472431292,
              "6hN7hS" => 3471844090,
              "6hHqoC" => 3470929416,
              "6hFDdx" => 3470582339,
              "6hFzdL" => 3470568896,
              "6hDuEH" => 3470163357,
              "6hCaZk" => 3469905409,
              "6hT2Hw" => 3472804260,
              "6hPhJY" => 3472074356,
              "6hKNBy" => 3471394398,
              "6hJPEq" => 3471202816,
              "6hGMH7" => 3470806020,
              "6hGp5L" => 3470729904,
              "6hFfRV" => 3470507135,
              "6hESHt" => 3470432637
    },
    :bitcoin => {
              "6Hknds" => 3471391110,
              "6HeSMr" => 3470152229,
              "6Hiizc" => 3470988633,
              "6HikVM" => 3470993664,
              "6HmGgw" => 3471485480,
              "6Hcrkr" => 3469844075
    },
    :ripple => {
              "aHk8d1" => 3471391110,
              "aHeSMi" => 3470152229,
              "aH55zc" => 3470988633,
              "aH5kVM" => 3470993664,
              "aHmGgA" => 3471485480,
              "aHciki" => 3469844075
    }
  }

  BINARY_STRING_EXAMPLES = {
    :flickr => {
              "6hKMCS" => "\xCE\xE99\x86".force_encoding('BINARY'),
              "6hDrmR" => "\xCE\xD6R%".force_encoding('BINARY'),
              "6hHHZB" => "\xCE\xE3\x15Y".force_encoding('BINARY'),
              "6hHKum" => "\xCE\xE3)\x00".force_encoding('BINARY'),
              "6hLgFW" => "\xCE\xEA\xAA(".force_encoding('BINARY'),
              "6hBRKR" => "\xCE\xD1\x9Ek".force_encoding('BINARY'),
              "7xBSG3j7NgPksBpPnX1G7y19EuAy4swQexDoECfWdys" => "\x01\xAD<l'\xAF!\x96N\x93u\x93\xE2\xAF\x92p\x96=\x89n\xD7\x953\x17\x12\x8E\xBD\xA2\x04\x84~Z".force_encoding('BINARY')
    },
    :bitcoin => {
              "6Hknds" => "\xCE\xE99\x86".force_encoding('BINARY'),
              "6HeSMr" => "\xCE\xD6R%".force_encoding('BINARY'),
              "6Hiizc" => "\xCE\xE3\x15Y".force_encoding('BINARY'),
              "6HikVM" => "\xCE\xE3)\x00".force_encoding('BINARY'),
              "6HmGgw" => "\xCE\xEA\xAA(".force_encoding('BINARY'),
              "6Hcrkr" => "\xCE\xD1\x9Ek".force_encoding('BINARY'),
              "7Ycsh3K7oGpLTcQpNx1h7Z19fVbZ4TXqEYePfdFwDZT" => "\x01\xAD<l'\xAF!\x96N\x93u\x93\xE2\xAF\x92p\x96=\x89n\xD7\x953\x17\x12\x8E\xBD\xA2\x04\x84~Z".force_encoding('BINARY')
    },
    :ripple => {
              "aHk8d1" => "\xCE\xE99\x86".force_encoding('BINARY'),
              "aHeSMi" => "\xCE\xD6R%".force_encoding('BINARY'),
              "aH55zc" => "\xCE\xE3\x15Y".force_encoding('BINARY'),
              "aH5kVM" => "\xCE\xE3)\x00".force_encoding('BINARY'),
              "aHmGgA" => "\xCE\xEA\xAA(".force_encoding('BINARY'),
              "aHciki" => "\xCE\xD1\x9Ek".force_encoding('BINARY'),
              "fYc16sKfoGFLTcQF4xr6fZr9CVbZhTXqNYePCdEADZT" => "\x01\xAD<l'\xAF!\x96N\x93u\x93\xE2\xAF\x92p\x96=\x89n\xD7\x953\x17\x12\x8E\xBD\xA2\x04\x84~Z".force_encoding('BINARY')
    }
  }

  LEADING_ZEROES_EXAMPLES = {
    :bitcoin => [
      {
        :hex => "00000000000000000000123456789ABCDEF0",
        :b58 => "111111111143c9JGph3DZ",
        :b58_no_zeroes => "43c9JGph3DZ"
      },
      {
        :hex => "00000000000000000000",
        :b58 => "1111111111",
        :b58_no_zeroes => "1"
      },
      {
        :hex => "00",
        :b58 => "1",
        :b58_no_zeroes => "1"
      },
      {
        :hex => "",
        :b58 => "1",
        :b58_no_zeroes => "1"
      },
    ],
    :flickr => [
      {
        :hex => "00000000000000000000123456789ABCDEF0",
        :b58 => "111111111143B9igPG3dy",
        :b58_no_zeroes => "43B9igPG3dy"
      },
      {
        :hex => "00000000000000000000",
        :b58 => "1111111111",
        :b58_no_zeroes => "1"
      },
      {
        :hex => "00",
        :b58 => "1",
        :b58_no_zeroes => "1"
      },
      {
        :hex => "",
        :b58 => "1",
        :b58_no_zeroes => "1"
      },
    ],
    :ripple => [
      {
        :hex => "00000000000000000000123456789ABCDEF0",
        :b58 => "rrrrrrrrrrhsc9JGF6sDZ",
        :b58_no_zeroes => "hsc9JGF6sDZ"
      },
      {
        :hex => "00000000000000000000",
        :b58 => "rrrrrrrrrr",
        :b58_no_zeroes => "r"
      },
      {
        :hex => "00",
        :b58 => "r",
        :b58_no_zeroes => "r"
      },
      {
        :hex => "",
        :b58 => "r",
        :b58_no_zeroes => "r"
      }
    ]
  }

  HEX_TO_BIN = ->hex { [hex].pack('H*') }
  HEX_TO_INT = ->hex { hex.to_i(16) }

  STRIP_LEADING = ->char { ->str { str.gsub(/^#{char}*/, '') } }
  STRIP_BINARY = STRIP_LEADING["\x00"]

  LEADING_ZEROES_EXAMPLES.each do |alphabet, examples|
    examples.each do |example|
      define_method("test_binary_to_base58_leading_zeroes_#{alphabet}_#{example[:hex]}") do
        bin = HEX_TO_BIN[example[:hex]]
        bin_no_zeroes = STRIP_BINARY[bin]

        assert_equal example[:b58], Base58.binary_to_base58(bin, alphabet) # Default behavior is to include leading zeroes
        assert_equal example[:b58], Base58.binary_to_base58(bin, alphabet, true)
        assert_equal example[:b58_no_zeroes], Base58.binary_to_base58(bin, alphabet, false) # Optionally, leading zeroes may be omitted

        # If there are no zeroes in the input, there are never zeroes in the output
        assert_equal example[:b58_no_zeroes], Base58.binary_to_base58(bin_no_zeroes, alphabet)
        assert_equal example[:b58_no_zeroes], Base58.binary_to_base58(bin_no_zeroes, alphabet, true)
        assert_equal example[:b58_no_zeroes], Base58.binary_to_base58(bin_no_zeroes, alphabet, false)
      end
    end
  end

  LEADING_ZEROES_EXAMPLES.each do |alphabet, examples|
    examples.each do |example|
      define_method("test_base58_to_binary_leading_zeroes_#{alphabet}_#{example[:hex]}") do
        bin = HEX_TO_BIN[example[:hex]]
        bin_no_zeroes = STRIP_BINARY[bin]

        # When converting from base58, an empty string will never be produced.
        bin_no_zeroes = "\x00" if bin_no_zeroes.empty?
        bin = "\x00" if bin.empty?

        assert_equal bin, Base58.base58_to_binary(example[:b58], alphabet)
        assert_equal bin_no_zeroes, Base58.base58_to_binary(example[:b58_no_zeroes], alphabet)
      end
    end
  end

  LEADING_ZEROES_EXAMPLES.each do |alphabet, examples|
    examples.each do |example|
      define_method("test_int_to_base58_leading_zeroes_#{alphabet}_#{example[:hex]}") do
        assert_equal example[:b58_no_zeroes], Base58.int_to_base58(HEX_TO_INT[example[:hex]], alphabet)
      end
    end
  end

  LEADING_ZEROES_EXAMPLES.each do |alphabet, examples|
    examples.each do |example|
      define_method("test_base58_to_int_leading_zeroes_#{alphabet}_#{example[:hex]}") do
        assert_equal HEX_TO_INT[example[:hex]], Base58.base58_to_int(example[:b58], alphabet)
        assert_equal HEX_TO_INT[example[:hex]], Base58.base58_to_int(example[:b58_no_zeroes], alphabet)
      end
    end
  end

  def test_base58_to_binary_empty_input
    assert_equal "\x00", Base58.base58_to_binary("")
  end

  def test_base58_to_int_leading_zeroes_other_examples
    # All other examples, when prepended with varying amounts of leading zeroes, should work properly.
    EXAMPLES.each do |alphabet, examples|
      examples.each do |base_58, expected|
        (0..50).each do |n|
          assert_equal expected, Base58.base58_to_int( (Base58::ALPHABETS[alphabet][0] * n) + base_58, alphabet )
        end
      end
    end
  end

  def test_binary_to_base58_all_alphabets
    BINARY_STRING_EXAMPLES.each do |alphabet, examples|
      examples.each do |expected, integer|
        assert_equal expected, Base58.binary_to_base58(integer, alphabet)
      end
    end
  end

  def test_base58_to_binary_all_alphabets
    BINARY_STRING_EXAMPLES.each do |alphabet, examples|
      examples.each do |base_58, expected|
        assert_equal expected, Base58.base58_to_binary(base_58, alphabet)
      end
    end
  end

  def test_base58_to_binary_round_trip
    BINARY_STRING_EXAMPLES.each do |alphabet, examples|
      examples.each do |base_58, binary|
        assert_equal base_58, Base58.binary_to_base58(Base58.base58_to_binary(base_58, alphabet), alphabet)
        assert_equal binary,  Base58.base58_to_binary(Base58.binary_to_base58(binary,  alphabet), alphabet)
      end
    end
  end

  def test_int_to_base58_all_alphabets
    EXAMPLES.each do |alphabet, examples|
      examples.each do |expected, integer|
        assert_equal expected, Base58.int_to_base58(integer, alphabet)
      end
    end
  end

  def test_base58_to_int_all_alphabets
    EXAMPLES.each do |alphabet, examples|
      examples.each do |base_58, expected|
        assert_equal expected, Base58.base58_to_int(base_58, alphabet)
      end
    end
  end

  def test_int_to_base58_default_alphabet
    EXAMPLES[:flickr].each do |expected, integer|
      assert_equal expected, Base58.int_to_base58(integer)
    end
  end  

  def test_base58_to_int_default_alphabet
    EXAMPLES[:flickr].each do |base_58, expected|
      assert_equal expected, Base58.base58_to_int(base_58)
    end
  end
  
  def test_string_instead_of_int
    e = assert_raise(ArgumentError) { Base58.int_to_base58('3470432637') }
    assert_equal 'Value passed is not an Integer.', e.message
  end
  
  def test_invalid_base58_string
    e = assert_raise(ArgumentError) { Base58.base58_to_int('nh?') }
    assert_equal 'Value passed not a valid Base58 String.', e.message
  end
  
  def test_encode_decode_aliases
    int = 3471844090
    str = Base58.encode(int)
    assert_equal str, "6hN7hS"
    assert_equal int, Base58.decode(str)
  end
  
end