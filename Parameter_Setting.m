%%%%%%%%%%%%%%%%%%%%Defination of Parameters%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;

Ts=1/(50e3);                                            %����Ƶ������ 20K
Ts_FEA = 1e-7;
flg_loss = 0;
flg_pwm = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  �������  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Pn=65e3;                                                %��������131kW
Tn=155;%155.9;                                          %����ת��
Tmax=Tn*1.2;                                            %�����ֵת��230N.m
n_n=4000;                                               %�ת��(rpm)
Umax=370;                                               %��ֵ��ѹ(V)
Un=Umax/1.2;                                            %����ѹ(V)
Imax=450*sqrt(2);                                       %��ֵ����(A)
In=Imax/1.2;                                            %�����(A)
p=4;                                                    %������
f1=n_n*p/60;                                            %�Ƶ��

k=Imax/In;                                            %����ϵ��
model=1;                                              %1����������
Jm=0.00247*2;                                          %ת������
B=0.00002 ;                                           %Ħ��ϵ��
faif=0.047;                                          %��������
Rs=8.5e-3;                                            %���ӵ��� (ŷķ)   
Ld=0.08e-3;                                           %d-q���
Lq=0.28e-3;
Ls=0.199e-3;
%%%%%%%%%%%%%%%%%%%%%Converter Parameters%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
VDC=370;                                              %ֱ��ĸ�ߵ�ѹ(V)


%%%%%%%%%%%%%%%%%%%%% Current Controller Parameters%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fc=2000;                            %����������Ƶ�ʣ�Hz��
wc=fc*2*pi;

Kpc=Ld*wc;                          %������������������
Kic=Rs*wc;                          %��������������������
Kawc=Kic/Kpc;                       %anti-windup�����ֱ�������         

duty_limit=2/sqrt(3);                     %ռ�ձ��޷�ֵ
%index_limit=0.8;                                          %Duty limit index for q1d1 regulator
%duty_limit_1=duty_limit*index_limit;                      %Duty limit for q1d1 regulator
%duty_limit_3=duty_limit*sqrt(1-index_limit)               %Duty limit for q3d3 regulator

%%%%%%%%%%%%%%%%%%%%% Speed Controller Parameters%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n=4000;
%k0=0.99999;
KT=3/2*p*faif;                       %���ת�ص���ϵ��
fs=20;                              %����ٶȻ�����Ƶ��(Hz)
ws=fs*2*pi;                             %����ٶȻ������Ƶ��(Hz)
yita=0.707;                          %����ٶȻ������

Kis=ws^2*Jm/KT;                     %�ٶȿ���������������                  
Kps=yita*ws*2*Jm/KT;                 %�ٶȿ�������������
kaws=Kis/Kps;                        %anti-windup�����ֱ������� 
Iq_limit=60;                        %�����޷�ֵ��Ϊ1.5���Ķ����

Ts_spc=Ts;                               %�ٶȻ�����Ƶ��
%Ts1=1e-5;                                
%Ts2=1e-5;                                 

Ts_dead=0.5e-6;                              %����ʱ������