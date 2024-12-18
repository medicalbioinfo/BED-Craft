# BED-Craft
BED-Craft for nanopore adaptive sampling

<hr>

BED-Craft is a tool that allows you to easily generate BED files, which are required for nanopore adaptive sampling, using multiple gene names as input files.  
Details of this tool will be described in a paper by Miya F and Kosaki K (2025?) (currently being submitted).




## License
BED-Craft code is provided under the GPLv3 license.

## Installation
You can use it simply by downloading the entire BED-Craft folder.  
BED-Craft requires perl 4 or 5.

## Usage
```cd BED-Craft```  
 
```perl BED-Craft.pl input.txt```  


<img src="https://github.com/user-attachments/assets/83f160e3-b809-4fe9-82fa-7091fce54a05" width="550">



  
### Optional parameters:  

```perl BED-Craft.pl input.txt [-genome <hg19|hg38|CHM13|mm10|mm39|other>] [-buffer <number>] [-chr <yes|no>]```

* **-build**  
You can choose the version of the human reference genomes from either hg19, hg38, and CHM13（<hg19|hg38|CHM13>), mouse reference genomes mm10 and mm39 (<mm10|mm39>). The default is hg38.  
 
* **-buffer**  
You can set the length of the extended region ("buffer") that is set on both sides of the genes. The default size is 50000. 
 
* **-chr**  
  You can choose whether or not to add "chr" to the chromosome number (<yes|no>). The default is yes.  
  
<hr>  
  
## Version information for the gene annotation used to create the gene location information file for this tool

### hg19 (GRCh37)
* RefSeq: <a href="https://ftp.ncbi.nlm.nih.gov/refseq/H_sapiens/annotation/GRCh37_latest/refseq_identifiers/">RefSeq GCF_000001405.25_GRCh37.p13_genomic.gtf</a>  
* Ensembl: <a href="https://ftp.ensembl.org/pub/grch37/release-87/gtf/homo_sapiens/">Homo_sapiens.GRCh37.87.chr.gtf</a>  

### hg38 (GRCh38)
* MANE transcript: <a href="https://ftp.ncbi.nlm.nih.gov/refseq/MANE/MANE_human/">MANE.GRCh38.v1.4.summary.txt</a>  
* RefSeq: <a href="https://ftp.ncbi.nlm.nih.gov/refseq/H_sapiens/annotation/GRCh38_latest/refseq_identifiers/">GRCh38_latest_genomic.gtf</a> (GRCh38.p14)    
* Ensembl: <a href="https://ftp.ensembl.org/pub/release-113/gtf/homo_sapiens/">Homo_sapiens.GRCh38.113.gtf</a>  

### CHM13 (T2T-CHM13 v2.0)
* <a href="https://github.com/marbl/CHM13">chm13v2.0_RefSeq_Liftoff_v5.2.gff3</a>  

### mm10 (GRCm38)
* Ensembl: <a href="https://ftp.ensembl.org/pub/release-102/gtf/mus_musculus/">Mus_musculus.GRCm38.102.gtf</a>  

### mm39 (GRCm39)
* Ensembl: <a href="https://ftp.ensembl.org/pub/release-113/gtf/mus_musculus/">Mus_musculus.GRCm39.113.gtf</a>  


Note: In each reference genome build version, the gene location information in this tool is overwritten in the order listed at the top.  
    
<hr>  

## Disclaimer  
This software is provided "as is," and the authors make no warranties regarding its functionality, accuracy, or fitness for any particular purpose. In no event shall the authors or contributors be held liable for any direct, indirect, incidental, special, exemplary, or consequential damages arising in any way from the use of this software, even if advised of the possibility of such damage. By using this repository, you agree to these terms.  

  <hr>  
  
## Citation
If you submit a paper using this tool, please cite Miya F and Kosaki K. (2025?) (in preparation).  

<hr>  
    
