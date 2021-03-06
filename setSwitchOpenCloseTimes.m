function setSwitchOpenCloseTimes(fid1,closetime,opentime)
% This is a helper function that write data in a specific format for switches in the ATP file


%/*Copyright (c) 2014, Ahmad Abdullah
% All rights reserved.
%
% Redistribution and use in source and binary forms, with or without modification,
% are permitted provided that the following conditions are met:
%
%  Redistributions of source code must retain the above copyright notice, this
% list of conditions and the following disclaimer.
%
% * Redistributions in binary form must reproduce the above copyright notice,
% this list of conditions and the following disclaimer in the documentation
% and/or other materials provided with the distribution.
%
% * The names of its contributors may not be used to endorse or promote products
% derived from this software without specific prior written permission.
%
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
% AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
% ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
% LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
% DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
% SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
% CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
% OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
% USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.*/
%
%   @author Ahmad Abdullah
%   @e-mail ahmad.abdullah@ieee.org
%

s1=ftell(fid1); % current position
s2=14; % shifting 1
s3=10; % shifting 2
fseek(fid1,s1+s2,-1);fprintf(fid1,'                     ');
% ct
if closetime<0
   flag=floor(log10(-closetime));
   switch flag
   case 0
      fseek(fid1,s1+s2,-1);fprintf(fid1,'%8.7f',closetime);
   case {-1,-2,-3,-4,-5}
      z1=sprintf('%9.8f',closetime);z2=[z1(1) z1(3:11)];
      fseek(fid1,s1+s2,-1);fprintf(fid1,'%10s',z2);
   otherwise
      error('closetime is not in required bounds')
   end
elseif closetime>0
   flag=floor(log10(closetime));
   switch flag
   case 0
      fseek(fid1,s1+s2,-1);fprintf(fid1,'%9.8f',closetime);
   case {-1,-2,-3,-4,-5}
      z1=sprintf('%10.9f',closetime);z2=z1(2:11);
      fseek(fid1,s1+s2,-1);fprintf(fid1,'%10s',z2);
   otherwise
      error('closetime is not in required bounds')
   end
else % ct==0
   fseek(fid1,s1+s2,-1);fprintf(fid1,'%9.8f',closetime);
end
% ot
if opentime<0
   error('closetime is not in required bounds')
end
flag=floor(log10(opentime));
switch flag
case 0
   fseek(fid1,s1+s2+s3,-1);fprintf(fid1,'%9.8f',opentime);
case {-1,-2,-3,-4,-5}
   z1=sprintf('%10.9f',opentime);z2=z1(2:11);
   fseek(fid1,s1+s2+s3,-1);fprintf(fid1,'%10s',z2);
otherwise
   error('opentime is not in required bounds')
end
