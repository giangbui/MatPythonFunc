import numpy as np
import PIL
from PIL import Image
img = Image.open(join(mypath, f)).convert('RGB')
ycbcr = img.convert('YCbCr')
W,H = ycbcr.size
highRes = np.array(ycbcr)*1.0/255
ycbcr = ycbcr.resize((int(W*1.0/3),int(H*1.0/3)),resample=PIL.Image.LANCZOS)
