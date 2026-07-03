# Dose-response relative risks for tobacco-related cancers **\[experimental\]**

Computes the relative risks for each tobacco-related cancer based on the
published risk curves.

## Usage

``` r
RRTobDR(data, disease = "Pharynx", av_cigs_day = "cigs_per_day")
```

## Arguments

- data:

  Data table of individual characteristics.

- disease:

  Character - the name of the disease for which the relative risks will
  be computed.

- av_cigs_day:

  Character - the name of the variable containing each individual's
  average number of daily cigarettes.

## Value

Returns a numeric vector of each individual's relative risks for the
tobacco related disease specified by "disease".

## Details

Relative risks for come from published risk functions whose parameters
have been hard-coded within this function rather than being read from an
external spreadsheet. These relative risks are based on an individual's
current smoking intensity. There are others measures of smoking exposure
including smoking duration and pack-years, which we will come to think
about further.

## Examples

``` r

if (FALSE) { # \dontrun{

RRTobDR(data = data,
       disease = "Pharynx",
       av_cigs_day = "cigs_per_day"
       )

} # }
```
