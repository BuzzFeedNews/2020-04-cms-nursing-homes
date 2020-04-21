# Nursing Home Inspections Analysis — Infection Control, Ulcer Care, and Medication Errors

This repository contains data and code supporting a BuzzFeed News article on nursing home facilities, published April 21, 2020. See below for details.

## Data

All data analyzed here comes from the Centers for Medicare and Medicaid Services (CMS) [Nursing Home Compare](https://data.medicare.gov/data/nursing-home-compare).

The following files are downloaded via the Socrata API and stored locally: 

- [data/health_deficiencies.csv](data/health_deficiencies.csv): Health related deficiencies recorded from the past three inspection cycles. __Note:__ This file is too large to store on GitHub and must be downloaded via the [notebooks/get-deficiencies.ipynb](notebooks/get-deficiencies.ipynb) notebook.
- [data/staffing.csv](data/staffing.csv): Staffing levels recorded by CMS.
- [data/survey.csv](data/survey.csv): The date of each standard inspection across three inspection cycles.

This following file was downloaded manually from the Nursing Home Compare [open data portal](https://data.medicare.gov/data/nursing-home-compare):

- [data/NHCDownloadableDatabaseDictionaries](data/NHCDownloadableDatabaseDictionaries/): Data dictionaries for the above.

## Notebooks

The following Jupyter notebooks, written in Python, fetch and analyze the data described above:

- [notebooks/get-deficiencies.ipynb](notebooks/get-deficiencies.ipynb): Fetches the latest CMS nursing home health deficiencies dataset and saves it in `data`.
- [notebooks/get-staffing.ipynb](notebooks/get-staffing.ipynb): Fetches the latest CMS nursing home staffing data and saves it in `data`.
- [notebooks/get-survey.ipynb](notebooks/get-survey.ipynb): Fetches the latest CMS survey data and saves it in `data`.
- [notebooks/analyze-deficiencies.ipynb](notebooks/analyze-deficiencies.ipynb): Analyzes the CMS nursing home health inspection data. Also makes use of the survey dataset.
- [notebooks/analyze-staffing.ipynb](notebooks/analyze-staffing.ipynb): Analyzes the CMS nursing home staffing data.

## Notes on deficiencies

The deficiencies dataset is organized as one deficiency per row. A facility may, and often does, incur more than one deficiency per inspection. A facility with no deficiencies will not appear in this dataset.

CMS-regulated nursing homes are inspected in 15-month "cycles." The time-based analyses in this repository divide facilities by cycle, rather than by year. To calculate the percent of facilities with certain deficiencies, we took as numerator all facilities inspected in a given inspection cycle. That number can be derived from the separate [survey dataset](data/survey.csv).

### "F tags"

Deficiencies are categorized by certain "F tags" which are defined in the supporting documents on [data.medicare.gov](https://data.medicare.gov/data/nursing-home-compare). In 2017, a number of F tags for the same deficiency changed. CMS provides a [crosswalk](https://www.cms.gov/Medicare/Provider-Enrollment-and-Certification/GuidanceforLawsAndRegulations/Nursing-Homes) to link older tags with newer ones. To count deficiencies, we searched on both the old and the new F tags to capture a range of time. Infection control deficiencies were indicated with F tags 0880 and 0441. Serious medication errors were indicated with F tags 0686 and 0314. Pressure sore deficiencies were indicated with F tags 0686 and 0314.

### Immediate jeopardy violations

CMS assigns a "scope and severity" level to violations. The most severe are labeled "immediate jeopardy" deficiencies. These are violations where one or more residents or employees are in immediate danger of being harmed, although a resident does not have to be harmed at the time for this violation to occur. According to the CMS Nursing Home Compare [technical guide](https://www.cms.gov/Medicare/Provider-Enrollment-and-Certification/CertificationandComplianc/downloads/usersguide.pdf), there are three categories of immediate jeopardy violations which correspond to their scope: "immediate", "pattern" and "widespread". They are assigned letter codes I, J and K, respectively. These are available in the `scope_severity_code` column of [health_deficiencies.csv](data/health_deficiencies.csv).


## Reproducibility

The analysis is written in Python 3, and requires the Python libraries specified in `requirements.txt`. To replicate the analysis, run `make replicate` from this repository's root directory. 

## Licensing

All code in this repository is available under the [MIT License](https://opensource.org/licenses/MIT). Files in the `output/` directory are available under the [Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/) (CC BY 4.0) license.

## Questions / Feedback

Contact Scott Pham at [scott.pham@buzzfeed.com](mailto:scott.pham@buzzfeed.com).

Looking for more from BuzzFeed News? [Click here for a list of our open-sourced projects, data, and code.](https://github.com/BuzzFeedNews/everything)
