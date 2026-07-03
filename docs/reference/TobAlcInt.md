# Risk interaction between tobacco and alcohol

Assigns the disease-specific interaction term (synergy index)
appropriate to each individual's tobacco and alcohol consumption.

## Usage

``` r
TobAlcInt(
  data,
  disease = "Pharynx",
  alcohol_var = "weekmean",
  tobacco_var = "smk.state",
  rr.data,
  account_for_synergy = TRUE
)
```

## Arguments

- data:

  Data table - containing the individual characteristics of smokers and
  drinkers

- disease:

  Character

- alcohol_var:

  Character

- tobacco_var:

  Character

- rr.data:

  Data table

- account_for_synergy:

  Logical

## Value

Returns a numeric vector containing of each individual's relative risks
for the tobacco-related disease specified by "disease".

## Details

We currently include estimates of synergistic effects for oral,
pharyngeal, laryngeal and oesophageal cancers (we describe these data
and their sources in our tobacco risk functions report Webster et al.
(2018) ). The data sources we use are Prabhu et al. (2014) and Hashibe
et al. (2009) . We apply these effects by scaling the joint risks by a
'synergy index', which takes the result of a meta-analysis of the
additional risk faced by people because they consume both tobacco and
alcohol.

## References

Webster L, Angus C, Brennan A, Gillespie D (2018). “Smoking and the
risks of adult diseases.”
[doi:10.15131/shef.data.7411451](https://doi.org/10.15131/shef.data.7411451)
.

Hashibe M, Brennan P, Chuang SC, Boccia S, Castellsague X, Chen C,
Curado MP, Dal Maso L, Daudt AW, Fabianova E, Fernandez L, Wunsch-Filho
V, Franceschi S, Hayes RB, Herrero R, Kelsey K, Koifman S, La Vecchia C,
Lazarus P, Levi F, Lence JJ, Mates D, Matos E, Menezes A, McClean MD,
Muscat J, Eluf-Neto J, Olshan AF, Purdue M, Rudnai P, Schwartz SM, Smith
E, Sturgis EM, Szeszenia-Dabrowska N, Talamini R, Wei QY, Winn DM,
Shangina O, Pilarska A, Zhang ZF, Ferro G, Berthiller J, Boffetta P
(2009). “Interaction between Tobacco and Alcohol Use and the Risk of
Head and Neck Cancer: Pooled Analysis in the International Head and Neck
Cancer Epidemiology Consortium.” *Cancer Epidemiology Biomarkers &
Prevention*, **18**(2), 541-550. ISSN 1055-9965.
[doi:10.1158/1055-9965.epi-08-0347](https://doi.org/10.1158/1055-9965.epi-08-0347)
.

Prabhu A, Obi KO, Rubenstein JH (2014). “The Synergistic Effects of
Alcohol and Tobacco Consumption on the Risk of Esophageal Squamous Cell
Carcinoma: A Meta-Analysis.” *American Journal of Gastroenterology*,
**109**(6), 821-827. ISSN 0002-9270.
[doi:10.1038/ajg.2014.71](https://doi.org/10.1038/ajg.2014.71) .

## Examples

``` r

if (FALSE) { # \dontrun{

TobAlcInt()

} # }

```
