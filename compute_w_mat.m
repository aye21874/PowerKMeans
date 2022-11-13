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
## @deftypefn {} {@var{retval} =} compute_w_mat (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: HP ProBook <HP ProBook@DESKTOP-A6TLB2C>
## Created: 2020-03-01

function weights = compute_w_mat (data, centroids,s)
  n = size(data,1)
  k = size(centroids,1)
  weights = zeros(n,k)
  for i = 1:n
    curr = repmat(data(i,:),k,1)
    diff = centroids - curr;
    norm = sum(diff.^2,2)
    denom = sum(norm.^s,1)/k
    denom = denom^(1-1/s)
    weights(i,:) = ((norm.^(s-1))/(k*denom))'
  endfor
endfunction 
