# Alcohol lag times

Prepare the disease specific functions that describe how a change in
alcohol consumption gradually has an effect on the relative risk of
disease incidence over time (up to 20 years) since alcohol consumption
changed.

## Usage

``` r
AlcLags(disease_name = c("Pharynx", "Oral_cavity"), n_years = 20)
```

## Arguments

- disease_name:

  Character - the name of the disease under consideration.

- n_years:

  Integer - the number of years from 1 to n over which the effect of a
  change in consumption emerges. Defaults to 20 years to fit with the
  current lag data.

## Value

Returns a data table with two columns - one for the years since
consumption changed, and the other that gives the proportion by which
the effect of a change in consumption on an individual's relative risk
of disease has so far emerged.

## Details

All lag times are taken from the review by Holmes et al. (2012) , and
are the numbers used in the current version of SAPM.

## References

Holmes J, Meier PS, Booth A, Guo Y, Brennan A (2012). “The temporal
relationship between per capita alcohol consumption and harm: a
systematic review of time lag specifications in aggregate time series
analyses.” *Drug and alcohol dependence*, **123**(1-3), 7–14.

## Examples

``` r
if (FALSE) { # \dontrun{
AlcLags("Pharynx")
} # }
```
