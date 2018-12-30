
##################################################################################
Step1 : run Variant Annotation Tool (VAT) to annotate TCGA coding mutation
##################################################################################

#snpMapper gencode.v19.pc.interval gencode.v19.pc.fa <mc3.v0.2.8.PUBLIC.BRCA.nonsyn.SNV.pass.vat.input > mc3.v0.2.8.PUBLIC.BRCA.nonsyn.SNV.pass.vat.output
snpMapper gencode.v19.pc.interval gencode_v19_fastaFile vatInput > vatOutput

##############################################################################################
Step2 : extract Missense mutation from VAT output along with mutation details on protein level
##############################################################################################

#python parseVatOut.py -d gencode.v19.pc_translations.fa -v mc3.v0.2.8.PUBLIC.BRCA.nonsyn.SNV.pass.vat.output -b mart_export.txt -type nonsynonymous
python parseVatOut.py -d gencode.v19.pc_translations.fa -v vatOutput -b bioMartFile -type nonsynonymous

##############################################################################################
Step3 : Map missense mutations onto the given list of high resolutation protein 3D-structure
##############################################################################################

#python mapSNP2PDB.py -p PDBs_filtered_resol28_rFree28_new.txt -b mart_export.txt -I mc3.v0.2.8.PUBLIC.BRCA.nonsyn.SNV.pass.vat.output.nonsynonymous.summary -B /usr/local/cluster/software/installation/blast-2.2.28+/bin/ -M /ysm-gpfs/home/sk972/from_louise/bin/modeller9.14/bin/ -P /ysm-gpfs/home/sk972/sk972_louise/fSIN/structure/pkg/pdbTools_0.2.1/ -O outFile.updated.dat


python mapSNP2PDB.py -p PDBListFile -b bioMartFile -I vatOutput_summary_file -B <blastDirectory> -P <pdbToolsDirectory> -O outputFile
