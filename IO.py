from os import listdir
from os.path import isfile, join
onlyfiles = [f for f in listdir(mypath) if isfile(join(mypath, f))]
###########################################################################
def load_hdf5_data():    
    with h5py.File('./preprocessing_code/mul_image_train.h5','r') as hf:
        print('List of arrays in this file: \n', hf.keys())
        data = np.array(hf.get('data'))
        label = np.array(hf.get('label'))
        # read a half only
        data = data[::2,:,:,:]
        label = label[::2,:,:,:]        
    return data,label
###########################################################################

onlyfiles = [f for f in listdir(mypath) if isfile(join(mypath, f))]
