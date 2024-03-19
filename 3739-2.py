import pandas as pd
import numpy as np

#將數據分成一列一組
def combine_mat(matclass): 
    mat = np.array(matclass[0]).T  # 將第一個陣列進行轉置
    for i in range(1, len(matclass)):
        mat = np.vstack((mat, np.array(matclass[i]).T))
    return mat

file_path = "data_with_classes.csv"
df = pd.read_csv(file_path)
class_matrix = df.iloc[:, -1]  # class的數據
df = df.drop(columns=["Class"]) #沒有class的數據

matclass1 = []
matclass2 = []
matclass3 = []
new_data = []
class_data = []

#將dataframe的數據轉變為陣列型態
for index, row in df.iterrows():
    new_data.append(row.tolist())

for i in range(len(class_matrix)):
    class_data.append(class_matrix[i])

#利用class的數據來分組
for i in range(len(class_data)):
    if class_data[i] == 1:
        matclass1.append(new_data[i])

    if class_data[i] == 2:
        matclass2.append(new_data[i])

    if class_data[i] == 3:
        matclass3.append(new_data[i])

#將資料分成一列一組
matclass1 = combine_mat(matclass1)
matclass2 = combine_mat(matclass2)
matclass3 = combine_mat(matclass3)

print(matclass1)
print("----------------------")
print(matclass2)
print("----------------------")
print(matclass3)