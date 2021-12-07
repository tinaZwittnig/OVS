function varargout = vaja08(varargin)
% VAJA08 M-file for vaja08.fig
%      VAJA08, by itself, creates a new VAJA08 or raises the existing
%      singleton*.
%
%      H = VAJA08 returns the handle to a new VAJA08 or the handle to
%      the existing singleton*.
%
%      VAJA08('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VAJA08.M with the given input arguments.
%
%      VAJA08('Property','Value',...) creates a new VAJA08 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before vaja08x_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to vaja08_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help vaja08

% Last Modified by GUIDE v2.5 07-Dec-2016 11:14:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @vaja08x_OpeningFcn, ...
                   'gui_OutputFcn',  @vaja08x_OutputFcn, ...
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


% --- Executes just before vaja08 is made visible.
function vaja08x_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to vaja08 (see VARARGIN)

% Choose default command line output for vaja08
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% doloci globalne spremenljivke
global oAcc; oAcc = [];
global rangeR; rangeR = []; 
global rangeF; rangeF = [];

% napolni seznam slik 
l = dir;
ext = {'raw', 'jpg', 'png', 'gif'};
for i = 1:length(l)
    if ~l(i).isdir
        f = strsplit(l(i).name, '.');
        if length(f) == 2
            if sum(strcmp(f{2}, ext))
                iList = cellstr(get(handles.inpList, 'String'));
                iList{end+1} = l(i).name;
                set(handles.inpList, 'String', iList);
            end
        end
    end
end

% UIWAIT makes vaja08 wait for user response (see UIRESUME)
% uiwait(handles.figureVaja08);


% --- Outputs from this function are returned to the command line.
function varargout = vaja08x_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function editImagePath_Callback(hObject, eventdata, handles)
% hObject    handle to editImagePath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editImagePath as text
%        str2double(get(hObject,'String')) returns contents of editImagePath as a double


% --- Executes during object creation, after setting all properties.
function editImagePath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editImagePath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end
 

function editImageX_Callback(hObject, eventdata, handles)
% hObject    handle to editImageX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editImageX as text
%        str2double(get(hObject,'String')) returns contents of editImageX as a double


% --- Executes during object creation, after setting all properties.
function editImageX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editImageX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function editImageY_Callback(hObject, eventdata, handles)
% hObject    handle to editImageY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editImageY as text
%        str2double(get(hObject,'String')) returns contents of editImageY as a double


% --- Executes during object creation, after setting all properties.
function editImageY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editImageY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

   

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function stepR_Callback(hObject, eventdata, handles)
% hObject    handle to stepR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of stepR as text
%        str2double(get(hObject,'String')) returns contents of stepR as a double


% --- Executes during object creation, after setting all properties.
function stepR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stepR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function stepF_Callback(hObject, eventdata, handles)
% hObject    handle to stepF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of stepF as text
%        str2double(get(hObject,'String')) returns contents of stepF as a double


% --- Executes during object creation, after setting all properties.
function stepF_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stepF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on findLines press in findLines.
function findLines_Callback(hObject, eventdata, handles)
% hObject    handle to findLines (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    % ---- poisci premice na podlagi akumulatorja --- 
    % pridobi podatke
    global oAcc rangeR rangeF;
    stepR = str2num(get(handles.stepR, 'String'));
    stepF = str2num(get(handles.stepF, 'String'));
    nIntersect = str2num(get(handles.minIntersections, 'String'));
    % ponovno prikazi akumulator
    displayAccumulator(oAcc, rangeR, rangeF, handles.accAxes);
    % poisci lokalne maksimume akumulatorja
    [maxR, maxF] = findLocalMaxima(oAcc, rangeR, rangeF, nIntersect, get(handles.maxIntersection,'Value'));    
    if (length(maxR) ~= length(maxF))
        mHandle = warndlg('Stevilo parametrov "r" ni enako stevilu parametrov "fi".', 'Opozorilo', 'modal'); 
        return;
    end
    % prikazi tocke na akumulatorju
    displayPoints(maxR, maxF, stepR, stepF, handles.accAxes);
    % prikazi premice na vhodni sliki
    displayImage(get(handles.inpAxes, 'UserData'), handles.inpAxes);
    displayLines(maxR, maxF, handles.inpAxes);
    % prikazi premice na sliki robov
    displayImage(get(handles.edgAxes, 'UserData'), handles.edgAxes);
    displayLines(maxR, maxF, handles.edgAxes);
    % shrani podatke o lokalnih maksimumih
    set(handles.houghTransform, 'UserData', [stepR, stepF]);
    set(handles.findLines, 'UserData', [maxR, maxF]);
    

% --- Executes during object creation, after setting all properties.
function figureVaja08_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figureVaja08 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
    clc;
    scrSize = get(0, 'ScreenSize');
    figSize = get(hObject, 'Position');
    set(hObject, 'Position', [(scrSize(3)-figSize(3))/2 (scrSize(4)-figSize(4))/2 figSize(3) figSize(4)]);    
    
          
function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

% --- Executes on houghTransform press in houghTransform.
function houghTransform_Callback(hObject, eventdata, handles)
% hObject    handle to houghTransform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    % ---- Houghova transformacija ----    
    % pridobi vhodno sliko in sliko robov
    iImage = get(handles.inpAxes, 'UserData');    
    iEdges = get(handles.edgAxes, 'UserData');
    if (isempty(iEdges))
        mHandle = warndlg('Slika robov ne obstaja.', 'Opozorilo', 'modal');
        return;
    end    
    % ponovno prikazi vhodno sliko in sliko robov
    displayImage(iImage, handles.inpAxes);
    displayImage(iEdges, handles.edgAxes);    
    % pridobi korak po "r" in korak po "fi"
    stepR = str2num(get(handles.stepR, 'String'));
    stepF = str2num(get(handles.stepF, 'String'));
    % izracunaj in prikazi Houghov akumulator
    global oAcc rangeR rangeF;
    [oAcc, rangeR, rangeF] = houghTransform2D2P(iEdges, stepR, stepF);
    displayAccumulator(oAcc, rangeR, rangeF, handles.accAxes);
    set(handles.maxAcc, 'String', num2str(max(oAcc(:))));

function minIntersections_Callback(hObject, eventdata, handles)
% hObject    handle to minIntersections (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of minIntersections as text
%        str2double(get(hObject,'String')) returns contents of minIntersections as a double


% --- Executes during object creation, after setting all properties.
function minIntersections_CreateFcn(hObject, eventdata, handles)
% hObject    handle to minIntersections (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% --- Executes on button press in showPointsAndLines.
function showPointsAndLines_Callback(hObject, eventdata, handles)
% hObject    handle to showPointsAndLines (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of showPointsAndLines
    % ---- pokazi/skrij tocke in premice ---- 
    % pridobi podatke
    iImage = get(handles.inpAxes, 'UserData');
    iEdges = get(handles.edgAxes, 'UserData');    
    global oAcc rangeR rangeF;    
    if (isempty(iImage) | isempty(oAcc))
        mHandle = errordlg('Vhodna slika ali akumulator ne obstajata.', 'Opozorilo', 'Modal');
        return;
    end
    % ponovno prikazi vhodno sliko, sliko robov in akumulator
    displayImage(iImage, handles.inpAxes);
    displayImage(iEdges, handles.edgAxes);
    displayAccumulator(oAcc, rangeR, rangeF, handles.accAxes);
    % pokazi tocke in premice
    if (get(hObject, 'Value'))
        % pridobi podatke
        steps  = get(handles.houghTransform, 'UserData');
        values = get(handles.findLines, 'UserData');
        if (isempty(steps) | isempty(values))
            return;
        end
        % ponovno prikazi tocke in premice
        displayPoints(values(:,1), values(:,2), steps(1), steps(2), handles.accAxes);        
        displayLines(values(:,1), values(:,2), handles.inpAxes);
        displayLines(values(:,1), values(:,2), handles.edgAxes);
    end
        

% --- Executes on button press in maxIntersection.
function maxIntersection_Callback(hObject, eventdata, handles)
% hObject    handle to maxIntersection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of maxIntersection
    % ---- longest line only on/off ----
    if (get(hObject,'Value'))
        set(handles.minIntersections, 'Enable', 'off');
    else
        set(handles.minIntersections, 'Enable', 'on');
    end
    

% --- Executes during object creation, after setting all properties.
function frame2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frame2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function frame1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frame1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function frame3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frame3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function frame4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frame4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function frame5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frame5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




% --- Executes during object creation, after setting all properties.
function maxAcc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxAcc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% --- Executes on button press in findEdges.
function findEdges_Callback(hObject, eventdata, handles)
% hObject    handle to findEdges (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    % ---- poisci robove ----
    iImage = get(handles.inpAxes, 'UserData');
    if (isempty(iImage))
        mHandle = warndlg('Nalozi vhodno sliko.', 'Opozorilo', 'modal');
        return;
    end
    % parametri detektorja robov (Canny)
    iThreshold = str2num(get(handles.edgeThreshold, 'String'));
    iStdDev = str2num(get(handles.edgeStdDev, 'String'));    
    if (iThreshold >= 1 | iThreshold <=0 | iStdDev <= 0)
        mHandle = warndlg('Prag naj bo med 0 in 1, standardni odklon pa pozitiven.', 'Opozorilo', 'modal');
        return;
    end
    % izracunaj in prikazi robove (Cannyjev detektor)
    displayImage(findEdges(iImage, iThreshold, iStdDev), handles.edgAxes);


function inpPath_Callback(hObject, eventdata, handles)
% hObject    handle to inpPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inpPath as text
%        str2double(get(hObject,'String')) returns contents of inpPath as a double


% --- Executes during object creation, after setting all properties.
function inpPath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inpPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function dimX_Callback(hObject, eventdata, handles)
% hObject    handle to dimX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dimX as text
%        str2double(get(hObject,'String')) returns contents of dimX as a double


% --- Executes during object creation, after setting all properties.
function dimX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dimX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function dimY_Callback(hObject, eventdata, handles)
% hObject    handle to dimY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dimY as text
%        str2double(get(hObject,'String')) returns contents of dimY as a double


% --- Executes during object creation, after setting all properties.
function dimY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dimY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function nBits_Callback(hObject, eventdata, handles)
% hObject    handle to nBits (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nBits as text
%        str2double(get(hObject,'String')) returns contents of nBits as a double


% --- Executes during object creation, after setting all properties.
function nBits_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nBits (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on button press in saveImages.
function saveImages_Callback(hObject, eventdata, handles)
% hObject    handle to saveImages (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    % ---- shrani slike ----    
    iFrame = getframe(handles.inpAxes); saveImage(iFrame.cdata, 'slika_1_vhodna_slika', 'jpg');
    iFrame = getframe(handles.edgAxes); saveImage(iFrame.cdata, 'slika_2_slika_robov', 'jpg');
    iFrame = getframe(handles.accAxes); saveImage(iFrame.cdata, 'slika_3_akumulator', 'jpg');
    
    
% --- Executes on button press in saveGUI.
function saveGUI_Callback(hObject, eventdata, handles)
% hObject    handle to saveGUI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    % ---- shrani uporabniski vmesnik ----
    saveImage(frame2im(getframe(handles.figureVaja08)), 'slika_4_uporabniski_vmesnik', 'jpg');


% --- Executes during object creation, after setting all properties.
function edgeStdDev_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edgeStdDev (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes during object creation, after setting all properties.
function edgeThreshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edgeThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes during object creation, after setting all properties.
function textMaxAccumulator_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textMaxAccumulator (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


function edgeThreshold_Callback(hObject, eventdata, handles)
% hObject    handle to edgeThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edgeThreshold as text
%        str2double(get(hObject,'String')) returns contents of edgeThreshold as a double


function edgeStdDev_Callback(hObject, eventdata, handles)
% hObject    handle to edgeStdDev (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edgeStdDev as text
%        str2double(get(hObject,'String')) returns contents of edgeStdDev as a double




% --- Executes on selection change in inpList.
function inpList_Callback(hObject, eventdata, handles)
% hObject    handle to inpList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns inpList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from inpList
    % ---- nalozi vhodno sliko ---- 
    idx = get(handles.inpList, 'Value'); 
    if idx > 1
        set(handles.inpList, 'UserData', idx);
        iList = cellstr(get(handles.inpList, 'String'));
        iPath = iList{idx};
        if strfind(iPath, '.raw')
            w = strsplit(iPath, '-');
            d = strsplit(w{2}, 'x');
            iDim = [str2double(d{1}), str2double(d{2})];
            iType = ['uint', num2str(str2double(w{3}(1:end-7)))];
            try
                displayImage(loadImage(iPath, iDim, iType), handles.inpAxes);
            catch
                mHandle = warndlg('Napaka pri nalaganju slike.', 'Opozorilo', 'modal');
                return;
            end
        else
            try
                displayImage(imread(iPath), handles.inpAxes);
            catch
                mHandle = warndlg('Napaka pri nalaganju slike.', 'Opozorilo', 'modal');
                return;
            end
        end
    else
        set(handles.inpList, 'Value', get(handles.inpList, 'UserData'));
    end


% --- Executes during object creation, after setting all properties.
function inpList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inpList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
