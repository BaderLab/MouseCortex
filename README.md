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
There are four datasets representing scRNAseq data from mouse embryonic 
cortically-derived cells from embryonic days 11.5 (e11), 13.5 (e13), 15.5 (e15), and 17.5 (e17).  
You can install this package by running:
```{r}
install.packages("devtools")
devtools::install_github("BaderLab/MouseCortex")
```
It takes a while for this command to run, since data files are larger than your usual github code.

Then the data can be viewed in the [*scClustViz*](https://baderlab.github.io/scClustViz) Shiny app by running:
```{r}
MouseCortex::viewMouseCortex("e11")
```
Installing *org.Mm.eg.db* from Bioconductor is also suggested for annotation purposes:
```{r}
source("https://bioconductor.org/biocLite.R")
biocLite("org.Mm.eg.db")
```
*scClustViz* is a visualization tool for single-cell RNAseq designed to assess clustering results 
for biological relevance using a metric based on differential gene expression between clusters. It 
also has figures designed for the identification of clusters and their marker genes. See 
[the website](https://baderlab.github.io/scClustViz) and upcoming paper for more details.
