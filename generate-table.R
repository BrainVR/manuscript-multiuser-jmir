library(dplyr)
library(PRISMAstatement)

df_papers <- read.csv("data/Papers imported_exported_1.csv")
count(df_papers, source)

table(df_papers$SelectionPhase1)
n_screened <- nrow(df_papers)
n_dupes <- nrow(filter(df_papers, source == "pubmed, wos" | SelectionPhase1 == "Duplicate"))

n_phase1 <- nrow(filter(df_papers, SelectionPhase1 == "Good"))

n_phase2 <- nrow(filter(df_papers, FinalSelected == "YES"))

n_phase3 <- nrow(filter(df_papers,
                        FinalSelected == "YES", 
                        Phase3DropReason == ""))
n_phase3_reviews <- nrow(filter(df_papers, 
                                FinalSelected == "YES", 
                                Phase3DropReason == "",
                                IsReview == TRUE))
prisma(found = n_screened + n_dupes,
       found_other = 0,
       np_dupes = n_dupes,
       screened = n_screened,
       screen_exclusions = n_screened - n_phase1,
       full_text = n_phase1,
       full_text_exclusions = n_phase2)
