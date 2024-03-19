using CSV
using DataFrames
using PrettyTables

file_path = "data_with_classes.csv"
df = CSV.read(file_path,DataFrame)
global class_matrix = df[:,end] #class

#global data = df[:, 1:end-1]
#處理資料(去除class)
function new_data_set(df)
    
    return df[:, 1:end-1]
end

#取資料
function data_check(Dim1,Dim2,Dim3,Dim4,Dim5) #Dim1[:,1]
    num = [Dim1,Dim2,Dim3,Dim4,Dim5] 
    return num
end

#將數據分成一列一組
function combine_mat(matclass) 
  
    global mat = matclass[1]'
    for i in 2:length(matclass)
          mat = vcat(mat, matclass[i]')
    end
    return mat
end

        
#Start with empty arrays
global matclass1 = []
global matclass2 = []
global matclass3 = []
global df = new_data_set(df)
global new_data = []

#將dataframe的數據轉變為陣列型態
for row in eachrow(df)
    global matclass1, matclass2, matclass3   
    column_name = :Class
    new_data1 = data_check(row[1],row[2],row[3],row[4],row[5])
    push!(new_data,new_data1)  
end

global group1 = []
global group2 = []
global group3 = []
  
#利用class的數據來分組
for i in 1:100
    if class_matrix[i] == 1
        push!(matclass1,new_data[i])
    end
    if class_matrix[i] == 2
        push!(matclass2,new_data[i])
    end
    if class_matrix[i] == 3
        push!(matclass3,new_data[i])
    end
end

#將資料分成一列一組
matclass1 = combine_mat(matclass1)
matclass2 = combine_mat(matclass2)
matclass3 = combine_mat(matclass3)

pretty_table(matclass1)
pretty_table(matclass2)
pretty_table(matclass3)

