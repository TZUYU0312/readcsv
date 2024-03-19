using Random
using CSV
using DataFrames
file_path = "mtcars.csv"
data = CSV.read(file_path, DataFrame)
println(data)
Random.seed!(1234)
function test_train_data(train_num,val_num,ts_num,data)

    # 計算訓練集的大小，這裡我們假設使用 50% 的資料作為訓練集
    train_size = floor(Int,train_num*nrow(data))
    val_size = floor(Int, val_num*nrow(data))
    ts_size = floor(Int,ts_num*nrow(data))

    # 隨機抽樣索引以分割資料集
    indices = shuffle(1:nrow(data))
    train_indices = indices[1:train_size]
    val_indices = indices[train_size+1:val_size+train_size]
    ts_indices = indices[val_size+train_size+1:end]
    return train_indices,val_indices,ts_indices
end
# 計算訓練集的大小，這裡我們假設使用 50% 的資料作為訓練集
train_set,val_set,ts_set = test_train_data(0.5,0.25,0.25,data)

train_data = data[train_set, :]
val_data = data[val_set, :]
test_data = data[ts_set,:]
println(train_data)
println(val_data)
println(test_data)

