# Mental Health Care in Multi-User Virtual Reality: The Journey from Non-Immersive to Immersive Applications

## Data
- (PUBMED 1139) csv-19992024dp-set.csv: Original list of records downloaded from pubmedd
- (WOS 1540) savedrecs.xls: Original list of records obtained from WOS
- Papers imported_exported_1.csv: Final edited table downloaded after screening for table generation anbd flowchart generation purposes. Extends the merged dataset with screening information and notes

## Code
- papers-merge.R: Code to merge and filter the data from pubmed and wos to be imported into the screening tool
- tables-report.qmd: Quarto file to generate tables to be included in the final manuscript (and some other tables not eventually included)
- prisma-report.qmd: Prisma flowchart generating code. This has not been used to generate the flowchart in the manuscript, due to changes we implemented in the process which could not be implemented in code. The values can be off by a few records, as the categories we used and which are traditionally used in PRISMA are slightly different.
