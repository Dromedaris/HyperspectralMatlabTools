function fh = create_figure_fromfile(file_path)



HSI=multibandread(file_path,[300,300,113],'float',0,'bsq','ieee-le');
screen = HSI(:,:,50);


fh = surf(screen,'EdgeColor','none');
view([0 0 1])