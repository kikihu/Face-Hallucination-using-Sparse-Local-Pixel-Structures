function[] = mqSaveKImages()

    %% IMAGE FILE IO
    lowres_dir_path = uigetdir;
    image_files = dir(strcat(lowres_dir_path, '\*.bmp'));
    num_files = length(image_files);

    ims = cell(num_files, 1);
    for i = 1 : num_files
        file_name = image_files(i).name;
        training_image = imread(strcat(lowres_dir_path ,'\', file_name));
        ims{i} = training_image;
    end
    save kimages.mat ims
end