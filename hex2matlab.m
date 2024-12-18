function decData = hex2matlab(filename,typefile)

    FID = fopen(filename);
    switch typefile
        case 'int16'
            dataFromfile = textscan(FID, '%s\t%s');
            dataFromfile2 = [char(dataFromfile{1,2}) char(dataFromfile{1,1})];
            q = quantizer('fixed', 'nearest', 'saturate', [16 0]);
        case 'single'
            dataFromfile = textscan(FID, '%s\t%s\t%s\t%s');
            dataFromfile2 = [char(dataFromfile{1,4}) char(dataFromfile{1,3}) char(dataFromfile{1,2}) char(dataFromfile{1,1})];
            q = quantizer('single', 'nearest', 'saturate', [8 0]);
    end
    decData = hex2num(q, dataFromfile2);
    fclose(FID);

end