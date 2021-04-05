% deal the image
clear;
maindir = pwd;
subdir  = dir( maindir );
label  = [];
for i = 1 : length( subdir )
    subdirpath = fullfile( maindir, subdir( i ).name, '*.txt' );
    dat = dir( subdirpath );              

    for j = 1 : length( dat )
        datpath = fullfile( maindir, subdir( i ).name, dat( j ).name);
        c = deal_with(datpath);
        s = strsplit(dat(j).name,{'-','.'});
        s_o = sprintf('%s^oC%s',cell2mat(s(1)),cell2mat(s(2)));%不同的的legend的自动抓取
        label=[label;s_o];
        plot(c(:,1),c(:,2),'linewidth',1);
        hold on
        
    end
    legend(char(label))
    xlabel('时间（min）','fontsize',12)
    ylabel('电压（mV）','fontsize',12)
    title(sprintf('30^oC加入不同%s的振荡曲线',cell2mat(s(1)),'fontsize',16);%标题自动抓取（只抓最后一个读取文件）
    hold off
end

% any problem contact with through the address in my homepage:http://home.ustc.edu.cn/~ustc_mitlb/
