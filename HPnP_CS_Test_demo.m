clc
clear
m_10_1=0; 
m_10_2=0; 
m_10_3=0; 
m_20_1=0; 
m_20_2=0; 
m_20_3=0; 
m_30_1=0; 
m_30_2=0; 
m_30_3=0; 
m_40_1=0;
m_40_2=0; 
m_40_3=0; 
m_50_1=0;
m_50_2=0; 
m_50_3=0; 
m_75_1=0;
m_75_2=0; 
m_75_3=0; 
m_100_1=0;
m_100_2=0; 
m_100_3=0; 

All_data_Results_10_1 = cell(1,200);
All_data_Results_10_2 = cell(1,200);
All_data_Results_10_3 = cell(1,200);

All_data_Results_20_1 = cell(1,200);
All_data_Results_20_2 = cell(1,200);
All_data_Results_20_3 = cell(1,200);

All_data_Results_30_1 = cell(1,200);
All_data_Results_30_2 = cell(1,200);
All_data_Results_30_3 = cell(1,200);

All_data_Results_40_1 = cell(1,200);
All_data_Results_40_2 = cell(1,200);
All_data_Results_40_3 = cell(1,200);

All_data_Results_50_1 = cell(1,200);
All_data_Results_50_2 = cell(1,200);
All_data_Results_50_3 = cell(1,200);

All_data_Results_75_1 = cell(1,200);
All_data_Results_75_2 = cell(1,200);
All_data_Results_75_3 = cell(1,200);

All_data_Results_100_1 = cell(1,200);
All_data_Results_100_2 = cell(1,200);
All_data_Results_100_3 = cell(1,200);



for i = 1:10
ImageNum =i;

switch ImageNum
           case 1
                filename = 'test001';
            case 2
                filename = 'test002';
            case 3
                filename = 'test003';
            case 4
                filename = 'test004';    
            case 5
                filename = 'test005'; 
                
            case 6
                filename = 'test006';
            case 7
                filename = 'test007';
            case 8
                filename = 'test008';
            case 9
                filename = 'test009';    
            case 10
                filename = 'test010'; 
                
            case 11
                filename = 'test011';
            case 12
                filename = 'test012';
            case 13
                filename = 'test013';     
                
            case 14
                filename = 'test014';
            case 15
                filename = 'test015';
            case 16
                filename = 'test016';
            case 17
                filename = 'test017';    
            case 18
                filename = 'test018'; 
                
            case 19
                filename = 'test019';
            case 20
                filename = 'test020';
            case 21
                filename = 'test021';     
                
            case 22
                filename = 'test022';
            case 23
                filename = 'test023';
            case 24
                filename = 'test024';
            case 25
                filename = 'test025';    
            case 26
                filename = 'test026'; 
                
            case 27
                filename = 'test027';
            case 28
                filename = 'test028';
            case 29
                filename = 'test029';    
            case 30
                filename = 'test030';       
             case 31
                filename = 'test031';   
                
            case 32
                filename = 'test032';
            case 33
                filename = 'test033';
            case 34
                filename = 'test034';
            case 35
                filename = 'test035';    
            case 36
                filename = 'test036'; 
                
            case 37
                filename = 'test037';
            case 38
                filename = 'test038';
            case 39
                filename = 'test039';    
            case 40
                filename = 'test040';                 
                
             case 41
                filename = 'test041';   
                
            case 42
                filename = 'test042';
            case 43
                filename = 'test043';
            case 44
                filename = 'test044';
            case 45
                filename = 'test045';    
            case 46
                filename = 'test046'; 
                
            case 47
                filename = 'test047';
            case 48
                filename = 'test048';
            case 49
                filename = 'test049';    
            case 50
                filename = 'test050';                 
                
              case 51
                filename = 'test051';   
                
            case 52
                filename = 'test052';
            case 53
                filename = 'test053';
            case 54
                filename = 'test054';
            case 55
                filename = 'test055';    
            case 56
                filename = 'test056'; 
                
            case 57
                filename = 'test057';
            case 58
                filename = 'test058';
            case 59
                filename = 'test059';    
            case 60
                filename = 'test060';                
                
              case 61
                filename = 'test061';   
                
            case 62
                filename = 'test062';
            case 63
                filename = 'test063';
            case 64
                filename = 'test064';
            case 65
                filename = 'test065';    
            case 66
                filename = 'test066'; 
                
            case 67
                filename = 'test067';
            case 68
                filename = 'test068' ;  
end



for j  =  1:5
 
filename    

randn ('seed',0);

Ratio_Num        =       [0.1, 0.2, 0.3, 0.4, 0.5]; 


