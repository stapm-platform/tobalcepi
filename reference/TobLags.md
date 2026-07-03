# Tobacco lag times

Prepare the disease specific functions that describe how a change in
tobacco consumption gradually has an effect on the relative risk of
disease incidence over time (up to 40 years) since e.g. someone quit
smoking

## Usage

``` r
TobLags(
  disease_name = c("Pharynx", "Oral_cavity"),
  n_years = 40,
  lag_data = tobalcepi::tobacco_lag_times,
  other_lag_function = "Cancers"
)
```

## Arguments

- disease_name:

  Character - the name of the disease under consideration.

- n_years:

  Integer - the number of years from 1 to n over which the effect of a
  change in consumption emerges. Defaults to 40 years to fit with the
  current lag data.

- lag_data:

  Data table containing the numerical description of the lag function.
  The data table "tobacco lag times" is embedded within the stapmr
  package.

- other_lag_function:

  Character - the name of the lag function to use for tobacco related
  conditions that are not categorised as CVD, COPD, or Cancer. Options:
  c("Cancers", "CVD", "COPD", "immediate"). The default is "Cancers",
  which gives the most conservative (i.e. slowest) estimate of the rate
  of decline in the risk of disease after quitting smoking.

## Value

Returns a data table with two columns - one for the years since
consumption changed, and the other that gives the proportion by which
the effect of a change in consumption on an individual's relative risk
of disease has so far emerged.

## Details

All lag times are taken from a re-analysis of the Cancer prevention II
study by Oza et al. (2011) and Kontis et al. (2014) . The values were
sent to us on request by Kontis. Lags are smoothed functions over time
describing the proportion of the excess risk due to smoking that still
remains.

Kontis et al. re-analysed the change in risk after smoking in the
ACS-CPS II study from Oza et al., producing three functions to describe
the decline in risk after quitting for each of cancers, CVD and COPD.
The estimates were informed by data on former smokers with known quit
dates who were disease-free at baseline. The results show the proportion
of excess relative risk remaining at each time-point since cessation. A
cross-check showed that the figures for cancers were broadly consistent
with the findings of the International Agency for Research on Cancer's
(IARC) 2007 review of the decline in risk after quitting smoking.

The remaining question is how risk declines after quitting smoking for
diseases that are not cancers, CVD or COPD. Kontis et al. state that
"Randomised trials also indicate that the benefits of behaviour change
and pharmacological treatment on diabetes risk occur within a few years,
more similar to the CVDs than cancers. Therefore, we used the CVD curve
for diabetes." In-line with Kontis, we apply the rate of decline in risk
of CVD after quitting smoking to type 2 diabetes. For all remaining
conditions we apply the most conservative estimate available and assume
that the decline in risk follows the cancer estimate provided by Kontis
et al., as this has the slowest decline in risk.

## References

Kontis V, Mathers CD, Rehm J, Stevens GA, Shield KD, Bonita R, Riley LM,
Poznyak V, Beaglehole R, Ezzati M (2014). “Contribution of six risk
factors to achieving the 25× 25 non-communicable disease mortality
reduction target: a modelling study.” *The Lancet*, **384**(9941),
427-437. ISSN 0140-6736.

Oza S, Thun MJ, Henley SJ, Lopez AD, Ezzati M (2011). “How many deaths
are attributable to smoking in the United States? Comparison of methods
for estimating smoking-attributable mortality when smoking prevalence
changes.” *Preventive medicine*, **52**(6), 428-433. ISSN 0091-7435.

## Examples

``` r
if (FALSE) { # \dontrun{
TobLags("Pharynx")

TobLags("Low_back_pain", other_lag_function = "immediate")
TobLags("Low_back_pain", other_lag_function = "CVD")
TobLags("Low_back_pain", other_lag_function = "Cancers")
} # }
```
