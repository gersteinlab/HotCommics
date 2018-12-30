import sys
import os
import subprocess
import random
import scipy.stats as stats

def genPDBList(inputPDBFile):

    genePdbTuple = ()
    pdbList = []

    fileName = open(inputPDBFile,'r')
    if fileName:
       for line in fileName:
           line = line.strip()

           #genePdbTuple = (line.split()[0],line.split()[1],line.split()[2])
           genePdbTuple = (line.split()[0],line.split()[1])

           pdbList.append(genePdbTuple)

    return pdbList


def extractMutInfo(InputFile,pdbName):


    mutTuple = ()
    mutInfoList = []

    resTuple = ()
    residueList = []

    fileName = open(InputFile,'r')
    if fileName:
       for line in fileName:
           line = line.strip()
           
           if line.split()[0] == pdbName:

              
              resTuple = (line.split()[0],line.split()[1],line.split()[3],line.split()[4])
              residueList.append(resTuple)
  
              mutTuple = (line.split()[0],line.split()[1],line.split()[3],line.split()[4],line.split()[5])
              mutInfoList.append(mutTuple)

    return mutInfoList,residueList                        


def genCommInfo(inputFile,geneId,pdbId):

    pdbInfoList = []

    commList = []
    commListMap = {}

    fileName = open(inputFile,'r')
    if fileName:
       for line in fileName:
           line = line.strip()

           geneName = line.split()[0]
           pdbName = line.split()[1]
 
           if geneId == geneName and pdbId == pdbName:
              pdbInfoList.append(int(line.split()[4])+1)


    commList = list(set(pdbInfoList))
    for item in commList:
        commListMap[item] = 0

    return commListMap


def genCommFreq(inputSNV,commInfo,pdbId):

    commFreq = 0


    if [item for item in inputSNV if item[0] == pdbId and int(item[3]) == commInfo]:
       frequency = [item for item in inputSNV if item[0] == pdbId and int(item[3]) == commInfo][0][5]
       commFreq = commFreq + int(frequency)

    return commFreq


def extractOrigInfo(origInputFile,freqDict,pdbName,geneName):

    tmpFreqDict = {}

    commValTup = ()
    commInfoList = []
    commValueList = []

    fileName = open(origInputFile,'r')
    if fileName:
       for line in fileName:
           line = line.strip()

           if line.split()[0] == geneName and line.split()[1] == pdbName and int(line.split()[2]) in freqDict.keys():

              commValTup = (int(line.split()[3]),float(line.split()[4]))
              tmpFreqDict[int(line.split()[2])] = commValTup


    return tmpFreqDict



def main():

    commFrequency = 0
    count = 0.0
    mutCount = 0
    randomSNVList = []

    mutationInfo = []
    residueInfo = []
    validList = []

    commSigFreqMap = {}
    commSigEqMap = {}

    fileOut = open("pancan.sigFraction.fisher.txt","a")

    #read in list of pdbId and GeneName combinations
    nrPDBList = genPDBList(sys.argv[1])

    for item in nrPDBList:
   
        geneId = item[0].upper()
        pdbId = item[1].upper()


        #chainId = item[2]

        #tuple storing infor for each residue with at least one mutation in the original data
        mutationInfo,residueInfo = extractMutInfo(sys.argv[2],pdbId)

       
        if mutationInfo:


            for mutation in mutationInfo:
                mutCount = mutCount + int(mutation[4])

    
            resCount = len(residueInfo)

            #dictionary intializing frequency of each residue in a given pdb 
            commFreqMap = genCommInfo(sys.argv[3],geneId,pdbId)

            #For a give gene and pdb combo, map of each community to number of mutation observed in the original data 
            origCommFreqMap = extractOrigInfo(sys.argv[4],commFreqMap,pdbId,geneId)

            for community in origCommFreqMap.keys():

                comm_mut_freq = origCommFreqMap[community][0]
                non_comm_mut_freq = mutCount - comm_mut_freq

                comm_residue_freq = origCommFreqMap[community][1]
                non_comm_residue_freq = resCount - comm_residue_freq

                #oddsratio, pvalue = stats.fisher_exact([[comm_mut_freq, comm_residue_freq], [non_comm_mut_freq, non_comm_residue_freq]],alternative='greater')
                oddsratio, pvalue = stats.fisher_exact([[comm_mut_freq, comm_residue_freq], [non_comm_mut_freq, non_comm_residue_freq]])

                #print geneId+"\t"+pdbId+"\t"+str(community)+"\t"+str(comm_mut_freq)+"\t"+str(comm_residue_freq)+"\t"+str(pvalue)+"\t"+str(oddsratio)

                fileOut.write(geneId+"\t"+pdbId+"\t"+str(community)+"\t"+str(comm_mut_freq)+"\t"+str(comm_residue_freq)+"\t"+str(pvalue)+"\t"+str(oddsratio))
                fileOut.write("\n")

            for key in origCommFreqMap.keys():
                    origCommFreqMap[key] = 0.0

            count = 0.0
            mutCount = 0

            validList = []

if __name__ == '__main__':

    main()

