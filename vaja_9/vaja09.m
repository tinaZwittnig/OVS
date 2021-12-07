function varargout = vaja09(varargin)
% VAJA09 M-file for vaja09.fig
%      VAJA09, by itself, creates a new VAJA09 or raises the existing
%      singleton*.
%
%      H = VAJA09 returns the handle to a new VAJA09 or the handle to
%      the existing singleton*.
%
%      VAJA09('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VAJA09.M with the given input arguments.
%
%      VAJA09('Property','Value',...) creates a new VAJA09 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before vaja09_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to vaja09_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help vaja09

% Last Modified by GUIDE v2.5 05-Dec-2017 09:55:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @vaja09_OpeningFcn, ...
                   'gui_OutputFcn',  @vaja09_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before vaja09 is made visible.
function vaja09_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to vaja09 (see VARARGIN)

% Choose default command line output for vaja09
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% doloci globalne spremenljivke
global regCP; regCP = [];
global difImage; difImage = []; 
global chsImage; chsImage = [];

% UIWAIT makes vaja09 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = vaja09_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in refListbox.
function refListbox_Callback(hObject, eventdata, handles)
% hObject    handle to refListbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns refListbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from refListbox


% --- Executes during object creation, after setting all properties.
function refListbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to refListbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

% --- Executes on button press in removeRefLandmark.
function removeRefLandmark_Callback(hObject, eventdata, handles)
% hObject    handle to removeRefLandmark (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
removeLandmark(handles.refAxes, handles.refListbox, handles.refPanel);




% --- Executes on button press in registerImages.
function registerImages_Callback(hObject, eventdata, handles)
% hObject    handle to registerImages (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    % ---- poravnaj vhodno in referencno sliko ----
    % referenèna in vhodna slika
    refImage = get(handles.refAxes, 'UserData');
    inpImage = get(handles.inpAxes, 'UserData');
    % referenène in vhodne toèke
    refCP = getLandmark(handles.refListbox);
    inpCP = getLandmark(handles.inpListbox);
    % vrsta poravnave
    regType = strtrim(get(get(handles.regType, 'SelectedObject'), 'UserData'));
    
    % preveri vrednost spremenljivk in izdaj opozorila
    if (isempty(refImage) || isempty(inpImage))
        mHandle = warndlg('Pred poravnavo nalozi referencno in vhodno sliko.', 'Opozorilo', 'modal');
    elseif ((size(refCP,1) ~= 3 || size(inpCP,1) ~= 3) && strcmp(regType, 'interpolation'))
        mHandle = warndlg('Pri afini interpolacijski poravnavi je potrebno izbrati natancno 3 pare kontrolnih tock na referencni in vhodni sliki.', 'Opozorilo', 'modal');
    elseif ((size(refCP,1) <= 3 || size(inpCP,1) <= 3) && strcmp(regType, 'approximation'))
        mHandle = warndlg('Pri afini aproksimacijski poravnavi je potrebno izbrati vsaj 4 pare kontrolnih tock na referencni in vhodni sliki.', 'Opozorilo', 'modal');
    elseif (size(refCP,1) ~= size(inpCP,1))
        mHandle = warndlg('Stevilo kontrolnih tock na referencni sliki mora biti enako stevilu kontrolnih tock na vhodni sliki.', 'Opozorilo', 'modal');
    else
        % afina poravnava
        global regCP;
        [regMatrix, regCP, regImage] = affineRegistration(regType, refCP, inpCP, inpImage);
        % slika razlik in šahovnica
        global difImage chsImage;
        [difImage, chsImage] = getImages(refImage, regImage, str2double(get(handles.cSize, 'String')));
        
        % doloèi podroèje raèunanja MSE
        mseArea = str2num([get(handles.xMSE, 'String'), ' ', get(handles.yMSE, 'String'), ' ', get(handles.wMSE, 'String'), ' ', get(handles.hMSE, 'String')]);

        % prikaz poravnane vhodne slike
        displayImage(regImage, handles.regAxes, -1, handles.regPanel);
        if (get(handles.displayMSEArea, 'Value') == 1)
            % prikaži podroèje
            drawArea(mseArea, handles.regAxes);
        else   
            % prikaži toèke
            set(handles.regPanel, 'UserData', 1);
            for k = 1:size(regCP,1)
                drawLandmark(regCP(k,1), regCP(k,2), handles.regAxes, handles.regPanel);
            end
        end
        
        % prikaz slike razlik / šahovnice
        if (get(handles.displayChessboard, 'Value') == 1)
            % prikaz slike šahovnice
            displayImage(chsImage, handles.difAxes, -1, handles.difPanel);
        else
            % prikaz slike razlik            
            displayImage(difImage, handles.difAxes, -1, handles.difPanel);
        end
        
        % izraèun napake R2 in MSE
        [R2, MSE] = computeError(refCP, inpCP, regCP, double(refImage), double(inpImage), double(regImage), mseArea);               
        % prikaz R2 in MSE (upoštevaj nDec decimalnih mest)
        nDec = 1;
        R2 = floor(R2.*(10^nDec))./(10^nDec);        
        MSE = floor(MSE.*(10^nDec))./(10^nDec);
        if (~isnan(R2(1)))
            str = num2str(R2(1));
            if (isempty(strfind(str,'.')))
                str = [str, '.0'];
            end
            set(handles.R2a, 'String', str);
        end
        if (~isnan(R2(2)))
            str = num2str(R2(2));
            if (isempty(strfind(str,'.')))
                str = [str, '.0'];
            end            
            set(handles.R2b, 'String', str);
        end        
        if (~isnan(MSE(1)))
            str = num2str(MSE(1));
            if (isempty(strfind(str,'.')))
                str = [str, '.0'];
            end
            set(handles.MSEa, 'String', str);
        end
        if (~isnan(MSE(2)))        
            str = num2str(MSE(2));
            if (isempty(strfind(str,'.')))
                str = [str, '.0'];
            end
            set(handles.MSEb, 'String', str);
        end
    end

% --- Executes on selection change in inpListbox.
function inpListbox_Callback(hObject, eventdata, handles)
% hObject    handle to inpListbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns inpListbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from inpListbox


% --- Executes during object creation, after setting all properties.
function inpListbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inpListbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on button press in removeInpLandmark.
function removeInpLandmark_Callback(hObject, eventdata, handles)
% hObject    handle to removeInpLandmark (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    % ---- odstrani tocko iz seznama tock na vhodni sliki ----
    removeLandmark(handles.inpAxes, handles.inpListbox, handles.inpPanel);



function xMSE_Callback(hObject, eventdata, handles)
% hObject    handle to xMSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xMSE as text
%        str2double(get(hObject,'String')) returns contents of xMSE as a double


% --- Executes during object creation, after setting all properties.
function xMSE_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xMSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function yMSE_Callback(hObject, eventdata, handles)
% hObject    handle to yMSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yMSE as text
%        str2double(get(hObject,'String')) returns contents of yMSE as a double


% --- Executes during object creation, after setting all properties.
function yMSE_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yMSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function wMSE_Callback(hObject, eventdata, handles)
% hObject    handle to wMSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wMSE as text
%        str2double(get(hObject,'String')) returns contents of wMSE as a double


% --- Executes during object creation, after setting all properties.
function wMSE_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wMSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function hMSE_Callback(hObject, eventdata, handles)
% hObject    handle to hMSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hMSE as text
%        str2double(get(hObject,'String')) returns contents of hMSE as a double


% --- Executes during object creation, after setting all properties.
function hMSE_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hMSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on button press in displayMSEArea.
function displayMSEArea_Callback(hObject, eventdata, handles)
% hObject    handle to displayMSEArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    % ---- prikaži / skrij obmoèje raèunanja MSE ----
    regImage = get(handles.regAxes, 'UserData');
    difImage = get(handles.difAxes, 'UserData');
    if (~isempty(regImage) && ~isempty(difImage))
        displayImage(regImage, handles.regAxes, -1, handles.regPanel);
        displayImage(difImage, handles.difAxes, -1, handles.difPanel);
        if (get(hObject, 'Value') == 1)
            % prikazi podrocje MSE na izhodni sliki in sliki razlik
            mseArea = str2num([get(handles.xMSE, 'String'), ' ', get(handles.yMSE, 'String'), ' ', get(handles.wMSE, 'String'), ' ', get(handles.hMSE, 'String')]);
            drawArea(mseArea, handles.regAxes);
            drawArea(mseArea, handles.difAxes); 
            set(hObject, 'String', 'Prikazi tocke');
        else
            % prikaži toèke
            global regCP;
            if (~isempty(regCP))
                for k = 1:size(regCP,1)
                    drawLandmark(regCP(k,1), regCP(k,2), handles.regAxes, handles.regPanel);
                end
                set(handles.regPanel, 'UserData', 1);
                set(hObject, 'String', 'Prikazi podrocje');
            end
        end
    end

% --- Executes on button press in displayChessboard.
function displayChessboard_Callback(hObject, eventdata, handles)
% hObject    handle to displayChessboard (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    % preveri spremembo velikosti šahovnice
    if str2double(get(handles.cSize, 'String')) ~= get(handles.cSize, 'UserData')
        global difImage chsImage;
        [difImage, chsImage] = getImages(get(handles.refAxes, 'UserData'), get(handles.inpAxes, 'UserData'), str2double(get(handles.cSize, 'String')));
        set(handles.cSize, 'UserData', cS);
        set(hObject, 'Value', 1);
    end
    % ---- prikaži / skrij sliko šahovnice ----
    if (get(hObject, 'Value') == 1)
        % prikaži sliko šahovnice
        global chsImage;   
        if (~isempty(chsImage))
            displayImage(chsImage, handles.difAxes, -1, handles.difPanel);
            set(hObject, 'String', 'Prikazi razliko');
        end
    else
        % prikaži sliko razlik
        global difImage;
        if (~isempty(difImage))
            displayImage(difImage, handles.difAxes, -1, handles.difPanel);
            set(hObject, 'String', 'Prikazi sahovnico');
        end
    end


% --- Executes during object creation, after setting all properties.
function figureVaja09_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figureVaja09 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
    clc;
    scrSize = get(0, 'ScreenSize');
    figSize = get(hObject, 'Position');
    set(hObject, 'Position', [(scrSize(3)-figSize(3))/2 (scrSize(4)-figSize(4))/2 figSize(3) figSize(4)]);    


% --- Executes on button press in saveImages.
function saveImages_Callback(hObject, eventdata, handles)
% hObject    handle to saveImages (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    imwrite(uint8(frame2im(getframe(handles.figureVaja09))), 'GUI.jpg');


function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on key press with focus on figureVaja09 and none of its controls.
function figureVaja09_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figureVaja09 (see GCBO)
% eventdata  structure with the following fields (see FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
% ---- dodaj vnaprej dolocene tocke ----
if (strcmp(eventdata.Modifier, 'control') && strcmp(eventdata.Key, 'l'))
    % dodaj naslednje referencne tocke
    rCP = [82 230; 112 236; 154 247; 182 257; 257 268; 288 274; 95 169; 127 177; 172 191; 206 203; 272 132; 335 145];    
    while (~isempty(get(handles.refListbox, 'String')))
        removeLandmark(handles.refAxes, handles.refListbox, handles.refPanel);
    end
    for k = 1:size(rCP,1)    
        addLandmark([], rCP(k,:), handles.refAxes, handles.refListbox, handles.refPanel)
    end
    % dodaj naslednje vhodne tocke
    iCP = [96 253; 122 254; 167 261; 194 267; 272 272; 301 274; 97 191; 134 196; 177 204; 212 212; 269 134; 335 142];
    while (~isempty(get(handles.inpListbox, 'String')))
        removeLandmark(handles.inpAxes, handles.inpListbox, handles.inpPanel);
    end
    for k = 1:size(iCP,1)    
        addLandmark([], iCP(k,:), handles.inpAxes, handles.inpListbox, handles.inpPanel)
    end
 end

% --- Executes on selection change in refSelect.
function refSelect_Callback(hObject, eventdata, handles)
% hObject    handle to refSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns refSelect contents as cell array
%        contents{get(hObject,'Value')} returns selected item from refSelect
contents = cellstr(get(hObject, 'String'));
value = get(hObject, 'Value');
try
    imInfo = imfinfo(contents{value});
    if ~strcmp(imInfo.Format, 'bmp')
        warndlg('Izbrana datoteka ne vsebuje BMP slike.', 'Napaka');
    else
        displayImage(imread(contents{value}), handles.refAxes, handles.refListbox, handles.refPanel);
        if strcmp(strtrim(contents{1}), '<izberi referencno sliko>')
            newString = cell(0);
            for i = 2:size(contents,1)
                newString{i-1} = contents{i};
            end
            set(hObject, 'String', newString); set(hObject, 'Value', value-1);
        end
        contents = cellstr(get(handles.inpSelect, 'String'));
        if ~strcmp(strtrim(contents{1}), '<izberi vhodno sliko>')
            set(handles.registerImages, 'Enable', 'on');
        end
    end
catch exception
    warndlg('Izbrana datoteka ne vsebuje BMP slike.', 'Napaka');
    set(hObject, 'Value', 1);
end

% --- Executes during object creation, after setting all properties.
function refSelect_CreateFcn(hObject, eventdata, handles)
% hObject    handle to refSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%-------------------------------
contents = cellstr(get(hObject, 'String'));
newString{1} = contents{1};
fList = ls('*ref*.bmp');
for i = 1:size(fList,1)
    newString{end+1} = fList(i,:); 
end
set(hObject, 'String', newString);
%-------------------------------


% --- Executes on selection change in inpSelect.
function inpSelect_Callback(hObject, eventdata, handles)
% hObject    handle to inpSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns inpSelect contents as cell array
%        contents{get(hObject,'Value')} returns selected item from inpSelect
contents = cellstr(get(hObject, 'String'));
value = get(hObject, 'Value');
try
    imInfo = imfinfo(contents{value});
    if ~strcmp(imInfo.Format, 'bmp')
        warndlg('Izbrana datoteka ne vsebuje BMP slike.', 'Napaka');
    else
        displayImage(imread(contents{value}), handles.inpAxes, handles.inpListbox, handles.inpPanel);
        if strcmp(strtrim(contents{1}), '<izberi vhodno sliko>')
            newString = cell(0);
            for i = 2:size(contents,1)
                newString{i-1} = contents{i};
            end
            set(hObject, 'String', newString); set(hObject, 'Value', value-1);
        end
        contents = cellstr(get(handles.refSelect, 'String'));
        if ~strcmp(strtrim(contents{1}), '<izberi referencno sliko>')
            set(handles.registerImages, 'Enable', 'on');
        end
    end
catch exception
    warndlg('Izbrana datoteka ne vsebuje BMP slike.', 'Napaka');
    set(hObject, 'Value', 1);
end

% --- Executes during object creation, after setting all properties.
function inpSelect_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inpSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%-------------------------------
contents = cellstr(get(hObject, 'String'));
newString{1} = contents{1};
fList = ls('*inp*.bmp');
for i = 1:size(fList,1)
    newString{end+1} = fList(i,:); 
end
set(hObject, 'String', newString);
%-------------------------------



function cSize_Callback(hObject, eventdata, handles)
% hObject    handle to cSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cSize as text
%        str2double(get(hObject,'String')) returns contents of cSize as a double


% --- Executes during object creation, after setting all properties.
function cSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



