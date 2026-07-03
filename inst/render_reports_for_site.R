# edit reports/Some_report.Rmd, then:
source("reports/render_reports.R")
render_report("Smoking_and_the_risks_of_adult_diseases.Rmd")  # regenerates just that output
render_report("Alcohol-attributable_diseases_and_dose-response_curves.Rmd")
render_report("PAF_methodology_report.Rmd")


pkgdown::build_site()        # copies the fresh output in from assets
pkgdown::deploy_to_branch()
