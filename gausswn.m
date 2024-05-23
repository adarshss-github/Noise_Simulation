function [Y,t] = gausswn(S,opt,fs,ti,tf,mY)

%===========================================================================================================================================================
%***********************************************************************************************************************************************************
%
%                                      --------------------------------------------------
%                                                          PREAMBLE
%                                      --------------------------------------------------
%
%[Y,t] = gausswn(S,opt,fs,ti,tf,mY) ;
%
%By Adarsh S, Ph.D. Candidate IIT Kanpur
%
%Description:
%-----------
%This function generates bandlimited zero mean Gaussian white noise signals, with a specified
%power spectral density value or rms value, arranged in rows upto time tf seconds
%
%Input Arguments:
%---------------
%1)If opt = 1 ,S is treated as the constant power spectral density value (Unit^2/Hz) , and if opt = 2, S is treated as root
% means square value (rms) for the Gasusian white noise signals which are to be generated
%2)fs is the sampling frequency of the generated signals
%3) ti is the initial time from which you want to generate the values
%4)tf is the time in seconds upto which you want to generate the values 
%5) mY is the number of signals you want
%
%Output Arguments:
%----------------
%1)Y is the generated signal matrix, each signal is arranged in rows
%2)t is the time axis
%
%Example:[F,t] = gausswn(96.2,1,100,0,600,10) ;
%
%
%                                      -----------------------------------------------
%                            *********|| All rights reserved; Adarsh S; October, 2019 || *********
%                                      -----------------------------------------------
%
%
%***********************************************************************************************************************************************************
%===========================================================================================================================================================

dt = 1/fs ;
t = ti:dt:tf ;
N = length(t) ;

if opt == 1
    
    Y = sqrt(S*fs)*randn(mY,N) ;
    
elseif opt == 2
    
    Y = S*randn(mY,N) ;
    
else
    
    error('The value of opt should be 1 or 2') ;
    
end

end
    