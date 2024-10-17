# Mental Health Care in Multi-User Virtual Reality: The Journey from Non-Immersive to Immersive Applications

## Data
- data/(PUBMED 1139) csv-19992024dp-set.csv: Original list of records downloaded from pubmedd
- data/(WOS 1540) savedrecs.xls: Original list of records obtained from WOS
- processed/papers_screened.csv: Merged list of manuscripts (from data) included in the selection process.
- processed/papers_screening_3.csv: List of manuscripts screened by full-text assessment of contents during the last phase.
- processed/papers_included.csv: Final list of publications included in the paper.

## Code
- papers-merge.R: Code to merge and filter the data from pubmed and wos to be imported into the screening tool
- tables-report.qmd: Quarto file to generate tables to be included in the final manuscript (and some other tables not eventually included)
- prisma-report.qmd: Prisma flowchart generating code. This has not been used to generate the flowchart in the manuscript, due to changes we implemented in the process which could not be implemented in code. The values can be off by a few records, as the categories we used and which are traditionally used in PRISMA are slightly different.
