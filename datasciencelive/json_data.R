library(dplyr)
library(jsonlite)

# read raw JSON data
exim_raw <- fromJSON("https://datasciencelive.com/data/eximbank.json")
head(exim_raw)

exim.meta <- exim_raw$meta
exim.df <- exim_raw$data

eximbank <-as_tibble(exim.df)

# identify column names
exim_meta_colname <- exim.meta$view$columns$fieldName
exim_meta_colname

# rename columns
names(eximbank) <- exim_meta_colname

# summarise data
program.type <- eximbank %>%
        select(program) %>%
        group_by(program) %>%
        summarise(approved_program = n()) %>%
        arrange(desc(approved_program))

program.type

# A tibble: 4 x 2
#program         approved_program
#<chr>                      <int>
#1 Insurance                  34470
#2 Working Capital             5531
#3 Guarantee                   2183
#4 Loan                         338