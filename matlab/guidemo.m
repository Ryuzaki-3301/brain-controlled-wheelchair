function varargout = guidemo(varargin)
% GUIDEMO M-file for guidemo.fig
%      GUIDEMO, by itself, creates a new GUIDEMO or raises the existing
%      singleton*.
%
%      H = GUIDEMO returns the handle to a new GUIDEMO or the handle to
%      the existing singleton*.
%
%      GUIDEMO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDEMO.M with the given input arguments.
%
%      GUIDEMO('Property','Value',...) creates a new GUIDEMO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guidemo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guidemo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guidemo

% Last Modified by GUIDE v2.5 14-Jun-2017 10:13:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guidemo_OpeningFcn, ...
                   'gui_OutputFcn',  @guidemo_OutputFcn, ...
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


% --- Executes just before guidemo is made visible.
function guidemo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guidemo (see VARARGIN)

% Choose default command line output for guidemo
handles.output = hObject;
aaa='Wait till initialization completes';
set(handles.edit1,'String',aaa);
a=imread('left.jpg');
axes(handles.axes4);
imshow(a);


b=imread('right.jpg');
axes(handles.axes2);
imshow(b);

c=imread('forward.jpg');
axes(handles.axes1);
imshow(c);

d=imread('backward.jpg');
axes(handles.axes3);
imshow(d);


instrhwinfo('Bluetooth','HC-05');

bt = Bluetooth('HC-05', 1);

fopen(bt);


handles.bt=bt;



aaa='Initialization Completed ,Ready to Start';
set(handles.edit1,'String',aaa);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guidemo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guidemo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Start.
function Start_Callback(hObject, eventdata, handles)
% hObject    handle to Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bt=handles.bt;

aaa='Acquiring EEG Signal';
set(handles.edit1,'String',aaa);
condition=0;
returncommand=0;
data = zeros(1,256);    %preallocate buffer

portnum1 = 5;   %COM Port #
comPortName1 = sprintf('\\\\.\\COM%d', portnum1);
TG_BAUD_57600 =      57600;
TG_STREAM_PACKETS =     0;
TG_DATA_RAW =         4;
loadlibrary('Thinkgear.dll');
fprintf('Thinkgear.dll loaded\n');
% dllVersion = calllib('Thinkgear', 'TG_GetDriverVersion');
% fprintf('ThinkGear DLL version: %d\n', dllVersion );
connectionId1 = calllib('Thinkgear', 'TG_GetNewConnectionId');
if ( connectionId1 < 0 )
    error( sprintf( 'ERROR: TG_GetNewConnectionId() returned %d.\n', connectionId1 ) );
end;





i=0;
while i< 3



currentpos=3;
c=imread('forwardc.jpg');
axes(handles.axes1);
imshow(c);
aa='Blink to Choose Forward';
bb='No Blinks Detected'
        set(handles.edit3,'String',bb);
set(handles.edit1,'String',aa);
pause(1);

readblink(bt,connectionId1,comPortName1,TG_BAUD_57600,TG_STREAM_PACKETS,TG_DATA_RAW,hObject, eventdata, handles,currentpos);

currentpos=2;
b=imread('rightc.jpg');
axes(handles.axes2);
imshow(b);
aa='Blink to Choose Right';
set(handles.edit1,'String',aa);
bb='No Blinks Detected'
        set(handles.edit3,'String',bb);
pause(1);
readblink(bt,connectionId1,comPortName1,TG_BAUD_57600,TG_STREAM_PACKETS,TG_DATA_RAW,hObject, eventdata, handles,currentpos);
currentpos=4;

d=imread('backwardc.jpg');
axes(handles.axes3);
imshow(d);
aa='Blink to Choose Backward';
set(handles.edit1,'String',aa);
bb='No Blinks Detected'
        set(handles.edit3,'String',bb);
pause(1);

