function [COVMf,COVMPhi,COVMzeta] = COVmat(f,Phi,zeta,COVf,COVPhi,COVzeta)

%===========================================================================================================================================================
%***********************************************************************************************************************************************************
%
%                                      --------------------------------------------------
%                                                          PREAMBLE
%                                      --------------------------------------------------
%
%[COVMf,COVMPhi,COVMzeta] = COVmat(f,Phi,zeta,COVf,COVPhi,COVzeta) 
%
%By Adarsh S, Ph.D. Candidate IIT Kanpur
%
%Function description:
%------------------------
%Genereates the diagonal covariance matrices for modal data given the
%coefficient-of-variance of the prediction error
%
%%Input Arguments:
%----------------
%1) f: Vector of natural frequencies
%2) Phi : Mode shape matrix
%3) zeta : Vector of modal damping ratios
%4) COVf: Coefficient-of-variance of noise for natural frequencies
%5) COVPhi: Coefficient-of-variance of noise for mode shape amplitudes
%6) COVzeta: Coefficient-of-variance of noise for modal damping ratios
%
%Output Arguments:
%-----------------
%1) COVMf: Covariance matrix for natural frequncies
%2) COVMPhi: 3-D matrix of covariance matrices for mode shapes
%3) COVMzeta: Covariance matrix for damping ratios
%
%Example:
% [COVMf,COVMPhi1N,COVMzeta] = COVmat(fm, Phim1N,zetam,1/100,1/100,20/100) ;
%
%                                      -----------------------------------------------
%                            *********|| All rights reserved; Adarsh S; October, 2019 || *********
%                                      -----------------------------------------------
%
%

%===========================================================================================================================================================
%***********************************************************************************************************************************************************


COVMf = zeros(length(f),length(f)) ;
[m,n] = size(Phi) ;
COVMPhi = zeros(m,m,n) ;
COVMzeta = zeros(length(zeta),length(zeta)) ;

for i = 1:1:length(f)
    
   COVMf(i,i) =  (f(i)*COVf)^2 ;
   COVMzeta(i,i) =  (zeta(i)*COVzeta)^2 ;
   
     
end


for  i = 1:1:n
 for j = 1:1:m

COVMPhi(j,j,i) = (Phi(j,i)*COVPhi)^2 ;

 end
end






end