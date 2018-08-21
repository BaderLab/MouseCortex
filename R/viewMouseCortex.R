#' View MouseCortex data in the scClustViz Shiny app
#'
#' A wrapper function to view one of the four \code{MouseCortex} datasets in the
#' \code{scClustViz} Shiny app.
#'
#' @param timepoint One of "e11", "e13", "e15", "e17".  Referring to the
#'   different datasets in this package, which each represent an embryonic day
#'   during mouse development from which the cerebral cortex was dissected and
#'   single-cell RNAseq data collected.
#'
#' @param outPath Default = "./" (the working directory). Specify the directory
#'   used to save/load any analysis files you generate while exploring the
#'   \code{MouseCortex} data.
#'
#' @return The function causes the scClustViz Shiny GUI app to open in a
#'   seperate window.
#'
#' @examples
#'   viewMouseCortex("e11")
#'
#' @seealso \url{https://baderlab.github.io/scClustViz} for information on
#'   \code{scClustViz}. Install by running
#'   \code{devtools::install_github("BaderLab/scClustViz")}.
#'
#' @export

viewMouseCortex <- function(timepoint,outPath="./") {
  if (!timepoint %in% c("e11","e13","e15","e17")) {
    stop('timepoint must be one of "e11", "e13", "e15", "e17"')
  }
  filePath <- system.file(paste0(timepoint,"/",timepoint,".RData"),package="MouseCortex")
  cellMarkers <- list("Cortical precursors"=c("Mki67","Sox2","Pax6",
                                              "Pcna","Nes","Cux1","Cux2"),
                      "Interneurons"=c("Gad1","Gad2","Npy","Sst","Lhx6",
                                       "Tubb3","Rbfox3","Dcx"),
                      "Cajal-Retzius neurons"="Reln",
                      "Intermediate progenitors"="Eomes",
                      "Projection neurons"=c("Tbr1","Satb2","Fezf2",
                                             "Bcl11b","Tle4","Nes",
                                             "Cux1","Cux2","Tubb3",
                                             "Rbfox3","Dcx")
  )

  if (require("org.Mm.eg.db",quietly=T)) {
    annotationDB <- org.Mm.eg.db
    scClustViz::runShiny(filePath=filePath,
                         outPath=outPath,
                         cellMarkers=cellMarkers,
                         annotationDB=annotationDB)

  } else {
    scClustViz::runShiny(filePath=filePath,
                         outPath=outPath,
                         cellMarkers=cellMarkers)
  }
}
