library(readxl)
library(dplyr)

df_pubmed <- read.table("data/(PUBMED 1139) csv-19992024dp-set.csv",
                        header = TRUE, sep = ",") %>%
  mutate(source = "PUBMED")

df_wos <- readxl::read_excel("data/(WOS 1540) savedrecs.xls") %>%
  mutate(source = "WOS") %>%
  rename("Title" = "Article Title")

# do full join and add suffixes to the columns even when unique
df_merged <- full_join(df_pubmed, df_wos, by = c("DOI" = "DOI"),
                       suffix = c(".pubmed", ".wos"))

# create column source with the source of the data
# If the data is from pubmed, the value is "PUBMED", if wos then wos and it also could be both
df_merged <- df_merged %>%
  mutate(source = ifelse(!is.na(source.pubmed) & !is.na(source.wos),
                         "pubmed, wos",
                         ifelse(!is.na(source.pubmed),
                                "pubmed",
                                "wos")),
          Authors = ifelse(!is.na(Authors.wos),
                            Authors.wos,
                            Authors.pubmed),
          Year = ifelse(!is.na(`Publication Year`),
                        `Publication Year`,
                        Publication.Year),
          Title = ifelse(!is.na(Title.wos),
                          Title.wos,
                          Title.pubmed),
          Journal = ifelse(!is.na(`Source Title`),
                           `Source Title`,
                           Journal.Book))

## To simplify, I dropped conference papers and 3 books
df_merged <- df_merged %>%
  select(-c(source.wos, source.pubmed, Authors.pubmed, Authors.wos, Title.pubmed, Title.wos)) %>%
  select(-c(PCMID, NIHMS.ID)) %>%
  select(-c(`Cited References`, 
            starts_with("Funding"), ends_with("Addresses"), ends_with("Status"),
            ends_with("Abbreviation")))

df_merged <- df_merged %>%
  filter(`Publication Type` == "J" | is.na(`Publication Type`)) %>%
  select(Title, Authors, Journal, Year, Abstract, DOI, source, `Research Areas`, `Author Keywords`)

df_merged %>%
  write.csv("merged.csv", row.names = FALSE)

# ---------------------------------------
