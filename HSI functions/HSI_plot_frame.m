function HSI_plot_frame(frame)

[n1,n2] = size(frame);


imagesc(frame)
xlabel('column')
ylabel('row')
axis equal

axis([.5, n2+.5, .5, n1+.5])

end