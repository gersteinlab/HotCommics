import sys
import os
import subprocess
import glob

def is_non_zero_file(fpath):
    return os.path.isfile(fpath) and os.path.getsize(fpath) > 0


def genPDBList(inputPDBFile):

    genePdbTuple = ()
    pdbList = []

    fileName = open(inputPDBFile,'r')
    if fileName:
       for line in fileName:
           line = line.strip()

           genePdbTuple = (line.split()[0],line.split()[1])

           pdbList.append(genePdbTuple)

    return pdbList

def preProcessStressOut1(stressOutFile,offSet):

    lineNum = 0

    communityMap = {}
    resIndexList = []
    communityList = []

    fileName = open(stressOutFile,'r')
    if fileName:
       for line in fileName:
           line = line.strip()
           lineNum = lineNum + 1

           if lineNum > 1 and lineNum < offSet:
              resIndexList.append(line.split()[0])
              communityList.append(int(line.split()[1]))

    communityMap = dict(zip(resIndexList,communityList))

    return communityMap
           

def preProcessStressOut2(stressOutFile2):


    residueMap = {}
    resIndexList = []
    resIdList = []

    fileName = open(stressOutFile2,'r')
    if fileName:
       for line in fileName:
           line = line.strip()

           resIndexList.append(line.split()[0])
           resIdList.append(line.split()[1])

    residueMap = dict(zip(resIndexList,resIdList))

    return residueMap



def generateFinalInput(mappingInputFile,residueMap,pdbName,geneName):

    outputPDB = mappingInputFile

    fileName = open(mappingInputFile,'r')
    if fileName:
       for line in fileName:
           line = line.strip()

           if line.split()[0] in residueMap.keys():

              print geneName+'\t'+pdbName+'\t'+line.split()[1]+'\t'+line.split()[2]+'\t'+str(residueMap[line.split()[0]])+'\t'+line.split()[3]


modResCommMap = {}

#mappingDir = '/gpfs/scratch/fas/gerstein/sk972/anziBC/pdb_files/simplified/'
mappingDir = '/ysm-gpfs/pi/gerstein/sk972/private/mappings/'

nrPDBList = genPDBList(sys.argv[1])

for item in nrPDBList:
  
    #print item
 
    stressOutput1 = '/ysm-gpfs/pi/gerstein/sk972/private/pancanAtlas_cleanedup/hotspot_unweighted/dataFile/output_'+item[1].upper()+'_o_bin.txt'

    if glob.glob(stressOutput1):
      if is_non_zero_file(stressOutput1):
 
        
       command = ''' awk '{ if ($1 == "Modularity") print NR}' ''' + stressOutput1 
   
       lineIndex = os.popen(command).read()
       residueCommMap = preProcessStressOut1(stressOutput1,int(lineIndex.strip('\n')))

       #print residueCommMap

       geneId = item[0].upper()
       pdbId = item[1].upper()
       mappingFile = mappingDir+pdbId+'_mappings.txt'
       #print mappingFile


       generateFinalInput(mappingFile,residueCommMap,pdbId,geneId)    
       modResCommMap = {}
