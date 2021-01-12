import numpy as np

def target_mean_cp(data, y_name, x_name):
    result = np.zeros(data.shape[0])
    cdef pd_x = data['x'].values
    cdef pd_y = data['y'].values
    cdef size_t k
    map_dict = dict()
    for k in range(data.shape[0]):
        if pd_x[k] not in map_dict.keys():
            map_dict[pd_x[k]] = pd_y[k]
        else:
            map_dict[pd_x[k]] += pd_y[k]
    for k in range(data.shape[0]):
        result[k] = (map_dict[pd_x[k]] - pd_y[k]) / (data.shape[0] - 1)
    return result
