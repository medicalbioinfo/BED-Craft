# BED-Craft
BED-Craft for nanopore adaptive sampling

<hr>

BED-Craft is a tool that allows you to easily create BED files, which are required for nanopore adaptive sampling, using multiple gene names as input files.
Details of this tool will be described in a paper by Miya F and Kosaki K (in press, 2025) (currently being submitted).




# License
SpliceAI source code is provided under the GPLv3 license.

# Installation
You can use it simply by downloading the entire BED-Craft folder (directory).
BED-Craft requires perl 4 or 5.

# Usage
cd BED-Craft<br\>
perl BED-Craft.pl input.txt

![Fig1](https://github.com/user-attachments/assets/a6f49219-eec4-4d0e-a3e7-e71934624cf4)

Optional parameters:

<ul>
  <li>-build</li>
  You can choose the version of the human reference genomes from either hg19, hg38 or CHM13（<hg19|hg38|CHM13>. The default is hg38.
  <li>-buffer</li>
You can set the length of the extended region ("buffer") that is set on both sides of the genes. The default size is 50000.
  <li>-chr</li>
  You can choose whether or not to add "chr" to the chromosome number (<yes|no>). The default is yes.
</ul>
