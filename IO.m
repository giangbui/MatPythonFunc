% reading from files
fid = fopen('scan_regularPhotoColoring.txt','r');
N = fscanf(fid,'%d\n',1)
data = fscanf(fid,'%f',[7,N])';%transpose the result

% writing to a file
fid = fopen('scan_regularPhotoColoring_2.txt','w');
fprintf(fid,'%f %f %f %f %f %f %f\n',data2');

% writing to binary file
fid = fopen('scan-cornell_6_19_13_ptsRemoved_tree.bin','wb');
fwrite(fid,[size(pointcloud,1) 7],'int');
fwrite(fid,[pointcloud(:,1:3) ones(length(pointcloud),1) repmat([255 255 255],length(pointcloud),1)]','float');

% generating ply files
fileID = fopen('3DmeshPlane.ply','w');
fprintf(fileID, 'ply\nformat ascii 1.0\nelement vertex %d\nproperty float32 x\nproperty float32 y\nproperty float32 z\nelement face %d\nproperty list uint8 int32 vertex_indices\nend_header\n', size(point3D, 1), size(mesh3D, 1));
fprintf(fileID,'%f %f %f\n',point3D(:,1:3)');
fprintf(fileID,'3 %d %d %d\n',mesh3D'-1);
fclose(fileID);
