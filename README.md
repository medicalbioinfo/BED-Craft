# BED-Craft
BED-Craft for nanopore adaptive sampling

<hr>

BED-Craft is a tool that allows you to easily create BED files, which are required for nanopore adaptive sampling, using multiple gene names as input files.  
Details of this tool will be described in a paper by Miya F and Kosaki K (in press, 2025) (currently being submitted).




## License
BED-Craft code is provided under the GPLv3 license.

## Installation
You can use it simply by downloading the entire BED-Craft folder.  
BED-Craft requires perl 4 or 5.

## Usage
```cd BED-Craft```  
 
```perl BED-Craft.pl input.txt```  

<img src="https://github.com/user-attachments/assets/a0baa854-8c7d-4811-835e-2b4973b1f019" alt="example" width="450" />
  
  
### Optional parameters:  

```perl BED-Craft.pl input_gene_symbol_name_file.txt [-build <hg19|hg38|CHM13>] [-buffer <number>] [-chr <yes|no>]```

* **-build**  
You can choose the version of the human reference genomes from either hg19, hg38 or CHM13（<hg19|hg38|CHM13>). The default is hg38.  
 
* **-buffer**  
You can set the length of the extended region ("buffer") that is set on both sides of the genes. The default size is 50000. 
 
* **-chr**  
  You can choose whether or not to add "chr" to the chromosome number (<yes|no>). The default is yes.  
  
<hr>  
  
## Version information for the gene annotation used to create the gene location information file for this tool

### hg19 (GRCh37)
* RefSeq: <a href="https://ftp.ncbi.nlm.nih.gov/refseq/H_sapiens/annotation/GRCh37_latest/refseq_identifiers/">RefSeq GCF_000001405.25_GRCh37.p13_genomic.gtf</a>  
* Ensembl: <a ref="https://ftp.ensembl.org/pub/grch37/release-87/gtf/homo_sapiens/Homo_sapiens.GRCh37.87.chr.gtf.gz">Homo_sapiens.GRCh37.87.chr.gtf</a>  

### hg38 (GRCh38)
* MANE transcript: <a href="https://ftp.ncbi.nlm.nih.gov/refseq/MANE/MANE_human/">MANE.GRCh38.v1.4.summary.txt</a>  
* RefSeq: <a href="https://ftp.ncbi.nlm.nih.gov/refseq/H_sapiens/annotation/GRCh38_latest/refseq_identifiers/">GRCh38_latest_genomic.gtf</a> (GRCh38.p14, Oct16, 2023 updated version)    
* Ensembl: <a ref="https://ftp.ensembl.org/pub/release-113/gtf/homo_sapiens/">Homo_sapiens.GRCh38.113.chr.gtf</a>  

### CHM13 (T2T-CHM13 v2.0)
* <a href="https://github.com/marbl/CHM13">chm13v2.0_RefSeq_Liftoff_v5.2.gff3</a>  

  
<hr>  
    
## Citation
If you submit a paper using this tool, please cite Miya F and Kosaki K. (2025) (in preparation).  

<hr>  
    
