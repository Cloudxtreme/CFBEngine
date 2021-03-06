function CFB_calc_conf_rankings(year, week)
%
addpath ../Base

%% === Read overall rankings ===
rankFile = sprintf('Rankings-%s-%s.cfb', year, week);
ranks = csvread(rankFile);
conferences = cell(11, 2);

%% === ACC ===
%% BC, Clem, Duke, FSU, GT, Lou, Mia, UNC, NCST, Pitt, Syr, UVA, VT, Wake
iACC = [15; 22; 25; 31; 36; 52; 57; 70; 71; 85; 98; 119; 120; 121];
conferences{1,2} = mean(ranks(iACC,1));
conferences{1,1} = 'ACC';

%% === American ===
%% Cin, ECU, Hou, Mem, Navy, SMU, USF, Tem, Tuln, Tlsa, UCF, UConn
iAmerican = [21; 26; 38; 56; 65; 89; 94; 100; 108; 109; 110; 112];
conferences{2,2} = mean(ranks(iAmerican,1));
conferences{2,1} = 'American';

%% === B1G ===
%% Ill, Ind, Iowa, MD, Mich, MSU, Minn, Neb, NW, OSU, PSU, Pur, Rutg, Wis
iB1G = [40; 41; 42; 54; 59; 60; 62; 66; 74; 77; 84; 86; 88; 127];
conferences{3,2} = mean(ranks(iB1G,1));
conferences{3,1} = 'B1G';

%% === Big 12 ===
%% Bay, ISU, Kan, KSU, Okla, OKST, TCU, Tex, TTU, WVU
iBig12 = [13; 43; 44; 45; 78; 79; 99; 102; 105; 124];
conferences{4,2} = mean(ranks(iBig12,1));
conferences{4,1} = 'Big 12';

%% === Conference USA ===
%% Char, FIU, FAU, LT, Mrsh, MTU, NT, OD, Rice, USM, UTEP, UTSA, WKU
iCUSA = [20; 28; 29; 51; 53; 61; 72; 80; 87; 96; 114; 115; 125];
conferences{5,2} = mean(ranks(iCUSA,1));
conferences{5,1} = 'Conference USA';

%% === Independent ===
%% Army, BYU, ND
iInd = [9; 11; 75];
conferences{6,2} = mean(ranks(iInd,1));
conferences{6,1} = 'Independent';

%% === MAC ===
%% Akr, Ball, Bowl, Buff, CMU, EMU, Kent, Mass, MOH, NIU, Ohio, Tol, WMU
iMAC = [2; 12; 16; 17; 19; 27; 46; 55; 58; 73; 76; 106; 126];
conferences{7,2} = mean(ranks(iMAC,1));
conferences{7,1} = 'MAC';

%% === Mountain West ===
%% AFA, Boise, CSU, Fres, Haw, Nev, UNM, SDSU, SJSU, UNLV, USU, Wyo
iMW = [1; 14; 24; 32; 37; 67; 68; 90; 91; 113; 117; 128];
conferences{8,2} = mean(ranks(iMW,1));
conferences{8,1} = 'Mountain West';

%% === Pac-12 ===
%% Ariz, ASU, Cal, Colo, Ore, ORST, USC, Stan, UCLA, Utah, Wash, WSU
iPac12 = [5; 6; 18; 23; 82; 83; 95; 97; 111; 116; 122; 123];
conferences{9,2} = mean(ranks(iPac12,1));
conferences{9,1} = 'Pac-12';

%% === SEC ===
%% Bama, Ark, Aub, Fla, UGA, UK, LSU, MSST, Mizz, Miss, SCar, Tenn, TAM, Vandy
iSEC = [3; 7; 10; 30; 33; 47; 48; 63; 64; 81; 93; 101; 103; 118];
conferences{10,2} = mean(ranks(iSEC,1));
conferences{10,1} = 'SEC';

%% === Sun Belt ===
%% App, ARST, GASO, GSU, Idho, ULL, ULM, NMSU, SOAL, TXST, Troy
iSB = [4; 8; 34; 35; 39; 49; 50; 69; 92; 104; 107];
conferences{11,2} = mean(ranks(iSB,1));
conferences{11,1} = 'Sun Belt';

%% === Sort and print ===
conferences = CFB_sort_results(conferences, 2);
cRanks = '';
for iConf = 1:11
    cRanks = sprintf('%s%s,%.2f\n', cRanks, conferences{iConf,1}, -1*conferences{iConf,2});
end
fprintf('%s', cRanks);
file = sprintf('ConferenceRankings-%s-%s.cfb', year, week);
fid = fopen(file, 'w');
fprintf(fid, '%s', cRanks);
fclose(fid);

%%
end
