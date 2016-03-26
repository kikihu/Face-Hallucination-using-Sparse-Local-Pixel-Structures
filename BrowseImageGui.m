function varargout = BrowseImageGui(varargin)
% BROWSEIMAGEGUI MATLAB code for BrowseImageGui.fig
%      BROWSEIMAGEGUI, by itself, creates a new BROWSEIMAGEGUI or raises the existing
%      singleton*.
%
%      H = BROWSEIMAGEGUI returns the handle to a new BROWSEIMAGEGUI or the handle to
%      the existing singleton*.
%
%      BROWSEIMAGEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BROWSEIMAGEGUI.M with the given input arguments.
%
%      BROWSEIMAGEGUI('Property','Value',...) creates a new BROWSEIMAGEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BrowseImageGui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BrowseImageGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BrowseImageGui

% Last Modified by GUIDE v2.5 26-Mar-2016 02:36:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BrowseImageGui_OpeningFcn, ...
                   'gui_OutputFcn',  @BrowseImageGui_OutputFcn, ...
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


% --- Executes just before BrowseImageGui is made visible.
function BrowseImageGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BrowseImageGui (see VARARGIN)

% Choose default command line output for BrowseImageGui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BrowseImageGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BrowseImageGui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname] = uigetfile({'*.jpg';'*.bmp'},'File Selector');
 handles.myImage = strcat(pathname, filename);
 imge = imread(handles.myImage);
 axes(handles.axes1);
 imshow(imge);
 set(handles.edit1,'string',handles.myImage);
  img = asBicubicInterpolation(imge,500,500);
 axes(handles.axes2);
 imshow(img);
 guidata(hObject,handles);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

