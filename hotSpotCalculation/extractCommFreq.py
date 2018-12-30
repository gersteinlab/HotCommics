import sys
import os
import subprocess

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


def genCommInfo(inputFile,geneId,pdbId):

    pdbInfoList = []
    residueList = []

    residueFreqDict = {}

    fileName = open(inputFile,'r')
    if fileName:
       for line in fileName:
           line = line.strip()

           geneName = line.split()[0]
           pdbName = line.split()[1]

           if geneId == geneName and pdbId == pdbName:
              residueList.append(line.split()[2])
              pdbCommTuple = (line.split()[1],line.split()[2],line.split()[3],int(line.split()[4])+1,line.split()[5])
              pdbInfoList.append(pdbCommTuple)


    for index in range(0,len(residueList)):
        residueFreqDict[residueList[index]] = 0

    return residueFreqDict,pdbInfoList


def genMutFreq(inputFile,pdbId,geneId,residueFreqDict):

    residueFreqDictupdated = {}

    fileName = open(inputFile,'r')
    if fileName:
       for line in fileName:
           line = line.strip()
           geneInfo = line.split()[3].split('|')[0]
           pdbInfo = line.split()[2].split('.')[0].upper()
           lengthOffset = len(line.split()[2].split('.')[1])

           origResidue = line.split()[2].split('.')[1][0:3]
           mutResidue = line.split()[2].split('.')[1][-3:] 
           residueIndex = line.split()[2].split('.')[1][3:lengthOffset-3]


           if pdbInfo == pdbId and geneId == geneName:
              if residueIndex in residueFreqDict.keys():
                 residueFreqDict[residueIndex] = residueFreqDict[residueIndex] + 1

    for key in residueFreqDict.keys():
        #if residueFreqDict[key] >= 2:
           residueFreqDictupdated[key] = residueFreqDict[key]
 
    return residueFreqDictupdated


def genCommFreq(inputFile,commInfo,resFreq,geneId,pdbId):

    commFreq = 0

    fileName = open(inputFile,'r')
    if fileName:
       for line in fileName:
           line = line.strip()

           geneName = line.split()[0]
           pdbName = line.split()[1]

           if geneId == geneName and pdbId == pdbName:

              if int(commInfo) == int(line.split()[4])+1 and line.split()[2] in resFreq.keys():
                 commFreq = commFreq + resFreq[line.split()[2]]

    return commFreq


residueFreqMap = {}

#generate pdblist with geneId,pdbId and chainInfo
nrPDBList = genPDBList(sys.argv[1])

fileOut = open('pancan.mutInfo.orig.txt','a')
fileOut1 = open('pancanCommInfo.orig.txt','a')



for item in nrPDBList:
   

    geneName = item[0].upper()
    pdbName = item[1].upper()

    #for each pdb generate residue and communities information map
    resFreqMap, pdbInfo= genCommInfo(sys.argv[2],geneName,pdbName)


    commList = list(set([x[3] for x in pdbInfo]))

    #populate residue frequency map
    residueFreqMap = genMutFreq(sys.argv[3],pdbName,geneName,resFreqMap)


    for a in pdbInfo:
        if str(a[1]) in residueFreqMap.keys():
           #if residueFreqMap[a[1]] >= 2:
              #print "\t".join([str(i) for i in a])+"\t"+str(residueFreqMap[a[1]])

              fileOut.write("\t".join([str(i) for i in a])+"\t"+str(residueFreqMap[a[1]]))
              fileOut.write("\n")

    for element in commList:
 
        commLength = len([x for x in pdbInfo if x[3] == element])
        
        commFrequency = genCommFreq(sys.argv[2],element,residueFreqMap,geneName,pdbName)
        #print geneName+"\t"+pdbName+"\t"+str(element)+"\t"+str(commFrequency)+"\t"+str(commLength)

        fileOut1.write(geneName+"\t"+pdbName+"\t"+str(element)+"\t"+str(commFrequency)+"\t"+str(commLength))
        fileOut1.write("\n")

    residueFreqMap = {}
