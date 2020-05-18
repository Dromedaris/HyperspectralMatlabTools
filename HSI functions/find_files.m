function names = find_files(filename_description)

info = dir(filename_description);
[n, ~] = size(info) ;
names = {};

for i = 1:n
    names{end+1} = info(i).name;
end


 end