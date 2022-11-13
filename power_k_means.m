## Copyright (C) 2020 HP ProBook
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} power_k_means (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: HP ProBook <HP ProBook@DESKTOP-A6TLB2C>
## Created: 2020-03-01
 
function [centroids] = power_k_means (data,s,k,max_iterations)
    %s = 1;
    [m n] = size(data)
    centroids = init_centroids(30,k,n);
    for i=1:max_iterations
      w_mat = compute_w_mat(data,centroids,s);
      %w_mat takes a lot of time
      centroids = compute_centers(w_mat,data);
      
    end  
endfunction