ratio             =       Ratio_Num(j)





 if  ratio== 0.1
     
     mu  = 0.002; lambda = 0.0006;  thr = 18;   c=2; Err_or =  0.0005;
  
   [Ori,  ratio,  PSNR_Final, FSIM_Final, SSIM_Final, jjj, difff, Time_s]=    HPnP_CS_Test(filename, ratio, mu, lambda, c, thr, Err_or);
 
 m_10_1= m_10_1+1;
 
 s=strcat('A',num2str(m_10_1));
 
 All_data_Results_10_1{m_10_1}={Ori, ratio,  mu, lambda, c, thr, PSNR_Final,FSIM_Final,SSIM_Final,jjj, difff, Time_s};
 

 
 xlswrite('HPnP_CS_0.1_BSD_68.xls', All_data_Results_10_1{m_10_1},'sheet1',s);
 
 
   
 
 
 elseif  ratio==0.2
     
         
     mu  = 0.004; lambda = 0.0006;  thr = 15; c=2; Err_or =  0.0008;
     
 [Ori,  ratio,  PSNR_Final, FSIM_Final, SSIM_Final, jjj, difff, Time_s]=    HPnP_CS_Test(filename, ratio, mu, lambda, c, thr, Err_or); 
 
 m_20_1= m_20_1+1;
 
 s=strcat('A',num2str(m_20_1));
 
 All_data_Results_20_1{m_20_1}={Ori, ratio,  mu, lambda, c, thr, PSNR_Final,FSIM_Final,SSIM_Final,jjj, difff, Time_s};
 
 xlswrite('HPnP_CS_0.2_BSD_68.xls', All_data_Results_20_1{m_20_1},'sheet1',s);
 
 

 
 
  elseif  ratio==0.3
     

         
     mu  = 0.005; lambda = 0.0002;   thr = 15;  c=1.9; Err_or =  0.0007;
     
 [Ori,  ratio,  PSNR_Final, FSIM_Final, SSIM_Final, jjj, difff, Time_s]=    HPnP_CS_Test(filename, ratio, mu, lambda, c, thr, Err_or); 
 
 m_30_1= m_30_1+1;
 
 s=strcat('A',num2str(m_30_1));
 
 All_data_Results_30_1{m_30_1}={Ori, ratio,  mu, lambda, c, thr, PSNR_Final,FSIM_Final,SSIM_Final,jjj, difff, Time_s};
 
 xlswrite('HPnP_CS_0.3_BSD_68.xls', All_data_Results_30_1{m_30_1},'sheet1',s);
 
 
  

   elseif  ratio==0.4
     

         
     mu  = 0.006; lambda = 0.0002;   thr = 15;  c=2; Err_or =  0.00066;
     
 [Ori,  ratio,  PSNR_Final, FSIM_Final, SSIM_Final, jjj, difff, Time_s]=    HPnP_CS_Test(filename, ratio, mu, lambda, c, thr, Err_or); 
 
 m_40_1= m_40_1+1;
 
 s=strcat('A',num2str(m_40_1));
 
 All_data_Results_40_1{m_40_1}={Ori, ratio,  mu, lambda, c, thr, PSNR_Final,FSIM_Final,SSIM_Final,jjj, difff, Time_s};
 
 xlswrite('HPnP_CS_0.4_BSD_68.xls', All_data_Results_40_1{m_40_1},'sheet1',s);
 
 



 elseif  ratio== 0.5
     

         
     mu  = 0.007; lambda =0.0002;   thr = 15;  c=0.5; Err_or =  0.0003;
     
 [Ori,  ratio,  PSNR_Final, FSIM_Final, SSIM_Final, jjj, difff, Time_s]=    HPnP_CS_Test(filename, ratio, mu, lambda, c, thr, Err_or); 
 
 m_50_1= m_50_1+1;
 
 s=strcat('A',num2str(m_50_1));
 
 All_data_Results_50_1{m_50_1}={Ori, ratio,  mu, lambda, c, thr, PSNR_Final,FSIM_Final,SSIM_Final,jjj, difff, Time_s};
 
 xlswrite('HPnP_CS_0.5_BSD_68.xls', All_data_Results_50_1{m_50_1},'sheet1',s);
 
 


 else
     
  
         
  mu  = 0.007; lambda =0.0002; thr = 15;   c=0.5;
     
 [Ori,  ratio,  PSNR_Final, FSIM_Final, SSIM_Final, jjj, difff, Time_s]=    HPnP_CS_Test(filename, ratio, mu, lambda, c, thr, Err_or); 
 
 m_100_1= m_100_1+1;
 
 s=strcat('A',num2str(m_100_1));
 
 All_data_Results_100_1{m_100_1}={Ori, ratio,  mu, lambda, c, thr, PSNR_Final,FSIM_Final,SSIM_Final,jjj, difff, Time_s};
 
 xlswrite('LR_FFDNet_Inpaint_100_gamma_0.1_lambda_0.8_c1_2.3.xls', All_data_Results_100_1{m_100_1},'sheet1',s);
 
 
 
 


 end
 

clearvars -except filename i m_10_1 m_10_2 m_10_3 m_20_1 m_20_2 m_20_3 m_30_1 m_30_2 m_30_3 m_40_1 m_40_2 m_40_3...
m_50_1 m_50_2 m_50_3 m_75_1 m_75_2 m_75_3 m_100_1 m_100_2 m_100_3 All_data_Results_10_1...
All_data_Results_10_2 All_data_Results_10_3 All_data_Results_20_1 All_data_Results_20_2...
All_data_Results_20_3 All_data_Results_30_1 All_data_Results_30_2 All_data_Results_30_3...
All_data_Results_40_1 All_data_Results_40_2 All_data_Results_40_3 All_data_Results_50_1...
All_data_Results_50_2 All_data_Results_50_3 All_data_Results_75_1 All_data_Results_75_2...
All_data_Results_75_3 All_data_Results_100_1 All_data_Results_100_2 All_data_Results_100_3
end
clearvars -except filename m_10_1 m_10_2 m_10_3 m_20_1 m_20_2 m_20_3 m_30_1 m_30_2 m_30_3 m_40_1 m_40_2 m_40_3...
m_50_1 m_50_2 m_50_3 m_75_1 m_75_2 m_75_3 m_100_1 m_100_2 m_100_3 All_data_Results_10_1...
All_data_Results_10_2 All_data_Results_10_3 All_data_Results_20_1 All_data_Results_20_2...
All_data_Results_20_3 All_data_Results_30_1 All_data_Results_30_2 All_data_Results_30_3...
All_data_Results_40_1 All_data_Results_40_2 All_data_Results_40_3 All_data_Results_50_1...
All_data_Results_50_2 All_data_Results_50_3 All_data_Results_75_1 All_data_Results_75_2...
All_data_Results_75_3 All_data_Results_100_1 All_data_Results_100_2 All_data_Results_100_3
end






         