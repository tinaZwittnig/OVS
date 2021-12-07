% iskanje robov z alternativnim detektorjem
function oImage = findEdgesAlter(iImage, iThreshold)

    % glajenje slike z Gaussovim filtrom
    gMax = 0;
    gImage = zeros(size(iImage));
    gK = [0.01 0.08 0.01; 0.08 0.64 0.08; 0.01 0.08 0.01]./9;
    n = floor((size(gK,1)-1)/2);
    m = floor((size(gK,2)-1)/2);
    tImage = zeros(size(iImage,1)+(2*n),size(iImage,2)+(2*m));
    tImage(n+1:n+size(iImage,1),m+1:m+size(iImage,2)) = iImage;    
    for y = 1:n
        tImage(y,:) = tImage((2*n+1)-y,:);
        tImage((size(iImage,1)+n)+y,:) = tImage((size(iImage,1)-n)+(2*n+1)-y,:);
    end
    for x = 1:m
        tImage(:,x) = tImage(:,(2*m+1)-x);
        tImage(:,(size(iImage,2)+m)+x) = tImage(:,(size(iImage,2)-m)+(2*m+1)-x);        
    end   
    for y = n+1:n+size(iImage,1)
        for x = m+1:m+size(iImage,2)
            gImage(y-n,x-m) = sum(sum(gK.*tImage(y-n:y+n,x-m:x+m)));
            if (gImage(y-n,x-m) > gMax)
                gMax = gImage(y-n,x-m);
            end
        end
    end
    gImage = gImage./gMax;
    % iskanje robov s Sobelovim operatorjem
    sMax = 0;
    sImage = zeros(size(gImage));
    sX = [-1 0 1; -2 0 2; -1 0 1];
    sY = [-1 -2 -1; 0 0 0; 1 2 1];    
    n = floor((size(sX,1)-1)/2);
    m = floor((size(sX,2)-1)/2);
    tImage = zeros(size(gImage,1)+(2*n),size(gImage,2)+(2*m));
    tImage(n+1:n+size(gImage,1),m+1:m+size(gImage,2)) = gImage;    
    for y = 1:n
        tImage(y,:) = tImage((2*n+1)-y,:);
        tImage((size(gImage,1)+n)+y,:) = tImage((size(gImage,1)-n)+(2*n+1)-y,:);
    end
    for x = 1:m
        tImage(:,x) = tImage(:,(2*m+1)-x);
        tImage(:,(size(gImage,2)+m)+x) = tImage(:,(size(gImage,2)-m)+(2*m+1)-x);        
    end   
    for y = n+1:n+size(gImage,1)
        for x = m+1:m+size(gImage,2)
            sImage(y-n,x-m) = sqrt(sum(sum(sX.*tImage(y-n:y+n,x-m:x+m)))^2+sum(sum(sY.*tImage(y-n:y+n,x-m:x+m)))^2);
            if (sImage(y-n,x-m) > sMax)
                sMax = sImage(y-n,x-m);
            end
        end
    end 
    sImage = sImage./sMax;
    % upragovljanje slike (izhodna slika robov)
    oImage = zeros(size(sImage));
    oImage(find(sImage >= iThreshold)) = 1;
    oImage(find(sImage <  iThreshold)) = 0;