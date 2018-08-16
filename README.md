# MouseCortex
R data package for the 2017 Cell Reports paper [Developmental emergence of adult neural 
stem cells as revealed by single cell transcriptional profiling](https://doi.org/10.1016/j.celrep.2017.12.017) 
by Yuzwa, Borrett, *et al.*

## Abstract
Adult neural stem cells (NSCs) derive from embryonic precursors, but little 
is known about how or when this occurs. We have addressed this issue using single-cell 
RNA sequencing at multiple developmental time points to analyze the embryonic murine 
cortex, one source of adult forebrain NSCs. We computationally identify all major 
cortical cell types, including the embryonic radial precursors (RPs) that generate 
adult NSCs. We define the initial emergence of RPs from neuroepithelial stem cells at 
E11.5. We show that, by E13.5, RPs express a transcriptional identity that is 
maintained and reinforced throughout their transition to a non-proliferative state 
between E15.5 and E17.5. These slowly proliferating late embryonic RPs share a core 
transcriptional phenotype with quiescent adult forebrain NSCs. Together, these 
findings support a model wherein cortical RPs maintain a core transcriptional identity 
from embryogenesis through to adulthood and wherein the transition to a quiescent 
adult NSC occurs during late neurogenesis.

## Usage
There are four files representing scRNAseq data from mouse embryonic 
cortically-derived cells from E11.5 to E17.5.  
You can install this package by running:
```
devtools::install_github("BaderLab/MouseCortex")
```
It takes a while for this command to run, since github is compressing the input data 
prior to downloading and installing.

The files included are:  
- E11.5: e11cortical_forViz.RData
- E13.5: e13cortical_forViz.RData
- E15.5: e15cortical_forViz.RData
- E17.5: e17cortical_forViz.RData

To view the data in [*scClustViz*](https://baderlab.github.io/scClustViz), it must also 
be installed by running:  
```
devtools::install_github("BaderLab/scClustViz")
```
Installing *org.Mm.eg.db* from Bioconductor is also suggested for annotation purposes:
```
source("https://bioconductor.org/biocLite.R")
biocLite("org.Mm.eg.db")
```
Then the data can be viewed in the *scClustViz* Shiny app by running:
```
runShiny(system.file("e15cortical_forViz.RData",package="MouseCortex"),
         # You can replace "e15cortical_forViz.RData" with any of the files above.
         annotationDB="org.Mm.eg.db",
         # This is an optional argument, but if present will add genenames to some figures.
         cellMarkers=list("Cortical precursors"=c("Mki67","Sox2","Pax6","Pcna","Nes","Cux1","Cux2"),
                          "Interneurons"=c("Gad1","Gad2","Npy","Sst","Lhx6","Tubb3","Rbfox3","Dcx"),
                          "Cajal-Retzius neurons"="Reln",
                          "Intermediate progenitors"="Eomes",
                          "Projection neurons"=c("Tbr1","Satb2","Fezf2","Bcl11b","Tle4",
                                                 "Nes","Cux1","Cux2","Tubb3","Rbfox3","Dcx"))
         # This is a list of canonical marker genes per expected cell type in the data.
         # The app uses this (optional) list to automatically annotate clusters.
         )
```
*scClustViz* is a visualization tool for single-cell RNAseq designed to assess clustering results 
for biological relevance using a metric based on differential gene expression between clusters. It 
also has figures designed for the identification of clusters and their marker genes. See 
[the website](https://baderlab.github.io/scClustViz) and upcoming paper for more details.
