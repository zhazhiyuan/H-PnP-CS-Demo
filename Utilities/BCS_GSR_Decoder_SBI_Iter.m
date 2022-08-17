
function [reconstructed_image All_PSNR] = BCS_GSR_Decoder_SBI_Iter(y, Opts)

row = Opts.row;% row is 256
col = Opts.col;% col is 256
Phi = Opts.Phi;% 测量矩阵is 307*1024
x_org = Opts.org;% x_org is 256*256 origimal image
IterNum = Opts.IterNum;% iTterNum is 120
x_initial = Opts.initial; %256*256预初始化 MH_BCS_SPL 方法
block_size = Opts.block_size;%32
Inloop = Opts.Inloop;% 200
mu = Opts.mu;%0.0025

x = im2col(x_initial, [block_size block_size], 'distinct');%1024*64

u = zeros(size(x));
b = zeros(size(x));

All_PSNR = zeros(1,IterNum);


ATA = Phi'*Phi;%QtQ   1024*1024
ATy = Phi'*y;%Qty     1024*64
IM = eye(size(ATA));% mu*I   1024*1024

for i = 1:IterNum
    
    x_hat = x;%  initial 1024*64
             
    r = col2im(x_hat - b, [block_size block_size],[row col], 'distinct');  %r is=u-b文献3343第11行
    
    x_bar = GSR_Solver_CS(r, Opts);
    
    x_bar = im2col(x_bar, [block_size block_size], 'distinct');
    
    u = x_bar;%Da
  %%  
    for kk = 1:Inloop
        
          d = ATA*x_hat - ATy + mu*(x_hat - u - b);
         dTd = d'*d;
         G = d'*(ATA + mu*IM)*d;
         Step_Matrix = abs(dTd./G); 
         Step_length = diag(diag(Step_Matrix));
         x = x_hat - d*Step_length;
         x_hat = x;    
     end
    %%
 %    x = (ATA+  mu*IM)\(ATy  + mu*( u+b));
 
      b = b - (x - u);
   
    x_img = col2im(x, [block_size block_size],[row col], 'distinct');
    
    Cur_PSNR = csnr(x_img,x_org,0,0);
    All_PSNR(i) = Cur_PSNR;
    fprintf('IterNum = %d, PSNR = %0.2f\n',i,Cur_PSNR);
    
end

reconstructed_image = col2im(x, [block_size block_size],[row col], 'distict');

