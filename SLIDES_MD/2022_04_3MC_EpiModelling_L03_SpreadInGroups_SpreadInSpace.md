---
marp: true
title: Epidemics spreading among groups. Epidemics spreading in space and time
description: 3MC Course Epidemiological Modelling - Julien Arino - Course 03 - Epidemics spreading among groups. Epidemics spreading in space and time
theme: default
paginate: false
math: mathjax
size: 4K
---

<style>
  .theorem {
    text-align:justify;
    background-color:#16a085;
    border-radius:20px;
    padding:10px 20px 10px 20px;
    box-shadow: 0px 1px 5px #999;  margin-bottom: 10px;
  }
  .definition {
    text-align:justify;
    background-color:#ededde;
    border-radius:20px;
    padding:10px 20px 10px 20px;
    box-shadow: 0px 1px 5px #999;
    margin-bottom: 10px;
  }
  img[alt~="center"] {
    display: block;
    margin: 0 auto;
  }
</style>

# Epidemics spreading among groups. Epidemics spreading in space and time

5 April 2022 

Julien Arino [![width:32px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/icons/email-round.png)](mailto:Julien.Arino@umanitoba.ca) [![width:32px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/icons/world-wide-web.png)](https://julien-arino.github.io/) [![width:32px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/icons/github-icon.png)](https://github.com/julien-arino)

Department of Mathematics & Data Science Nexus
University of Manitoba*

<div style = "font-size:18px; margin-top:-10px; padding-bottom:30px;"></div>

Canadian Centre for Disease Modelling
Canadian COVID-19 Mathematical Modelling Task Force
NSERC-PHAC EID Modelling Consortium (CANMOD, MfPH, OMNI/RÉUNIS)

<div style = "text-align: justify; position: relative; bottom: -5%; font-size:18px;">
* The University of Manitoba campuses are located on original lands of Anishinaabeg, Cree, Oji-Cree, Dakota and Dene peoples, and on the homeland of the Métis Nation.</div>

--- 

<!-- _backgroundImage: "radial-gradient(white,80%,#f1c40f)" -->
# Outline
- Heterogeneity of spread within a location
- Mobility and the spread of infectious diseases
- Waves of COVID-19

---
<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# Heterogeneity of spread within a location

---

<!-- _backgroundImage: "radial-gradient(white, 80%, #156C26)" -->
# Heterogeneity of spread within a location
- Age structure
- Social structure
- Pathogen heterogeneity

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# Age structure

---

# <!-- fit -->Many diseases have different burdens in different age groups

- Childhood disease conferring lifelong immunity: measles, mumps, etc.
- Diseases in which immunity is acquired through repeated exposition: malaria
- Disease for which repeated contacts are important: kids playing together, adults meeting mostly other adults, adults with kids getting sick from them (WAIFW - who acquires infection from whom)

---

![bg left:71%](https://www.cdc.gov/mmwr/preview/mmwrhtml/figures/m6013a1f.gif "https://www.cdc.gov/mmwr/preview/mmwrhtml/mm6013a1.htm")

# Measles cases among travellers returning to the US

<!-- Measles cases among travellers returning to the US https://www.cdc.gov/mmwr/preview/mmwrhtml/mm6013a1.htm -->

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/malaria-deaths-by-age.png "Max Roser and Hannah Ritchie (2019) - 'Malaria'. Published online at OurWorldInData.org. Retrieved from: 'https://ourworldindata.org/malaria' [Online Resource]")

<!-- Max Roser and Hannah Ritchie (2019) - 'Malaria'. Published online at OurWorldInData.org. Retrieved from: 'https://ourworldindata.org/malaria' [Online Resource] -->

---

# Population contact patterns in the United States during the COVID-19 pandemic

![bg right:65%](https://media.springernature.com/full/springer-static/image/art%3A10.1038%2Fs41467-021-20990-2/MediaObjects/41467_2021_20990_Fig3_HTML.png?as=webp "https://doi.org/10.1038/s41467-021-20990-2")

<!-- https://doi.org/10.1038/s41467-021-20990-2 -->

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# Social structure

---

# Social structure also plays a very important role

- Age is determinant of social structure and thus contacts:
  - School
  - Work
  - Social events
- In countries with large immigration: newcomers versus more established population, e.g., TB
- Risk groups: drug users (HIV)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/pnas.202112605fig01.jpg "Within and between classroom transmission patterns of seasonal influenza among primary school students in Matsumoto city, Japan https://doi.org/10.1073/pnas.2112605118")

<!-- Within and between classroom transmission patterns of seasonal influenza among primary school students in Matsumoto city, Japan https://doi.org/10.1073/pnas.2112605118 -->

---

![bg right:71%](https://erj.ersjournals.com/content/erj/38/4/895/F1.large.jpg "https://doi.org/10.1183/09031936.00196610")

# Arrivals to CAN from country groups with incidence per 100K ..

---

![bg contain](https://www.cdc.gov/mmwr/preview/mmwrhtml/figures/m6410a2f2.gif "https://www.cdc.gov/mmwr/preview/mmwrhtml/mm6410a2.htm")

---

![bg contain](https://www.cdc.gov/hiv/images/basics/statistics/infographics/cdc-hiv-statistics-diagnoses-category-1200x630.png "https://www.cdc.gov/hiv/basics/statistics.html")

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, 20%, white)" -->
# Pathogen heterogeneity

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/ppat.1008984.g001.png "Characterising the epidemic spread of influenza A/H3N2 within a city through phylogenetics https://doi.org/10.1371/journal.ppat.1008984")

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/InfluenzaStrainsCAN_2019-2020.png)

---

<div style="width:100%; height:100%">
  <iframe src="https://covariants.org/per-country?country=South+Africa" style="position:absolute; top:0px; left:0px; 
  width:100%; height:100%; border: none; overflow: hidden;"></iframe>
</div>

---

<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# Mobility and the spread of infectious diseases

---

# <!-- fit --> Pathogens have been mobile for a while

<!--<div style = "text-align: justify">-->
It first began, it is said, in the parts of **Ethiopia** above Egypt, and thence descended into **Egypt** and **Libya** and into most of the King's country [**Persia**]. Suddenly falling upon Athens, it first attacked the population in **Piraeus**—which was the occasion of their saying that the Peloponnesians had poisoned the reservoirs, there being as yet no wells there—and afterwards appeared in the **upper city**, when the deaths became much more frequent.
<!--</div>-->

<div style = "text-align: right; position: relative; bottom: -10%; ">
Thucydides (c. 460 BCE - c. 395 BCE)

[History of the Peloponnesian War](https://www.gutenberg.org/files/7142/7142-h/7142-h.htm#link2HCH0007)
</div>

![bg 90% right:30%](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/various/Thucydides-bust-noBG.png)

---

# <!-- fit -->Mobility is complicated and drives disease spatialisation

**Mobility is complicated**:

- Multiple modalities: foot, bicycle, personal vehicle, bus, train, boat, airplane
- Various durations: trip to the corner shop $\neq$ commuting $\neq$ multi-day trip for work or leisure $\neq$ relocation, immigration or refuge seeking
- Volumes are hard to fathom

And yet **mobility drives spatio-temporal spread**:
- Black Death 1347-1353 arrived in Europe and spread following trade routes
- SARS-CoV-1 spread out of HKG along the GATN
- Khan, Arino, Hu *et al*, [Spread of a novel influenza A (H1N1) virus via global airline transportation](https://www.nejm.org/doi/pdf/10.1056/NEJMc0904559), *New England Journal of Medicine* (2009)
</div>

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/transportation/trade_routes_1212AD.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/epidemio/Peste-Delumeau.jpg)

---

![bg contain](https://www.usu.edu/markdamen/1320hist&civ/slides/06plague/map.jpg)

---

# The Black Death: quick facts

- First of the middle ages plagues to hit Europe
- Affected Afro-Eurasia from 1346 to 1353
- Europe 1347-1351
- Killed 75–200M in Eurasia & North Africa
- Killed 30-60% of European population

![bg right:35%](https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Yersinia_pestis_fluorescent.jpeg/1036px-Yersinia_pestis_fluorescent.jpeg)

---

# Plague control measures

- Lazzarettos of Dubrovnik 1377 (30 days)
- Quarantena of Venice 1448 (40 days)
- Isolation of known or suspected cases as well as persons who had been in contact with them, at first for 14 days and gradually increased to 40 days
- Improvement of sanitation: development of pure water supplies, garbage and sewage disposal, food inspection
- .. Find and kill a snake, chop it into pieces and rub the various parts over swollen buboes. (Snake, synonymous with Satan, was thought to draw the disease out of the body as evil would be drawn to evil)

![bg left:24%](https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Nuremberg_chronicles_-_Dance_of_Death_%28CCLXIIIIv%29.jpg/1201px-Nuremberg_chronicles_-_Dance_of_Death_%28CCLXIIIIv%29.jpg)

---

# Pathogen spread has evolved with mobility

- Pathogens travel along trade routes

- In ancient times, trade routes were relatively easy to comprehend

- With acceleration and globalization of mobility, things change

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/transportation/duration_Paris_Bordeaux.png)

---

![bg 100%](https://upload.wikimedia.org/wikipedia/commons/b/bf/High_Speed_Railroad_Map_of_Europe.svg)
![bg 100%](https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/Rail_map_of_China_%28high_speed_highlighted%29_WP.svg/1280px-Rail_map_of_China_%28high_speed_highlighted%29_WP.svg.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/transportation/world_graph-degree.png)

---

![bg contain](https://www.cmaj.ca/content/cmaj/182/6/579/F2.large.jpg)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/transportation/passengers_transported_worldwide.png)

---

# <!--fit-->Fragmented jurisdictional landscape

- Political divisions (jurisdictions): nation groups (e.g., EU), nations, provinces/states, regions, counties, cities..
- Travel between jurisdictions can be complicated or impossible
- Data is integrated at the jurisdicional level
- Policy is decided at the jurisdictional level
- Long range mobility is a bottom $\to$ top $\to$ top $\to$ bottom process

![bg right:40%](https://compote.slate.com/images/af3c1e4a-9ca9-4caa-8cbb-7f4f34c9ac88.jpeg?width=1440&rect=1560x1040&offset=0x0)

---

# Why mobility is important in the context of health

```
All migrants/travellers carry with them their "health history"
```

- latent and/or active infections (TB, H1N1, polio)
- immunizations (schedules vary by country)
- health/nutrition practices (KJv)
- treatment methods (antivirals)

```
Pathogens ignore borders and politics
```

- antiviral treatment policies for Canada and USA
- SARS-CoV-2 anyone?

---

# SARS-CoV-1 (2002-2003)

## Overall impact

- Index case for international spread arrives HKG 21 February 2003

- Last country with local transmission (Taiwan) removed from list 5 July 2003

- 8273 cases in 28 countries	

- (Of these cases, 1706 were HCW)

- 775 deaths (CFR 9.4%)

![bg right:45%](https://www.cdc.gov/sars/lab/images/coronavirus2.gif)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/sars-cov-1/SARS_countries_with_time.png)


---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/polio/polio_vaccine_coverage_Africa_2003.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/polio/West_Central_Africa_Polio_2000_2006_noNGA.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/polio/West_Central_Africa_Polio_2000_2006.png)

---

![bg contain](https://www.nejm.org/na101/home/literatum/publisher/mms/journals/content/nejm/2006/nejm_2006.355.issue-24/nejmp068200/production/images/img_medium/nejmp068200_f1.jpeg)

<div style = "position: relative; bottom: -57%; padding-bottom:0px; font-size:25px; text-align: right;">
Polio spread 2002-2006. Pallansch & Sandhu, N Engl J Med 2006; 355:2508-2511
</div>

---
<!-- _backgroundImage: "linear-gradient(to bottom, #f1c40f, 20%, white)" -->
# <!-- fit -->Waves of COVID-19

<div style = "position: relative; bottom: -40%; font-size:20px;">

JA. [Describing, modelling and forecasting the spatial and temporal spread of COVID-19 - A short review](https://server.math.umanitoba.ca/~jarino/publications/Arino-2022-FIC85.pdf). *Fields Institute Communications* **85**:25-51 (2022)
</div>

---

# Amplification in Wuhan (Hubei province)

- Details of emergence and precise timeline before amplification started unknown
- Amplification in Wuhan
	- Cluster of pneumonia cases mostly related to the Huanan Seafood Market
	- 27 December 2019: first report to local government
	- 31 December 2019: publication
	- 8 January 2020: identification of SARS-CoV-2 as causative agent
-  $\sim$ 23 January 2020: lockdown Wuhan and Hubei province + face mask mandates

By 29 January, virus was found in all provinces of mainland China

---

# First detections outside China

<style scoped>
table {
    height: 100%;
    width: 100%;
    font-size: 20px;
}
</style>

| Date | Location | Note |
|------|----------|------|
| 13 Jan. | Thailand | Arrived 8 Jan. |
| 16 Jan. | Japan | Arrived 6 Jan. |
| 20 Jan. | Republic of Korea | Airport detected on 19 Jan. |
| 20 Jan. | USA | Arrived Jan. 15 |
| 23 Jan. | Nepal | Arrived 13 Jan. |
| 23 Jan. | Singapore | Arrived 20 Jan. |
| 24 Jan. | France | Arrived 22 Jan. |
| 24 Jan. | Vietnam | Arrived 13 Jan. |
| 25 Jan. | Australia | Arrived 19 Jan. |
| 25 Jan. | Malaysia | Arrived 24 Jan. |

---

# Caveat : evidence of earlier spread

- Report to Wuhan authorities on 27 December 2019
- First export detections in Thailand and Japan on 13 and 16 January 2020 (with actual importations on 8 and 6 January)

$\implies$ amplification must have been occurring for a while longer

- France: sample taken from 42-year-old male (last foreign travel to Algeria in August 2019) who presented to ICU on 27 December 2019
- Retrospective studies in United Kingdom and Italy also showed undetected COVID-19 cases in prepandemic period

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/sars-cov-2/CT_extent_2020-07-30.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/sars-cov-2/VOC_countries_reporting_since_first_case_2022_02_17.png)

