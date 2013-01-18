%DOESBLOCKEXIST Checks wether a Simulink block already exists in a Simulink model.
%
% RES = doesblockexist(MDLNAME, BLOCKADDRESS) is true, if the block exists, false otherwise.
% MDLNAME is the name of the Simulink model to work in.
% BLOCKADRESS is the address of the Simulink block within the model.
%
% Authors::
%  J�rn Malzahn   
%  2012 RST, Technische Universit�t Dortmund, Germany
%  http://www.rst.e-technik.tu-dortmund.de  
%
% See also symexpr2slblock, distributeblocks.

% Copyright (C) 1993-2012, by Peter I. Corke
%
% This file is part of The Robotics Toolbox for Matlab (RTB).
% 
% RTB is free software: you can redistribute it and/or modify
% it under the terms of the GNU Lesser General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% RTB is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU Lesser General Public License for more details.
% 
% You should have received a copy of the GNU Leser General Public License
% along with RTB.  If not, see <http://www.gnu.org/licenses/>.
%
% http://www.petercorke.com

function [res] = doesblockexist(mdlName, blockAddress)
 
wasntLoaded = 0;
if ~bdIsLoaded(mdlName)
    load_system(mdlName)
    wasntLoaded = 1;
end

blockList = find_system(mdlName);
blockList = strfind(blockList,blockAddress);
emptyList = cellfun(@isempty,blockList);
res = any(~emptyList);


if wasntLoaded
    close_system(mdlName)
end

