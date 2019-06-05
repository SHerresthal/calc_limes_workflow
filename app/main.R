library(fastgenomicsR)
fg <- fastgenomicsR::Process()

write_summary(fg)
print(paste0("Writing knit to: ", fg@output$index@path))
rmarkdown::render('/app/main.Rmd', output_file=fg@output$index@path, intermediates_dir="/tmp")
