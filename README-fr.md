archeoViz
================

`archeoViz` est une application dédiée à l’archéologie. Elle permet de
*visualiser*, d’*explorer* interactivement, et d’exposer et
*communiquer* rapidement sur le web des données archéologiques de
terrain. Elle propose des *visualisations* en 3D et 2D, génère des
*coupes* et des *cartes* des restes archéologiques, permet de réaliser
des *statistiques spatiales* simples (enveloppes convexes, surfaces de
régression, estimation de densité par noyau en 2D), et de visualiser
une *chronologie* interactive des fouilles d’un site. `archeoViz` peut
être utilisée localement ou déployée sur un serveur, soit en chargeant
des données via l’interface, soit en lançant l’application avec un jeu
de donnée spécifique. L’interface est disponible en anglais et en
français.

[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://lifecycle.r-lib.org/articles/stages.html#maturing)
[![R](https://github.com/sebastien-plutniak/archeoviz/actions/workflows/r.yml/badge.svg)](https://github.com/sebastien-plutniak/archeoviz/actions/workflows/r.yml)
[![codecov](https://codecov.io/gh/sebastien-plutniak/archeoviz/branch/main/graph/badge.svg?token=6QKYVKISCT)](https://app.codecov.io/gh/sebastien-plutniak/archeoviz)
[![license](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.r-project.org/Licenses/GPL-3)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7460193.svg)](https://doi.org/10.5281/zenodo.7460193)
[![CRAN
Version](http://www.r-pkg.org/badges/version/archeoViz)](https://cran.r-project.org/package=archeoViz)

  - [**Installation**](#installation)
      - [Locale](#locale)
      - [Déployée](#déployée)
      - [Démonstration](#démonstration)
  - [**Recommandations
    communautaires**](#recommandations-communautaires)
      - [Signaler un bug](#signaler-un-bug)
      - [Soumettre une modification](#soumettre-une-modification)
  - [**Utilisation**](#utilisation)
      - [Données](#données)
          - [Par chargement de tableaux](#par-chargement-de-tableaux)
          - [Par génération de données
            aléatoires](#par-génération-de-données-aléatoires)
          - [Par paramétrage de la
            fonction](#par-paramétrage-de-la-fonction)
      - [Sous-sélection de données](#sous-sélection-de-données)
          - [Par mode de localisation](#par-mode-de-localisation)
          - [Par catégorie d’objet](#par-catégorie-dobjet)
          - [Sous-groupes de données](#sous-groupes-de-données)
          - [Par objet](#par-objet)
      - [Remontages](#remontages)
      - [Visualisations interactives](#visualisations-interactives)
      - [Sorties graphiques](#sorties-graphiques)
      - [Statistiques spatiales](#statistiques-spatiales)
          - [Surfaces de régression](#surfaces-de-régression)
          - [Enveloppes convexes](#enveloppes-convexes)
          - [Estimation 2D de densité par
            noyau](#estimation-2d-de-densité-par-noyau)
      - [**Paramètres avancés**](#paramètres-avancés)
          - [Carroyage](#carroyage)
          - [Pré-sélection des
            paramètres](#pré-sélection-des-paramètres)
          - [Affichage réactif des
            visualisations](#affichage-réactif-des-visualisations)
  - [**Références**](#références)

# Installation

`archeoViz` peut être employée de deux manières:

  - localement, sur la machine de l’utilisateur
  - à distance, après déploiement sur un serveur distant

## Locale

Le package peut être installé depuis le CRAN:

``` r
install.packages("archeoViz")
```

La version de développement peut être télécharée depuis GitHub:

``` r
# install.packages("devtools")
devtools::install_github("sebastien-plutniak/archeoviz")
```

Après quoi, chargez le package et lancez l’application avec:

``` r
library(archeoViz)
archeoViz()
```

## Déployée

Pour déployer `archeoViz` sur votre Shiny server, téléchargez
premièrement le package:

``` r
# déterminez le répertoire de travail dans votre shiny server:
setwd(dir = "/some/path/")
# téléchargez le package:
download.file(url = "https://github.com/sebastien-plutniak/archeoviz/archive/master.zip",
              destfile = "archeoviz.zip")
# décompression:
unzip(zipfile = "archeoviz.zip")
```

Puis, rendez-vous à `https://<your-shiny-server>/archeoviz-main`.

Pour paramétrer l’application avec vos données et préférences, éditez le
fichier app.R situé à la racine du répertoire de l’application:

``` r
archeoViz(objects.df = NULL,   # data.frame pour les objets
          refits.df = NULL,    # data.frame optionnel pour les remontages
          timeline.df = NULL,  # data.frame optionnel pour la chronologie des fouilles
          default.group =NULL, # méthode de groupement des données,
                               # par couche ("by.layer") ou "by.variable"
          title = NULL,        # titre du site / du jeu de données
          home.text = NULL,    # contenu html à afficher sur la page d'accueil
          lang = "fr"          # langue de l'interface ("en": Anglais, "fr": Français, "pt": Portugais)
          set.theme = "cosmo") # thème graphique de l'interface Shiny
```

Les valeurs possibles pour le paramètre `set.theme` sont illustrées sur
[cette page](https://rstudio.github.io/shinythemes/). La langue de
l’application peut être définie avec le paramètre `lang`.

## Démonstration

Des instances de démonstration de l’application sont déployées sur le
Shiny server d’*Huma Num*:

  - [`archeoViz` en
    Français](https://analytics.huma-num.fr/archeoviz/fr).
  - [`archeoViz` en
    Anglais](https://analytics.huma-num.fr/archeoviz/en).
  - [`archeoViz` en
    Portugais](https://analytics.huma-num.fr/archeoviz/pt).

Pour un cas d’emploi réel, voir l’exemple de la grotte préhistorique du
[Poeymaü](https://analytics.huma-num.fr/Sebastien.Plutniak/poeymau/)
dans les Pyrénées (N.B. il s’agit dans ce cas d’une version modifiée de
l’application `archeoViz`).

# Recommandations communautaires

## Signaler un bug

Si vous rencontrez un bug, ouvrez une
[issue](https://github.com/sebastien-plutniak/archeoviz/issues) en
indiquant tous les détails nécessaires pour le reproduire.

## Suggérer un changement

Les suggestions de modifications sont bienvenues. Les demandes peuvent
concerner des fonctions additionnelles, des modifications dans la
documentation, des exemples additionnels, de nouvelles fonctionnalités,
etc. Elles peuvent être faite en ouvrant une
[issue](https://github.com/sebastien-plutniak/archeoviz/issues) ou,
mieux encore, en employant une *pull requests* et le modèle GitHub [Fork
and Pull](https://docs.github.com/articles/about-pull-requests).

# Utilisation

Considérant les restes archéologiques d’un site donné, `archeoViz` est
conçu pour réduire les freins techniques à la réalisation de trois
objectifs:

  - l’exploration spatiale basique et la production de documents
    graphiques analytiques;
  - la pré-publication rapide de données archéologiques, à destination
    de la communauté scientifique;
  - le déploiement aisé d’un outil d’exposition et de communication, à
    destination d’un plus large public.

N.B.: par conséquent, `archeoViz` n’t pas destiné à se substituer à des
outils d’analyse plus sophistiqués (e.g., SIG, packages statistiques,
etc.)

## Données

Il existe trois manières d’introduire des données dans `archeoViz`:

1.  en chargeant des tableaux à partir de l’onglet “Données”,
2.  en employant le générateur de données aléatoire dans l’onglet
    “Données”;
3.  en paramétrant la fonction `archeoViz` avant de lancer
    l’application.

### Par chargement de tableaux

Des tableaux pour trois types de données peuvent être chargés à partir
de l’onglet “Données”:

  - un tableau “objects” (requis), à propos des objets;
  - un tableau “refits” (optionnel), à propos des relations de
    remontage;
  - un tableau “timeline” (optionnel), à propos des carrés du site et
    des années où ils ont été fouillés.

Les tableaux doivent être au format .csv et la première ligne doit
contenir les noms des variables (le symbole séparateur du csv peut être
défini dans l’interface). Plus de détails à propos des formats et des
colonnes sont donnés dans l’onglet “Données”.

### Par génération de données aléatoires

À des fins de démonstration, il est possible d’employer des données
aléatoirement générées. Déplacer le curseur sur une valeur supérieure à
0, dans l’onglet “Données”, active cette fonctionnalité (replacer le
curseur sur 0 la désactive). Des données d’objets, de remontage, et de
chronologie de la fouille sont alors générés, permettant de tester
toutes les fonctionnalités d’`archeoViz`.

### Par paramétrage de la fonction

La fonction de lancement d’`archeoViz()` peut être exécutée sans définir
de paramètres:

``` r
archeoViz()
```

ou en employant les paramètres `objects.df`, `refits.df`, `timeline.df`
afin de charger des données relatives, respectivement, aux objets, aux
remontages, et à la chronologie.

``` r
archeoViz(objects.df = NULL,  # data.frame pour les objets
          refits.df = NULL,   # data.frame optionnel pour les remontages
          timeline.df = NULL) # data.frame optionnel pour la chronologie
```

## Sous-sélection de données

Après que les données soient chargées, des sous-sélection peuvent être
réalisées en employant les options du menu gauche de l’interface.
Plusieurs paramètres sont possibles: le mode de localisation, les
catégories des objets, et la définition de sous-groupes de données.

### Par mode de localisation

La localisation des objets archéologiques peut avoir été enregistrée de
différentes manières, plus ou moins précises: comme des points
(coordonnées xyz), sur des lignes, des plans, ou au sein de volumes
(intervalles de valeurs x, y et/ou z). Dans `archeoViz`, une distinction
est faite entre les localisations exactes (les points) et les autres
types de localisations vagues (lignes, plans, volumes). Les boutons
permettent de sélectionner le sous-ensemble de données correspondant à
l’un, l’autre, ou les deux modes de localisation.

### Par catégorie d’objet

Des sous-ensembles de données peuvent être définis à partir des
catégories des objets, en employant les champs “Variable” et “Valeurs”.
Après que l’une des variables ait été sélectionnée (“object\_type” ou
une autre “object\_” variable possible), ses valeurs apparaissent en
dessous et peuvent être sélectionnées en cochant les items. La sélection
doit être validée en cliquant sur le bouton “Valider”. Cette sélection
détermine les données qui seront présentées dans les graphiques et
tableaux.

### Sous-groupes de données

Il est, de plus, possible de préciser si les couleurs doivent être
définies en fonction des couches ou en fonction de la variable objet
sélectionnée.

Des sous-groupes de données peuvent être définies de deux manières: soit
par couche ou en fonction de la variable “object\_” sélectionnée. Cette
option détermine l’application des couleurs dans les graphiques 3D et 2D
et les sous-groupes de données auxquels sont appliqués les calculs de
surface de régression et d’enveloppes convexes.

### Par objet

Enfin, dans l’onglet “Vue 3D”, cliquer sur un point active l’affichage
d’information à son sujet dans le tableau présent sous la
visualisation.

## Remontages

Les remontages sont généralement enregistrés de deux manières par les
archéologues:

1.  par ensemble d’objets remontant entre eux: en employant alors un
    tableau à deux colonnes où une ligne correspond à un **objet**. La
    première colonne contient l’identifiant unique de l’objet et la
    deuxième colonne contient l’identifiant unique de l’ensemble
    d’objets remontant entre eux auquel l’objet considéré appartient.
2.  par relation de remontage: en employant alors un tableau à deux
    colonnes où une ligne correspond à un **relation de remontage**. La
    première colonne contient l’identifiant unique du premier objet et
    la deuxième colonne contient l’identifiant unique du deuxième objet.

Bien que la seconde structure de donnée soit plus précise, c’est la
pemière qui est le plus fréquemment employée.

Ces deux structures de données sont traitées différement dans
`archeoViz`:

  - les ensembles d’objets remontant entre eux doivent être décrits dans
    une colonne spécifique dans le tableau `objects.df` table (nommée
    par ex. `object_refits`) et sont représentés par la couleur des
    points dans les visualisations (comme pour tout autre variable);
  - les relations de remontage doivent être décrits dans un tableau
    `refits.df` et sont visualisés par des segments reliant les objets
    liés par des relations de remontage.

## Visualisations interactives

Les visualisations dans les onglets “Vue 3D”, “Carte”, “Section X” et
“Section Y” sont générées à l’aide de la librairie
[`plotly`](https://CRAN.R-project.org/package=plotly/). Toutes ces
visualisations sont dynamiques et sont surmontées d’une barre de menu
comportant plusieurs options (générer un fichier image, zoomer, déplacer
le point de vue, etc.). Davantage de détails sont disponibles sur le
[site de
plotly](http://plotly.github.io/getting-to-know-the-plotly-modebar/).

Cliquer sur un item de la légende modifie l’affichage:

  - un simple click sur un item active/désactive son affichage;
  - un double click sur un item limite l’affichage à cet item seul (un
    autre double click annule cette sélection).

Cette fonctionnalité permet de définir les couches devant être
affichées. De plus, la taille des points peut être ajustée, ainsi que
l’affichage ou non des relations de remontage.

## Sorties graphiques

Plusieurs sorties graphiques peuvent être générées dans `archeoViz`.

  - Toutes les visualisations générées avec `plotly` comportent une
    fonction d’exportation en format .svg.
  - le plan des fouilles (dans l’onglet “Chronologie”) peut être
    téléchargé au format .svg en cliquant sur le bouton en dessous.

## Statistiques spatiales

`archeoViz` comporte quelques fonctionnalités d’analyse spatiale,
destinées à usage simple et exploratoire.

### Surfaces de régression

Dans l’onglet “Vue 3D”, cliquer sur “Calculer les surfaces” puis
“Valider” affiche les surfaces de régression associées à chaque
sous-ensemble de points (couche), comportant au moins 100 points. Les
surfaces sont calculées grâce au modèle additif généralisé implémenté
dans le package [`mgcv`](https://CRAN.R-project.org/package=mgcv).

### Enveloppes convexes

Cliquer sur “Calculer les enveloppes” puis “Valider”, dans l’onglet “Vue
3D”, affiche les enveloppes convexes associées à chaque sous-ensemble de
points (couches), comportant au moins 20 points. Les enveloppes sont
calculées en employant le package
[`cxhull`](https://CRAN.R-project.org/package=cxhull).

### Estimation 2D de densité par noyau

Dans l’onglet “Plan”, cocher la case “Calculer la densité” et cliquer
sur “Valider” génère un plan comportant des lignes de contour
représentant la densité des points. La densité peut être calculée pour
l’ensemble des points ou par couche (comportant au moins 30 points).
L’estimation bidimensionnelle de densité par noyau est calculée avec
la fonction `kde2d` du package
[`MASS`](https://CRAN.R-project.org/package=MASS) (à travers le package
[`ggplot2`](https://CRAN.R-project.org/package=ggplot2)).

## Paramètres avancés

La fonction `archeoViz()` admet de nombreux paramètres optionels,
relatifs à:

  - les données à charger (traité
    [ci-dessus](#par-paramétrage-de-la-fonction)),
  - le contenu de la page d’accueil (traité [ci-dessus](#déployée)),
  - le carroyage,
  - le pré-paramètrage des paramètres pouvant être définis dans
    l’interface graphique,
  - le comportement réactif de l’application à propos du calcul et de
    l’affichage des viausalisations.

<!-- end list -->

``` r
archeoViz(objects.df=NULL, refits.df=NULL, timeline.df=NULL,
          title=NULL, home.text=NULL, lang="en", set.theme="cosmo",
          square.size = 100, reverse.axis.values = NULL, reverse.square.names = NULL,
          add.x.square.labels = NULL, add.y.square.labels = NULL,
          class.variable = NULL, class.values = NULL,
          default.group = "by.layer", location.mode = NULL,
          map.z.val = NULL, map.density = "no", map.refits = NULL,
          plot3d.hulls = NULL, plot3d.surfaces = NULL, plot3d.refits = NULL,
          sectionX.x.val = NULL, sectionX.y.val = NULL, sectionX.refits = NULL, 
          sectionY.x.val = NULL, sectionY.y.val = NULL, sectionY.refits = NULL,
          camera.center = NULL, camera.eye = NULL, run.plots = FALSE
          )
```

### Carroyage

``` r
archeoViz(square.size = 100,
          reverse.axis.values = NULL, reverse.square.names = NULL,
          add.x.square.labels = NULL, add.y.square.labels = NULL
          )
```

  - *square.size*: numérique. Size (width and height) in centimeter of
    the squares in the grid system. Default value is 100 cm.
  - *reverse.axis.values*: caractères. Whether to reverse the values of
    one or several axes (‘x’, ‘y’, ‘z’).
  - *reverse.square.names*: caractères. Whether to reverse the square
    names on the ‘x’, ‘y’ axes, or both (‘xy’).
  - *add.x.square.labels*: caractères. Additional square labels on the
    ‘x’ axis.
  - *add.y.square.labels*: caractères. Additional square labels on the
    ‘y’ axis.

### Pré-sélection des paramètres

``` r
archeoViz(class.variable = NULL, class.values = NULL,
          default.group = "by.layer", location.mode = NULL,
          map.z.val = NULL, map.density = "no", map.refits = NULL,
          plot3d.hulls = NULL, plot3d.surfaces = NULL, plot3d.refits = NULL,
          sectionX.x.val = NULL, sectionX.y.val = NULL, sectionX.refits = NULL, 
          sectionY.x.val = NULL, sectionY.y.val = NULL, sectionY.refits = NULL,
          camera.center = NULL, camera.eye = NULL
          )
```

  - *class.variable*: caractères. Au lancement de l’application, nom de
    la variable à pré-sélectionner.
  - *class.values*: caractères. Au lancement de l’application, nom des
    valeurs à pré-sélectionner.
  - *default.group*: caractères. Au lancement de l’application,
    pré-sélection de la variable à employer pour grouper les données
    (soit ‘by.layer’ ou ‘by.variable’).
  - *location.mode*: caractères. Au lancement de l’application,
    pré-sélection du ou des modes de localisation à afficher (soit
    ‘exact’, ‘fuzzy’, ou ‘exact.fuzzy’).
  - *map.z.val*: numérique. Au lancement de l’application, valeurs
    minimale et maximale des coordonnées Z à présélectionner dans la
    visualisation en plan.
  - *map.density*: caractères. Au lancement de l’application, calculer
    et afficher ou non les courbes de densité dans la visualisation en
    plan (soit ‘no’, ‘overall’, ou ‘by.variable’).
  - *map.refits*: TRUE ou FALSE. Afficher ou non les remontages dans la
    visualisation en plan.
  - *plot3d.hulls*: TRUE ou FALSE. Au lancement de l’application,
    calculer et afficher ou non les enveloppes convexes dans la
    visualisation 3D.
  - *plot3d.surfaces*: TRUE ou FALSE. Au lancement de l’application,
    calculer et afficher ou non les surfaces de régression dans la
    visualisation 3D.
  - *plot3d.refits*: TRUE ou FALSE. Au lancement de l’application,
    afficher ou non les remontages dans la visualisation 3D.
  - *sectionX.x.val*: numérique. Au lancement de l’application, valeurs
    minimale et maximale des coordonnées X à présélectionner dans la
    visualisation en section X.
  - *sectionX.y.val*: numérique. Au lancement de l’application, valeurs
    minimale et maximale des coordonnées Y à présélectionner dans la
    visualisation en section X.
  - *sectionX.refits*: TRUE ou FALSE. Au lancement de l’application,
    afficher ou non les remontages dans la visualisation en section X.
  - *sectionY.x.val*: numérique. Au lancement de l’application, valeurs
    minimale et maximale des coordonnées X à présélectionner dans la
    visualisation en section Y.
  - *sectionY.y.val*: numérique. Au lancement de l’application, valeurs
    minimale et maximale des coordonnées Y à présélectionner dans la
    visualisation en section Y.
  - *sectionY.refits*: TRUE ou FALSE. Au lancement de l’application,
    afficher ou non les remontages dans la visualisation en section Y.
  - *camera.center*: numérique. Au lancement de l’application,
    coordonnées du point vers lequel la caméra est orientée dans la
    visualisation 3D (valeurs par défaut: x=0, y=0, z=0).
  - *camera.eye*: numérique. Au lancement de l’application, coordonnées
    de la position de la caméra dans la visualisation 3D (valeurs par
    défaut: x=1.25, y=1.25, z=1.25).

### Affichage réactif des visualisations

``` r
archeoViz(run.plots = FALSE)
```

  - *run.plots*: TRUE ou FALSE. Si les visualisations doivent, ou non,
    être immédiatement calculées et affichées (sans nécessiter un click
    sur les boutons de l’interface).

# Références

  - Plutniak, Sébastien. 2023. “archeoViz. Visualisation, Exploration,
    and Web Communication of Archaeological Excavation Data”. v0.2.1,
    DOI:
    [10.5281/zenodo.7512526](https://doi.org/10.5281/zenodo.7512526).
