

function [filename,ratio,PSN_Result,FSIM_Result,SSIM_Result, jjj, diffff, Time_s]   =   HPnP_CS_Test(filename, ratio, mu, lambda, c, thr, Err_or)
        
        
         time0                    =                          clock;
         
         
         subrate                  =                          ratio;
         
        Original_Filename         =                          [filename '.png'];
        
        Original_Image            =                           imread(Original_Filename);
        
        [ww, hh,kkk]    =                           size(Original_Image);
        
        Original_Image                   =    imresize (Original_Image, [ww-1, hh-1]);     
        
        
        if kkk==3
            
            original_image=double(rgb2gray(Original_Image));
            
        else
            
           original_image=double((Original_Image));
           
        end
        
       block_size              =                  32; % Block size   

      [row, col]               =                  size(original_image);
      
      
       N                       =                  block_size * block_size;
       
       M                       =                  round(subrate * N);
       
      randn('seed',0);
      
      Phi                      =                  orth(randn(N, N))';
      
      Phi                      =                  Phi(1:M, :);
        
      x                        =                  im2col(original_image, [block_size block_size], 'distinct');
        
      y                        =                  Phi * x;
        
        % Obtain Initilization by MH
       disp('Initilization ...');
     [x_MH x_DWT]              =                 MH_BCS_SPL_Decoder(y, Phi, subrate, row, col);
         disp('Ending Initilization ...');

        par                    =                   [];
        
        par.Phi                =                  Phi;
        
        par.block_size         =                  block_size;
        
        par.row                =                  row;
        
        par.col                =                  col;
        
        
       if ~isfield(par,'initial')
            par.initial = double(x_MH);
        end
        
        
        if ~isfield(par,'mu')
            par.mu = mu;
        end
        
        if ~isfield(par,'lambda')
            par.lambda = lambda;
        end       
        
        if ~isfield(par,'c')
            par.c = c;
        end             
        
        if ~isfield(par,'org')
            par.org = original_image;
        end  

        if ~isfield(par,'patch')
            par.patch = 7;  % patch size
        end
        
         if ~isfield(par,'step')
            par.step = 4;
         end       
        
         if ~isfield(par,'Similar_patch')
             par.Similar_patch = 60; % Similar patches 60 
         end
         
         if ~isfield(par,'Region')
              par.Region = 20; % Region
         end        
        
        if ~isfield(par,'sigma')
               par.sigma = sqrt(2);
        end 
        
        if ~isfield(par,'thr')
               par.thr =  thr;
        end         
        
        if ~isfield(par,'e')
               par.e = 0.35;
        end     
        
         if ~isfield(par,'IterNum')
               par.IterNum = 60;
        end         
                  
        
        if ~isfield(par,'loop')
               par.loop = 200;
        end         
           
        
     fprintf('.........................................\n');
     fprintf(filename);
     fprintf('\n');
     fprintf('..........................................\n');
     
     fprintf('Initial PSNR = %0.2f\n',csnr(par.org,par.initial,0,0));
     
     fprintf('..................................................\n');

        [reconstructed_image, PSN_Result,FSIM_Result,SSIM_Result,diffff, jjj] = HPnP_CS_Main(y,par, Err_or);


                 Time_s =(etime(clock,time0));  
                 
        if ratio==0.1
            
        Final_Name= strcat(filename,'_HPnP_CS_',num2str(ratio),'_PSNR_',num2str(PSN_Result),'_FSIM_',num2str(FSIM_Result),'_SSIM_',num2str(SSIM_Result),'.png');
            
        imwrite(uint8(reconstructed_image),strcat('./CS_0.1_Results/',Final_Name));        
        elseif ratio==0.2
            
        Final_Name= strcat(filename,'_HPnP_CS_',num2str(ratio),'_PSNR_',num2str(PSN_Result),'_FSIM_',num2str(FSIM_Result),'_SSIM_',num2str(SSIM_Result),'.png');
            
        imwrite(uint8(reconstructed_image),strcat('./CS_0.2_Results/',Final_Name));
        elseif ratio==0.3
            
        Final_Name= strcat(filename,'_HPnP_CS_',num2str(ratio),'_PSNR_',num2str(PSN_Result),'_FSIM_',num2str(FSIM_Result),'_SSIM_',num2str(SSIM_Result),'.png');
        
        imwrite(uint8(reconstructed_image),strcat('./CS_0.3_Results/',Final_Name));
        elseif ratio==0.4
            
        Final_Name= strcat(filename,'_HPnP_CS_',num2str(ratio),'_PSNR_',num2str(PSN_Result),'_FSIM_',num2str(FSIM_Result),'_SSIM_',num2str(SSIM_Result),'.png');
        
        imwrite(uint8(reconstructed_image),strcat('./CS_0.4_Results/',Final_Name));
        else
            
        Final_Name= strcat(filename,'_HPnP_CS_',num2str(ratio),'_PSNR_',num2str(PSN_Result),'_FSIM_',num2str(FSIM_Result),'_SSIM_',num2str(SSIM_Result),'.png');
        
        imwrite(uint8(reconstructed_image),strcat('./CS_0.5_Results/',Final_Name));
                                
        end    



end

