function oP = getParameters(iType, varargin)
%getParameters določi paramatre glede na dan tip poravnave
%vhodni parametri:
%   iType - tip poravnave, dan v stringu
%   vararagin - dani parametri (stopinje v stopinjah!)
%izhodni parameetri:
%   oP - matrika dane poravnave

%afina preslikava
if strcmp(iType, 'affine')
    
    %skaliranje
    Tk = eye(3);
    Tk(1,1) = varargin{1}(1);
    Tk(2,2) = varargin{1}(2);
    
    %translacija
     Tt = eye(3);
     Tt(1,3) = varargin{2}(1);
     Tt(2,3) = varargin{2}(2);
     
     %rotacija
     phi = varargin{3};
     
     Tf = [cosd(phi) -sind(phi) 0;
         sind(phi) cosd(phi) 0;
         0  0   1;];
     
     %strig
     Tg = eye(3);
     Tg(1,2) = varargin{4}(1);
     Tg(2,1) = varargin{4}(2);
     
     %matrika afine preslikave
     oP = Tg * Tf * Tt * Tk;
elseif strcmp(iType, 'radial')
    % število kontrolnih točk
    K = size (varargin{1},1);
    UU = zeros(K);
    kontrolne= varargin{1};
    for i = 1:K
        UU (i,: ) = getRadialValue(kontrolne(i,:), kontrolne)';
    end
    %koeficienti alpha
    a = UU\varargin{2}(:,1);
    b = UU\varargin{2}(:,2);
    oP{1} = kontrolne;
    oP{2} = [a b];
 elseif strcmp(iType, 'polynomial')
    kontrolne = varargin{1}
    preslikane_kontrolne = varargin{2}
    
end


     
    
end
