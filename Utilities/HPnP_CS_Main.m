

function [reconstructed_image, PSN_Result,FSIM_Result,SSIM_Result,diffff, j] = HPnP_CS_Main(y,par,Error_Num)

randn ('seed',0);

               row                   =                par.row;
               
               col                   =                par.col;
               
               Phi                   =                par.Phi;
               
               x_org                 =                par.org;
               
               IterNum               =                par.IterNum;
               
               X_Initial             =                par.initial;               
               
               block_size            =                par.block_size;
               
               loop                  =                par.loop;

               mu                    =                par.mu;
         
         lr_lambda                   =                par.lambda;
         
              X                      =                im2col(X_Initial, [block_size block_size], 'distinct');
              
              Z                      =                X;
         
              C                      =                zeros(size(X));
              
              ATA                    =                 Phi'*Phi;
              
              ATy                    =                 Phi'*y;
              
              IM                     =                 eye(size(ATA));

        All_PSNR                     =               zeros(1,IterNum);
        
        Denoising                    =                cell (1, IterNum);     

fprintf('Initial PSNR = %f\n',csnr(X_Initial,x_org,0,0));



for   j                 =                    1:IterNum
    
    
        X_hat           =                      X;

        G               =                     col2im(X_hat, [block_size block_size],[row col], 'distinct');    
    
        L               =                     LR_WNNM_Main(G, par);% Low rank
        
       L_bar            =                     im2col(L, [block_size block_size], 'distinct');
       
        
        
        for    jj    =     1:loop
        
        D       =         ATA*X_hat - ATy +  lr_lambda*X_hat - lr_lambda*L_bar + mu*(X_hat - Z - C);
        
        DTD     =         D'*D;
        
        G       =         D'*(ATA + mu*IM)*D;
        
       Step_Matrix   =    abs(DTD./G); 
       
       STEP_LENGTH   =    diag(diag(Step_Matrix));
       
       X             =     X_hat - D*STEP_LENGTH;
       
       X_hat         =      X;    
       
        end
        
        Z            =      FFD_Net_Denoiser (col2im(X_hat, [block_size block_size],[row col], 'distinct')...
            - col2im(C, [block_size block_size],[row col], 'distinct'), par.thr); %FFDNet 
        
        
        Z            =       im2col(Z, [block_size block_size], 'distinct');   
        
        
       
        C            =      C - (X-Z);
    
    All_PSNR(j) = csnr(col2im(X, [block_size block_size],[row col], 'distinct'),x_org,0,0);
    
    
       Denoising{j}               =  col2im(X, [block_size block_size],[row col], 'distinct');
    
    fprintf('iter number = %d, PSNR = %f, SSIM = %f\n',j,csnr(col2im(X, [block_size block_size],[row col], 'distinct'),x_org,0,0),...
        cal_ssim(x_org,col2im(X, [block_size block_size],[row col], 'distinct'),0,0));

    if j>15
        
         diffff      =  norm(abs(Denoising{j}) - abs(Denoising{j-1}),'fro')/norm(abs(Denoising{j-1}), 'fro');
        
        if diffff<Error_Num
            
            break;
            
        end
    end

end

reconstructed_image = Denoising{j};

PSN_Result  = csnr(reconstructed_image,x_org,0,0);
FSIM_Result = FeatureSIM(reconstructed_image,x_org);
SSIM_Result  = cal_ssim(reconstructed_image,x_org,0,0);


end

