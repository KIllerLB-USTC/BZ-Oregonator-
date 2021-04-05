clear;
maindir = pwd;
subdir  = dir( maindir );
label  = [];
period = [];
for i = 1 : length( subdir )
    subdirpath = fullfile( maindir, subdir( i ).name, '*.txt' );
    dat = dir( subdirpath );              

    for j = 1 : length( dat )
        datpath = fullfile( maindir, subdir( i ).name, dat( j ).name);
        c = deal_with(datpath);
        [peak_sg_rev,peak_sg_rev_posi] = findpeaks(-c(:,2),c(:,1),'MinPeakProminence',10);
        subplot(2,2,j);
        plot(c(:,1),c(:,2),'linewidth',1);
        [peak_single, peak_position] = findpeaks(c(:,2),c(:,1),'MinPeakProminence',10);
        findpeaks(c(:,2),c(:,1),'MinPeakProminence',10);
        hold on
        %以上是对图像的列出，以下估算前五个平均周期
        if length(peak_single)>=6  
            start_point = length(peak_single)-4;
            end_point = length(peak_single);
            for k = start_point : end_point
                period(k) = peak_position(k)-peak_position(k-1);
            end
            aver_p = mean(period(start_point : end_point));
            writematrix(period(start_point : end_point),'周期收集.xls','WriteMode','append');
            %标出平均周期于峰顶+20position
            word = sprintf('%s%.3f%s','由前6个峰值估算得到平均周期为',aver_p,'min');
            text(0.5,peak_single(1)+20,word);
        end
        %以下是诱导时间
        if ~isempty(peak_sg_rev)&& ~isempty(peak_single)
            t_youdao = peak_sg_rev_posi(1);
        %标出诱导时间
        text(0.5,peak_single(1)+40,sprintf('%s%.3f%s','诱导时间为第一个波谷',t_youdao,'min'));
        end
        s = strsplit(dat(j).name,{'-','.'});
        name = sprintf('%s^oC %s%s下的振荡曲线',cell2mat(s(1)),cell2mat(s(3)),cell2mat(s(2)));
        title(name,'fontsize',10)
        legend(dat(j).name)
        xlabel('时间（min）','fontsize',12)
        ylabel('电压（mV）','fontsize',12)
    end
    hold off
 end
    
   
% any problem contact with through the address in my homepage:http://home.ustc.edu.cn/~ustc_mitlb/