
sub dr_site_trd_match {
    if (!req.http.X-DR-Site && req.http.host ~ ".*\.adressa.no$") {
        set req.http.X-DR-Site = "trd";
    }
}

sub dr_site_trd_synth {
    if (req.http.X-DR-Site == "trd") {
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


/* Site override: trd */
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
</style><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><meta name="robots" content="noindex, nofollow" charset="utf-8"><link rel="icon" type="image/png" href="" sizes="192x192"><title>Adresseavisen</title></head><body><div class="logo-container"><div class="logo"><svg
  class="trdby-text"
  xmlns="http://www.w3.org/2000/svg"
  data-name="trdby-text"
  viewBox="0 0 234 112"
>
  <defs>
    <linearGradient
      id="trd-gradient"
      gradientTransform="rotate(60), translate(0,-4)"
    >
      <stop offset="0%" stop-color="var(--color-stop-one, #ff9600)" />
      <stop offset="100%" stop-color="var(--color-stop-two, #d10000)" />
    </linearGradient>
  </defs>
  <g class="trd" style="fill: url(#trd-gradient)">
    <path
      d="M5 76V50H0v-9h5V28h16v13h9v9h-9v23c0 5 2 6 6 6h3v9a31 31 0 01-9 1C11 89 5 86 5 76zM31 79h3a3 3 0 002-2V53a3 3 0 00-2-2h-3V41h18c2 0 3 1 3 7 3-4 7-8 13-8a9 9 0 013 1v12h-2l-14 2v24h6v9H31zM68 65c0-18 11-25 20-25a16 16 0 0113 6V35h-5V25h19l2 4v48a3 3 0 003 2h2v9h-18c-1 0-2-2-2-5-3 4-8 6-14 6-11 0-20-6-20-24zm33 11V53a20 20 0 00-6-2c-6 0-10 3-10 14s4 14 9 14a12 12 0 007-3z"
    />
  </g>
  <g class="by">
    <path
      d="M134 82V85L132 88H129V31C129.037 30.3507 128.862 29.7071 128.501 29.166C128.14 28.6249 127.613 28.2157 127 28H122V25H133L134 27V50C138 46 144 41 153 41C162 41 171 46 171 64C171 83 160 89 150 89C142 89 138 86 134 82ZM166 65C166 49 158 45 151 45C144 45 138 49 134 54V79C138 83 142 85 149 85C157 85 166 81 166 65ZM182 100C187 98 192 94 195 86L179 48C178 46 177 45 175 45H173V41H191V45H183L198 80L211 49C212 46 211 45 209 45H205V41H222V45H220C218 45 217 46 216 48L200 86C196 94 191 100 186 103H182V100Z"
    />
  </g>
</svg>
</div></div><div class="articles"><div class="article" id="dr-fallback"><div class="headline"><h1 class="title">Adresseavisen: Vi jobber med å gjenopprette normal drift</h1><img src=""></div><div class="article-body"><p class="text-item">Nettstedet vårt er midlertidig utilgjengelig. Avisen jobber fortløpende med å rette feilen og få publiseringen tilbake til normal drift.</p><p class="text-item">Vi oppdaterer denne siden så snart vi har ny informasjon. Takk for tålmodigheten.</p><p class="text-item">Sist oppdatert: 02.06.2026, 08:35.</p></div><ul class="table-of-contents"><li><a href="#dr-fallback">Adresseavisen: Vi jobber med å gjenopprette normal drift</a></li></ul></div></div><div></div></body></html>"} );
        return (deliver);
    }
}
