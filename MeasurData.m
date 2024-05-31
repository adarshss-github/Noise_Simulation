function [fm,Phim,zetam] = MeasurData(f,Phi,zeta,mod,COVf,COVPhi,COVzeta) 

%===========================================================================================================================================================
%***********************************************************************************************************************************************************
%
%                                      --------------------------------------------------
%                                                          PREAMBLE
%                                      --------------------------------------------------
%
%[fm,Phim,zetam] = MeasurData(f,Phi,zeta,mod,COVf,COVPhi,COVzeta) 
%
%By Adarsh S, Ph.D. Candidate IIT Kanpur
%
%Function description:
%------------------------
%Adds zero-mean random Gaussian noise to modal parameters according to coefficient-of-variance
%given for noise
%
%%Input Arguments:
%----------------
%1) f: Vector of natural frequencies
%2) Phi : Mode shape matrix
%3) zeta : Vector of modal damping ratios
%4) nmod: Number of modes to be considered
%5) COVf: Coefficient-of-variance of noise for natural frequencies
%6) COVPhi: Coefficient-of-variance of noise for mode shape amplitudes
%7) COVzeta: Coefficient-of-variance of noise for modal damping ratios
%
%Output Arguments:
%-----------------
%1) fm: Natural frequncies with added noise
%2) Phim: Mode shapes with added noise
%3) zetam: Modal damping ratios with added noise
%
%Example:
% [fm,Phim,zetam] = MeasurData(f,Phi,zeta,[1,2],10/100,10/100,20/100) ;
%
%                                      -----------------------------------------------
%                            *********|| All rights reserved; Adarsh S; October, 2019 || *********
%                                      -----------------------------------------------
%
%

%===========================================================================================================================================================
%***********************************************************************************************************************************************************

f = f(mod) ;
Phi =  Phi(:,mod) ;
zeta = zeta(mod)  ;

fm = zeros(length(f),1) ;
[mPhi,nPhi] = size(Phi) ;
Phim = zeros(mPhi,nPhi) ;
zetam = zeros(length(zeta),1) ;

for i = 1:1:length(fm)

fm(i) = f(i) + (COVf*f(i))*randn ;
zetam(i) = zeta(i) + (COVzeta*zeta(i))*randn ;

end

for i = 1:1:mPhi
    for j = 1:1:nPhi

Phim(i,j) = Phi(i,j) +  (COVPhi*Phi(i,j))*randn ;

    end

end



end