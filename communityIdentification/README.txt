::::::::  Dependencies & Notes   ::::::::
Dependencies: Python, Perl, MMTK, C compiler
NOTES: 
	1) If you have any difficulty generating any of the output files, output files for this example 
	are stored in the directory ./output_files/
	2) When submitting a PDB file, we suggest using the biological assembly file (not the raw 
	asymmetric unit).




::::::::  Implementation   ::::::::
I.  Given a user-submitted PDB (the example 1EDH.pdb is provided here), generate the necessary 
simplified PDB file. This "SIMPLIFIED PDB" file is needed in order to run MMTK's FNM software. 
It lacks the PDB format irregularities which would otherwise cause MMTK to crash.

	USAGE:
		python just_make_simplified_pdb_and_rm_HETATM.py 1EDH.pdb 1EDH_SIMPLIFIED.pdb

		* NOTE: This script also removes all HETATM lines! (this needs to be the case in order for 
		MMTK to produce fnm files correctly - unfortunately, HETATMs will cause MMTK to fail).

	Now use the SIMPLIFIED pdb to generate the CA-only PDB -- the CA PDB that is generated (and 
	ends in "_CA.pdb") is simply all of the alpha carbon atoms represented in SIMPLIFIED_PDB:

		USAGE:
		python just_make_simplified_pdb__CA_LINES_ONLY.py ./1EDH_SIMPLIFIED.pdb ./1EDH_CA.pdb



II. Use the CA-only PDB to produce the needed ANM file (which is generated by MMTK)
	* NOTE: For this step, it is necessary to have MMTK installed! We have found this software to 
	be fairly tricky to install because there are so many dependencies.

	First make the full fnm file -- USAGE: 
		python calpha_modes.py ./1EDH_CA.pdb f > 1EDH.fnm

	Extract the top 10 normal modes from this output file -- USAGE:
		perl top_nm.pl 10 < 1EDH.fnm > 1EDH.fnm_t10

	The main output file in which we are interested has the suffix "fnm_t10" -- this lists the top 
	10 lowest-frequency normal modes.



III.  Generate the binary and weighted contact maps of interacting residues: for each pair of residues, 
determine whether the residues are in contact (defined by any pair of heavy atoms within 4.5 A). Use 
the exact same SIMPLIDIED_PDBs that are used in identifying surface-critical residues (see corresponding 
README file). 

	USAGE (note that this may take a few minutes): 
		python make_contact_map.py ./1EDH_SIMPLIFIED.pdb heavy 4.5 1 1EDH_cont_map.txt ./1EDH_CA.pdb

	The 'heads' (which are kept for a sanity check in a different module) of each line in the resultant 
	contact maps must be removed in order to run gncommunities -- USAGE: 
		python mod_cont_map_for_gn.py ./1EDH_cont_map.txt ./1EDH_cont_map_BIN.txt

	Now generate WEIGHTED contact maps (the weights being given by correlated motions from the fnm file).

		USAGE: 
		python correlate_motions_ver2.py ./1EDH_cont_map_BIN.txt ./1EDH_CA.pdb ./1EDH.fnm_t10 > ./1EDH_WGH_cont_map.txt



IV. Run the GN algorithm on the weighted contact map
	
	First 'make' the files in the directory ./networkTools/

	Run the GN algorithm on the weighted contact map:
		USAGE (note that, depending on the PDB size, this could take a while):
			./networkTools/gncommunities ./1EDH_WGH_cont_map.txt 1EDH_o_wght.txt > o_1EDH_wght.txt

	Several output files are generated, but we're most interested in 1EDH_o_wght.txt. This file can be 
	used to get the modules.
