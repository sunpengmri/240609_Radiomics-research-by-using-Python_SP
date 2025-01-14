#!/usr/bin/bash


WorkDir=/home/peng/01_data/02_radiomics/SCLC-2

RawPath=$WorkDir/raw
MaskPath=$WorkDir/mask
TargetPath=$WorkDir/result


sublist=($(ls $RawPath));

# sublist='sub_001';
# echo ${sublist[@]}


# 4. for qianfoshan & shanxi nii data
mkdir -p ${TargetPath};
sublist=($(ls $RawPath | sed 's/\.nii\.gz$//'));

for sub in ${sublist[@]};
# for sub in ${sublist};  
do   
    mkdir -p ${TargetPath}/${sub};

    cp ${RawPath}/${sub}.nii.gz ${TargetPath}/${sub}/${sub}.nii.gz
    cp ${MaskPath}/${sub}_roi.nii.gz ${TargetPath}/${sub}/${sub}_roi.nii.gz
    
done


# 5. for shenzhen nii data
sublist=($(ls $TargetPath));
# echo ${sublist[@]}

for sub in ${sublist[@]};
# for sub in ${sublist};  
do   

    if [ ! -f ${TargetPath}/${sub}/${sub}.nii.gz ] || [ ! -f ${TargetPath}/${sub}/${sub}_roi.nii.gz ]; then
      echo $sub 
    fi
    
done
