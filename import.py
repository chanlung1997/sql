import fnmatch
import shutil
import os 
import openpyxl as op
wb = op.load_workbook(r"C:\Users\Derek\OneDrive - sagetech.com.hk\Desktop\GIT\testing\datastan_batch1_20221123.xlsx")

sheet = wb.sheetnames

k=0
for file in os.listdir('.'):
    x = str((sheet)).strip()
    if fnmatch.fnmatch(file, '*.yml'):
        if file[:-4].upper() in sheet:
            #k+=1
            shutil.move("C:\\Users\\Derek\\OneDrive - sagetech.com.hk\\Desktop\\GIT\\sql\\"+file, "C:\\Users\\Derek\\OneDrive - sagetech.com.hk\\Desktop\\GIT\\sql\\policytags\\"+file)
        else:
            pass
print(k)