##################################################################################
Step1: generate pancancer mutation mapping on residues for PDB files
##################################################################################

#python generateInput.py mappedPDBFile.chained.txt > pancan.mappedRes.mutation.somatic.txt
python generateInput.py pdbList_w_mappedMutation_file > pancan_mapped_mutation_outFile

##################################################################################
Step2: generate residue and community level mutation frequencies for each PDB file
##################################################################################

#python extractCommFreq.py mappedPDBFile.chained.txt pancan.mappedRes.mutation.somatic.txt pancan.outFile.updated.somatic.dat
python extractCommFreq.py pdbList_w_mappedMutation_file pancan_mapped_mutation_outFile pancan_freq_outFile

##################################################################################
Step3: generate residue and community level mutation frequencies for each PDB file
##################################################################################

#python randomizeInput.fisher.py mappedPDBFile.chained.txt pancan.mutInfo.orig.final.txt pancan.mappedRes.mutation.somatic.txt pancanCommInfo.orig.final.txt
python randomizeInput.fisher.py pdbList_w_mappedMutation_file pancan_mutInfo_file pancan_mapped_mutation_outFile pancanCommInfo_file
