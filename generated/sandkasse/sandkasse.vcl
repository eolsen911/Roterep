
sub dr_site_sandkasse_match {
    if (!req.http.X-DR-Site && req.http.host ~ ".*\.polarismedia.no$") {
        set req.http.X-DR-Site = "sandkasse";
    }
}

sub dr_site_sandkasse_synth {
    if (req.http.X-DR-Site == "sandkasse") {
        set resp.http.Content-Type = "text/html; charset=utf-8";
        set resp.http.Retry-After = "5";
        synthetic( {"<!doctype html>
<html lang="no"><head><style>html,
body {
  margin: 0;
  padding: 0;
  width: 100%;
}

:root {
  --site-primary: #888;
  --site-link: #000;
}

.logo-container {
  position: sticky;
  top: 0;
  left: 0;
  right: 0;
  z-index: 30;
  margin: 0;
  padding: 0;
  width: 100%;
  box-sizing: border-box;
  background: #ffffff;
  border-bottom: 1px solid rgba(0, 0, 0, 0.08);
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.06);
}

.logo {
  width: 100%;
  max-width: 100%;
  height: 50px;
  padding: 8px 20px;
  box-sizing: border-box;
  background-color: var(--site-primary);
  display: flex;
  flex-direction: column;
  align-self: center;
  justify-content: space-between;
  align-items: center;
  text-align: center;
  margin: 0 auto;
}

.articles {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding-top: 0;
}

.table-of-contents > li {
  padding: 5px;
}

.article {
  display: flex;
  flex-direction: column;
  align-self: center;
  justify-content: space-between;
  align-items: center;

  padding: 30px;
  padding-bottom: 50px;
  max-width: 80%;

  border-bottom: solid black 1px;
}

.headline {
  display: flex;
  flex-direction: column;
  align-items: center;
  max-width: 80%;
}

.headline h1 {
  font-size: 32px;
  line-height: calc(-25px + 3.75rem);
  overflow-wrap: break-word;
  font-family:
    Publico Headline,
    Times New Roman,
    serif;
  font-weight: 500;
  color: #000724;
}

.authors {
  padding-top: 15px;
  font-family:
    Publico Headline,
    Times New Roman,
    serif;
}

.title {
  text-align: center;
}

.text-item {
  font-size: 18px;
  line-height: 27px;
  overflow-wrap: break-word;
  font-family:
    Publico,
    Times New Roman,
    serif;
  font-weight: normal;
  color: #333333;
  letter-spacing: -0.1px;
  text-rendering: optimizeLegibility;

  margin-bottom: 16px;
  max-width: 60vw;
}

.lead-text {
  color: #656565;
  font-size: calc(6px + 0.75rem);
  line-height: calc(4px + 1.25rem);
  font-family: Arial, sans-serif;
  font-weight: 300;
  text-rendering: optimizeLegibility;
  margin-top: 16px;
  margin-bottom: 16px;
}

.heading {
  margin-top: 29px;
  font-size: 19px;
  line-height: calc(-1px + 1.5rem);
  overflow-wrap: break-word;
  font-family: Graphik, Arial, sans-serif;
  font-weight: 600;
  color: #000724;
  text-rendering: optimizeLegibility;
}

.fact-label {
  color: #767676;
  font-family: Graphik, Arial, sans-serif;
  font-weight: 600;
  font-size: 12px;
  line-height: calc(-16px + 2rem);
  margin-bottom: 4px;
}

.fact-title {
  font-size: calc(6px + 0.75rem);
  line-height: 12px;
  overflow-wrap: break-word;
  font-family: Graphik, Arial, sans-serif;
  color: #000724;
  text-rendering: optimizeLegibility;
}

.fact-items > .text-item {
  color: #767676;
  max-width: 98vw;
}

aside {
  margin-bottom: 48px;
  padding: 16px 0 12px;
  border-left: none;
  border-top: 1px solid rgba(0, 0, 0, 0.1);
  border-bottom: 1px solid rgba(0, 0, 0, 0.1);
  margin-top: 48px;
  max-width: 60vw;
}

.list {
  list-style-position: outside;
  list-style: none;
  padding-left: 5px;
  max-width: 98%;
}

.list-item::before {
  content: "●";
  color: #000724;
  margin-right: 8px;
}

.list-item {
  font-size: 18px;
  line-height: 27px;
  overflow-wrap: break-word;
  font-family:
    Publico,
    Times New Roman,
    serif;
  color: #767676;
  text-rendering: optimizeLegibility;
  padding-bottom: 5px;
}

hr {
  border-style: none;
  margin: 0;
  background: transparent no-repeat center;
  min-height: 1px;
  margin-bottom: 22px;
  margin-top: 8px;
  background-color: rgba(0, 0, 0, 0.3);
}

.who-is-who > .text-item {
  font-size: 18px;
  line-height: 27px;
  overflow-wrap: break-word;
  font-family:
    Publico,
    Times New Roman,
    serif;
  color: #656565;
  text-rendering: optimizeLegibility;
}

a:hover {
  color: #0533ff;
}

a {
  color: #333333;
  text-decoration: none;
  padding-bottom: 1px;
  border-bottom: 1px solid #0533ff;
}

.headline > img {
  max-width: 98vw;
}

@media (max-width: 800px) {
  .headline {
    max-width: 90vw;
  }

  .text-item,
  aside {
    max-width: 86vw;
  }

  .headline > img {
    max-width: 80vw;
  }
}

@media (min-width: 1100px) {
  .article {
    max-width: 800px;
  }
}


/* Site override: sandkasse */
:root {
  --site-primary: #005379;
  --site-link: #0086bc;
}
</style><style>
.logo > svg {
  max-width: 100%;
  max-height: 100%;
  width: auto;
  height: 100%;
  display: block;
  margin: 0 auto;
}
</style><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><meta name="robots" content="noindex, nofollow" charset="utf-8"><link rel="icon" type="image/png" href="" sizes="192x192"><title>Polaris sandkasse</title></head><body><div class="logo-container"><div class="logo"><?xml version="1.0" encoding="UTF-8"?>
<svg version="1.0" xmlns="http://www.w3.org/2000/svg"
 width="1928.000000pt" height="371.000000pt" viewBox="0 0 1928.000000 371.000000"
 preserveAspectRatio="xMidYMid meet">

<g transform="translate(0.000000,371.000000) scale(0.100000,-0.100000)"
fill="#ffffff" stroke="none">
<path d="M11127 3574 c-278 -50 -532 -214 -682 -439 -111 -167 -145 -282 -152
-516 l-5 -166 -169 -39 -169 -39 0 -117 0 -118 170 0 170 0 0 -824 0 -823 -87
-11 c-49 -7 -121 -15 -160 -18 l-73 -7 0 -123 0 -124 660 0 660 0 0 123 0 123
-182 13 c-101 6 -195 14 -210 17 l-28 6 0 824 0 824 253 2 252 3 3 158 3 157
-257 0 -256 0 4 253 c3 232 5 256 24 297 54 115 168 156 359 131 94 -13 226
-56 274 -90 16 -12 32 -21 35 -21 3 0 6 115 6 255 0 294 11 266 -116 291 -93
17 -224 17 -327 -2z" />
<path d="M11955 3486 l-340 -41 -3 -112 c-1 -62 -1 -113 1 -113 2 0 66 -11
143 -25 76 -14 140 -25 142 -25 1 0 2 -603 2 -1339 l0 -1340 -42 -6 c-24 -3
-86 -11 -138 -18 l-95 -12 -3 -122 -3 -123 576 0 575 0 0 123 0 124 -127 12
c-71 7 -136 15 -145 17 -17 5 -18 84 -18 1484 l0 1479 -53 41 c-43 32 -62 40
-93 39 -21 -1 -192 -20 -379 -43z" />
<path d="M15165 3486 l-340 -42 0 -109 c0 -127 -19 -111 173 -145 l122 -22 0
-1338 0 -1339 -47 -7 c-27 -3 -79 -12 -118 -18 l-70 -12 -3 -122 -3 -122 531
0 530 0 0 123 0 124 -97 12 c-54 7 -110 15 -124 18 l-26 5 -6 241 -6 242 177
178 c97 97 180 176 184 175 9 -3 458 -831 453 -836 -1 -1 -47 -10 -101 -20
l-99 -17 -3 -122 -3 -123 541 0 541 0 -3 123 -3 122 -107 16 c-60 9 -110 18
-114 21 -3 3 -163 275 -356 604 l-350 599 223 217 c123 120 240 228 259 242
28 19 67 28 188 47 l152 22 0 119 0 118 -530 0 -531 0 3 -117 3 -118 138 -21
c75 -11 140 -23 143 -27 4 -4 -791 -847 -799 -847 -1 0 -1 478 1 1063 l3 1063
-54 37 c-41 28 -63 37 -93 36 -21 -1 -192 -20 -379 -43z"/>
<path d="M2255 2474 c-181 -23 -331 -43 -333 -44 -1 0 -1 -64 0 -141 l3 -142
125 -36 125 -36 3 -792 2 -792 -47 -7 c-27 -3 -79 -12 -118 -18 l-70 -12 -3
-122 -3 -122 531 0 530 0 0 123 0 124 -87 12 c-49 6 -103 14 -120 17 l-33 6 0
737 0 737 64 42 c166 109 317 158 464 149 183 -11 264 -96 292 -308 7 -55 10
-304 8 -724 l-3 -640 -102 -14 -103 -14 0 -123 0 -124 525 0 526 0 -3 123 -3
122 -120 17 c-66 9 -121 17 -122 17 -1 1 -3 308 -6 684 -4 729 -7 779 -58 942
-64 209 -181 325 -371 370 -219 52 -486 16 -737 -101 -97 -45 -242 -137 -275
-173 -11 -12 -22 -21 -25 -21 -3 0 -5 55 -4 122 l3 123 -49 37 c-27 21 -55 40
-62 42 -8 2 -162 -16 -344 -40z" fill="#FFF"/>
<path d="M5301 2504 c-390 -66 -698 -318 -831 -682 -59 -162 -74 -264 -74
-497 0 -178 4 -225 22 -313 95 -442 339 -715 724 -811 115 -29 276 -44 383
-36 543 39 906 350 1020 875 26 117 31 418 11 558 -57 387 -240 668 -531 814
-182 92 -489 131 -724 92z m352 -289 c101 -50 165 -136 216 -290 50 -152 63
-254 68 -537 6 -275 -3 -402 -38 -548 -26 -107 -85 -231 -139 -292 -145 -165
-436 -152 -571 27 -101 134 -150 319 -169 637 -18 292 15 595 81 754 57 138
127 214 235 260 52 22 71 24 159 21 86 -3 108 -7 158 -32z" fill="#FFF"/>
<path d="M18078 2505 c-379 -62 -670 -300 -799 -654 -139 -385 -104 -918 81
-1235 162 -276 394 -412 764 -447 318 -30 690 75 925 261 28 22 51 45 51 52 0
9 -87 208 -95 216 -1 2 -32 -13 -68 -33 -191 -105 -475 -160 -653 -126 -281
54 -453 294 -489 685 l-7 76 655 0 c361 0 658 4 661 9 29 46 42 466 18 576
-62 284 -201 467 -429 563 -148 63 -425 88 -615 57z m283 -276 c27 -12 67 -41
90 -66 87 -94 119 -218 119 -459 l0 -154 -390 0 -390 0 0 35 c0 131 41 353 84
448 46 105 153 195 260 217 60 13 171 3 227 -21z"/>
<path d="M860 2496 c-339 -61 -571 -237 -634 -482 -34 -132 -13 -319 51 -454
28 -60 54 -93 127 -165 108 -107 189 -156 406 -250 192 -83 410 -194 472 -240
65 -48 99 -110 106 -190 17 -222 -201 -348 -503 -290 -86 16 -203 66 -233 99
-11 12 -39 89 -65 176 l-44 155 -172 3 -171 2 0 -265 0 -265 28 -11 c52 -20
340 -97 442 -118 328 -68 690 -41 914 68 185 91 304 230 351 411 13 50 16 93
13 185 -6 143 -29 217 -100 317 -109 153 -229 228 -663 418 -116 50 -230 103
-254 117 -63 37 -128 99 -159 152 -24 40 -27 57 -27 133 0 80 2 89 30 130 99
141 353 181 553 88 73 -34 71 -31 128 -227 l39 -133 163 0 162 0 0 263 0 264
-117 33 c-242 68 -329 81 -558 85 -147 3 -232 0 -285 -9z"/>
<path d="M13575 2496 c-143 -24 -303 -71 -445 -131 -67 -28 -218 -111 -258
-143 l-23 -18 63 -132 63 -131 90 40 c139 62 311 116 412 130 136 17 343 8
415 -20 75 -29 130 -84 158 -157 19 -48 24 -86 28 -200 l4 -141 -128 -7 c-508
-28 -899 -164 -1069 -373 -89 -109 -125 -220 -125 -384 0 -324 173 -553 486
-640 108 -31 293 -31 407 0 136 36 274 114 405 229 l62 54 0 -93 c1 -183 40
-215 260 -212 113 1 358 30 435 51 l30 8 0 115 0 114 -107 3 -108 3 0 642 c0
665 -6 810 -41 946 -65 254 -199 376 -484 441 -78 18 -435 22 -530 6z m503
-1493 l-3 -338 -69 -47 c-38 -27 -106 -62 -150 -80 -144 -56 -283 -39 -383 46
-78 65 -126 242 -103 375 29 166 163 288 376 341 81 21 197 36 287 39 l47 1
-2 -337z"/>
<path d="M6372 2343 l3 -117 94 -23 c51 -12 95 -23 96 -25 4 -4 645 -1985 645
-1993 0 -3 108 -5 239 -5 220 0 240 1 245 18 3 9 88 307 189 662 179 625 186
652 217 867 19 123 34 222 36 220 1 -1 21 -99 43 -217 37 -192 63 -286 248
-882 l208 -668 235 0 236 0 304 993 c167 545 307 996 311 1000 4 5 51 19 105
31 l99 21 3 118 3 117 -436 0 -435 0 0 -118 0 -119 138 -23 c75 -12 140 -26
144 -29 4 -4 -57 -252 -136 -551 -79 -300 -163 -634 -187 -742 -23 -109 -44
-196 -46 -194 -2 1 -23 95 -48 207 -28 129 -118 454 -247 887 l-202 682 -246
0 -246 0 -184 -682 c-101 -376 -203 -775 -226 -888 -22 -113 -44 -198 -47
-190 -4 8 -26 105 -50 215 -24 110 -110 438 -191 728 -81 291 -146 530 -144
532 2 2 65 14 141 26 l137 24 0 117 0 118 -525 0 -526 0 3 -117z"/>
</g>
</svg></div></div><div class="articles"><div class="article" id="dr-fallback"><div class="headline"><h1 class="title">Polaris sandkasse: Vi jobber med å gjenopprette normal drift</h1><img src=""></div><div class="article-body"><p class="text-item">Nettstedet vårt er midlertidig utilgjengelig. Avisen jobber fortløpende med å rette feilen og få publiseringen tilbake til normal drift.</p><p class="text-item">Vi oppdaterer denne siden så snart vi har ny informasjon. Takk for tålmodigheten.</p><p class="text-item">Sist oppdatert: 02.06.2026, 08:35.</p></div><ul class="table-of-contents"><li><a href="#dr-fallback">Polaris sandkasse: Vi jobber med å gjenopprette normal drift</a></li></ul></div></div><div></div></body></html>"} );
        return (deliver);
    }
}
