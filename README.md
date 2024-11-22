# BED-Craft
BED-Craft for nanopore adaptive sampling

<hr>

BED-Craft is a tool that allows you to easily create BED files, which are required for nanopore adaptive sampling, using multiple gene names as input files.
Details of this tool will be described in a paper by Miya F and Kosaki K (in press, 2025) (currently being submitted).




## License
BED-Craft code is provided under the GPLv3 license.

## Installation
You can use it simply by downloading the entire BED-Craft folder (directory).  
BED-Craft requires perl 4 or 5.

## Usage
```cd BED-Craft```  
 
```perl BED-Craft.pl input.txt```  

<img src="https://github.com/user-attachments/assets/a0baa854-8c7d-4811-835e-2b4973b1f019" alt="example" width="570" />

![Fig1](https://github.com/user-attachments/assets/a0baa854-8c7d-4811-835e-2b4973b1f019)


Optional parameters:  

* **-build**  
You can choose the version of the human reference genomes from either hg19, hg38 or CHM13（<hg19|hg38|CHM13>. The default is hg38.  
 
* **-buffer**  
You can set the length of the extended region ("buffer") that is set on both sides of the genes. The default size is 50000. 
 
* **-chr**  
  You can choose whether or not to add "chr" to the chromosome number (<yes|no>). The default is yes.  
  

<hr>  
    
### Citation
If you submit a paper using this tool, please cite Miya F and Kosaki K. (2025) (in preparation).  

<hr>  
    
