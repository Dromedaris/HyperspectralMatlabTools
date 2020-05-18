function HSI_plot_frame2(frame)

% [nx,ny] = size(frame);
% 
% surf(frame,'EdgeColor','none')
% view([0 0 1])
% axis equal
% axis([0, nx+1, 0, ny+1])
% xlabel('x'),ylabel('y')
% end

surf(frame,'EdgeColor','none')
xlabel('column'),ylabel('row')
% axis equal
end