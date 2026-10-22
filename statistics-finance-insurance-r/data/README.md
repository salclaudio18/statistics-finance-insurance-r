# Data files

The CSV bytes are unchanged from the supplied educational project. Only the
filenames have been standardized.

## Housing: `house_prices.csv`

4,548 observations; all six columns are numeric; no missing entries.

| Column | Description in the original report |
| --- | --- |
| `Avg. Area Income` | Average area income, in dollars |
| `House Age` | House age, in years |
| `Number of Rooms` | Number of rooms |
| `Number of Bedrooms` | Number of bedrooms |
| `Area Population` | Area population |
| `Price` | House price, in dollars; response |

Some counts are non-integer values. Without the original source documentation,
their precise aggregation or construction cannot be established. The reported
US setting is the original authors' description, not independently verified
geographic provenance.

## Bank marketing: `bank_marketing.csv`

4,521 observations; seven numeric predictors and one string target; no missing
entries. `y = yes`: 521; `y = no`: 4,000.

| Column | Description in the original report |
| --- | --- |
| `age` | Customer age |
| `balance` | Average annual balance in euros |
| `day` | Day of last contact |
| `duration` | Last contact duration, in seconds; unavailable before that contact |
| `campaign` | Number of contacts during the current campaign |
| `pdays` | Days since previous campaign contact; supplied data include -1 |
| `previous` | Number of contacts before the current campaign |
| `y` | Term-deposit subscription: yes/no |

The revised source retains the supplied numeric encoding of `pdays`, including
-1. A future revision should verify its meaning against the primary data
dictionary and evaluate an explicit never-contacted indicator if appropriate.

## Provenance

The supplied files do not include primary-source URLs, data licenses or a record
of filtering/subsampling. The banking context is described as Portuguese bank
marketing in the original report. These files are not asserted to be official,
complete or unmodified copies of any particular public dataset.