readblink(bt,connectionId1,comPortName1,TG_BAUD_57600,TG_STREAM_PACKETS,TG_DATA_RAW,hObject, eventdata, handles,currentpos);
currentpos=1;
a=imread('leftc.jpg');
axes(handles.axes4);
imshow(a);
aa='Blink to Choose Left';
set(handles.edit1,'String',aa);
bb='No Blinks Detected'
        set(handles.edit3,'String',bb);
        pause(1);

readblink(bt,connectionId1,comPortName1,TG_BAUD_57600,TG_STREAM_PACKETS,TG_DATA_RAW,hObject, eventdata, handles,currentpos);

%%%relaod images
a=imread('left.jpg');
axes(handles.axes4);
imshow(a);


b=imread('right.jpg');
axes(handles.axes2);
imshow(b);

c=imread('forward.jpg');
axes(handles.axes1);
imshow(c);

d=imread('backward.jpg');
axes(handles.axes3);
imshow(d);
%%%%%%%%%%%%%%

i=i+1;
end
                 fwrite(bt,'S');
aaa='Press Start to Restart';
set(handles.edit1,'String',aaa);

function readblink(bt,connectionId1,comPortName1,TG_BAUD_57600,TG_STREAM_PACKETS,TG_DATA_RAW,hObject, eventdata, handles,currentpos)

bt=handles.bt;
connectionId1 = calllib('Thinkgear', 'TG_GetNewConnectionId');
if ( connectionId1 < 0 )
    error( sprintf( 'ERROR: TG_GetNewConnectionId() returned %d.\n', connectionId1 ) );
end;

% Attempt to connect the connection ID handle to serial port "COM3"
errCode = calllib('Thinkgear', 'TG_Connect',  connectionId1,comPortName1,TG_BAUD_57600,TG_STREAM_PACKETS );
if ( errCode < 0 )
    error( sprintf( 'ERROR: TG_Connect() returned %d.\n', errCode ) );
end

fprintf( 'Connected.  detecting blinks...\n' );


bb='Ready to capture Blinks'
        set(handles.edit3,'String',bb);

%%
%record data

j = 0;
i = 0;

%%%%%%%%%%%%choose left

while (i < 2240)   %loop for 20 seconds
    if (calllib('Thinkgear','TG_ReadPackets',connectionId1,1) == 1)   %if a packet was read...
        
      %  if (calllib('Thinkgear','TG_GetValueStatus',connectionId1,TG_DATA_RAW) ~= 0)   %if RAW has been updated 
            j = j + 1;
            i = i + 1;
            data(j) = calllib('Thinkgear','TG_GetValue',connectionId1,TG_DATA_RAW);
      %  end
    end
      if (j == 256)
     axes(handles.axes6);
          plotRAW(data);            %plot the data, update every .5 seconds (256 points)
       out=max(data);
       out1=min(data);
       if ((out > 300)  && (out1 < -300))
        amp=5 
        fs=1000  % sampling frequency
        duration=1
        freq=100
        values=0:1/fs:duration;
        a=amp*sin(2*pi* freq*values)
        sound(a)
        aa='Blink detected';
        switch currentpos
          case 1
                a=imread('lefts.jpg');
                axes(handles.axes4);
                imshow(a);
                fwrite(bt,'L');

                pause(1);

          case 2
                b=imread('rights.jpg');
                axes(handles.axes2);
                imshow(b);
                fwrite(bt,'R');

                 pause(1);

          case 3
                c=imread('forwards.jpg');
                axes(handles.axes1);
                imshow(c);
                fwrite(bt,'F');

                pause(1);
          case 4
                d=imread('backwards.jpg');
                axes(handles.axes3);
                imshow(d);
                fwrite(bt,'B');

                pause(1);

        end
        set(handles.edit3,'String',aa);
        pause(1);
        break
        
       end
        j = 0;
    end
    
end
%disconnect             
calllib('Thinkgear', 'TG_FreeConnection', connectionId1 );
