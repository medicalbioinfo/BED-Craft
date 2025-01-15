# BED-Craft
BED-Craft for nanopore adaptive sampling

<hr>

BED-Craft is a tool that allows you to easily generate BED files, which are required for nanopore adaptive sampling, using multiple gene names as input files.  
Details of this tool will be described in a paper by Miya F and Kosaki K (2025) (Under revision).




## License
BED-Craft code is provided under the GPLv3 license.

## Installation
You can use it simply by downloading the entire BED-Craft folder.  
BED-Craft requires perl 4 or 5.

## Getting started
1. BED-Craft source code can be downloaded from GitHub: named releases from <a href="https://github.com/medicalbioinfo/BED-Craft/releases/">https://github.com/medicalbioinfo/BED-Craft/releases/</a>.  
  
2. Place the downloaded and extracted folder (e.g., BED-Craft-2.0) in an appropriate directory (e.g., /home/miya/BED-Craft-2.0), and navigate to that directory using the command line.  
```cd /home/miya/BED-Craft-2.0```

3.	The folder includes sample files such as "Example_ACMG_SF3.2_gene_list.txt". Use the example file to execute the following command.  
 ```perl ./BED-Craft/BED-Craft.pl Example_ACMG_SF3.2_gene_list.txt```  
If a message is displayed on the screen, showing the number of targets and the results as below, it indicates that the program is running correctly.  
![Web_1](https://github.com/user-attachments/assets/3845b89e-a61f-46e2-9ce8-0a9cd3718788)
  
The resulting BED file is structured as a six-column file, as shown below:  
	chr1	16968721	17054032	SDHB_NM_003000.3_ENST00000375499.8	0	+  
	chr1    17018721        17104032        SDHB_NM_003000.3_ENST00000375499.8      0       -  
	chr1    45279241        45340440        MUTYH_NM_001128425.2_ENST00000710952.2  0       +  
	chr1    45329241        45390440        MUTYH_NM_001128425.2_ENST00000710952.2  0       -  
  
These six columns represent the following information:
  Column 1: chromosome  
	Column 2: start position  
	Column 3: end position  
	Column 4: ID (GeneSymbol_DatabaseID)  
	Column 5: 0  
	Column 6: strand (+ or −)  
  
  
## Usage
```cd BED-Craft```  
 
```perl BED-Craft.pl input.txt```  


<img src="https://github.com/user-attachments/assets/a1eaa30d-2e6f-411e-8552-0344c6bb7c49" width="550">


  
### Optional parameters:  

```perl BED-Craft.pl input.txt [-genome <hg19|hg38|CHM13|mm10|mm39|other>] [-buffer <number>] [-chr <yes|no>]```

* **-genome**  
You can choose the version of the human reference genomes from either hg19, hg38, and CHM13（<hg19|hg38|CHM13>), mouse reference genomes mm10 and mm39 (<mm10|mm39>).  As well as human and mouse, the tool can be used for over 200 other various species. How to support species other than human and mouse is described below. The default is hg38.  
 
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

## Method for supporting species other than humans and mouse

For over 200 species other than humans and mouse, a program is provided to generate the desired .bed file using Ensembl GTF files (URL: https://ftp.ensembl.org/pub/current_gtf/).  
The following shows the procedure using zebrafish (Danio rerio) file as an example.  
  
First, navigate to https://ftp.ensembl.org/pub/current_gtf/danio_rerio and download the file Danio_rerio.GRCz11.113.gtf.gz (or a newer version).  
  
Next, use the "print_gene_region_for_Ensembl_gtf.pl" program included in the BED-Craft tool to create a file containing gene location information by executing the following command:  
```perl print_gene_region_for_Ensembl_gtf.pl Danio_rerio.GRCz11.113.gtf > Danio_rerio_annotation.bed```  
  
Place the resulting file into the BED-Craft folder.  
  
Using the file, you can then generate a .bed file for the target gene symbols listed in the "target_gene.txt" file with the following command:  
```perl BED_Craft.pl target_gene.txt -genome Danio_rerio_annotation.bed```  
  
This process creates a .bed file ("target_gene.bed") for adaptive sampling of zebrafish (Danio rerio).  

    
<hr>  
  
## Disclaimer  
This software is provided "as is," and the authors make no warranties regarding its functionality, accuracy, or fitness for any particular purpose. In no event shall the authors or contributors be held liable for any direct, indirect, incidental, special, exemplary, or consequential damages arising in any way from the use of this software, even if advised of the possibility of such damage. By using this repository, you agree to these terms.  

  <hr>  
  
## Citation
If you submit a paper using this tool, please cite Miya F and Kosaki K. (2025) (in preparation).  

<hr>  
    
