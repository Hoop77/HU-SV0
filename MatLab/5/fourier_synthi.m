function varargout = fourier_synthi(varargin)
% FOURIER_SYNTHI MATLAB code for fourier_synthi.fig
%      FOURIER_SYNTHI, by itself, creates a new FOURIER_SYNTHI or raises the existing
%      singleton*.
%
%      H = FOURIER_SYNTHI returns the handle to a new FOURIER_SYNTHI or the handle to
%      the existing singleton*.
%
%      FOURIER_SYNTHI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FOURIER_SYNTHI.M with the given input arguments.
%
%      FOURIER_SYNTHI('Property','Value',...) creates a new FOURIER_SYNTHI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fourier_synthi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fourier_synthi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fourier_synthi

% Last Modified by GUIDE v2.5 09-Jan-2018 20:50:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fourier_synthi_OpeningFcn, ...
                   'gui_OutputFcn',  @fourier_synthi_OutputFcn, ...
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


function draw_plot(handles)
a0 = get(handles.slider_ak0, 'Value');
a1 = get(handles.slider_ak1, 'Value');
a2 = get(handles.slider_ak2, 'Value');
a3 = get(handles.slider_ak3, 'Value');
a4 = get(handles.slider_ak4, 'Value');
a5 = get(handles.slider_ak5, 'Value');

b1 = get(handles.slider_bk1, 'Value');
b2 = get(handles.slider_bk2, 'Value');
b3 = get(handles.slider_bk3, 'Value');
b4 = get(handles.slider_bk4, 'Value');
b5 = get(handles.slider_bk5, 'Value');

ak = [a0 a1 a2 a3 a4 a5];
bk = [0 b1 b2 b3 b4 b5];

N = get(handles.edit_N, 'Value');

x = 0:(N-1);
y = fouriersynthese(N, ak, bk);

axis(handles.fourier_plot);
plot(x, y);


% --- Executes just before fourier_synthi is made visible.
function fourier_synthi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fourier_synthi (see VARARGIN)

% Choose default command line output for fourier_synthi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fourier_synthi wait for user response (see UIRESUME)
% uiwait(handles.figure1);

draw_plot(handles);


% --- Outputs from this function are returned to the command line.
function varargout = fourier_synthi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider_ak0_Callback(hObject, eventdata, handles)
% hObject    handle to slider_ak0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

draw_plot(handles);


% --- Executes during object creation, after setting all properties.
function slider_ak0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_ak0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_ak1_Callback(hObject, eventdata, handles)
% hObject    handle to slider_ak1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

draw_plot(handles);


% --- Executes during object creation, after setting all properties.
function slider_ak1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_ak1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_ak2_Callback(hObject, eventdata, handles)
% hObject    handle to slider_ak2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

draw_plot(handles);


% --- Executes during object creation, after setting all properties.
function slider_ak2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_ak2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_ak3_Callback(hObject, eventdata, handles)
% hObject    handle to slider_ak3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

draw_plot(handles);


% --- Executes during object creation, after setting all properties.
function slider_ak3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_ak3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_ak4_Callback(hObject, eventdata, handles)
% hObject    handle to slider_ak4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

draw_plot(handles);


% --- Executes during object creation, after setting all properties.
function slider_ak4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_ak4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_ak5_Callback(hObject, eventdata, handles)
% hObject    handle to slider_ak5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

draw_plot(handles);


% --- Executes during object creation, after setting all properties.
function slider_ak5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_ak5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_bk1_Callback(hObject, eventdata, handles)
% hObject    handle to slider_bk1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

draw_plot(handles);


% --- Executes during object creation, after setting all properties.
function slider_bk1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_bk1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_bk2_Callback(hObject, eventdata, handles)
% hObject    handle to slider_bk2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

draw_plot(handles);


% --- Executes during object creation, after setting all properties.
function slider_bk2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_bk2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_bk3_Callback(hObject, eventdata, handles)
% hObject    handle to slider_bk3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

draw_plot(handles);


% --- Executes during object creation, after setting all properties.
function slider_bk3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_bk3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_bk4_Callback(hObject, eventdata, handles)
% hObject    handle to slider_bk4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

draw_plot(handles);


% --- Executes during object creation, after setting all properties.
function slider_bk4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_bk4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_bk5_Callback(hObject, eventdata, handles)
% hObject    handle to slider_bk5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

draw_plot(handles);


% --- Executes during object creation, after setting all properties.
function slider_bk5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_bk5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in btn_slider_reset.
function btn_slider_reset_Callback(hObject, eventdata, handles)
% hObject    handle to btn_slider_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.slider_ak0, 'Value', 0);
set(handles.slider_ak1, 'Value', 0);
set(handles.slider_ak2, 'Value', 0);
set(handles.slider_ak3, 'Value', 0);
set(handles.slider_ak4, 'Value', 0);
set(handles.slider_ak5, 'Value', 0);

set(handles.slider_bk1, 'Value', 0);
set(handles.slider_bk2, 'Value', 0);
set(handles.slider_bk3, 'Value', 0);
set(handles.slider_bk4, 'Value', 0);
set(handles.slider_bk5, 'Value', 0);

draw_plot(handles);


function edit_N_Callback(hObject, eventdata, handles)
% hObject    handle to edit_N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_N as text
%        str2double(get(hObject,'String')) returns contents of edit_N as a double

new_N = str2num(get(handles.edit_N, 'String'));

if numel(new_N) == 0 || new_N ~= abs(round(new_N)) || new_N <= 10
    old_N = get(handles.edit_N, 'Value');
    set(handles.edit_N, 'String', num2str(old_N));
    return
end

set(handles.edit_N, 'Value', new_N);

draw_plot(handles);


% --- Executes during object creation, after setting all properties.
function edit_N_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
