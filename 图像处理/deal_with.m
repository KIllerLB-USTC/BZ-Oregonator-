function[out] = deal_with(path)
 fid = fopen(path,'r');
 if fid<0
 warndlg('打开文件失败!');
 return;
 else
 FormatString=repmat('%f',1,2);
 out= cell2mat(textscan(fid,FormatString,'HeaderLines', 3));
 end
 %msgbox('文件读取成功! ');
 if fclose(fid)==0
 %msgbox('文件关闭成功!');
 else
 %warndlg('关闭文件失败!');
 end
end

 %bin