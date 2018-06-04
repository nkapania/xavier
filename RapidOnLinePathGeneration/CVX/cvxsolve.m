% Produced by CVXGEN, 2015-09-15 02:48:02 -0400.
% CVXGEN is Copyright (C) 2006-2012 Jacob Mattingley, jem@cvxgen.com.
% The code in this file is Copyright (C) 2006-2012 Jacob Mattingley.
% CVXGEN, or solvers produced by CVXGEN, cannot be used for commercial
% applications without prior written permission from Jacob Mattingley.

% Filename: cvxsolve.m.
% Description: Solution file, via cvx, for use with sample.m.
function [vars, status] = cvxsolve(params, settings)
if isfield(params, 'A_1')
  A_1 = params.A_1;
elseif isfield(params, 'A')
  A_1 = params.A{1};
else
  error 'could not find A_1'
end
if isfield(params, 'A_2')
  A_2 = params.A_2;
elseif isfield(params, 'A')
  A_2 = params.A{2};
else
  error 'could not find A_2'
end
if isfield(params, 'A_3')
  A_3 = params.A_3;
elseif isfield(params, 'A')
  A_3 = params.A{3};
else
  error 'could not find A_3'
end
if isfield(params, 'A_4')
  A_4 = params.A_4;
elseif isfield(params, 'A')
  A_4 = params.A{4};
else
  error 'could not find A_4'
end
if isfield(params, 'A_5')
  A_5 = params.A_5;
elseif isfield(params, 'A')
  A_5 = params.A{5};
else
  error 'could not find A_5'
end
if isfield(params, 'A_6')
  A_6 = params.A_6;
elseif isfield(params, 'A')
  A_6 = params.A{6};
else
  error 'could not find A_6'
end
if isfield(params, 'A_7')
  A_7 = params.A_7;
elseif isfield(params, 'A')
  A_7 = params.A{7};
else
  error 'could not find A_7'
end
if isfield(params, 'A_8')
  A_8 = params.A_8;
elseif isfield(params, 'A')
  A_8 = params.A{8};
else
  error 'could not find A_8'
end
if isfield(params, 'A_9')
  A_9 = params.A_9;
elseif isfield(params, 'A')
  A_9 = params.A{9};
else
  error 'could not find A_9'
end
if isfield(params, 'A_10')
  A_10 = params.A_10;
elseif isfield(params, 'A')
  A_10 = params.A{10};
else
  error 'could not find A_10'
end
if isfield(params, 'A_11')
  A_11 = params.A_11;
elseif isfield(params, 'A')
  A_11 = params.A{11};
else
  error 'could not find A_11'
end
if isfield(params, 'A_12')
  A_12 = params.A_12;
elseif isfield(params, 'A')
  A_12 = params.A{12};
else
  error 'could not find A_12'
end
if isfield(params, 'A_13')
  A_13 = params.A_13;
elseif isfield(params, 'A')
  A_13 = params.A{13};
else
  error 'could not find A_13'
end
if isfield(params, 'A_14')
  A_14 = params.A_14;
elseif isfield(params, 'A')
  A_14 = params.A{14};
else
  error 'could not find A_14'
end
if isfield(params, 'A_15')
  A_15 = params.A_15;
elseif isfield(params, 'A')
  A_15 = params.A{15};
else
  error 'could not find A_15'
end
if isfield(params, 'A_16')
  A_16 = params.A_16;
elseif isfield(params, 'A')
  A_16 = params.A{16};
else
  error 'could not find A_16'
end
if isfield(params, 'A_17')
  A_17 = params.A_17;
elseif isfield(params, 'A')
  A_17 = params.A{17};
else
  error 'could not find A_17'
end
if isfield(params, 'A_18')
  A_18 = params.A_18;
elseif isfield(params, 'A')
  A_18 = params.A{18};
else
  error 'could not find A_18'
end
if isfield(params, 'A_19')
  A_19 = params.A_19;
elseif isfield(params, 'A')
  A_19 = params.A{19};
else
  error 'could not find A_19'
end
if isfield(params, 'A_20')
  A_20 = params.A_20;
elseif isfield(params, 'A')
  A_20 = params.A{20};
else
  error 'could not find A_20'
end
if isfield(params, 'A_21')
  A_21 = params.A_21;
elseif isfield(params, 'A')
  A_21 = params.A{21};
else
  error 'could not find A_21'
end
if isfield(params, 'A_22')
  A_22 = params.A_22;
elseif isfield(params, 'A')
  A_22 = params.A{22};
else
  error 'could not find A_22'
end
if isfield(params, 'A_23')
  A_23 = params.A_23;
elseif isfield(params, 'A')
  A_23 = params.A{23};
else
  error 'could not find A_23'
end
if isfield(params, 'A_24')
  A_24 = params.A_24;
elseif isfield(params, 'A')
  A_24 = params.A{24};
else
  error 'could not find A_24'
end
if isfield(params, 'A_25')
  A_25 = params.A_25;
elseif isfield(params, 'A')
  A_25 = params.A{25};
else
  error 'could not find A_25'
end
if isfield(params, 'A_26')
  A_26 = params.A_26;
elseif isfield(params, 'A')
  A_26 = params.A{26};
else
  error 'could not find A_26'
end
if isfield(params, 'A_27')
  A_27 = params.A_27;
elseif isfield(params, 'A')
  A_27 = params.A{27};
else
  error 'could not find A_27'
end
if isfield(params, 'A_28')
  A_28 = params.A_28;
elseif isfield(params, 'A')
  A_28 = params.A{28};
else
  error 'could not find A_28'
end
if isfield(params, 'A_29')
  A_29 = params.A_29;
elseif isfield(params, 'A')
  A_29 = params.A{29};
else
  error 'could not find A_29'
end
if isfield(params, 'A_30')
  A_30 = params.A_30;
elseif isfield(params, 'A')
  A_30 = params.A{30};
else
  error 'could not find A_30'
end
if isfield(params, 'A_31')
  A_31 = params.A_31;
elseif isfield(params, 'A')
  A_31 = params.A{31};
else
  error 'could not find A_31'
end
if isfield(params, 'A_32')
  A_32 = params.A_32;
elseif isfield(params, 'A')
  A_32 = params.A{32};
else
  error 'could not find A_32'
end
if isfield(params, 'A_33')
  A_33 = params.A_33;
elseif isfield(params, 'A')
  A_33 = params.A{33};
else
  error 'could not find A_33'
end
if isfield(params, 'A_34')
  A_34 = params.A_34;
elseif isfield(params, 'A')
  A_34 = params.A{34};
else
  error 'could not find A_34'
end
if isfield(params, 'A_35')
  A_35 = params.A_35;
elseif isfield(params, 'A')
  A_35 = params.A{35};
else
  error 'could not find A_35'
end
if isfield(params, 'A_36')
  A_36 = params.A_36;
elseif isfield(params, 'A')
  A_36 = params.A{36};
else
  error 'could not find A_36'
end
if isfield(params, 'A_37')
  A_37 = params.A_37;
elseif isfield(params, 'A')
  A_37 = params.A{37};
else
  error 'could not find A_37'
end
if isfield(params, 'A_38')
  A_38 = params.A_38;
elseif isfield(params, 'A')
  A_38 = params.A{38};
else
  error 'could not find A_38'
end
if isfield(params, 'A_39')
  A_39 = params.A_39;
elseif isfield(params, 'A')
  A_39 = params.A{39};
else
  error 'could not find A_39'
end
if isfield(params, 'A_40')
  A_40 = params.A_40;
elseif isfield(params, 'A')
  A_40 = params.A{40};
else
  error 'could not find A_40'
end
if isfield(params, 'A_41')
  A_41 = params.A_41;
elseif isfield(params, 'A')
  A_41 = params.A{41};
else
  error 'could not find A_41'
end
if isfield(params, 'A_42')
  A_42 = params.A_42;
elseif isfield(params, 'A')
  A_42 = params.A{42};
else
  error 'could not find A_42'
end
if isfield(params, 'A_43')
  A_43 = params.A_43;
elseif isfield(params, 'A')
  A_43 = params.A{43};
else
  error 'could not find A_43'
end
if isfield(params, 'A_44')
  A_44 = params.A_44;
elseif isfield(params, 'A')
  A_44 = params.A{44};
else
  error 'could not find A_44'
end
if isfield(params, 'A_45')
  A_45 = params.A_45;
elseif isfield(params, 'A')
  A_45 = params.A{45};
else
  error 'could not find A_45'
end
if isfield(params, 'A_46')
  A_46 = params.A_46;
elseif isfield(params, 'A')
  A_46 = params.A{46};
else
  error 'could not find A_46'
end
if isfield(params, 'A_47')
  A_47 = params.A_47;
elseif isfield(params, 'A')
  A_47 = params.A{47};
else
  error 'could not find A_47'
end
if isfield(params, 'A_48')
  A_48 = params.A_48;
elseif isfield(params, 'A')
  A_48 = params.A{48};
else
  error 'could not find A_48'
end
if isfield(params, 'A_49')
  A_49 = params.A_49;
elseif isfield(params, 'A')
  A_49 = params.A{49};
else
  error 'could not find A_49'
end
if isfield(params, 'A_50')
  A_50 = params.A_50;
elseif isfield(params, 'A')
  A_50 = params.A{50};
else
  error 'could not find A_50'
end
if isfield(params, 'A_51')
  A_51 = params.A_51;
elseif isfield(params, 'A')
  A_51 = params.A{51};
else
  error 'could not find A_51'
end
if isfield(params, 'A_52')
  A_52 = params.A_52;
elseif isfield(params, 'A')
  A_52 = params.A{52};
else
  error 'could not find A_52'
end
if isfield(params, 'A_53')
  A_53 = params.A_53;
elseif isfield(params, 'A')
  A_53 = params.A{53};
else
  error 'could not find A_53'
end
if isfield(params, 'A_54')
  A_54 = params.A_54;
elseif isfield(params, 'A')
  A_54 = params.A{54};
else
  error 'could not find A_54'
end
if isfield(params, 'A_55')
  A_55 = params.A_55;
elseif isfield(params, 'A')
  A_55 = params.A{55};
else
  error 'could not find A_55'
end
if isfield(params, 'A_56')
  A_56 = params.A_56;
elseif isfield(params, 'A')
  A_56 = params.A{56};
else
  error 'could not find A_56'
end
if isfield(params, 'A_57')
  A_57 = params.A_57;
elseif isfield(params, 'A')
  A_57 = params.A{57};
else
  error 'could not find A_57'
end
if isfield(params, 'A_58')
  A_58 = params.A_58;
elseif isfield(params, 'A')
  A_58 = params.A{58};
else
  error 'could not find A_58'
end
if isfield(params, 'A_59')
  A_59 = params.A_59;
elseif isfield(params, 'A')
  A_59 = params.A{59};
else
  error 'could not find A_59'
end
if isfield(params, 'A_60')
  A_60 = params.A_60;
elseif isfield(params, 'A')
  A_60 = params.A{60};
else
  error 'could not find A_60'
end
if isfield(params, 'A_61')
  A_61 = params.A_61;
elseif isfield(params, 'A')
  A_61 = params.A{61};
else
  error 'could not find A_61'
end
if isfield(params, 'A_62')
  A_62 = params.A_62;
elseif isfield(params, 'A')
  A_62 = params.A{62};
else
  error 'could not find A_62'
end
if isfield(params, 'A_63')
  A_63 = params.A_63;
elseif isfield(params, 'A')
  A_63 = params.A{63};
else
  error 'could not find A_63'
end
if isfield(params, 'A_64')
  A_64 = params.A_64;
elseif isfield(params, 'A')
  A_64 = params.A{64};
else
  error 'could not find A_64'
end
if isfield(params, 'A_65')
  A_65 = params.A_65;
elseif isfield(params, 'A')
  A_65 = params.A{65};
else
  error 'could not find A_65'
end
if isfield(params, 'A_66')
  A_66 = params.A_66;
elseif isfield(params, 'A')
  A_66 = params.A{66};
else
  error 'could not find A_66'
end
if isfield(params, 'A_67')
  A_67 = params.A_67;
elseif isfield(params, 'A')
  A_67 = params.A{67};
else
  error 'could not find A_67'
end
if isfield(params, 'A_68')
  A_68 = params.A_68;
elseif isfield(params, 'A')
  A_68 = params.A{68};
else
  error 'could not find A_68'
end
if isfield(params, 'A_69')
  A_69 = params.A_69;
elseif isfield(params, 'A')
  A_69 = params.A{69};
else
  error 'could not find A_69'
end
if isfield(params, 'A_70')
  A_70 = params.A_70;
elseif isfield(params, 'A')
  A_70 = params.A{70};
else
  error 'could not find A_70'
end
if isfield(params, 'A_71')
  A_71 = params.A_71;
elseif isfield(params, 'A')
  A_71 = params.A{71};
else
  error 'could not find A_71'
end
if isfield(params, 'A_72')
  A_72 = params.A_72;
elseif isfield(params, 'A')
  A_72 = params.A{72};
else
  error 'could not find A_72'
end
if isfield(params, 'A_73')
  A_73 = params.A_73;
elseif isfield(params, 'A')
  A_73 = params.A{73};
else
  error 'could not find A_73'
end
if isfield(params, 'A_74')
  A_74 = params.A_74;
elseif isfield(params, 'A')
  A_74 = params.A{74};
else
  error 'could not find A_74'
end
if isfield(params, 'A_75')
  A_75 = params.A_75;
elseif isfield(params, 'A')
  A_75 = params.A{75};
else
  error 'could not find A_75'
end
if isfield(params, 'A_76')
  A_76 = params.A_76;
elseif isfield(params, 'A')
  A_76 = params.A{76};
else
  error 'could not find A_76'
end
if isfield(params, 'A_77')
  A_77 = params.A_77;
elseif isfield(params, 'A')
  A_77 = params.A{77};
else
  error 'could not find A_77'
end
if isfield(params, 'A_78')
  A_78 = params.A_78;
elseif isfield(params, 'A')
  A_78 = params.A{78};
else
  error 'could not find A_78'
end
if isfield(params, 'A_79')
  A_79 = params.A_79;
elseif isfield(params, 'A')
  A_79 = params.A{79};
else
  error 'could not find A_79'
end
if isfield(params, 'A_80')
  A_80 = params.A_80;
elseif isfield(params, 'A')
  A_80 = params.A{80};
else
  error 'could not find A_80'
end
if isfield(params, 'A_81')
  A_81 = params.A_81;
elseif isfield(params, 'A')
  A_81 = params.A{81};
else
  error 'could not find A_81'
end
if isfield(params, 'A_82')
  A_82 = params.A_82;
elseif isfield(params, 'A')
  A_82 = params.A{82};
else
  error 'could not find A_82'
end
if isfield(params, 'A_83')
  A_83 = params.A_83;
elseif isfield(params, 'A')
  A_83 = params.A{83};
else
  error 'could not find A_83'
end
if isfield(params, 'A_84')
  A_84 = params.A_84;
elseif isfield(params, 'A')
  A_84 = params.A{84};
else
  error 'could not find A_84'
end
if isfield(params, 'A_85')
  A_85 = params.A_85;
elseif isfield(params, 'A')
  A_85 = params.A{85};
else
  error 'could not find A_85'
end
if isfield(params, 'A_86')
  A_86 = params.A_86;
elseif isfield(params, 'A')
  A_86 = params.A{86};
else
  error 'could not find A_86'
end
if isfield(params, 'A_87')
  A_87 = params.A_87;
elseif isfield(params, 'A')
  A_87 = params.A{87};
else
  error 'could not find A_87'
end
if isfield(params, 'A_88')
  A_88 = params.A_88;
elseif isfield(params, 'A')
  A_88 = params.A{88};
else
  error 'could not find A_88'
end
if isfield(params, 'A_89')
  A_89 = params.A_89;
elseif isfield(params, 'A')
  A_89 = params.A{89};
else
  error 'could not find A_89'
end
if isfield(params, 'A_90')
  A_90 = params.A_90;
elseif isfield(params, 'A')
  A_90 = params.A{90};
else
  error 'could not find A_90'
end
if isfield(params, 'A_91')
  A_91 = params.A_91;
elseif isfield(params, 'A')
  A_91 = params.A{91};
else
  error 'could not find A_91'
end
if isfield(params, 'A_92')
  A_92 = params.A_92;
elseif isfield(params, 'A')
  A_92 = params.A{92};
else
  error 'could not find A_92'
end
if isfield(params, 'A_93')
  A_93 = params.A_93;
elseif isfield(params, 'A')
  A_93 = params.A{93};
else
  error 'could not find A_93'
end
if isfield(params, 'A_94')
  A_94 = params.A_94;
elseif isfield(params, 'A')
  A_94 = params.A{94};
else
  error 'could not find A_94'
end
if isfield(params, 'B_1')
  B_1 = params.B_1;
elseif isfield(params, 'B')
  B_1 = params.B{1};
else
  error 'could not find B_1'
end
if isfield(params, 'B_2')
  B_2 = params.B_2;
elseif isfield(params, 'B')
  B_2 = params.B{2};
else
  error 'could not find B_2'
end
if isfield(params, 'B_3')
  B_3 = params.B_3;
elseif isfield(params, 'B')
  B_3 = params.B{3};
else
  error 'could not find B_3'
end
if isfield(params, 'B_4')
  B_4 = params.B_4;
elseif isfield(params, 'B')
  B_4 = params.B{4};
else
  error 'could not find B_4'
end
if isfield(params, 'B_5')
  B_5 = params.B_5;
elseif isfield(params, 'B')
  B_5 = params.B{5};
else
  error 'could not find B_5'
end
if isfield(params, 'B_6')
  B_6 = params.B_6;
elseif isfield(params, 'B')
  B_6 = params.B{6};
else
  error 'could not find B_6'
end
if isfield(params, 'B_7')
  B_7 = params.B_7;
elseif isfield(params, 'B')
  B_7 = params.B{7};
else
  error 'could not find B_7'
end
if isfield(params, 'B_8')
  B_8 = params.B_8;
elseif isfield(params, 'B')
  B_8 = params.B{8};
else
  error 'could not find B_8'
end
if isfield(params, 'B_9')
  B_9 = params.B_9;
elseif isfield(params, 'B')
  B_9 = params.B{9};
else
  error 'could not find B_9'
end
if isfield(params, 'B_10')
  B_10 = params.B_10;
elseif isfield(params, 'B')
  B_10 = params.B{10};
else
  error 'could not find B_10'
end
if isfield(params, 'B_11')
  B_11 = params.B_11;
elseif isfield(params, 'B')
  B_11 = params.B{11};
else
  error 'could not find B_11'
end
if isfield(params, 'B_12')
  B_12 = params.B_12;
elseif isfield(params, 'B')
  B_12 = params.B{12};
else
  error 'could not find B_12'
end
if isfield(params, 'B_13')
  B_13 = params.B_13;
elseif isfield(params, 'B')
  B_13 = params.B{13};
else
  error 'could not find B_13'
end
if isfield(params, 'B_14')
  B_14 = params.B_14;
elseif isfield(params, 'B')
  B_14 = params.B{14};
else
  error 'could not find B_14'
end
if isfield(params, 'B_15')
  B_15 = params.B_15;
elseif isfield(params, 'B')
  B_15 = params.B{15};
else
  error 'could not find B_15'
end
if isfield(params, 'B_16')
  B_16 = params.B_16;
elseif isfield(params, 'B')
  B_16 = params.B{16};
else
  error 'could not find B_16'
end
if isfield(params, 'B_17')
  B_17 = params.B_17;
elseif isfield(params, 'B')
  B_17 = params.B{17};
else
  error 'could not find B_17'
end
if isfield(params, 'B_18')
  B_18 = params.B_18;
elseif isfield(params, 'B')
  B_18 = params.B{18};
else
  error 'could not find B_18'
end
if isfield(params, 'B_19')
  B_19 = params.B_19;
elseif isfield(params, 'B')
  B_19 = params.B{19};
else
  error 'could not find B_19'
end
if isfield(params, 'B_20')
  B_20 = params.B_20;
elseif isfield(params, 'B')
  B_20 = params.B{20};
else
  error 'could not find B_20'
end
if isfield(params, 'B_21')
  B_21 = params.B_21;
elseif isfield(params, 'B')
  B_21 = params.B{21};
else
  error 'could not find B_21'
end
if isfield(params, 'B_22')
  B_22 = params.B_22;
elseif isfield(params, 'B')
  B_22 = params.B{22};
else
  error 'could not find B_22'
end
if isfield(params, 'B_23')
  B_23 = params.B_23;
elseif isfield(params, 'B')
  B_23 = params.B{23};
else
  error 'could not find B_23'
end
if isfield(params, 'B_24')
  B_24 = params.B_24;
elseif isfield(params, 'B')
  B_24 = params.B{24};
else
  error 'could not find B_24'
end
if isfield(params, 'B_25')
  B_25 = params.B_25;
elseif isfield(params, 'B')
  B_25 = params.B{25};
else
  error 'could not find B_25'
end
if isfield(params, 'B_26')
  B_26 = params.B_26;
elseif isfield(params, 'B')
  B_26 = params.B{26};
else
  error 'could not find B_26'
end
if isfield(params, 'B_27')
  B_27 = params.B_27;
elseif isfield(params, 'B')
  B_27 = params.B{27};
else
  error 'could not find B_27'
end
if isfield(params, 'B_28')
  B_28 = params.B_28;
elseif isfield(params, 'B')
  B_28 = params.B{28};
else
  error 'could not find B_28'
end
if isfield(params, 'B_29')
  B_29 = params.B_29;
elseif isfield(params, 'B')
  B_29 = params.B{29};
else
  error 'could not find B_29'
end
if isfield(params, 'B_30')
  B_30 = params.B_30;
elseif isfield(params, 'B')
  B_30 = params.B{30};
else
  error 'could not find B_30'
end
if isfield(params, 'B_31')
  B_31 = params.B_31;
elseif isfield(params, 'B')
  B_31 = params.B{31};
else
  error 'could not find B_31'
end
if isfield(params, 'B_32')
  B_32 = params.B_32;
elseif isfield(params, 'B')
  B_32 = params.B{32};
else
  error 'could not find B_32'
end
if isfield(params, 'B_33')
  B_33 = params.B_33;
elseif isfield(params, 'B')
  B_33 = params.B{33};
else
  error 'could not find B_33'
end
if isfield(params, 'B_34')
  B_34 = params.B_34;
elseif isfield(params, 'B')
  B_34 = params.B{34};
else
  error 'could not find B_34'
end
if isfield(params, 'B_35')
  B_35 = params.B_35;
elseif isfield(params, 'B')
  B_35 = params.B{35};
else
  error 'could not find B_35'
end
if isfield(params, 'B_36')
  B_36 = params.B_36;
elseif isfield(params, 'B')
  B_36 = params.B{36};
else
  error 'could not find B_36'
end
if isfield(params, 'B_37')
  B_37 = params.B_37;
elseif isfield(params, 'B')
  B_37 = params.B{37};
else
  error 'could not find B_37'
end
if isfield(params, 'B_38')
  B_38 = params.B_38;
elseif isfield(params, 'B')
  B_38 = params.B{38};
else
  error 'could not find B_38'
end
if isfield(params, 'B_39')
  B_39 = params.B_39;
elseif isfield(params, 'B')
  B_39 = params.B{39};
else
  error 'could not find B_39'
end
if isfield(params, 'B_40')
  B_40 = params.B_40;
elseif isfield(params, 'B')
  B_40 = params.B{40};
else
  error 'could not find B_40'
end
if isfield(params, 'B_41')
  B_41 = params.B_41;
elseif isfield(params, 'B')
  B_41 = params.B{41};
else
  error 'could not find B_41'
end
if isfield(params, 'B_42')
  B_42 = params.B_42;
elseif isfield(params, 'B')
  B_42 = params.B{42};
else
  error 'could not find B_42'
end
if isfield(params, 'B_43')
  B_43 = params.B_43;
elseif isfield(params, 'B')
  B_43 = params.B{43};
else
  error 'could not find B_43'
end
if isfield(params, 'B_44')
  B_44 = params.B_44;
elseif isfield(params, 'B')
  B_44 = params.B{44};
else
  error 'could not find B_44'
end
if isfield(params, 'B_45')
  B_45 = params.B_45;
elseif isfield(params, 'B')
  B_45 = params.B{45};
else
  error 'could not find B_45'
end
if isfield(params, 'B_46')
  B_46 = params.B_46;
elseif isfield(params, 'B')
  B_46 = params.B{46};
else
  error 'could not find B_46'
end
if isfield(params, 'B_47')
  B_47 = params.B_47;
elseif isfield(params, 'B')
  B_47 = params.B{47};
else
  error 'could not find B_47'
end
if isfield(params, 'B_48')
  B_48 = params.B_48;
elseif isfield(params, 'B')
  B_48 = params.B{48};
else
  error 'could not find B_48'
end
if isfield(params, 'B_49')
  B_49 = params.B_49;
elseif isfield(params, 'B')
  B_49 = params.B{49};
else
  error 'could not find B_49'
end
if isfield(params, 'B_50')
  B_50 = params.B_50;
elseif isfield(params, 'B')
  B_50 = params.B{50};
else
  error 'could not find B_50'
end
if isfield(params, 'B_51')
  B_51 = params.B_51;
elseif isfield(params, 'B')
  B_51 = params.B{51};
else
  error 'could not find B_51'
end
if isfield(params, 'B_52')
  B_52 = params.B_52;
elseif isfield(params, 'B')
  B_52 = params.B{52};
else
  error 'could not find B_52'
end
if isfield(params, 'B_53')
  B_53 = params.B_53;
elseif isfield(params, 'B')
  B_53 = params.B{53};
else
  error 'could not find B_53'
end
if isfield(params, 'B_54')
  B_54 = params.B_54;
elseif isfield(params, 'B')
  B_54 = params.B{54};
else
  error 'could not find B_54'
end
if isfield(params, 'B_55')
  B_55 = params.B_55;
elseif isfield(params, 'B')
  B_55 = params.B{55};
else
  error 'could not find B_55'
end
if isfield(params, 'B_56')
  B_56 = params.B_56;
elseif isfield(params, 'B')
  B_56 = params.B{56};
else
  error 'could not find B_56'
end
if isfield(params, 'B_57')
  B_57 = params.B_57;
elseif isfield(params, 'B')
  B_57 = params.B{57};
else
  error 'could not find B_57'
end
if isfield(params, 'B_58')
  B_58 = params.B_58;
elseif isfield(params, 'B')
  B_58 = params.B{58};
else
  error 'could not find B_58'
end
if isfield(params, 'B_59')
  B_59 = params.B_59;
elseif isfield(params, 'B')
  B_59 = params.B{59};
else
  error 'could not find B_59'
end
if isfield(params, 'B_60')
  B_60 = params.B_60;
elseif isfield(params, 'B')
  B_60 = params.B{60};
else
  error 'could not find B_60'
end
if isfield(params, 'B_61')
  B_61 = params.B_61;
elseif isfield(params, 'B')
  B_61 = params.B{61};
else
  error 'could not find B_61'
end
if isfield(params, 'B_62')
  B_62 = params.B_62;
elseif isfield(params, 'B')
  B_62 = params.B{62};
else
  error 'could not find B_62'
end
if isfield(params, 'B_63')
  B_63 = params.B_63;
elseif isfield(params, 'B')
  B_63 = params.B{63};
else
  error 'could not find B_63'
end
if isfield(params, 'B_64')
  B_64 = params.B_64;
elseif isfield(params, 'B')
  B_64 = params.B{64};
else
  error 'could not find B_64'
end
if isfield(params, 'B_65')
  B_65 = params.B_65;
elseif isfield(params, 'B')
  B_65 = params.B{65};
else
  error 'could not find B_65'
end
if isfield(params, 'B_66')
  B_66 = params.B_66;
elseif isfield(params, 'B')
  B_66 = params.B{66};
else
  error 'could not find B_66'
end
if isfield(params, 'B_67')
  B_67 = params.B_67;
elseif isfield(params, 'B')
  B_67 = params.B{67};
else
  error 'could not find B_67'
end
if isfield(params, 'B_68')
  B_68 = params.B_68;
elseif isfield(params, 'B')
  B_68 = params.B{68};
else
  error 'could not find B_68'
end
if isfield(params, 'B_69')
  B_69 = params.B_69;
elseif isfield(params, 'B')
  B_69 = params.B{69};
else
  error 'could not find B_69'
end
if isfield(params, 'B_70')
  B_70 = params.B_70;
elseif isfield(params, 'B')
  B_70 = params.B{70};
else
  error 'could not find B_70'
end
if isfield(params, 'B_71')
  B_71 = params.B_71;
elseif isfield(params, 'B')
  B_71 = params.B{71};
else
  error 'could not find B_71'
end
if isfield(params, 'B_72')
  B_72 = params.B_72;
elseif isfield(params, 'B')
  B_72 = params.B{72};
else
  error 'could not find B_72'
end
if isfield(params, 'B_73')
  B_73 = params.B_73;
elseif isfield(params, 'B')
  B_73 = params.B{73};
else
  error 'could not find B_73'
end
if isfield(params, 'B_74')
  B_74 = params.B_74;
elseif isfield(params, 'B')
  B_74 = params.B{74};
else
  error 'could not find B_74'
end
if isfield(params, 'B_75')
  B_75 = params.B_75;
elseif isfield(params, 'B')
  B_75 = params.B{75};
else
  error 'could not find B_75'
end
if isfield(params, 'B_76')
  B_76 = params.B_76;
elseif isfield(params, 'B')
  B_76 = params.B{76};
else
  error 'could not find B_76'
end
if isfield(params, 'B_77')
  B_77 = params.B_77;
elseif isfield(params, 'B')
  B_77 = params.B{77};
else
  error 'could not find B_77'
end
if isfield(params, 'B_78')
  B_78 = params.B_78;
elseif isfield(params, 'B')
  B_78 = params.B{78};
else
  error 'could not find B_78'
end
if isfield(params, 'B_79')
  B_79 = params.B_79;
elseif isfield(params, 'B')
  B_79 = params.B{79};
else
  error 'could not find B_79'
end
if isfield(params, 'B_80')
  B_80 = params.B_80;
elseif isfield(params, 'B')
  B_80 = params.B{80};
else
  error 'could not find B_80'
end
if isfield(params, 'B_81')
  B_81 = params.B_81;
elseif isfield(params, 'B')
  B_81 = params.B{81};
else
  error 'could not find B_81'
end
if isfield(params, 'B_82')
  B_82 = params.B_82;
elseif isfield(params, 'B')
  B_82 = params.B{82};
else
  error 'could not find B_82'
end
if isfield(params, 'B_83')
  B_83 = params.B_83;
elseif isfield(params, 'B')
  B_83 = params.B{83};
else
  error 'could not find B_83'
end
if isfield(params, 'B_84')
  B_84 = params.B_84;
elseif isfield(params, 'B')
  B_84 = params.B{84};
else
  error 'could not find B_84'
end
if isfield(params, 'B_85')
  B_85 = params.B_85;
elseif isfield(params, 'B')
  B_85 = params.B{85};
else
  error 'could not find B_85'
end
if isfield(params, 'B_86')
  B_86 = params.B_86;
elseif isfield(params, 'B')
  B_86 = params.B{86};
else
  error 'could not find B_86'
end
if isfield(params, 'B_87')
  B_87 = params.B_87;
elseif isfield(params, 'B')
  B_87 = params.B{87};
else
  error 'could not find B_87'
end
if isfield(params, 'B_88')
  B_88 = params.B_88;
elseif isfield(params, 'B')
  B_88 = params.B{88};
else
  error 'could not find B_88'
end
if isfield(params, 'B_89')
  B_89 = params.B_89;
elseif isfield(params, 'B')
  B_89 = params.B{89};
else
  error 'could not find B_89'
end
if isfield(params, 'B_90')
  B_90 = params.B_90;
elseif isfield(params, 'B')
  B_90 = params.B{90};
else
  error 'could not find B_90'
end
if isfield(params, 'B_91')
  B_91 = params.B_91;
elseif isfield(params, 'B')
  B_91 = params.B{91};
else
  error 'could not find B_91'
end
if isfield(params, 'B_92')
  B_92 = params.B_92;
elseif isfield(params, 'B')
  B_92 = params.B{92};
else
  error 'could not find B_92'
end
if isfield(params, 'B_93')
  B_93 = params.B_93;
elseif isfield(params, 'B')
  B_93 = params.B{93};
else
  error 'could not find B_93'
end
if isfield(params, 'B_94')
  B_94 = params.B_94;
elseif isfield(params, 'B')
  B_94 = params.B{94};
else
  error 'could not find B_94'
end
W_delta = params.W_delta;
W_psi = params.W_psi;
if isfield(params, 'd_1')
  d_1 = params.d_1;
elseif isfield(params, 'd')
  d_1 = params.d{1};
else
  error 'could not find d_1'
end
if isfield(params, 'd_2')
  d_2 = params.d_2;
elseif isfield(params, 'd')
  d_2 = params.d{2};
else
  error 'could not find d_2'
end
if isfield(params, 'd_3')
  d_3 = params.d_3;
elseif isfield(params, 'd')
  d_3 = params.d{3};
else
  error 'could not find d_3'
end
if isfield(params, 'd_4')
  d_4 = params.d_4;
elseif isfield(params, 'd')
  d_4 = params.d{4};
else
  error 'could not find d_4'
end
if isfield(params, 'd_5')
  d_5 = params.d_5;
elseif isfield(params, 'd')
  d_5 = params.d{5};
else
  error 'could not find d_5'
end
if isfield(params, 'd_6')
  d_6 = params.d_6;
elseif isfield(params, 'd')
  d_6 = params.d{6};
else
  error 'could not find d_6'
end
if isfield(params, 'd_7')
  d_7 = params.d_7;
elseif isfield(params, 'd')
  d_7 = params.d{7};
else
  error 'could not find d_7'
end
if isfield(params, 'd_8')
  d_8 = params.d_8;
elseif isfield(params, 'd')
  d_8 = params.d{8};
else
  error 'could not find d_8'
end
if isfield(params, 'd_9')
  d_9 = params.d_9;
elseif isfield(params, 'd')
  d_9 = params.d{9};
else
  error 'could not find d_9'
end
if isfield(params, 'd_10')
  d_10 = params.d_10;
elseif isfield(params, 'd')
  d_10 = params.d{10};
else
  error 'could not find d_10'
end
if isfield(params, 'd_11')
  d_11 = params.d_11;
elseif isfield(params, 'd')
  d_11 = params.d{11};
else
  error 'could not find d_11'
end
if isfield(params, 'd_12')
  d_12 = params.d_12;
elseif isfield(params, 'd')
  d_12 = params.d{12};
else
  error 'could not find d_12'
end
if isfield(params, 'd_13')
  d_13 = params.d_13;
elseif isfield(params, 'd')
  d_13 = params.d{13};
else
  error 'could not find d_13'
end
if isfield(params, 'd_14')
  d_14 = params.d_14;
elseif isfield(params, 'd')
  d_14 = params.d{14};
else
  error 'could not find d_14'
end
if isfield(params, 'd_15')
  d_15 = params.d_15;
elseif isfield(params, 'd')
  d_15 = params.d{15};
else
  error 'could not find d_15'
end
if isfield(params, 'd_16')
  d_16 = params.d_16;
elseif isfield(params, 'd')
  d_16 = params.d{16};
else
  error 'could not find d_16'
end
if isfield(params, 'd_17')
  d_17 = params.d_17;
elseif isfield(params, 'd')
  d_17 = params.d{17};
else
  error 'could not find d_17'
end
if isfield(params, 'd_18')
  d_18 = params.d_18;
elseif isfield(params, 'd')
  d_18 = params.d{18};
else
  error 'could not find d_18'
end
if isfield(params, 'd_19')
  d_19 = params.d_19;
elseif isfield(params, 'd')
  d_19 = params.d{19};
else
  error 'could not find d_19'
end
if isfield(params, 'd_20')
  d_20 = params.d_20;
elseif isfield(params, 'd')
  d_20 = params.d{20};
else
  error 'could not find d_20'
end
if isfield(params, 'd_21')
  d_21 = params.d_21;
elseif isfield(params, 'd')
  d_21 = params.d{21};
else
  error 'could not find d_21'
end
if isfield(params, 'd_22')
  d_22 = params.d_22;
elseif isfield(params, 'd')
  d_22 = params.d{22};
else
  error 'could not find d_22'
end
if isfield(params, 'd_23')
  d_23 = params.d_23;
elseif isfield(params, 'd')
  d_23 = params.d{23};
else
  error 'could not find d_23'
end
if isfield(params, 'd_24')
  d_24 = params.d_24;
elseif isfield(params, 'd')
  d_24 = params.d{24};
else
  error 'could not find d_24'
end
if isfield(params, 'd_25')
  d_25 = params.d_25;
elseif isfield(params, 'd')
  d_25 = params.d{25};
else
  error 'could not find d_25'
end
if isfield(params, 'd_26')
  d_26 = params.d_26;
elseif isfield(params, 'd')
  d_26 = params.d{26};
else
  error 'could not find d_26'
end
if isfield(params, 'd_27')
  d_27 = params.d_27;
elseif isfield(params, 'd')
  d_27 = params.d{27};
else
  error 'could not find d_27'
end
if isfield(params, 'd_28')
  d_28 = params.d_28;
elseif isfield(params, 'd')
  d_28 = params.d{28};
else
  error 'could not find d_28'
end
if isfield(params, 'd_29')
  d_29 = params.d_29;
elseif isfield(params, 'd')
  d_29 = params.d{29};
else
  error 'could not find d_29'
end
if isfield(params, 'd_30')
  d_30 = params.d_30;
elseif isfield(params, 'd')
  d_30 = params.d{30};
else
  error 'could not find d_30'
end
if isfield(params, 'd_31')
  d_31 = params.d_31;
elseif isfield(params, 'd')
  d_31 = params.d{31};
else
  error 'could not find d_31'
end
if isfield(params, 'd_32')
  d_32 = params.d_32;
elseif isfield(params, 'd')
  d_32 = params.d{32};
else
  error 'could not find d_32'
end
if isfield(params, 'd_33')
  d_33 = params.d_33;
elseif isfield(params, 'd')
  d_33 = params.d{33};
else
  error 'could not find d_33'
end
if isfield(params, 'd_34')
  d_34 = params.d_34;
elseif isfield(params, 'd')
  d_34 = params.d{34};
else
  error 'could not find d_34'
end
if isfield(params, 'd_35')
  d_35 = params.d_35;
elseif isfield(params, 'd')
  d_35 = params.d{35};
else
  error 'could not find d_35'
end
if isfield(params, 'd_36')
  d_36 = params.d_36;
elseif isfield(params, 'd')
  d_36 = params.d{36};
else
  error 'could not find d_36'
end
if isfield(params, 'd_37')
  d_37 = params.d_37;
elseif isfield(params, 'd')
  d_37 = params.d{37};
else
  error 'could not find d_37'
end
if isfield(params, 'd_38')
  d_38 = params.d_38;
elseif isfield(params, 'd')
  d_38 = params.d{38};
else
  error 'could not find d_38'
end
if isfield(params, 'd_39')
  d_39 = params.d_39;
elseif isfield(params, 'd')
  d_39 = params.d{39};
else
  error 'could not find d_39'
end
if isfield(params, 'd_40')
  d_40 = params.d_40;
elseif isfield(params, 'd')
  d_40 = params.d{40};
else
  error 'could not find d_40'
end
if isfield(params, 'd_41')
  d_41 = params.d_41;
elseif isfield(params, 'd')
  d_41 = params.d{41};
else
  error 'could not find d_41'
end
if isfield(params, 'd_42')
  d_42 = params.d_42;
elseif isfield(params, 'd')
  d_42 = params.d{42};
else
  error 'could not find d_42'
end
if isfield(params, 'd_43')
  d_43 = params.d_43;
elseif isfield(params, 'd')
  d_43 = params.d{43};
else
  error 'could not find d_43'
end
if isfield(params, 'd_44')
  d_44 = params.d_44;
elseif isfield(params, 'd')
  d_44 = params.d{44};
else
  error 'could not find d_44'
end
if isfield(params, 'd_45')
  d_45 = params.d_45;
elseif isfield(params, 'd')
  d_45 = params.d{45};
else
  error 'could not find d_45'
end
if isfield(params, 'd_46')
  d_46 = params.d_46;
elseif isfield(params, 'd')
  d_46 = params.d{46};
else
  error 'could not find d_46'
end
if isfield(params, 'd_47')
  d_47 = params.d_47;
elseif isfield(params, 'd')
  d_47 = params.d{47};
else
  error 'could not find d_47'
end
if isfield(params, 'd_48')
  d_48 = params.d_48;
elseif isfield(params, 'd')
  d_48 = params.d{48};
else
  error 'could not find d_48'
end
if isfield(params, 'd_49')
  d_49 = params.d_49;
elseif isfield(params, 'd')
  d_49 = params.d{49};
else
  error 'could not find d_49'
end
if isfield(params, 'd_50')
  d_50 = params.d_50;
elseif isfield(params, 'd')
  d_50 = params.d{50};
else
  error 'could not find d_50'
end
if isfield(params, 'd_51')
  d_51 = params.d_51;
elseif isfield(params, 'd')
  d_51 = params.d{51};
else
  error 'could not find d_51'
end
if isfield(params, 'd_52')
  d_52 = params.d_52;
elseif isfield(params, 'd')
  d_52 = params.d{52};
else
  error 'could not find d_52'
end
if isfield(params, 'd_53')
  d_53 = params.d_53;
elseif isfield(params, 'd')
  d_53 = params.d{53};
else
  error 'could not find d_53'
end
if isfield(params, 'd_54')
  d_54 = params.d_54;
elseif isfield(params, 'd')
  d_54 = params.d{54};
else
  error 'could not find d_54'
end
if isfield(params, 'd_55')
  d_55 = params.d_55;
elseif isfield(params, 'd')
  d_55 = params.d{55};
else
  error 'could not find d_55'
end
if isfield(params, 'd_56')
  d_56 = params.d_56;
elseif isfield(params, 'd')
  d_56 = params.d{56};
else
  error 'could not find d_56'
end
if isfield(params, 'd_57')
  d_57 = params.d_57;
elseif isfield(params, 'd')
  d_57 = params.d{57};
else
  error 'could not find d_57'
end
if isfield(params, 'd_58')
  d_58 = params.d_58;
elseif isfield(params, 'd')
  d_58 = params.d{58};
else
  error 'could not find d_58'
end
if isfield(params, 'd_59')
  d_59 = params.d_59;
elseif isfield(params, 'd')
  d_59 = params.d{59};
else
  error 'could not find d_59'
end
if isfield(params, 'd_60')
  d_60 = params.d_60;
elseif isfield(params, 'd')
  d_60 = params.d{60};
else
  error 'could not find d_60'
end
if isfield(params, 'd_61')
  d_61 = params.d_61;
elseif isfield(params, 'd')
  d_61 = params.d{61};
else
  error 'could not find d_61'
end
if isfield(params, 'd_62')
  d_62 = params.d_62;
elseif isfield(params, 'd')
  d_62 = params.d{62};
else
  error 'could not find d_62'
end
if isfield(params, 'd_63')
  d_63 = params.d_63;
elseif isfield(params, 'd')
  d_63 = params.d{63};
else
  error 'could not find d_63'
end
if isfield(params, 'd_64')
  d_64 = params.d_64;
elseif isfield(params, 'd')
  d_64 = params.d{64};
else
  error 'could not find d_64'
end
if isfield(params, 'd_65')
  d_65 = params.d_65;
elseif isfield(params, 'd')
  d_65 = params.d{65};
else
  error 'could not find d_65'
end
if isfield(params, 'd_66')
  d_66 = params.d_66;
elseif isfield(params, 'd')
  d_66 = params.d{66};
else
  error 'could not find d_66'
end
if isfield(params, 'd_67')
  d_67 = params.d_67;
elseif isfield(params, 'd')
  d_67 = params.d{67};
else
  error 'could not find d_67'
end
if isfield(params, 'd_68')
  d_68 = params.d_68;
elseif isfield(params, 'd')
  d_68 = params.d{68};
else
  error 'could not find d_68'
end
if isfield(params, 'd_69')
  d_69 = params.d_69;
elseif isfield(params, 'd')
  d_69 = params.d{69};
else
  error 'could not find d_69'
end
if isfield(params, 'd_70')
  d_70 = params.d_70;
elseif isfield(params, 'd')
  d_70 = params.d{70};
else
  error 'could not find d_70'
end
if isfield(params, 'd_71')
  d_71 = params.d_71;
elseif isfield(params, 'd')
  d_71 = params.d{71};
else
  error 'could not find d_71'
end
if isfield(params, 'd_72')
  d_72 = params.d_72;
elseif isfield(params, 'd')
  d_72 = params.d{72};
else
  error 'could not find d_72'
end
if isfield(params, 'd_73')
  d_73 = params.d_73;
elseif isfield(params, 'd')
  d_73 = params.d{73};
else
  error 'could not find d_73'
end
if isfield(params, 'd_74')
  d_74 = params.d_74;
elseif isfield(params, 'd')
  d_74 = params.d{74};
else
  error 'could not find d_74'
end
if isfield(params, 'd_75')
  d_75 = params.d_75;
elseif isfield(params, 'd')
  d_75 = params.d{75};
else
  error 'could not find d_75'
end
if isfield(params, 'd_76')
  d_76 = params.d_76;
elseif isfield(params, 'd')
  d_76 = params.d{76};
else
  error 'could not find d_76'
end
if isfield(params, 'd_77')
  d_77 = params.d_77;
elseif isfield(params, 'd')
  d_77 = params.d{77};
else
  error 'could not find d_77'
end
if isfield(params, 'd_78')
  d_78 = params.d_78;
elseif isfield(params, 'd')
  d_78 = params.d{78};
else
  error 'could not find d_78'
end
if isfield(params, 'd_79')
  d_79 = params.d_79;
elseif isfield(params, 'd')
  d_79 = params.d{79};
else
  error 'could not find d_79'
end
if isfield(params, 'd_80')
  d_80 = params.d_80;
elseif isfield(params, 'd')
  d_80 = params.d{80};
else
  error 'could not find d_80'
end
if isfield(params, 'd_81')
  d_81 = params.d_81;
elseif isfield(params, 'd')
  d_81 = params.d{81};
else
  error 'could not find d_81'
end
if isfield(params, 'd_82')
  d_82 = params.d_82;
elseif isfield(params, 'd')
  d_82 = params.d{82};
else
  error 'could not find d_82'
end
if isfield(params, 'd_83')
  d_83 = params.d_83;
elseif isfield(params, 'd')
  d_83 = params.d{83};
else
  error 'could not find d_83'
end
if isfield(params, 'd_84')
  d_84 = params.d_84;
elseif isfield(params, 'd')
  d_84 = params.d{84};
else
  error 'could not find d_84'
end
if isfield(params, 'd_85')
  d_85 = params.d_85;
elseif isfield(params, 'd')
  d_85 = params.d{85};
else
  error 'could not find d_85'
end
if isfield(params, 'd_86')
  d_86 = params.d_86;
elseif isfield(params, 'd')
  d_86 = params.d{86};
else
  error 'could not find d_86'
end
if isfield(params, 'd_87')
  d_87 = params.d_87;
elseif isfield(params, 'd')
  d_87 = params.d{87};
else
  error 'could not find d_87'
end
if isfield(params, 'd_88')
  d_88 = params.d_88;
elseif isfield(params, 'd')
  d_88 = params.d{88};
else
  error 'could not find d_88'
end
if isfield(params, 'd_89')
  d_89 = params.d_89;
elseif isfield(params, 'd')
  d_89 = params.d{89};
else
  error 'could not find d_89'
end
if isfield(params, 'd_90')
  d_90 = params.d_90;
elseif isfield(params, 'd')
  d_90 = params.d{90};
else
  error 'could not find d_90'
end
if isfield(params, 'd_91')
  d_91 = params.d_91;
elseif isfield(params, 'd')
  d_91 = params.d{91};
else
  error 'could not find d_91'
end
if isfield(params, 'd_92')
  d_92 = params.d_92;
elseif isfield(params, 'd')
  d_92 = params.d{92};
else
  error 'could not find d_92'
end
if isfield(params, 'd_93')
  d_93 = params.d_93;
elseif isfield(params, 'd')
  d_93 = params.d{93};
else
  error 'could not find d_93'
end
if isfield(params, 'd_94')
  d_94 = params.d_94;
elseif isfield(params, 'd')
  d_94 = params.d{94};
else
  error 'could not find d_94'
end
if isfield(params, 'ds_1')
  ds_1 = params.ds_1;
elseif isfield(params, 'ds')
  ds_1 = params.ds{1};
else
  error 'could not find ds_1'
end
if isfield(params, 'ds_2')
  ds_2 = params.ds_2;
elseif isfield(params, 'ds')
  ds_2 = params.ds{2};
else
  error 'could not find ds_2'
end
if isfield(params, 'ds_3')
  ds_3 = params.ds_3;
elseif isfield(params, 'ds')
  ds_3 = params.ds{3};
else
  error 'could not find ds_3'
end
if isfield(params, 'ds_4')
  ds_4 = params.ds_4;
elseif isfield(params, 'ds')
  ds_4 = params.ds{4};
else
  error 'could not find ds_4'
end
if isfield(params, 'ds_5')
  ds_5 = params.ds_5;
elseif isfield(params, 'ds')
  ds_5 = params.ds{5};
else
  error 'could not find ds_5'
end
if isfield(params, 'ds_6')
  ds_6 = params.ds_6;
elseif isfield(params, 'ds')
  ds_6 = params.ds{6};
else
  error 'could not find ds_6'
end
if isfield(params, 'ds_7')
  ds_7 = params.ds_7;
elseif isfield(params, 'ds')
  ds_7 = params.ds{7};
else
  error 'could not find ds_7'
end
if isfield(params, 'ds_8')
  ds_8 = params.ds_8;
elseif isfield(params, 'ds')
  ds_8 = params.ds{8};
else
  error 'could not find ds_8'
end
if isfield(params, 'ds_9')
  ds_9 = params.ds_9;
elseif isfield(params, 'ds')
  ds_9 = params.ds{9};
else
  error 'could not find ds_9'
end
if isfield(params, 'ds_10')
  ds_10 = params.ds_10;
elseif isfield(params, 'ds')
  ds_10 = params.ds{10};
else
  error 'could not find ds_10'
end
if isfield(params, 'ds_11')
  ds_11 = params.ds_11;
elseif isfield(params, 'ds')
  ds_11 = params.ds{11};
else
  error 'could not find ds_11'
end
if isfield(params, 'ds_12')
  ds_12 = params.ds_12;
elseif isfield(params, 'ds')
  ds_12 = params.ds{12};
else
  error 'could not find ds_12'
end
if isfield(params, 'ds_13')
  ds_13 = params.ds_13;
elseif isfield(params, 'ds')
  ds_13 = params.ds{13};
else
  error 'could not find ds_13'
end
if isfield(params, 'ds_14')
  ds_14 = params.ds_14;
elseif isfield(params, 'ds')
  ds_14 = params.ds{14};
else
  error 'could not find ds_14'
end
if isfield(params, 'ds_15')
  ds_15 = params.ds_15;
elseif isfield(params, 'ds')
  ds_15 = params.ds{15};
else
  error 'could not find ds_15'
end
if isfield(params, 'ds_16')
  ds_16 = params.ds_16;
elseif isfield(params, 'ds')
  ds_16 = params.ds{16};
else
  error 'could not find ds_16'
end
if isfield(params, 'ds_17')
  ds_17 = params.ds_17;
elseif isfield(params, 'ds')
  ds_17 = params.ds{17};
else
  error 'could not find ds_17'
end
if isfield(params, 'ds_18')
  ds_18 = params.ds_18;
elseif isfield(params, 'ds')
  ds_18 = params.ds{18};
else
  error 'could not find ds_18'
end
if isfield(params, 'ds_19')
  ds_19 = params.ds_19;
elseif isfield(params, 'ds')
  ds_19 = params.ds{19};
else
  error 'could not find ds_19'
end
if isfield(params, 'ds_20')
  ds_20 = params.ds_20;
elseif isfield(params, 'ds')
  ds_20 = params.ds{20};
else
  error 'could not find ds_20'
end
if isfield(params, 'ds_21')
  ds_21 = params.ds_21;
elseif isfield(params, 'ds')
  ds_21 = params.ds{21};
else
  error 'could not find ds_21'
end
if isfield(params, 'ds_22')
  ds_22 = params.ds_22;
elseif isfield(params, 'ds')
  ds_22 = params.ds{22};
else
  error 'could not find ds_22'
end
if isfield(params, 'ds_23')
  ds_23 = params.ds_23;
elseif isfield(params, 'ds')
  ds_23 = params.ds{23};
else
  error 'could not find ds_23'
end
if isfield(params, 'ds_24')
  ds_24 = params.ds_24;
elseif isfield(params, 'ds')
  ds_24 = params.ds{24};
else
  error 'could not find ds_24'
end
if isfield(params, 'ds_25')
  ds_25 = params.ds_25;
elseif isfield(params, 'ds')
  ds_25 = params.ds{25};
else
  error 'could not find ds_25'
end
if isfield(params, 'ds_26')
  ds_26 = params.ds_26;
elseif isfield(params, 'ds')
  ds_26 = params.ds{26};
else
  error 'could not find ds_26'
end
if isfield(params, 'ds_27')
  ds_27 = params.ds_27;
elseif isfield(params, 'ds')
  ds_27 = params.ds{27};
else
  error 'could not find ds_27'
end
if isfield(params, 'ds_28')
  ds_28 = params.ds_28;
elseif isfield(params, 'ds')
  ds_28 = params.ds{28};
else
  error 'could not find ds_28'
end
if isfield(params, 'ds_29')
  ds_29 = params.ds_29;
elseif isfield(params, 'ds')
  ds_29 = params.ds{29};
else
  error 'could not find ds_29'
end
if isfield(params, 'ds_30')
  ds_30 = params.ds_30;
elseif isfield(params, 'ds')
  ds_30 = params.ds{30};
else
  error 'could not find ds_30'
end
if isfield(params, 'ds_31')
  ds_31 = params.ds_31;
elseif isfield(params, 'ds')
  ds_31 = params.ds{31};
else
  error 'could not find ds_31'
end
if isfield(params, 'ds_32')
  ds_32 = params.ds_32;
elseif isfield(params, 'ds')
  ds_32 = params.ds{32};
else
  error 'could not find ds_32'
end
if isfield(params, 'ds_33')
  ds_33 = params.ds_33;
elseif isfield(params, 'ds')
  ds_33 = params.ds{33};
else
  error 'could not find ds_33'
end
if isfield(params, 'ds_34')
  ds_34 = params.ds_34;
elseif isfield(params, 'ds')
  ds_34 = params.ds{34};
else
  error 'could not find ds_34'
end
if isfield(params, 'ds_35')
  ds_35 = params.ds_35;
elseif isfield(params, 'ds')
  ds_35 = params.ds{35};
else
  error 'could not find ds_35'
end
if isfield(params, 'ds_36')
  ds_36 = params.ds_36;
elseif isfield(params, 'ds')
  ds_36 = params.ds{36};
else
  error 'could not find ds_36'
end
if isfield(params, 'ds_37')
  ds_37 = params.ds_37;
elseif isfield(params, 'ds')
  ds_37 = params.ds{37};
else
  error 'could not find ds_37'
end
if isfield(params, 'ds_38')
  ds_38 = params.ds_38;
elseif isfield(params, 'ds')
  ds_38 = params.ds{38};
else
  error 'could not find ds_38'
end
if isfield(params, 'ds_39')
  ds_39 = params.ds_39;
elseif isfield(params, 'ds')
  ds_39 = params.ds{39};
else
  error 'could not find ds_39'
end
if isfield(params, 'ds_40')
  ds_40 = params.ds_40;
elseif isfield(params, 'ds')
  ds_40 = params.ds{40};
else
  error 'could not find ds_40'
end
if isfield(params, 'ds_41')
  ds_41 = params.ds_41;
elseif isfield(params, 'ds')
  ds_41 = params.ds{41};
else
  error 'could not find ds_41'
end
if isfield(params, 'ds_42')
  ds_42 = params.ds_42;
elseif isfield(params, 'ds')
  ds_42 = params.ds{42};
else
  error 'could not find ds_42'
end
if isfield(params, 'ds_43')
  ds_43 = params.ds_43;
elseif isfield(params, 'ds')
  ds_43 = params.ds{43};
else
  error 'could not find ds_43'
end
if isfield(params, 'ds_44')
  ds_44 = params.ds_44;
elseif isfield(params, 'ds')
  ds_44 = params.ds{44};
else
  error 'could not find ds_44'
end
if isfield(params, 'ds_45')
  ds_45 = params.ds_45;
elseif isfield(params, 'ds')
  ds_45 = params.ds{45};
else
  error 'could not find ds_45'
end
if isfield(params, 'ds_46')
  ds_46 = params.ds_46;
elseif isfield(params, 'ds')
  ds_46 = params.ds{46};
else
  error 'could not find ds_46'
end
if isfield(params, 'ds_47')
  ds_47 = params.ds_47;
elseif isfield(params, 'ds')
  ds_47 = params.ds{47};
else
  error 'could not find ds_47'
end
if isfield(params, 'ds_48')
  ds_48 = params.ds_48;
elseif isfield(params, 'ds')
  ds_48 = params.ds{48};
else
  error 'could not find ds_48'
end
if isfield(params, 'ds_49')
  ds_49 = params.ds_49;
elseif isfield(params, 'ds')
  ds_49 = params.ds{49};
else
  error 'could not find ds_49'
end
if isfield(params, 'ds_50')
  ds_50 = params.ds_50;
elseif isfield(params, 'ds')
  ds_50 = params.ds{50};
else
  error 'could not find ds_50'
end
if isfield(params, 'ds_51')
  ds_51 = params.ds_51;
elseif isfield(params, 'ds')
  ds_51 = params.ds{51};
else
  error 'could not find ds_51'
end
if isfield(params, 'ds_52')
  ds_52 = params.ds_52;
elseif isfield(params, 'ds')
  ds_52 = params.ds{52};
else
  error 'could not find ds_52'
end
if isfield(params, 'ds_53')
  ds_53 = params.ds_53;
elseif isfield(params, 'ds')
  ds_53 = params.ds{53};
else
  error 'could not find ds_53'
end
if isfield(params, 'ds_54')
  ds_54 = params.ds_54;
elseif isfield(params, 'ds')
  ds_54 = params.ds{54};
else
  error 'could not find ds_54'
end
if isfield(params, 'ds_55')
  ds_55 = params.ds_55;
elseif isfield(params, 'ds')
  ds_55 = params.ds{55};
else
  error 'could not find ds_55'
end
if isfield(params, 'ds_56')
  ds_56 = params.ds_56;
elseif isfield(params, 'ds')
  ds_56 = params.ds{56};
else
  error 'could not find ds_56'
end
if isfield(params, 'ds_57')
  ds_57 = params.ds_57;
elseif isfield(params, 'ds')
  ds_57 = params.ds{57};
else
  error 'could not find ds_57'
end
if isfield(params, 'ds_58')
  ds_58 = params.ds_58;
elseif isfield(params, 'ds')
  ds_58 = params.ds{58};
else
  error 'could not find ds_58'
end
if isfield(params, 'ds_59')
  ds_59 = params.ds_59;
elseif isfield(params, 'ds')
  ds_59 = params.ds{59};
else
  error 'could not find ds_59'
end
if isfield(params, 'ds_60')
  ds_60 = params.ds_60;
elseif isfield(params, 'ds')
  ds_60 = params.ds{60};
else
  error 'could not find ds_60'
end
if isfield(params, 'ds_61')
  ds_61 = params.ds_61;
elseif isfield(params, 'ds')
  ds_61 = params.ds{61};
else
  error 'could not find ds_61'
end
if isfield(params, 'ds_62')
  ds_62 = params.ds_62;
elseif isfield(params, 'ds')
  ds_62 = params.ds{62};
else
  error 'could not find ds_62'
end
if isfield(params, 'ds_63')
  ds_63 = params.ds_63;
elseif isfield(params, 'ds')
  ds_63 = params.ds{63};
else
  error 'could not find ds_63'
end
if isfield(params, 'ds_64')
  ds_64 = params.ds_64;
elseif isfield(params, 'ds')
  ds_64 = params.ds{64};
else
  error 'could not find ds_64'
end
if isfield(params, 'ds_65')
  ds_65 = params.ds_65;
elseif isfield(params, 'ds')
  ds_65 = params.ds{65};
else
  error 'could not find ds_65'
end
if isfield(params, 'ds_66')
  ds_66 = params.ds_66;
elseif isfield(params, 'ds')
  ds_66 = params.ds{66};
else
  error 'could not find ds_66'
end
if isfield(params, 'ds_67')
  ds_67 = params.ds_67;
elseif isfield(params, 'ds')
  ds_67 = params.ds{67};
else
  error 'could not find ds_67'
end
if isfield(params, 'ds_68')
  ds_68 = params.ds_68;
elseif isfield(params, 'ds')
  ds_68 = params.ds{68};
else
  error 'could not find ds_68'
end
if isfield(params, 'ds_69')
  ds_69 = params.ds_69;
elseif isfield(params, 'ds')
  ds_69 = params.ds{69};
else
  error 'could not find ds_69'
end
if isfield(params, 'ds_70')
  ds_70 = params.ds_70;
elseif isfield(params, 'ds')
  ds_70 = params.ds{70};
else
  error 'could not find ds_70'
end
if isfield(params, 'ds_71')
  ds_71 = params.ds_71;
elseif isfield(params, 'ds')
  ds_71 = params.ds{71};
else
  error 'could not find ds_71'
end
if isfield(params, 'ds_72')
  ds_72 = params.ds_72;
elseif isfield(params, 'ds')
  ds_72 = params.ds{72};
else
  error 'could not find ds_72'
end
if isfield(params, 'ds_73')
  ds_73 = params.ds_73;
elseif isfield(params, 'ds')
  ds_73 = params.ds{73};
else
  error 'could not find ds_73'
end
if isfield(params, 'ds_74')
  ds_74 = params.ds_74;
elseif isfield(params, 'ds')
  ds_74 = params.ds{74};
else
  error 'could not find ds_74'
end
if isfield(params, 'ds_75')
  ds_75 = params.ds_75;
elseif isfield(params, 'ds')
  ds_75 = params.ds{75};
else
  error 'could not find ds_75'
end
if isfield(params, 'ds_76')
  ds_76 = params.ds_76;
elseif isfield(params, 'ds')
  ds_76 = params.ds{76};
else
  error 'could not find ds_76'
end
if isfield(params, 'ds_77')
  ds_77 = params.ds_77;
elseif isfield(params, 'ds')
  ds_77 = params.ds{77};
else
  error 'could not find ds_77'
end
if isfield(params, 'ds_78')
  ds_78 = params.ds_78;
elseif isfield(params, 'ds')
  ds_78 = params.ds{78};
else
  error 'could not find ds_78'
end
if isfield(params, 'ds_79')
  ds_79 = params.ds_79;
elseif isfield(params, 'ds')
  ds_79 = params.ds{79};
else
  error 'could not find ds_79'
end
if isfield(params, 'ds_80')
  ds_80 = params.ds_80;
elseif isfield(params, 'ds')
  ds_80 = params.ds{80};
else
  error 'could not find ds_80'
end
if isfield(params, 'ds_81')
  ds_81 = params.ds_81;
elseif isfield(params, 'ds')
  ds_81 = params.ds{81};
else
  error 'could not find ds_81'
end
if isfield(params, 'ds_82')
  ds_82 = params.ds_82;
elseif isfield(params, 'ds')
  ds_82 = params.ds{82};
else
  error 'could not find ds_82'
end
if isfield(params, 'ds_83')
  ds_83 = params.ds_83;
elseif isfield(params, 'ds')
  ds_83 = params.ds{83};
else
  error 'could not find ds_83'
end
if isfield(params, 'ds_84')
  ds_84 = params.ds_84;
elseif isfield(params, 'ds')
  ds_84 = params.ds{84};
else
  error 'could not find ds_84'
end
if isfield(params, 'ds_85')
  ds_85 = params.ds_85;
elseif isfield(params, 'ds')
  ds_85 = params.ds{85};
else
  error 'could not find ds_85'
end
if isfield(params, 'ds_86')
  ds_86 = params.ds_86;
elseif isfield(params, 'ds')
  ds_86 = params.ds{86};
else
  error 'could not find ds_86'
end
if isfield(params, 'ds_87')
  ds_87 = params.ds_87;
elseif isfield(params, 'ds')
  ds_87 = params.ds{87};
else
  error 'could not find ds_87'
end
if isfield(params, 'ds_88')
  ds_88 = params.ds_88;
elseif isfield(params, 'ds')
  ds_88 = params.ds{88};
else
  error 'could not find ds_88'
end
if isfield(params, 'ds_89')
  ds_89 = params.ds_89;
elseif isfield(params, 'ds')
  ds_89 = params.ds{89};
else
  error 'could not find ds_89'
end
if isfield(params, 'ds_90')
  ds_90 = params.ds_90;
elseif isfield(params, 'ds')
  ds_90 = params.ds{90};
else
  error 'could not find ds_90'
end
if isfield(params, 'ds_91')
  ds_91 = params.ds_91;
elseif isfield(params, 'ds')
  ds_91 = params.ds{91};
else
  error 'could not find ds_91'
end
if isfield(params, 'ds_92')
  ds_92 = params.ds_92;
elseif isfield(params, 'ds')
  ds_92 = params.ds{92};
else
  error 'could not find ds_92'
end
if isfield(params, 'ds_93')
  ds_93 = params.ds_93;
elseif isfield(params, 'ds')
  ds_93 = params.ds{93};
else
  error 'could not find ds_93'
end
if isfield(params, 'ds_94')
  ds_94 = params.ds_94;
elseif isfield(params, 'ds')
  ds_94 = params.ds{94};
else
  error 'could not find ds_94'
end
if isfield(params, 'psiR_1')
  psiR_1 = params.psiR_1;
elseif isfield(params, 'psiR')
  psiR_1 = params.psiR{1};
else
  error 'could not find psiR_1'
end
if isfield(params, 'psiR_2')
  psiR_2 = params.psiR_2;
elseif isfield(params, 'psiR')
  psiR_2 = params.psiR{2};
else
  error 'could not find psiR_2'
end
if isfield(params, 'psiR_3')
  psiR_3 = params.psiR_3;
elseif isfield(params, 'psiR')
  psiR_3 = params.psiR{3};
else
  error 'could not find psiR_3'
end
if isfield(params, 'psiR_4')
  psiR_4 = params.psiR_4;
elseif isfield(params, 'psiR')
  psiR_4 = params.psiR{4};
else
  error 'could not find psiR_4'
end
if isfield(params, 'psiR_5')
  psiR_5 = params.psiR_5;
elseif isfield(params, 'psiR')
  psiR_5 = params.psiR{5};
else
  error 'could not find psiR_5'
end
if isfield(params, 'psiR_6')
  psiR_6 = params.psiR_6;
elseif isfield(params, 'psiR')
  psiR_6 = params.psiR{6};
else
  error 'could not find psiR_6'
end
if isfield(params, 'psiR_7')
  psiR_7 = params.psiR_7;
elseif isfield(params, 'psiR')
  psiR_7 = params.psiR{7};
else
  error 'could not find psiR_7'
end
if isfield(params, 'psiR_8')
  psiR_8 = params.psiR_8;
elseif isfield(params, 'psiR')
  psiR_8 = params.psiR{8};
else
  error 'could not find psiR_8'
end
if isfield(params, 'psiR_9')
  psiR_9 = params.psiR_9;
elseif isfield(params, 'psiR')
  psiR_9 = params.psiR{9};
else
  error 'could not find psiR_9'
end
if isfield(params, 'psiR_10')
  psiR_10 = params.psiR_10;
elseif isfield(params, 'psiR')
  psiR_10 = params.psiR{10};
else
  error 'could not find psiR_10'
end
if isfield(params, 'psiR_11')
  psiR_11 = params.psiR_11;
elseif isfield(params, 'psiR')
  psiR_11 = params.psiR{11};
else
  error 'could not find psiR_11'
end
if isfield(params, 'psiR_12')
  psiR_12 = params.psiR_12;
elseif isfield(params, 'psiR')
  psiR_12 = params.psiR{12};
else
  error 'could not find psiR_12'
end
if isfield(params, 'psiR_13')
  psiR_13 = params.psiR_13;
elseif isfield(params, 'psiR')
  psiR_13 = params.psiR{13};
else
  error 'could not find psiR_13'
end
if isfield(params, 'psiR_14')
  psiR_14 = params.psiR_14;
elseif isfield(params, 'psiR')
  psiR_14 = params.psiR{14};
else
  error 'could not find psiR_14'
end
if isfield(params, 'psiR_15')
  psiR_15 = params.psiR_15;
elseif isfield(params, 'psiR')
  psiR_15 = params.psiR{15};
else
  error 'could not find psiR_15'
end
if isfield(params, 'psiR_16')
  psiR_16 = params.psiR_16;
elseif isfield(params, 'psiR')
  psiR_16 = params.psiR{16};
else
  error 'could not find psiR_16'
end
if isfield(params, 'psiR_17')
  psiR_17 = params.psiR_17;
elseif isfield(params, 'psiR')
  psiR_17 = params.psiR{17};
else
  error 'could not find psiR_17'
end
if isfield(params, 'psiR_18')
  psiR_18 = params.psiR_18;
elseif isfield(params, 'psiR')
  psiR_18 = params.psiR{18};
else
  error 'could not find psiR_18'
end
if isfield(params, 'psiR_19')
  psiR_19 = params.psiR_19;
elseif isfield(params, 'psiR')
  psiR_19 = params.psiR{19};
else
  error 'could not find psiR_19'
end
if isfield(params, 'psiR_20')
  psiR_20 = params.psiR_20;
elseif isfield(params, 'psiR')
  psiR_20 = params.psiR{20};
else
  error 'could not find psiR_20'
end
if isfield(params, 'psiR_21')
  psiR_21 = params.psiR_21;
elseif isfield(params, 'psiR')
  psiR_21 = params.psiR{21};
else
  error 'could not find psiR_21'
end
if isfield(params, 'psiR_22')
  psiR_22 = params.psiR_22;
elseif isfield(params, 'psiR')
  psiR_22 = params.psiR{22};
else
  error 'could not find psiR_22'
end
if isfield(params, 'psiR_23')
  psiR_23 = params.psiR_23;
elseif isfield(params, 'psiR')
  psiR_23 = params.psiR{23};
else
  error 'could not find psiR_23'
end
if isfield(params, 'psiR_24')
  psiR_24 = params.psiR_24;
elseif isfield(params, 'psiR')
  psiR_24 = params.psiR{24};
else
  error 'could not find psiR_24'
end
if isfield(params, 'psiR_25')
  psiR_25 = params.psiR_25;
elseif isfield(params, 'psiR')
  psiR_25 = params.psiR{25};
else
  error 'could not find psiR_25'
end
if isfield(params, 'psiR_26')
  psiR_26 = params.psiR_26;
elseif isfield(params, 'psiR')
  psiR_26 = params.psiR{26};
else
  error 'could not find psiR_26'
end
if isfield(params, 'psiR_27')
  psiR_27 = params.psiR_27;
elseif isfield(params, 'psiR')
  psiR_27 = params.psiR{27};
else
  error 'could not find psiR_27'
end
if isfield(params, 'psiR_28')
  psiR_28 = params.psiR_28;
elseif isfield(params, 'psiR')
  psiR_28 = params.psiR{28};
else
  error 'could not find psiR_28'
end
if isfield(params, 'psiR_29')
  psiR_29 = params.psiR_29;
elseif isfield(params, 'psiR')
  psiR_29 = params.psiR{29};
else
  error 'could not find psiR_29'
end
if isfield(params, 'psiR_30')
  psiR_30 = params.psiR_30;
elseif isfield(params, 'psiR')
  psiR_30 = params.psiR{30};
else
  error 'could not find psiR_30'
end
if isfield(params, 'psiR_31')
  psiR_31 = params.psiR_31;
elseif isfield(params, 'psiR')
  psiR_31 = params.psiR{31};
else
  error 'could not find psiR_31'
end
if isfield(params, 'psiR_32')
  psiR_32 = params.psiR_32;
elseif isfield(params, 'psiR')
  psiR_32 = params.psiR{32};
else
  error 'could not find psiR_32'
end
if isfield(params, 'psiR_33')
  psiR_33 = params.psiR_33;
elseif isfield(params, 'psiR')
  psiR_33 = params.psiR{33};
else
  error 'could not find psiR_33'
end
if isfield(params, 'psiR_34')
  psiR_34 = params.psiR_34;
elseif isfield(params, 'psiR')
  psiR_34 = params.psiR{34};
else
  error 'could not find psiR_34'
end
if isfield(params, 'psiR_35')
  psiR_35 = params.psiR_35;
elseif isfield(params, 'psiR')
  psiR_35 = params.psiR{35};
else
  error 'could not find psiR_35'
end
if isfield(params, 'psiR_36')
  psiR_36 = params.psiR_36;
elseif isfield(params, 'psiR')
  psiR_36 = params.psiR{36};
else
  error 'could not find psiR_36'
end
if isfield(params, 'psiR_37')
  psiR_37 = params.psiR_37;
elseif isfield(params, 'psiR')
  psiR_37 = params.psiR{37};
else
  error 'could not find psiR_37'
end
if isfield(params, 'psiR_38')
  psiR_38 = params.psiR_38;
elseif isfield(params, 'psiR')
  psiR_38 = params.psiR{38};
else
  error 'could not find psiR_38'
end
if isfield(params, 'psiR_39')
  psiR_39 = params.psiR_39;
elseif isfield(params, 'psiR')
  psiR_39 = params.psiR{39};
else
  error 'could not find psiR_39'
end
if isfield(params, 'psiR_40')
  psiR_40 = params.psiR_40;
elseif isfield(params, 'psiR')
  psiR_40 = params.psiR{40};
else
  error 'could not find psiR_40'
end
if isfield(params, 'psiR_41')
  psiR_41 = params.psiR_41;
elseif isfield(params, 'psiR')
  psiR_41 = params.psiR{41};
else
  error 'could not find psiR_41'
end
if isfield(params, 'psiR_42')
  psiR_42 = params.psiR_42;
elseif isfield(params, 'psiR')
  psiR_42 = params.psiR{42};
else
  error 'could not find psiR_42'
end
if isfield(params, 'psiR_43')
  psiR_43 = params.psiR_43;
elseif isfield(params, 'psiR')
  psiR_43 = params.psiR{43};
else
  error 'could not find psiR_43'
end
if isfield(params, 'psiR_44')
  psiR_44 = params.psiR_44;
elseif isfield(params, 'psiR')
  psiR_44 = params.psiR{44};
else
  error 'could not find psiR_44'
end
if isfield(params, 'psiR_45')
  psiR_45 = params.psiR_45;
elseif isfield(params, 'psiR')
  psiR_45 = params.psiR{45};
else
  error 'could not find psiR_45'
end
if isfield(params, 'psiR_46')
  psiR_46 = params.psiR_46;
elseif isfield(params, 'psiR')
  psiR_46 = params.psiR{46};
else
  error 'could not find psiR_46'
end
if isfield(params, 'psiR_47')
  psiR_47 = params.psiR_47;
elseif isfield(params, 'psiR')
  psiR_47 = params.psiR{47};
else
  error 'could not find psiR_47'
end
if isfield(params, 'psiR_48')
  psiR_48 = params.psiR_48;
elseif isfield(params, 'psiR')
  psiR_48 = params.psiR{48};
else
  error 'could not find psiR_48'
end
if isfield(params, 'psiR_49')
  psiR_49 = params.psiR_49;
elseif isfield(params, 'psiR')
  psiR_49 = params.psiR{49};
else
  error 'could not find psiR_49'
end
if isfield(params, 'psiR_50')
  psiR_50 = params.psiR_50;
elseif isfield(params, 'psiR')
  psiR_50 = params.psiR{50};
else
  error 'could not find psiR_50'
end
if isfield(params, 'psiR_51')
  psiR_51 = params.psiR_51;
elseif isfield(params, 'psiR')
  psiR_51 = params.psiR{51};
else
  error 'could not find psiR_51'
end
if isfield(params, 'psiR_52')
  psiR_52 = params.psiR_52;
elseif isfield(params, 'psiR')
  psiR_52 = params.psiR{52};
else
  error 'could not find psiR_52'
end
if isfield(params, 'psiR_53')
  psiR_53 = params.psiR_53;
elseif isfield(params, 'psiR')
  psiR_53 = params.psiR{53};
else
  error 'could not find psiR_53'
end
if isfield(params, 'psiR_54')
  psiR_54 = params.psiR_54;
elseif isfield(params, 'psiR')
  psiR_54 = params.psiR{54};
else
  error 'could not find psiR_54'
end
if isfield(params, 'psiR_55')
  psiR_55 = params.psiR_55;
elseif isfield(params, 'psiR')
  psiR_55 = params.psiR{55};
else
  error 'could not find psiR_55'
end
if isfield(params, 'psiR_56')
  psiR_56 = params.psiR_56;
elseif isfield(params, 'psiR')
  psiR_56 = params.psiR{56};
else
  error 'could not find psiR_56'
end
if isfield(params, 'psiR_57')
  psiR_57 = params.psiR_57;
elseif isfield(params, 'psiR')
  psiR_57 = params.psiR{57};
else
  error 'could not find psiR_57'
end
if isfield(params, 'psiR_58')
  psiR_58 = params.psiR_58;
elseif isfield(params, 'psiR')
  psiR_58 = params.psiR{58};
else
  error 'could not find psiR_58'
end
if isfield(params, 'psiR_59')
  psiR_59 = params.psiR_59;
elseif isfield(params, 'psiR')
  psiR_59 = params.psiR{59};
else
  error 'could not find psiR_59'
end
if isfield(params, 'psiR_60')
  psiR_60 = params.psiR_60;
elseif isfield(params, 'psiR')
  psiR_60 = params.psiR{60};
else
  error 'could not find psiR_60'
end
if isfield(params, 'psiR_61')
  psiR_61 = params.psiR_61;
elseif isfield(params, 'psiR')
  psiR_61 = params.psiR{61};
else
  error 'could not find psiR_61'
end
if isfield(params, 'psiR_62')
  psiR_62 = params.psiR_62;
elseif isfield(params, 'psiR')
  psiR_62 = params.psiR{62};
else
  error 'could not find psiR_62'
end
if isfield(params, 'psiR_63')
  psiR_63 = params.psiR_63;
elseif isfield(params, 'psiR')
  psiR_63 = params.psiR{63};
else
  error 'could not find psiR_63'
end
if isfield(params, 'psiR_64')
  psiR_64 = params.psiR_64;
elseif isfield(params, 'psiR')
  psiR_64 = params.psiR{64};
else
  error 'could not find psiR_64'
end
if isfield(params, 'psiR_65')
  psiR_65 = params.psiR_65;
elseif isfield(params, 'psiR')
  psiR_65 = params.psiR{65};
else
  error 'could not find psiR_65'
end
if isfield(params, 'psiR_66')
  psiR_66 = params.psiR_66;
elseif isfield(params, 'psiR')
  psiR_66 = params.psiR{66};
else
  error 'could not find psiR_66'
end
if isfield(params, 'psiR_67')
  psiR_67 = params.psiR_67;
elseif isfield(params, 'psiR')
  psiR_67 = params.psiR{67};
else
  error 'could not find psiR_67'
end
if isfield(params, 'psiR_68')
  psiR_68 = params.psiR_68;
elseif isfield(params, 'psiR')
  psiR_68 = params.psiR{68};
else
  error 'could not find psiR_68'
end
if isfield(params, 'psiR_69')
  psiR_69 = params.psiR_69;
elseif isfield(params, 'psiR')
  psiR_69 = params.psiR{69};
else
  error 'could not find psiR_69'
end
if isfield(params, 'psiR_70')
  psiR_70 = params.psiR_70;
elseif isfield(params, 'psiR')
  psiR_70 = params.psiR{70};
else
  error 'could not find psiR_70'
end
if isfield(params, 'psiR_71')
  psiR_71 = params.psiR_71;
elseif isfield(params, 'psiR')
  psiR_71 = params.psiR{71};
else
  error 'could not find psiR_71'
end
if isfield(params, 'psiR_72')
  psiR_72 = params.psiR_72;
elseif isfield(params, 'psiR')
  psiR_72 = params.psiR{72};
else
  error 'could not find psiR_72'
end
if isfield(params, 'psiR_73')
  psiR_73 = params.psiR_73;
elseif isfield(params, 'psiR')
  psiR_73 = params.psiR{73};
else
  error 'could not find psiR_73'
end
if isfield(params, 'psiR_74')
  psiR_74 = params.psiR_74;
elseif isfield(params, 'psiR')
  psiR_74 = params.psiR{74};
else
  error 'could not find psiR_74'
end
if isfield(params, 'psiR_75')
  psiR_75 = params.psiR_75;
elseif isfield(params, 'psiR')
  psiR_75 = params.psiR{75};
else
  error 'could not find psiR_75'
end
if isfield(params, 'psiR_76')
  psiR_76 = params.psiR_76;
elseif isfield(params, 'psiR')
  psiR_76 = params.psiR{76};
else
  error 'could not find psiR_76'
end
if isfield(params, 'psiR_77')
  psiR_77 = params.psiR_77;
elseif isfield(params, 'psiR')
  psiR_77 = params.psiR{77};
else
  error 'could not find psiR_77'
end
if isfield(params, 'psiR_78')
  psiR_78 = params.psiR_78;
elseif isfield(params, 'psiR')
  psiR_78 = params.psiR{78};
else
  error 'could not find psiR_78'
end
if isfield(params, 'psiR_79')
  psiR_79 = params.psiR_79;
elseif isfield(params, 'psiR')
  psiR_79 = params.psiR{79};
else
  error 'could not find psiR_79'
end
if isfield(params, 'psiR_80')
  psiR_80 = params.psiR_80;
elseif isfield(params, 'psiR')
  psiR_80 = params.psiR{80};
else
  error 'could not find psiR_80'
end
if isfield(params, 'psiR_81')
  psiR_81 = params.psiR_81;
elseif isfield(params, 'psiR')
  psiR_81 = params.psiR{81};
else
  error 'could not find psiR_81'
end
if isfield(params, 'psiR_82')
  psiR_82 = params.psiR_82;
elseif isfield(params, 'psiR')
  psiR_82 = params.psiR{82};
else
  error 'could not find psiR_82'
end
if isfield(params, 'psiR_83')
  psiR_83 = params.psiR_83;
elseif isfield(params, 'psiR')
  psiR_83 = params.psiR{83};
else
  error 'could not find psiR_83'
end
if isfield(params, 'psiR_84')
  psiR_84 = params.psiR_84;
elseif isfield(params, 'psiR')
  psiR_84 = params.psiR{84};
else
  error 'could not find psiR_84'
end
if isfield(params, 'psiR_85')
  psiR_85 = params.psiR_85;
elseif isfield(params, 'psiR')
  psiR_85 = params.psiR{85};
else
  error 'could not find psiR_85'
end
if isfield(params, 'psiR_86')
  psiR_86 = params.psiR_86;
elseif isfield(params, 'psiR')
  psiR_86 = params.psiR{86};
else
  error 'could not find psiR_86'
end
if isfield(params, 'psiR_87')
  psiR_87 = params.psiR_87;
elseif isfield(params, 'psiR')
  psiR_87 = params.psiR{87};
else
  error 'could not find psiR_87'
end
if isfield(params, 'psiR_88')
  psiR_88 = params.psiR_88;
elseif isfield(params, 'psiR')
  psiR_88 = params.psiR{88};
else
  error 'could not find psiR_88'
end
if isfield(params, 'psiR_89')
  psiR_89 = params.psiR_89;
elseif isfield(params, 'psiR')
  psiR_89 = params.psiR{89};
else
  error 'could not find psiR_89'
end
if isfield(params, 'psiR_90')
  psiR_90 = params.psiR_90;
elseif isfield(params, 'psiR')
  psiR_90 = params.psiR{90};
else
  error 'could not find psiR_90'
end
if isfield(params, 'psiR_91')
  psiR_91 = params.psiR_91;
elseif isfield(params, 'psiR')
  psiR_91 = params.psiR{91};
else
  error 'could not find psiR_91'
end
if isfield(params, 'psiR_92')
  psiR_92 = params.psiR_92;
elseif isfield(params, 'psiR')
  psiR_92 = params.psiR{92};
else
  error 'could not find psiR_92'
end
if isfield(params, 'psiR_93')
  psiR_93 = params.psiR_93;
elseif isfield(params, 'psiR')
  psiR_93 = params.psiR{93};
else
  error 'could not find psiR_93'
end
if isfield(params, 'psiR_94')
  psiR_94 = params.psiR_94;
elseif isfield(params, 'psiR')
  psiR_94 = params.psiR{94};
else
  error 'could not find psiR_94'
end
if isfield(params, 'psiR_95')
  psiR_95 = params.psiR_95;
elseif isfield(params, 'psiR')
  psiR_95 = params.psiR{95};
else
  error 'could not find psiR_95'
end
if isfield(params, 'widthLeft_1')
  widthLeft_1 = params.widthLeft_1;
elseif isfield(params, 'widthLeft')
  widthLeft_1 = params.widthLeft{1};
else
  error 'could not find widthLeft_1'
end
if isfield(params, 'widthLeft_2')
  widthLeft_2 = params.widthLeft_2;
elseif isfield(params, 'widthLeft')
  widthLeft_2 = params.widthLeft{2};
else
  error 'could not find widthLeft_2'
end
if isfield(params, 'widthLeft_3')
  widthLeft_3 = params.widthLeft_3;
elseif isfield(params, 'widthLeft')
  widthLeft_3 = params.widthLeft{3};
else
  error 'could not find widthLeft_3'
end
if isfield(params, 'widthLeft_4')
  widthLeft_4 = params.widthLeft_4;
elseif isfield(params, 'widthLeft')
  widthLeft_4 = params.widthLeft{4};
else
  error 'could not find widthLeft_4'
end
if isfield(params, 'widthLeft_5')
  widthLeft_5 = params.widthLeft_5;
elseif isfield(params, 'widthLeft')
  widthLeft_5 = params.widthLeft{5};
else
  error 'could not find widthLeft_5'
end
if isfield(params, 'widthLeft_6')
  widthLeft_6 = params.widthLeft_6;
elseif isfield(params, 'widthLeft')
  widthLeft_6 = params.widthLeft{6};
else
  error 'could not find widthLeft_6'
end
if isfield(params, 'widthLeft_7')
  widthLeft_7 = params.widthLeft_7;
elseif isfield(params, 'widthLeft')
  widthLeft_7 = params.widthLeft{7};
else
  error 'could not find widthLeft_7'
end
if isfield(params, 'widthLeft_8')
  widthLeft_8 = params.widthLeft_8;
elseif isfield(params, 'widthLeft')
  widthLeft_8 = params.widthLeft{8};
else
  error 'could not find widthLeft_8'
end
if isfield(params, 'widthLeft_9')
  widthLeft_9 = params.widthLeft_9;
elseif isfield(params, 'widthLeft')
  widthLeft_9 = params.widthLeft{9};
else
  error 'could not find widthLeft_9'
end
if isfield(params, 'widthLeft_10')
  widthLeft_10 = params.widthLeft_10;
elseif isfield(params, 'widthLeft')
  widthLeft_10 = params.widthLeft{10};
else
  error 'could not find widthLeft_10'
end
if isfield(params, 'widthLeft_11')
  widthLeft_11 = params.widthLeft_11;
elseif isfield(params, 'widthLeft')
  widthLeft_11 = params.widthLeft{11};
else
  error 'could not find widthLeft_11'
end
if isfield(params, 'widthLeft_12')
  widthLeft_12 = params.widthLeft_12;
elseif isfield(params, 'widthLeft')
  widthLeft_12 = params.widthLeft{12};
else
  error 'could not find widthLeft_12'
end
if isfield(params, 'widthLeft_13')
  widthLeft_13 = params.widthLeft_13;
elseif isfield(params, 'widthLeft')
  widthLeft_13 = params.widthLeft{13};
else
  error 'could not find widthLeft_13'
end
if isfield(params, 'widthLeft_14')
  widthLeft_14 = params.widthLeft_14;
elseif isfield(params, 'widthLeft')
  widthLeft_14 = params.widthLeft{14};
else
  error 'could not find widthLeft_14'
end
if isfield(params, 'widthLeft_15')
  widthLeft_15 = params.widthLeft_15;
elseif isfield(params, 'widthLeft')
  widthLeft_15 = params.widthLeft{15};
else
  error 'could not find widthLeft_15'
end
if isfield(params, 'widthLeft_16')
  widthLeft_16 = params.widthLeft_16;
elseif isfield(params, 'widthLeft')
  widthLeft_16 = params.widthLeft{16};
else
  error 'could not find widthLeft_16'
end
if isfield(params, 'widthLeft_17')
  widthLeft_17 = params.widthLeft_17;
elseif isfield(params, 'widthLeft')
  widthLeft_17 = params.widthLeft{17};
else
  error 'could not find widthLeft_17'
end
if isfield(params, 'widthLeft_18')
  widthLeft_18 = params.widthLeft_18;
elseif isfield(params, 'widthLeft')
  widthLeft_18 = params.widthLeft{18};
else
  error 'could not find widthLeft_18'
end
if isfield(params, 'widthLeft_19')
  widthLeft_19 = params.widthLeft_19;
elseif isfield(params, 'widthLeft')
  widthLeft_19 = params.widthLeft{19};
else
  error 'could not find widthLeft_19'
end
if isfield(params, 'widthLeft_20')
  widthLeft_20 = params.widthLeft_20;
elseif isfield(params, 'widthLeft')
  widthLeft_20 = params.widthLeft{20};
else
  error 'could not find widthLeft_20'
end
if isfield(params, 'widthLeft_21')
  widthLeft_21 = params.widthLeft_21;
elseif isfield(params, 'widthLeft')
  widthLeft_21 = params.widthLeft{21};
else
  error 'could not find widthLeft_21'
end
if isfield(params, 'widthLeft_22')
  widthLeft_22 = params.widthLeft_22;
elseif isfield(params, 'widthLeft')
  widthLeft_22 = params.widthLeft{22};
else
  error 'could not find widthLeft_22'
end
if isfield(params, 'widthLeft_23')
  widthLeft_23 = params.widthLeft_23;
elseif isfield(params, 'widthLeft')
  widthLeft_23 = params.widthLeft{23};
else
  error 'could not find widthLeft_23'
end
if isfield(params, 'widthLeft_24')
  widthLeft_24 = params.widthLeft_24;
elseif isfield(params, 'widthLeft')
  widthLeft_24 = params.widthLeft{24};
else
  error 'could not find widthLeft_24'
end
if isfield(params, 'widthLeft_25')
  widthLeft_25 = params.widthLeft_25;
elseif isfield(params, 'widthLeft')
  widthLeft_25 = params.widthLeft{25};
else
  error 'could not find widthLeft_25'
end
if isfield(params, 'widthLeft_26')
  widthLeft_26 = params.widthLeft_26;
elseif isfield(params, 'widthLeft')
  widthLeft_26 = params.widthLeft{26};
else
  error 'could not find widthLeft_26'
end
if isfield(params, 'widthLeft_27')
  widthLeft_27 = params.widthLeft_27;
elseif isfield(params, 'widthLeft')
  widthLeft_27 = params.widthLeft{27};
else
  error 'could not find widthLeft_27'
end
if isfield(params, 'widthLeft_28')
  widthLeft_28 = params.widthLeft_28;
elseif isfield(params, 'widthLeft')
  widthLeft_28 = params.widthLeft{28};
else
  error 'could not find widthLeft_28'
end
if isfield(params, 'widthLeft_29')
  widthLeft_29 = params.widthLeft_29;
elseif isfield(params, 'widthLeft')
  widthLeft_29 = params.widthLeft{29};
else
  error 'could not find widthLeft_29'
end
if isfield(params, 'widthLeft_30')
  widthLeft_30 = params.widthLeft_30;
elseif isfield(params, 'widthLeft')
  widthLeft_30 = params.widthLeft{30};
else
  error 'could not find widthLeft_30'
end
if isfield(params, 'widthLeft_31')
  widthLeft_31 = params.widthLeft_31;
elseif isfield(params, 'widthLeft')
  widthLeft_31 = params.widthLeft{31};
else
  error 'could not find widthLeft_31'
end
if isfield(params, 'widthLeft_32')
  widthLeft_32 = params.widthLeft_32;
elseif isfield(params, 'widthLeft')
  widthLeft_32 = params.widthLeft{32};
else
  error 'could not find widthLeft_32'
end
if isfield(params, 'widthLeft_33')
  widthLeft_33 = params.widthLeft_33;
elseif isfield(params, 'widthLeft')
  widthLeft_33 = params.widthLeft{33};
else
  error 'could not find widthLeft_33'
end
if isfield(params, 'widthLeft_34')
  widthLeft_34 = params.widthLeft_34;
elseif isfield(params, 'widthLeft')
  widthLeft_34 = params.widthLeft{34};
else
  error 'could not find widthLeft_34'
end
if isfield(params, 'widthLeft_35')
  widthLeft_35 = params.widthLeft_35;
elseif isfield(params, 'widthLeft')
  widthLeft_35 = params.widthLeft{35};
else
  error 'could not find widthLeft_35'
end
if isfield(params, 'widthLeft_36')
  widthLeft_36 = params.widthLeft_36;
elseif isfield(params, 'widthLeft')
  widthLeft_36 = params.widthLeft{36};
else
  error 'could not find widthLeft_36'
end
if isfield(params, 'widthLeft_37')
  widthLeft_37 = params.widthLeft_37;
elseif isfield(params, 'widthLeft')
  widthLeft_37 = params.widthLeft{37};
else
  error 'could not find widthLeft_37'
end
if isfield(params, 'widthLeft_38')
  widthLeft_38 = params.widthLeft_38;
elseif isfield(params, 'widthLeft')
  widthLeft_38 = params.widthLeft{38};
else
  error 'could not find widthLeft_38'
end
if isfield(params, 'widthLeft_39')
  widthLeft_39 = params.widthLeft_39;
elseif isfield(params, 'widthLeft')
  widthLeft_39 = params.widthLeft{39};
else
  error 'could not find widthLeft_39'
end
if isfield(params, 'widthLeft_40')
  widthLeft_40 = params.widthLeft_40;
elseif isfield(params, 'widthLeft')
  widthLeft_40 = params.widthLeft{40};
else
  error 'could not find widthLeft_40'
end
if isfield(params, 'widthLeft_41')
  widthLeft_41 = params.widthLeft_41;
elseif isfield(params, 'widthLeft')
  widthLeft_41 = params.widthLeft{41};
else
  error 'could not find widthLeft_41'
end
if isfield(params, 'widthLeft_42')
  widthLeft_42 = params.widthLeft_42;
elseif isfield(params, 'widthLeft')
  widthLeft_42 = params.widthLeft{42};
else
  error 'could not find widthLeft_42'
end
if isfield(params, 'widthLeft_43')
  widthLeft_43 = params.widthLeft_43;
elseif isfield(params, 'widthLeft')
  widthLeft_43 = params.widthLeft{43};
else
  error 'could not find widthLeft_43'
end
if isfield(params, 'widthLeft_44')
  widthLeft_44 = params.widthLeft_44;
elseif isfield(params, 'widthLeft')
  widthLeft_44 = params.widthLeft{44};
else
  error 'could not find widthLeft_44'
end
if isfield(params, 'widthLeft_45')
  widthLeft_45 = params.widthLeft_45;
elseif isfield(params, 'widthLeft')
  widthLeft_45 = params.widthLeft{45};
else
  error 'could not find widthLeft_45'
end
if isfield(params, 'widthLeft_46')
  widthLeft_46 = params.widthLeft_46;
elseif isfield(params, 'widthLeft')
  widthLeft_46 = params.widthLeft{46};
else
  error 'could not find widthLeft_46'
end
if isfield(params, 'widthLeft_47')
  widthLeft_47 = params.widthLeft_47;
elseif isfield(params, 'widthLeft')
  widthLeft_47 = params.widthLeft{47};
else
  error 'could not find widthLeft_47'
end
if isfield(params, 'widthLeft_48')
  widthLeft_48 = params.widthLeft_48;
elseif isfield(params, 'widthLeft')
  widthLeft_48 = params.widthLeft{48};
else
  error 'could not find widthLeft_48'
end
if isfield(params, 'widthLeft_49')
  widthLeft_49 = params.widthLeft_49;
elseif isfield(params, 'widthLeft')
  widthLeft_49 = params.widthLeft{49};
else
  error 'could not find widthLeft_49'
end
if isfield(params, 'widthLeft_50')
  widthLeft_50 = params.widthLeft_50;
elseif isfield(params, 'widthLeft')
  widthLeft_50 = params.widthLeft{50};
else
  error 'could not find widthLeft_50'
end
if isfield(params, 'widthLeft_51')
  widthLeft_51 = params.widthLeft_51;
elseif isfield(params, 'widthLeft')
  widthLeft_51 = params.widthLeft{51};
else
  error 'could not find widthLeft_51'
end
if isfield(params, 'widthLeft_52')
  widthLeft_52 = params.widthLeft_52;
elseif isfield(params, 'widthLeft')
  widthLeft_52 = params.widthLeft{52};
else
  error 'could not find widthLeft_52'
end
if isfield(params, 'widthLeft_53')
  widthLeft_53 = params.widthLeft_53;
elseif isfield(params, 'widthLeft')
  widthLeft_53 = params.widthLeft{53};
else
  error 'could not find widthLeft_53'
end
if isfield(params, 'widthLeft_54')
  widthLeft_54 = params.widthLeft_54;
elseif isfield(params, 'widthLeft')
  widthLeft_54 = params.widthLeft{54};
else
  error 'could not find widthLeft_54'
end
if isfield(params, 'widthLeft_55')
  widthLeft_55 = params.widthLeft_55;
elseif isfield(params, 'widthLeft')
  widthLeft_55 = params.widthLeft{55};
else
  error 'could not find widthLeft_55'
end
if isfield(params, 'widthLeft_56')
  widthLeft_56 = params.widthLeft_56;
elseif isfield(params, 'widthLeft')
  widthLeft_56 = params.widthLeft{56};
else
  error 'could not find widthLeft_56'
end
if isfield(params, 'widthLeft_57')
  widthLeft_57 = params.widthLeft_57;
elseif isfield(params, 'widthLeft')
  widthLeft_57 = params.widthLeft{57};
else
  error 'could not find widthLeft_57'
end
if isfield(params, 'widthLeft_58')
  widthLeft_58 = params.widthLeft_58;
elseif isfield(params, 'widthLeft')
  widthLeft_58 = params.widthLeft{58};
else
  error 'could not find widthLeft_58'
end
if isfield(params, 'widthLeft_59')
  widthLeft_59 = params.widthLeft_59;
elseif isfield(params, 'widthLeft')
  widthLeft_59 = params.widthLeft{59};
else
  error 'could not find widthLeft_59'
end
if isfield(params, 'widthLeft_60')
  widthLeft_60 = params.widthLeft_60;
elseif isfield(params, 'widthLeft')
  widthLeft_60 = params.widthLeft{60};
else
  error 'could not find widthLeft_60'
end
if isfield(params, 'widthLeft_61')
  widthLeft_61 = params.widthLeft_61;
elseif isfield(params, 'widthLeft')
  widthLeft_61 = params.widthLeft{61};
else
  error 'could not find widthLeft_61'
end
if isfield(params, 'widthLeft_62')
  widthLeft_62 = params.widthLeft_62;
elseif isfield(params, 'widthLeft')
  widthLeft_62 = params.widthLeft{62};
else
  error 'could not find widthLeft_62'
end
if isfield(params, 'widthLeft_63')
  widthLeft_63 = params.widthLeft_63;
elseif isfield(params, 'widthLeft')
  widthLeft_63 = params.widthLeft{63};
else
  error 'could not find widthLeft_63'
end
if isfield(params, 'widthLeft_64')
  widthLeft_64 = params.widthLeft_64;
elseif isfield(params, 'widthLeft')
  widthLeft_64 = params.widthLeft{64};
else
  error 'could not find widthLeft_64'
end
if isfield(params, 'widthLeft_65')
  widthLeft_65 = params.widthLeft_65;
elseif isfield(params, 'widthLeft')
  widthLeft_65 = params.widthLeft{65};
else
  error 'could not find widthLeft_65'
end
if isfield(params, 'widthLeft_66')
  widthLeft_66 = params.widthLeft_66;
elseif isfield(params, 'widthLeft')
  widthLeft_66 = params.widthLeft{66};
else
  error 'could not find widthLeft_66'
end
if isfield(params, 'widthLeft_67')
  widthLeft_67 = params.widthLeft_67;
elseif isfield(params, 'widthLeft')
  widthLeft_67 = params.widthLeft{67};
else
  error 'could not find widthLeft_67'
end
if isfield(params, 'widthLeft_68')
  widthLeft_68 = params.widthLeft_68;
elseif isfield(params, 'widthLeft')
  widthLeft_68 = params.widthLeft{68};
else
  error 'could not find widthLeft_68'
end
if isfield(params, 'widthLeft_69')
  widthLeft_69 = params.widthLeft_69;
elseif isfield(params, 'widthLeft')
  widthLeft_69 = params.widthLeft{69};
else
  error 'could not find widthLeft_69'
end
if isfield(params, 'widthLeft_70')
  widthLeft_70 = params.widthLeft_70;
elseif isfield(params, 'widthLeft')
  widthLeft_70 = params.widthLeft{70};
else
  error 'could not find widthLeft_70'
end
if isfield(params, 'widthLeft_71')
  widthLeft_71 = params.widthLeft_71;
elseif isfield(params, 'widthLeft')
  widthLeft_71 = params.widthLeft{71};
else
  error 'could not find widthLeft_71'
end
if isfield(params, 'widthLeft_72')
  widthLeft_72 = params.widthLeft_72;
elseif isfield(params, 'widthLeft')
  widthLeft_72 = params.widthLeft{72};
else
  error 'could not find widthLeft_72'
end
if isfield(params, 'widthLeft_73')
  widthLeft_73 = params.widthLeft_73;
elseif isfield(params, 'widthLeft')
  widthLeft_73 = params.widthLeft{73};
else
  error 'could not find widthLeft_73'
end
if isfield(params, 'widthLeft_74')
  widthLeft_74 = params.widthLeft_74;
elseif isfield(params, 'widthLeft')
  widthLeft_74 = params.widthLeft{74};
else
  error 'could not find widthLeft_74'
end
if isfield(params, 'widthLeft_75')
  widthLeft_75 = params.widthLeft_75;
elseif isfield(params, 'widthLeft')
  widthLeft_75 = params.widthLeft{75};
else
  error 'could not find widthLeft_75'
end
if isfield(params, 'widthLeft_76')
  widthLeft_76 = params.widthLeft_76;
elseif isfield(params, 'widthLeft')
  widthLeft_76 = params.widthLeft{76};
else
  error 'could not find widthLeft_76'
end
if isfield(params, 'widthLeft_77')
  widthLeft_77 = params.widthLeft_77;
elseif isfield(params, 'widthLeft')
  widthLeft_77 = params.widthLeft{77};
else
  error 'could not find widthLeft_77'
end
if isfield(params, 'widthLeft_78')
  widthLeft_78 = params.widthLeft_78;
elseif isfield(params, 'widthLeft')
  widthLeft_78 = params.widthLeft{78};
else
  error 'could not find widthLeft_78'
end
if isfield(params, 'widthLeft_79')
  widthLeft_79 = params.widthLeft_79;
elseif isfield(params, 'widthLeft')
  widthLeft_79 = params.widthLeft{79};
else
  error 'could not find widthLeft_79'
end
if isfield(params, 'widthLeft_80')
  widthLeft_80 = params.widthLeft_80;
elseif isfield(params, 'widthLeft')
  widthLeft_80 = params.widthLeft{80};
else
  error 'could not find widthLeft_80'
end
if isfield(params, 'widthLeft_81')
  widthLeft_81 = params.widthLeft_81;
elseif isfield(params, 'widthLeft')
  widthLeft_81 = params.widthLeft{81};
else
  error 'could not find widthLeft_81'
end
if isfield(params, 'widthLeft_82')
  widthLeft_82 = params.widthLeft_82;
elseif isfield(params, 'widthLeft')
  widthLeft_82 = params.widthLeft{82};
else
  error 'could not find widthLeft_82'
end
if isfield(params, 'widthLeft_83')
  widthLeft_83 = params.widthLeft_83;
elseif isfield(params, 'widthLeft')
  widthLeft_83 = params.widthLeft{83};
else
  error 'could not find widthLeft_83'
end
if isfield(params, 'widthLeft_84')
  widthLeft_84 = params.widthLeft_84;
elseif isfield(params, 'widthLeft')
  widthLeft_84 = params.widthLeft{84};
else
  error 'could not find widthLeft_84'
end
if isfield(params, 'widthLeft_85')
  widthLeft_85 = params.widthLeft_85;
elseif isfield(params, 'widthLeft')
  widthLeft_85 = params.widthLeft{85};
else
  error 'could not find widthLeft_85'
end
if isfield(params, 'widthLeft_86')
  widthLeft_86 = params.widthLeft_86;
elseif isfield(params, 'widthLeft')
  widthLeft_86 = params.widthLeft{86};
else
  error 'could not find widthLeft_86'
end
if isfield(params, 'widthLeft_87')
  widthLeft_87 = params.widthLeft_87;
elseif isfield(params, 'widthLeft')
  widthLeft_87 = params.widthLeft{87};
else
  error 'could not find widthLeft_87'
end
if isfield(params, 'widthLeft_88')
  widthLeft_88 = params.widthLeft_88;
elseif isfield(params, 'widthLeft')
  widthLeft_88 = params.widthLeft{88};
else
  error 'could not find widthLeft_88'
end
if isfield(params, 'widthLeft_89')
  widthLeft_89 = params.widthLeft_89;
elseif isfield(params, 'widthLeft')
  widthLeft_89 = params.widthLeft{89};
else
  error 'could not find widthLeft_89'
end
if isfield(params, 'widthLeft_90')
  widthLeft_90 = params.widthLeft_90;
elseif isfield(params, 'widthLeft')
  widthLeft_90 = params.widthLeft{90};
else
  error 'could not find widthLeft_90'
end
if isfield(params, 'widthLeft_91')
  widthLeft_91 = params.widthLeft_91;
elseif isfield(params, 'widthLeft')
  widthLeft_91 = params.widthLeft{91};
else
  error 'could not find widthLeft_91'
end
if isfield(params, 'widthLeft_92')
  widthLeft_92 = params.widthLeft_92;
elseif isfield(params, 'widthLeft')
  widthLeft_92 = params.widthLeft{92};
else
  error 'could not find widthLeft_92'
end
if isfield(params, 'widthLeft_93')
  widthLeft_93 = params.widthLeft_93;
elseif isfield(params, 'widthLeft')
  widthLeft_93 = params.widthLeft{93};
else
  error 'could not find widthLeft_93'
end
if isfield(params, 'widthLeft_94')
  widthLeft_94 = params.widthLeft_94;
elseif isfield(params, 'widthLeft')
  widthLeft_94 = params.widthLeft{94};
else
  error 'could not find widthLeft_94'
end
if isfield(params, 'widthLeft_95')
  widthLeft_95 = params.widthLeft_95;
elseif isfield(params, 'widthLeft')
  widthLeft_95 = params.widthLeft{95};
else
  error 'could not find widthLeft_95'
end
if isfield(params, 'widthRight_1')
  widthRight_1 = params.widthRight_1;
elseif isfield(params, 'widthRight')
  widthRight_1 = params.widthRight{1};
else
  error 'could not find widthRight_1'
end
if isfield(params, 'widthRight_2')
  widthRight_2 = params.widthRight_2;
elseif isfield(params, 'widthRight')
  widthRight_2 = params.widthRight{2};
else
  error 'could not find widthRight_2'
end
if isfield(params, 'widthRight_3')
  widthRight_3 = params.widthRight_3;
elseif isfield(params, 'widthRight')
  widthRight_3 = params.widthRight{3};
else
  error 'could not find widthRight_3'
end
if isfield(params, 'widthRight_4')
  widthRight_4 = params.widthRight_4;
elseif isfield(params, 'widthRight')
  widthRight_4 = params.widthRight{4};
else
  error 'could not find widthRight_4'
end
if isfield(params, 'widthRight_5')
  widthRight_5 = params.widthRight_5;
elseif isfield(params, 'widthRight')
  widthRight_5 = params.widthRight{5};
else
  error 'could not find widthRight_5'
end
if isfield(params, 'widthRight_6')
  widthRight_6 = params.widthRight_6;
elseif isfield(params, 'widthRight')
  widthRight_6 = params.widthRight{6};
else
  error 'could not find widthRight_6'
end
if isfield(params, 'widthRight_7')
  widthRight_7 = params.widthRight_7;
elseif isfield(params, 'widthRight')
  widthRight_7 = params.widthRight{7};
else
  error 'could not find widthRight_7'
end
if isfield(params, 'widthRight_8')
  widthRight_8 = params.widthRight_8;
elseif isfield(params, 'widthRight')
  widthRight_8 = params.widthRight{8};
else
  error 'could not find widthRight_8'
end
if isfield(params, 'widthRight_9')
  widthRight_9 = params.widthRight_9;
elseif isfield(params, 'widthRight')
  widthRight_9 = params.widthRight{9};
else
  error 'could not find widthRight_9'
end
if isfield(params, 'widthRight_10')
  widthRight_10 = params.widthRight_10;
elseif isfield(params, 'widthRight')
  widthRight_10 = params.widthRight{10};
else
  error 'could not find widthRight_10'
end
if isfield(params, 'widthRight_11')
  widthRight_11 = params.widthRight_11;
elseif isfield(params, 'widthRight')
  widthRight_11 = params.widthRight{11};
else
  error 'could not find widthRight_11'
end
if isfield(params, 'widthRight_12')
  widthRight_12 = params.widthRight_12;
elseif isfield(params, 'widthRight')
  widthRight_12 = params.widthRight{12};
else
  error 'could not find widthRight_12'
end
if isfield(params, 'widthRight_13')
  widthRight_13 = params.widthRight_13;
elseif isfield(params, 'widthRight')
  widthRight_13 = params.widthRight{13};
else
  error 'could not find widthRight_13'
end
if isfield(params, 'widthRight_14')
  widthRight_14 = params.widthRight_14;
elseif isfield(params, 'widthRight')
  widthRight_14 = params.widthRight{14};
else
  error 'could not find widthRight_14'
end
if isfield(params, 'widthRight_15')
  widthRight_15 = params.widthRight_15;
elseif isfield(params, 'widthRight')
  widthRight_15 = params.widthRight{15};
else
  error 'could not find widthRight_15'
end
if isfield(params, 'widthRight_16')
  widthRight_16 = params.widthRight_16;
elseif isfield(params, 'widthRight')
  widthRight_16 = params.widthRight{16};
else
  error 'could not find widthRight_16'
end
if isfield(params, 'widthRight_17')
  widthRight_17 = params.widthRight_17;
elseif isfield(params, 'widthRight')
  widthRight_17 = params.widthRight{17};
else
  error 'could not find widthRight_17'
end
if isfield(params, 'widthRight_18')
  widthRight_18 = params.widthRight_18;
elseif isfield(params, 'widthRight')
  widthRight_18 = params.widthRight{18};
else
  error 'could not find widthRight_18'
end
if isfield(params, 'widthRight_19')
  widthRight_19 = params.widthRight_19;
elseif isfield(params, 'widthRight')
  widthRight_19 = params.widthRight{19};
else
  error 'could not find widthRight_19'
end
if isfield(params, 'widthRight_20')
  widthRight_20 = params.widthRight_20;
elseif isfield(params, 'widthRight')
  widthRight_20 = params.widthRight{20};
else
  error 'could not find widthRight_20'
end
if isfield(params, 'widthRight_21')
  widthRight_21 = params.widthRight_21;
elseif isfield(params, 'widthRight')
  widthRight_21 = params.widthRight{21};
else
  error 'could not find widthRight_21'
end
if isfield(params, 'widthRight_22')
  widthRight_22 = params.widthRight_22;
elseif isfield(params, 'widthRight')
  widthRight_22 = params.widthRight{22};
else
  error 'could not find widthRight_22'
end
if isfield(params, 'widthRight_23')
  widthRight_23 = params.widthRight_23;
elseif isfield(params, 'widthRight')
  widthRight_23 = params.widthRight{23};
else
  error 'could not find widthRight_23'
end
if isfield(params, 'widthRight_24')
  widthRight_24 = params.widthRight_24;
elseif isfield(params, 'widthRight')
  widthRight_24 = params.widthRight{24};
else
  error 'could not find widthRight_24'
end
if isfield(params, 'widthRight_25')
  widthRight_25 = params.widthRight_25;
elseif isfield(params, 'widthRight')
  widthRight_25 = params.widthRight{25};
else
  error 'could not find widthRight_25'
end
if isfield(params, 'widthRight_26')
  widthRight_26 = params.widthRight_26;
elseif isfield(params, 'widthRight')
  widthRight_26 = params.widthRight{26};
else
  error 'could not find widthRight_26'
end
if isfield(params, 'widthRight_27')
  widthRight_27 = params.widthRight_27;
elseif isfield(params, 'widthRight')
  widthRight_27 = params.widthRight{27};
else
  error 'could not find widthRight_27'
end
if isfield(params, 'widthRight_28')
  widthRight_28 = params.widthRight_28;
elseif isfield(params, 'widthRight')
  widthRight_28 = params.widthRight{28};
else
  error 'could not find widthRight_28'
end
if isfield(params, 'widthRight_29')
  widthRight_29 = params.widthRight_29;
elseif isfield(params, 'widthRight')
  widthRight_29 = params.widthRight{29};
else
  error 'could not find widthRight_29'
end
if isfield(params, 'widthRight_30')
  widthRight_30 = params.widthRight_30;
elseif isfield(params, 'widthRight')
  widthRight_30 = params.widthRight{30};
else
  error 'could not find widthRight_30'
end
if isfield(params, 'widthRight_31')
  widthRight_31 = params.widthRight_31;
elseif isfield(params, 'widthRight')
  widthRight_31 = params.widthRight{31};
else
  error 'could not find widthRight_31'
end
if isfield(params, 'widthRight_32')
  widthRight_32 = params.widthRight_32;
elseif isfield(params, 'widthRight')
  widthRight_32 = params.widthRight{32};
else
  error 'could not find widthRight_32'
end
if isfield(params, 'widthRight_33')
  widthRight_33 = params.widthRight_33;
elseif isfield(params, 'widthRight')
  widthRight_33 = params.widthRight{33};
else
  error 'could not find widthRight_33'
end
if isfield(params, 'widthRight_34')
  widthRight_34 = params.widthRight_34;
elseif isfield(params, 'widthRight')
  widthRight_34 = params.widthRight{34};
else
  error 'could not find widthRight_34'
end
if isfield(params, 'widthRight_35')
  widthRight_35 = params.widthRight_35;
elseif isfield(params, 'widthRight')
  widthRight_35 = params.widthRight{35};
else
  error 'could not find widthRight_35'
end
if isfield(params, 'widthRight_36')
  widthRight_36 = params.widthRight_36;
elseif isfield(params, 'widthRight')
  widthRight_36 = params.widthRight{36};
else
  error 'could not find widthRight_36'
end
if isfield(params, 'widthRight_37')
  widthRight_37 = params.widthRight_37;
elseif isfield(params, 'widthRight')
  widthRight_37 = params.widthRight{37};
else
  error 'could not find widthRight_37'
end
if isfield(params, 'widthRight_38')
  widthRight_38 = params.widthRight_38;
elseif isfield(params, 'widthRight')
  widthRight_38 = params.widthRight{38};
else
  error 'could not find widthRight_38'
end
if isfield(params, 'widthRight_39')
  widthRight_39 = params.widthRight_39;
elseif isfield(params, 'widthRight')
  widthRight_39 = params.widthRight{39};
else
  error 'could not find widthRight_39'
end
if isfield(params, 'widthRight_40')
  widthRight_40 = params.widthRight_40;
elseif isfield(params, 'widthRight')
  widthRight_40 = params.widthRight{40};
else
  error 'could not find widthRight_40'
end
if isfield(params, 'widthRight_41')
  widthRight_41 = params.widthRight_41;
elseif isfield(params, 'widthRight')
  widthRight_41 = params.widthRight{41};
else
  error 'could not find widthRight_41'
end
if isfield(params, 'widthRight_42')
  widthRight_42 = params.widthRight_42;
elseif isfield(params, 'widthRight')
  widthRight_42 = params.widthRight{42};
else
  error 'could not find widthRight_42'
end
if isfield(params, 'widthRight_43')
  widthRight_43 = params.widthRight_43;
elseif isfield(params, 'widthRight')
  widthRight_43 = params.widthRight{43};
else
  error 'could not find widthRight_43'
end
if isfield(params, 'widthRight_44')
  widthRight_44 = params.widthRight_44;
elseif isfield(params, 'widthRight')
  widthRight_44 = params.widthRight{44};
else
  error 'could not find widthRight_44'
end
if isfield(params, 'widthRight_45')
  widthRight_45 = params.widthRight_45;
elseif isfield(params, 'widthRight')
  widthRight_45 = params.widthRight{45};
else
  error 'could not find widthRight_45'
end
if isfield(params, 'widthRight_46')
  widthRight_46 = params.widthRight_46;
elseif isfield(params, 'widthRight')
  widthRight_46 = params.widthRight{46};
else
  error 'could not find widthRight_46'
end
if isfield(params, 'widthRight_47')
  widthRight_47 = params.widthRight_47;
elseif isfield(params, 'widthRight')
  widthRight_47 = params.widthRight{47};
else
  error 'could not find widthRight_47'
end
if isfield(params, 'widthRight_48')
  widthRight_48 = params.widthRight_48;
elseif isfield(params, 'widthRight')
  widthRight_48 = params.widthRight{48};
else
  error 'could not find widthRight_48'
end
if isfield(params, 'widthRight_49')
  widthRight_49 = params.widthRight_49;
elseif isfield(params, 'widthRight')
  widthRight_49 = params.widthRight{49};
else
  error 'could not find widthRight_49'
end
if isfield(params, 'widthRight_50')
  widthRight_50 = params.widthRight_50;
elseif isfield(params, 'widthRight')
  widthRight_50 = params.widthRight{50};
else
  error 'could not find widthRight_50'
end
if isfield(params, 'widthRight_51')
  widthRight_51 = params.widthRight_51;
elseif isfield(params, 'widthRight')
  widthRight_51 = params.widthRight{51};
else
  error 'could not find widthRight_51'
end
if isfield(params, 'widthRight_52')
  widthRight_52 = params.widthRight_52;
elseif isfield(params, 'widthRight')
  widthRight_52 = params.widthRight{52};
else
  error 'could not find widthRight_52'
end
if isfield(params, 'widthRight_53')
  widthRight_53 = params.widthRight_53;
elseif isfield(params, 'widthRight')
  widthRight_53 = params.widthRight{53};
else
  error 'could not find widthRight_53'
end
if isfield(params, 'widthRight_54')
  widthRight_54 = params.widthRight_54;
elseif isfield(params, 'widthRight')
  widthRight_54 = params.widthRight{54};
else
  error 'could not find widthRight_54'
end
if isfield(params, 'widthRight_55')
  widthRight_55 = params.widthRight_55;
elseif isfield(params, 'widthRight')
  widthRight_55 = params.widthRight{55};
else
  error 'could not find widthRight_55'
end
if isfield(params, 'widthRight_56')
  widthRight_56 = params.widthRight_56;
elseif isfield(params, 'widthRight')
  widthRight_56 = params.widthRight{56};
else
  error 'could not find widthRight_56'
end
if isfield(params, 'widthRight_57')
  widthRight_57 = params.widthRight_57;
elseif isfield(params, 'widthRight')
  widthRight_57 = params.widthRight{57};
else
  error 'could not find widthRight_57'
end
if isfield(params, 'widthRight_58')
  widthRight_58 = params.widthRight_58;
elseif isfield(params, 'widthRight')
  widthRight_58 = params.widthRight{58};
else
  error 'could not find widthRight_58'
end
if isfield(params, 'widthRight_59')
  widthRight_59 = params.widthRight_59;
elseif isfield(params, 'widthRight')
  widthRight_59 = params.widthRight{59};
else
  error 'could not find widthRight_59'
end
if isfield(params, 'widthRight_60')
  widthRight_60 = params.widthRight_60;
elseif isfield(params, 'widthRight')
  widthRight_60 = params.widthRight{60};
else
  error 'could not find widthRight_60'
end
if isfield(params, 'widthRight_61')
  widthRight_61 = params.widthRight_61;
elseif isfield(params, 'widthRight')
  widthRight_61 = params.widthRight{61};
else
  error 'could not find widthRight_61'
end
if isfield(params, 'widthRight_62')
  widthRight_62 = params.widthRight_62;
elseif isfield(params, 'widthRight')
  widthRight_62 = params.widthRight{62};
else
  error 'could not find widthRight_62'
end
if isfield(params, 'widthRight_63')
  widthRight_63 = params.widthRight_63;
elseif isfield(params, 'widthRight')
  widthRight_63 = params.widthRight{63};
else
  error 'could not find widthRight_63'
end
if isfield(params, 'widthRight_64')
  widthRight_64 = params.widthRight_64;
elseif isfield(params, 'widthRight')
  widthRight_64 = params.widthRight{64};
else
  error 'could not find widthRight_64'
end
if isfield(params, 'widthRight_65')
  widthRight_65 = params.widthRight_65;
elseif isfield(params, 'widthRight')
  widthRight_65 = params.widthRight{65};
else
  error 'could not find widthRight_65'
end
if isfield(params, 'widthRight_66')
  widthRight_66 = params.widthRight_66;
elseif isfield(params, 'widthRight')
  widthRight_66 = params.widthRight{66};
else
  error 'could not find widthRight_66'
end
if isfield(params, 'widthRight_67')
  widthRight_67 = params.widthRight_67;
elseif isfield(params, 'widthRight')
  widthRight_67 = params.widthRight{67};
else
  error 'could not find widthRight_67'
end
if isfield(params, 'widthRight_68')
  widthRight_68 = params.widthRight_68;
elseif isfield(params, 'widthRight')
  widthRight_68 = params.widthRight{68};
else
  error 'could not find widthRight_68'
end
if isfield(params, 'widthRight_69')
  widthRight_69 = params.widthRight_69;
elseif isfield(params, 'widthRight')
  widthRight_69 = params.widthRight{69};
else
  error 'could not find widthRight_69'
end
if isfield(params, 'widthRight_70')
  widthRight_70 = params.widthRight_70;
elseif isfield(params, 'widthRight')
  widthRight_70 = params.widthRight{70};
else
  error 'could not find widthRight_70'
end
if isfield(params, 'widthRight_71')
  widthRight_71 = params.widthRight_71;
elseif isfield(params, 'widthRight')
  widthRight_71 = params.widthRight{71};
else
  error 'could not find widthRight_71'
end
if isfield(params, 'widthRight_72')
  widthRight_72 = params.widthRight_72;
elseif isfield(params, 'widthRight')
  widthRight_72 = params.widthRight{72};
else
  error 'could not find widthRight_72'
end
if isfield(params, 'widthRight_73')
  widthRight_73 = params.widthRight_73;
elseif isfield(params, 'widthRight')
  widthRight_73 = params.widthRight{73};
else
  error 'could not find widthRight_73'
end
if isfield(params, 'widthRight_74')
  widthRight_74 = params.widthRight_74;
elseif isfield(params, 'widthRight')
  widthRight_74 = params.widthRight{74};
else
  error 'could not find widthRight_74'
end
if isfield(params, 'widthRight_75')
  widthRight_75 = params.widthRight_75;
elseif isfield(params, 'widthRight')
  widthRight_75 = params.widthRight{75};
else
  error 'could not find widthRight_75'
end
if isfield(params, 'widthRight_76')
  widthRight_76 = params.widthRight_76;
elseif isfield(params, 'widthRight')
  widthRight_76 = params.widthRight{76};
else
  error 'could not find widthRight_76'
end
if isfield(params, 'widthRight_77')
  widthRight_77 = params.widthRight_77;
elseif isfield(params, 'widthRight')
  widthRight_77 = params.widthRight{77};
else
  error 'could not find widthRight_77'
end
if isfield(params, 'widthRight_78')
  widthRight_78 = params.widthRight_78;
elseif isfield(params, 'widthRight')
  widthRight_78 = params.widthRight{78};
else
  error 'could not find widthRight_78'
end
if isfield(params, 'widthRight_79')
  widthRight_79 = params.widthRight_79;
elseif isfield(params, 'widthRight')
  widthRight_79 = params.widthRight{79};
else
  error 'could not find widthRight_79'
end
if isfield(params, 'widthRight_80')
  widthRight_80 = params.widthRight_80;
elseif isfield(params, 'widthRight')
  widthRight_80 = params.widthRight{80};
else
  error 'could not find widthRight_80'
end
if isfield(params, 'widthRight_81')
  widthRight_81 = params.widthRight_81;
elseif isfield(params, 'widthRight')
  widthRight_81 = params.widthRight{81};
else
  error 'could not find widthRight_81'
end
if isfield(params, 'widthRight_82')
  widthRight_82 = params.widthRight_82;
elseif isfield(params, 'widthRight')
  widthRight_82 = params.widthRight{82};
else
  error 'could not find widthRight_82'
end
if isfield(params, 'widthRight_83')
  widthRight_83 = params.widthRight_83;
elseif isfield(params, 'widthRight')
  widthRight_83 = params.widthRight{83};
else
  error 'could not find widthRight_83'
end
if isfield(params, 'widthRight_84')
  widthRight_84 = params.widthRight_84;
elseif isfield(params, 'widthRight')
  widthRight_84 = params.widthRight{84};
else
  error 'could not find widthRight_84'
end
if isfield(params, 'widthRight_85')
  widthRight_85 = params.widthRight_85;
elseif isfield(params, 'widthRight')
  widthRight_85 = params.widthRight{85};
else
  error 'could not find widthRight_85'
end
if isfield(params, 'widthRight_86')
  widthRight_86 = params.widthRight_86;
elseif isfield(params, 'widthRight')
  widthRight_86 = params.widthRight{86};
else
  error 'could not find widthRight_86'
end
if isfield(params, 'widthRight_87')
  widthRight_87 = params.widthRight_87;
elseif isfield(params, 'widthRight')
  widthRight_87 = params.widthRight{87};
else
  error 'could not find widthRight_87'
end
if isfield(params, 'widthRight_88')
  widthRight_88 = params.widthRight_88;
elseif isfield(params, 'widthRight')
  widthRight_88 = params.widthRight{88};
else
  error 'could not find widthRight_88'
end
if isfield(params, 'widthRight_89')
  widthRight_89 = params.widthRight_89;
elseif isfield(params, 'widthRight')
  widthRight_89 = params.widthRight{89};
else
  error 'could not find widthRight_89'
end
if isfield(params, 'widthRight_90')
  widthRight_90 = params.widthRight_90;
elseif isfield(params, 'widthRight')
  widthRight_90 = params.widthRight{90};
else
  error 'could not find widthRight_90'
end
if isfield(params, 'widthRight_91')
  widthRight_91 = params.widthRight_91;
elseif isfield(params, 'widthRight')
  widthRight_91 = params.widthRight{91};
else
  error 'could not find widthRight_91'
end
if isfield(params, 'widthRight_92')
  widthRight_92 = params.widthRight_92;
elseif isfield(params, 'widthRight')
  widthRight_92 = params.widthRight{92};
else
  error 'could not find widthRight_92'
end
if isfield(params, 'widthRight_93')
  widthRight_93 = params.widthRight_93;
elseif isfield(params, 'widthRight')
  widthRight_93 = params.widthRight{93};
else
  error 'could not find widthRight_93'
end
if isfield(params, 'widthRight_94')
  widthRight_94 = params.widthRight_94;
elseif isfield(params, 'widthRight')
  widthRight_94 = params.widthRight{94};
else
  error 'could not find widthRight_94'
end
if isfield(params, 'widthRight_95')
  widthRight_95 = params.widthRight_95;
elseif isfield(params, 'widthRight')
  widthRight_95 = params.widthRight{95};
else
  error 'could not find widthRight_95'
end
x_0 = params.x_0;
cvx_begin
  % Caution: automatically generated by cvxgen. May be incorrect.
  variable x_2(4, 1);
  variable x_1(4, 1);
  variable x_3(4, 1);
  variable x_4(4, 1);
  variable x_5(4, 1);
  variable x_6(4, 1);
  variable x_7(4, 1);
  variable x_8(4, 1);
  variable x_9(4, 1);
  variable x_10(4, 1);
  variable x_11(4, 1);
  variable x_12(4, 1);
  variable x_13(4, 1);
  variable x_14(4, 1);
  variable x_15(4, 1);
  variable x_16(4, 1);
  variable x_17(4, 1);
  variable x_18(4, 1);
  variable x_19(4, 1);
  variable x_20(4, 1);
  variable x_21(4, 1);
  variable x_22(4, 1);
  variable x_23(4, 1);
  variable x_24(4, 1);
  variable x_25(4, 1);
  variable x_26(4, 1);
  variable x_27(4, 1);
  variable x_28(4, 1);
  variable x_29(4, 1);
  variable x_30(4, 1);
  variable x_31(4, 1);
  variable x_32(4, 1);
  variable x_33(4, 1);
  variable x_34(4, 1);
  variable x_35(4, 1);
  variable x_36(4, 1);
  variable x_37(4, 1);
  variable x_38(4, 1);
  variable x_39(4, 1);
  variable x_40(4, 1);
  variable x_41(4, 1);
  variable x_42(4, 1);
  variable x_43(4, 1);
  variable x_44(4, 1);
  variable x_45(4, 1);
  variable x_46(4, 1);
  variable x_47(4, 1);
  variable x_48(4, 1);
  variable x_49(4, 1);
  variable x_50(4, 1);
  variable x_51(4, 1);
  variable x_52(4, 1);
  variable x_53(4, 1);
  variable x_54(4, 1);
  variable x_55(4, 1);
  variable x_56(4, 1);
  variable x_57(4, 1);
  variable x_58(4, 1);
  variable x_59(4, 1);
  variable x_60(4, 1);
  variable x_61(4, 1);
  variable x_62(4, 1);
  variable x_63(4, 1);
  variable x_64(4, 1);
  variable x_65(4, 1);
  variable x_66(4, 1);
  variable x_67(4, 1);
  variable x_68(4, 1);
  variable x_69(4, 1);
  variable x_70(4, 1);
  variable x_71(4, 1);
  variable x_72(4, 1);
  variable x_73(4, 1);
  variable x_74(4, 1);
  variable x_75(4, 1);
  variable x_76(4, 1);
  variable x_77(4, 1);
  variable x_78(4, 1);
  variable x_79(4, 1);
  variable x_80(4, 1);
  variable x_81(4, 1);
  variable x_82(4, 1);
  variable x_83(4, 1);
  variable x_84(4, 1);
  variable x_85(4, 1);
  variable x_86(4, 1);
  variable x_87(4, 1);
  variable x_88(4, 1);
  variable x_89(4, 1);
  variable x_90(4, 1);
  variable x_91(4, 1);
  variable x_92(4, 1);
  variable x_93(4, 1);
  variable x_94(4, 1);
  variable x_95(4, 1);
  variable delta_2;
  variable delta_1;
  variable delta_3;
  variable delta_4;
  variable delta_5;
  variable delta_6;
  variable delta_7;
  variable delta_8;
  variable delta_9;
  variable delta_10;
  variable delta_11;
  variable delta_12;
  variable delta_13;
  variable delta_14;
  variable delta_15;
  variable delta_16;
  variable delta_17;
  variable delta_18;
  variable delta_19;
  variable delta_20;
  variable delta_21;
  variable delta_22;
  variable delta_23;
  variable delta_24;
  variable delta_25;
  variable delta_26;
  variable delta_27;
  variable delta_28;
  variable delta_29;
  variable delta_30;
  variable delta_31;
  variable delta_32;
  variable delta_33;
  variable delta_34;
  variable delta_35;
  variable delta_36;
  variable delta_37;
  variable delta_38;
  variable delta_39;
  variable delta_40;
  variable delta_41;
  variable delta_42;
  variable delta_43;
  variable delta_44;
  variable delta_45;
  variable delta_46;
  variable delta_47;
  variable delta_48;
  variable delta_49;
  variable delta_50;
  variable delta_51;
  variable delta_52;
  variable delta_53;
  variable delta_54;
  variable delta_55;
  variable delta_56;
  variable delta_57;
  variable delta_58;
  variable delta_59;
  variable delta_60;
  variable delta_61;
  variable delta_62;
  variable delta_63;
  variable delta_64;
  variable delta_65;
  variable delta_66;
  variable delta_67;
  variable delta_68;
  variable delta_69;
  variable delta_70;
  variable delta_71;
  variable delta_72;
  variable delta_73;
  variable delta_74;
  variable delta_75;
  variable delta_76;
  variable delta_77;
  variable delta_78;
  variable delta_79;
  variable delta_80;
  variable delta_81;
  variable delta_82;
  variable delta_83;
  variable delta_84;
  variable delta_85;
  variable delta_86;
  variable delta_87;
  variable delta_88;
  variable delta_89;
  variable delta_90;
  variable delta_91;
  variable delta_92;
  variable delta_93;
  variable delta_94;
  variable delta_95;

  minimize(quad_form((1/ds_1)*(psiR_2 - psiR_1 + x_2(2) - x_1(2)), W_psi) + quad_form((1/ds_2)*(psiR_3 - psiR_2 + x_3(2) - x_2(2)), W_psi) + quad_form((1/ds_3)*(psiR_4 - psiR_3 + x_4(2) - x_3(2)), W_psi) + quad_form((1/ds_4)*(psiR_5 - psiR_4 + x_5(2) - x_4(2)), W_psi) + quad_form((1/ds_5)*(psiR_6 - psiR_5 + x_6(2) - x_5(2)), W_psi) + quad_form((1/ds_6)*(psiR_7 - psiR_6 + x_7(2) - x_6(2)), W_psi) + quad_form((1/ds_7)*(psiR_8 - psiR_7 + x_8(2) - x_7(2)), W_psi) + quad_form((1/ds_8)*(psiR_9 - psiR_8 + x_9(2) - x_8(2)), W_psi) + quad_form((1/ds_9)*(psiR_10 - psiR_9 + x_10(2) - x_9(2)), W_psi) + quad_form((1/ds_10)*(psiR_11 - psiR_10 + x_11(2) - x_10(2)), W_psi) + quad_form((1/ds_11)*(psiR_12 - psiR_11 + x_12(2) - x_11(2)), W_psi) + quad_form((1/ds_12)*(psiR_13 - psiR_12 + x_13(2) - x_12(2)), W_psi) + quad_form((1/ds_13)*(psiR_14 - psiR_13 + x_14(2) - x_13(2)), W_psi) + quad_form((1/ds_14)*(psiR_15 - psiR_14 + x_15(2) - x_14(2)), W_psi) + quad_form((1/ds_15)*(psiR_16 - psiR_15 + x_16(2) - x_15(2)), W_psi) + quad_form((1/ds_16)*(psiR_17 - psiR_16 + x_17(2) - x_16(2)), W_psi) + quad_form((1/ds_17)*(psiR_18 - psiR_17 + x_18(2) - x_17(2)), W_psi) + quad_form((1/ds_18)*(psiR_19 - psiR_18 + x_19(2) - x_18(2)), W_psi) + quad_form((1/ds_19)*(psiR_20 - psiR_19 + x_20(2) - x_19(2)), W_psi) + quad_form((1/ds_20)*(psiR_21 - psiR_20 + x_21(2) - x_20(2)), W_psi) + quad_form((1/ds_21)*(psiR_22 - psiR_21 + x_22(2) - x_21(2)), W_psi) + quad_form((1/ds_22)*(psiR_23 - psiR_22 + x_23(2) - x_22(2)), W_psi) + quad_form((1/ds_23)*(psiR_24 - psiR_23 + x_24(2) - x_23(2)), W_psi) + quad_form((1/ds_24)*(psiR_25 - psiR_24 + x_25(2) - x_24(2)), W_psi) + quad_form((1/ds_25)*(psiR_26 - psiR_25 + x_26(2) - x_25(2)), W_psi) + quad_form((1/ds_26)*(psiR_27 - psiR_26 + x_27(2) - x_26(2)), W_psi) + quad_form((1/ds_27)*(psiR_28 - psiR_27 + x_28(2) - x_27(2)), W_psi) + quad_form((1/ds_28)*(psiR_29 - psiR_28 + x_29(2) - x_28(2)), W_psi) + quad_form((1/ds_29)*(psiR_30 - psiR_29 + x_30(2) - x_29(2)), W_psi) + quad_form((1/ds_30)*(psiR_31 - psiR_30 + x_31(2) - x_30(2)), W_psi) + quad_form((1/ds_31)*(psiR_32 - psiR_31 + x_32(2) - x_31(2)), W_psi) + quad_form((1/ds_32)*(psiR_33 - psiR_32 + x_33(2) - x_32(2)), W_psi) + quad_form((1/ds_33)*(psiR_34 - psiR_33 + x_34(2) - x_33(2)), W_psi) + quad_form((1/ds_34)*(psiR_35 - psiR_34 + x_35(2) - x_34(2)), W_psi) + quad_form((1/ds_35)*(psiR_36 - psiR_35 + x_36(2) - x_35(2)), W_psi) + quad_form((1/ds_36)*(psiR_37 - psiR_36 + x_37(2) - x_36(2)), W_psi) + quad_form((1/ds_37)*(psiR_38 - psiR_37 + x_38(2) - x_37(2)), W_psi) + quad_form((1/ds_38)*(psiR_39 - psiR_38 + x_39(2) - x_38(2)), W_psi) + quad_form((1/ds_39)*(psiR_40 - psiR_39 + x_40(2) - x_39(2)), W_psi) + quad_form((1/ds_40)*(psiR_41 - psiR_40 + x_41(2) - x_40(2)), W_psi) + quad_form((1/ds_41)*(psiR_42 - psiR_41 + x_42(2) - x_41(2)), W_psi) + quad_form((1/ds_42)*(psiR_43 - psiR_42 + x_43(2) - x_42(2)), W_psi) + quad_form((1/ds_43)*(psiR_44 - psiR_43 + x_44(2) - x_43(2)), W_psi) + quad_form((1/ds_44)*(psiR_45 - psiR_44 + x_45(2) - x_44(2)), W_psi) + quad_form((1/ds_45)*(psiR_46 - psiR_45 + x_46(2) - x_45(2)), W_psi) + quad_form((1/ds_46)*(psiR_47 - psiR_46 + x_47(2) - x_46(2)), W_psi) + quad_form((1/ds_47)*(psiR_48 - psiR_47 + x_48(2) - x_47(2)), W_psi) + quad_form((1/ds_48)*(psiR_49 - psiR_48 + x_49(2) - x_48(2)), W_psi) + quad_form((1/ds_49)*(psiR_50 - psiR_49 + x_50(2) - x_49(2)), W_psi) + quad_form((1/ds_50)*(psiR_51 - psiR_50 + x_51(2) - x_50(2)), W_psi) + quad_form((1/ds_51)*(psiR_52 - psiR_51 + x_52(2) - x_51(2)), W_psi) + quad_form((1/ds_52)*(psiR_53 - psiR_52 + x_53(2) - x_52(2)), W_psi) + quad_form((1/ds_53)*(psiR_54 - psiR_53 + x_54(2) - x_53(2)), W_psi) + quad_form((1/ds_54)*(psiR_55 - psiR_54 + x_55(2) - x_54(2)), W_psi) + quad_form((1/ds_55)*(psiR_56 - psiR_55 + x_56(2) - x_55(2)), W_psi) + quad_form((1/ds_56)*(psiR_57 - psiR_56 + x_57(2) - x_56(2)), W_psi) + quad_form((1/ds_57)*(psiR_58 - psiR_57 + x_58(2) - x_57(2)), W_psi) + quad_form((1/ds_58)*(psiR_59 - psiR_58 + x_59(2) - x_58(2)), W_psi) + quad_form((1/ds_59)*(psiR_60 - psiR_59 + x_60(2) - x_59(2)), W_psi) + quad_form((1/ds_60)*(psiR_61 - psiR_60 + x_61(2) - x_60(2)), W_psi) + quad_form((1/ds_61)*(psiR_62 - psiR_61 + x_62(2) - x_61(2)), W_psi) + quad_form((1/ds_62)*(psiR_63 - psiR_62 + x_63(2) - x_62(2)), W_psi) + quad_form((1/ds_63)*(psiR_64 - psiR_63 + x_64(2) - x_63(2)), W_psi) + quad_form((1/ds_64)*(psiR_65 - psiR_64 + x_65(2) - x_64(2)), W_psi) + quad_form((1/ds_65)*(psiR_66 - psiR_65 + x_66(2) - x_65(2)), W_psi) + quad_form((1/ds_66)*(psiR_67 - psiR_66 + x_67(2) - x_66(2)), W_psi) + quad_form((1/ds_67)*(psiR_68 - psiR_67 + x_68(2) - x_67(2)), W_psi) + quad_form((1/ds_68)*(psiR_69 - psiR_68 + x_69(2) - x_68(2)), W_psi) + quad_form((1/ds_69)*(psiR_70 - psiR_69 + x_70(2) - x_69(2)), W_psi) + quad_form((1/ds_70)*(psiR_71 - psiR_70 + x_71(2) - x_70(2)), W_psi) + quad_form((1/ds_71)*(psiR_72 - psiR_71 + x_72(2) - x_71(2)), W_psi) + quad_form((1/ds_72)*(psiR_73 - psiR_72 + x_73(2) - x_72(2)), W_psi) + quad_form((1/ds_73)*(psiR_74 - psiR_73 + x_74(2) - x_73(2)), W_psi) + quad_form((1/ds_74)*(psiR_75 - psiR_74 + x_75(2) - x_74(2)), W_psi) + quad_form((1/ds_75)*(psiR_76 - psiR_75 + x_76(2) - x_75(2)), W_psi) + quad_form((1/ds_76)*(psiR_77 - psiR_76 + x_77(2) - x_76(2)), W_psi) + quad_form((1/ds_77)*(psiR_78 - psiR_77 + x_78(2) - x_77(2)), W_psi) + quad_form((1/ds_78)*(psiR_79 - psiR_78 + x_79(2) - x_78(2)), W_psi) + quad_form((1/ds_79)*(psiR_80 - psiR_79 + x_80(2) - x_79(2)), W_psi) + quad_form((1/ds_80)*(psiR_81 - psiR_80 + x_81(2) - x_80(2)), W_psi) + quad_form((1/ds_81)*(psiR_82 - psiR_81 + x_82(2) - x_81(2)), W_psi) + quad_form((1/ds_82)*(psiR_83 - psiR_82 + x_83(2) - x_82(2)), W_psi) + quad_form((1/ds_83)*(psiR_84 - psiR_83 + x_84(2) - x_83(2)), W_psi) + quad_form((1/ds_84)*(psiR_85 - psiR_84 + x_85(2) - x_84(2)), W_psi) + quad_form((1/ds_85)*(psiR_86 - psiR_85 + x_86(2) - x_85(2)), W_psi) + quad_form((1/ds_86)*(psiR_87 - psiR_86 + x_87(2) - x_86(2)), W_psi) + quad_form((1/ds_87)*(psiR_88 - psiR_87 + x_88(2) - x_87(2)), W_psi) + quad_form((1/ds_88)*(psiR_89 - psiR_88 + x_89(2) - x_88(2)), W_psi) + quad_form((1/ds_89)*(psiR_90 - psiR_89 + x_90(2) - x_89(2)), W_psi) + quad_form((1/ds_90)*(psiR_91 - psiR_90 + x_91(2) - x_90(2)), W_psi) + quad_form((1/ds_91)*(psiR_92 - psiR_91 + x_92(2) - x_91(2)), W_psi) + quad_form((1/ds_92)*(psiR_93 - psiR_92 + x_93(2) - x_92(2)), W_psi) + quad_form((1/ds_93)*(psiR_94 - psiR_93 + x_94(2) - x_93(2)), W_psi) + quad_form((1/ds_94)*(psiR_95 - psiR_94 + x_95(2) - x_94(2)), W_psi) + quad_form(delta_2 - delta_1, W_delta) + quad_form(delta_3 - delta_2, W_delta) + quad_form(delta_4 - delta_3, W_delta) + quad_form(delta_5 - delta_4, W_delta) + quad_form(delta_6 - delta_5, W_delta) + quad_form(delta_7 - delta_6, W_delta) + quad_form(delta_8 - delta_7, W_delta) + quad_form(delta_9 - delta_8, W_delta) + quad_form(delta_10 - delta_9, W_delta) + quad_form(delta_11 - delta_10, W_delta) + quad_form(delta_12 - delta_11, W_delta) + quad_form(delta_13 - delta_12, W_delta) + quad_form(delta_14 - delta_13, W_delta) + quad_form(delta_15 - delta_14, W_delta) + quad_form(delta_16 - delta_15, W_delta) + quad_form(delta_17 - delta_16, W_delta) + quad_form(delta_18 - delta_17, W_delta) + quad_form(delta_19 - delta_18, W_delta) + quad_form(delta_20 - delta_19, W_delta) + quad_form(delta_21 - delta_20, W_delta) + quad_form(delta_22 - delta_21, W_delta) + quad_form(delta_23 - delta_22, W_delta) + quad_form(delta_24 - delta_23, W_delta) + quad_form(delta_25 - delta_24, W_delta) + quad_form(delta_26 - delta_25, W_delta) + quad_form(delta_27 - delta_26, W_delta) + quad_form(delta_28 - delta_27, W_delta) + quad_form(delta_29 - delta_28, W_delta) + quad_form(delta_30 - delta_29, W_delta) + quad_form(delta_31 - delta_30, W_delta) + quad_form(delta_32 - delta_31, W_delta) + quad_form(delta_33 - delta_32, W_delta) + quad_form(delta_34 - delta_33, W_delta) + quad_form(delta_35 - delta_34, W_delta) + quad_form(delta_36 - delta_35, W_delta) + quad_form(delta_37 - delta_36, W_delta) + quad_form(delta_38 - delta_37, W_delta) + quad_form(delta_39 - delta_38, W_delta) + quad_form(delta_40 - delta_39, W_delta) + quad_form(delta_41 - delta_40, W_delta) + quad_form(delta_42 - delta_41, W_delta) + quad_form(delta_43 - delta_42, W_delta) + quad_form(delta_44 - delta_43, W_delta) + quad_form(delta_45 - delta_44, W_delta) + quad_form(delta_46 - delta_45, W_delta) + quad_form(delta_47 - delta_46, W_delta) + quad_form(delta_48 - delta_47, W_delta) + quad_form(delta_49 - delta_48, W_delta) + quad_form(delta_50 - delta_49, W_delta) + quad_form(delta_51 - delta_50, W_delta) + quad_form(delta_52 - delta_51, W_delta) + quad_form(delta_53 - delta_52, W_delta) + quad_form(delta_54 - delta_53, W_delta) + quad_form(delta_55 - delta_54, W_delta) + quad_form(delta_56 - delta_55, W_delta) + quad_form(delta_57 - delta_56, W_delta) + quad_form(delta_58 - delta_57, W_delta) + quad_form(delta_59 - delta_58, W_delta) + quad_form(delta_60 - delta_59, W_delta) + quad_form(delta_61 - delta_60, W_delta) + quad_form(delta_62 - delta_61, W_delta) + quad_form(delta_63 - delta_62, W_delta) + quad_form(delta_64 - delta_63, W_delta) + quad_form(delta_65 - delta_64, W_delta) + quad_form(delta_66 - delta_65, W_delta) + quad_form(delta_67 - delta_66, W_delta) + quad_form(delta_68 - delta_67, W_delta) + quad_form(delta_69 - delta_68, W_delta) + quad_form(delta_70 - delta_69, W_delta) + quad_form(delta_71 - delta_70, W_delta) + quad_form(delta_72 - delta_71, W_delta) + quad_form(delta_73 - delta_72, W_delta) + quad_form(delta_74 - delta_73, W_delta) + quad_form(delta_75 - delta_74, W_delta) + quad_form(delta_76 - delta_75, W_delta) + quad_form(delta_77 - delta_76, W_delta) + quad_form(delta_78 - delta_77, W_delta) + quad_form(delta_79 - delta_78, W_delta) + quad_form(delta_80 - delta_79, W_delta) + quad_form(delta_81 - delta_80, W_delta) + quad_form(delta_82 - delta_81, W_delta) + quad_form(delta_83 - delta_82, W_delta) + quad_form(delta_84 - delta_83, W_delta) + quad_form(delta_85 - delta_84, W_delta) + quad_form(delta_86 - delta_85, W_delta) + quad_form(delta_87 - delta_86, W_delta) + quad_form(delta_88 - delta_87, W_delta) + quad_form(delta_89 - delta_88, W_delta) + quad_form(delta_90 - delta_89, W_delta) + quad_form(delta_91 - delta_90, W_delta) + quad_form(delta_92 - delta_91, W_delta) + quad_form(delta_93 - delta_92, W_delta) + quad_form(delta_94 - delta_93, W_delta) + quad_form(delta_95 - delta_94, W_delta));
  subject to
    x_2 == A_1*x_1 + B_1*delta_1 + d_1;
    x_3 == A_2*x_2 + B_2*delta_2 + d_2;
    x_4 == A_3*x_3 + B_3*delta_3 + d_3;
    x_5 == A_4*x_4 + B_4*delta_4 + d_4;
    x_6 == A_5*x_5 + B_5*delta_5 + d_5;
    x_7 == A_6*x_6 + B_6*delta_6 + d_6;
    x_8 == A_7*x_7 + B_7*delta_7 + d_7;
    x_9 == A_8*x_8 + B_8*delta_8 + d_8;
    x_10 == A_9*x_9 + B_9*delta_9 + d_9;
    x_11 == A_10*x_10 + B_10*delta_10 + d_10;
    x_12 == A_11*x_11 + B_11*delta_11 + d_11;
    x_13 == A_12*x_12 + B_12*delta_12 + d_12;
    x_14 == A_13*x_13 + B_13*delta_13 + d_13;
    x_15 == A_14*x_14 + B_14*delta_14 + d_14;
    x_16 == A_15*x_15 + B_15*delta_15 + d_15;
    x_17 == A_16*x_16 + B_16*delta_16 + d_16;
    x_18 == A_17*x_17 + B_17*delta_17 + d_17;
    x_19 == A_18*x_18 + B_18*delta_18 + d_18;
    x_20 == A_19*x_19 + B_19*delta_19 + d_19;
    x_21 == A_20*x_20 + B_20*delta_20 + d_20;
    x_22 == A_21*x_21 + B_21*delta_21 + d_21;
    x_23 == A_22*x_22 + B_22*delta_22 + d_22;
    x_24 == A_23*x_23 + B_23*delta_23 + d_23;
    x_25 == A_24*x_24 + B_24*delta_24 + d_24;
    x_26 == A_25*x_25 + B_25*delta_25 + d_25;
    x_27 == A_26*x_26 + B_26*delta_26 + d_26;
    x_28 == A_27*x_27 + B_27*delta_27 + d_27;
    x_29 == A_28*x_28 + B_28*delta_28 + d_28;
    x_30 == A_29*x_29 + B_29*delta_29 + d_29;
    x_31 == A_30*x_30 + B_30*delta_30 + d_30;
    x_32 == A_31*x_31 + B_31*delta_31 + d_31;
    x_33 == A_32*x_32 + B_32*delta_32 + d_32;
    x_34 == A_33*x_33 + B_33*delta_33 + d_33;
    x_35 == A_34*x_34 + B_34*delta_34 + d_34;
    x_36 == A_35*x_35 + B_35*delta_35 + d_35;
    x_37 == A_36*x_36 + B_36*delta_36 + d_36;
    x_38 == A_37*x_37 + B_37*delta_37 + d_37;
    x_39 == A_38*x_38 + B_38*delta_38 + d_38;
    x_40 == A_39*x_39 + B_39*delta_39 + d_39;
    x_41 == A_40*x_40 + B_40*delta_40 + d_40;
    x_42 == A_41*x_41 + B_41*delta_41 + d_41;
    x_43 == A_42*x_42 + B_42*delta_42 + d_42;
    x_44 == A_43*x_43 + B_43*delta_43 + d_43;
    x_45 == A_44*x_44 + B_44*delta_44 + d_44;
    x_46 == A_45*x_45 + B_45*delta_45 + d_45;
    x_47 == A_46*x_46 + B_46*delta_46 + d_46;
    x_48 == A_47*x_47 + B_47*delta_47 + d_47;
    x_49 == A_48*x_48 + B_48*delta_48 + d_48;
    x_50 == A_49*x_49 + B_49*delta_49 + d_49;
    x_51 == A_50*x_50 + B_50*delta_50 + d_50;
    x_52 == A_51*x_51 + B_51*delta_51 + d_51;
    x_53 == A_52*x_52 + B_52*delta_52 + d_52;
    x_54 == A_53*x_53 + B_53*delta_53 + d_53;
    x_55 == A_54*x_54 + B_54*delta_54 + d_54;
    x_56 == A_55*x_55 + B_55*delta_55 + d_55;
    x_57 == A_56*x_56 + B_56*delta_56 + d_56;
    x_58 == A_57*x_57 + B_57*delta_57 + d_57;
    x_59 == A_58*x_58 + B_58*delta_58 + d_58;
    x_60 == A_59*x_59 + B_59*delta_59 + d_59;
    x_61 == A_60*x_60 + B_60*delta_60 + d_60;
    x_62 == A_61*x_61 + B_61*delta_61 + d_61;
    x_63 == A_62*x_62 + B_62*delta_62 + d_62;
    x_64 == A_63*x_63 + B_63*delta_63 + d_63;
    x_65 == A_64*x_64 + B_64*delta_64 + d_64;
    x_66 == A_65*x_65 + B_65*delta_65 + d_65;
    x_67 == A_66*x_66 + B_66*delta_66 + d_66;
    x_68 == A_67*x_67 + B_67*delta_67 + d_67;
    x_69 == A_68*x_68 + B_68*delta_68 + d_68;
    x_70 == A_69*x_69 + B_69*delta_69 + d_69;
    x_71 == A_70*x_70 + B_70*delta_70 + d_70;
    x_72 == A_71*x_71 + B_71*delta_71 + d_71;
    x_73 == A_72*x_72 + B_72*delta_72 + d_72;
    x_74 == A_73*x_73 + B_73*delta_73 + d_73;
    x_75 == A_74*x_74 + B_74*delta_74 + d_74;
    x_76 == A_75*x_75 + B_75*delta_75 + d_75;
    x_77 == A_76*x_76 + B_76*delta_76 + d_76;
    x_78 == A_77*x_77 + B_77*delta_77 + d_77;
    x_79 == A_78*x_78 + B_78*delta_78 + d_78;
    x_80 == A_79*x_79 + B_79*delta_79 + d_79;
    x_81 == A_80*x_80 + B_80*delta_80 + d_80;
    x_82 == A_81*x_81 + B_81*delta_81 + d_81;
    x_83 == A_82*x_82 + B_82*delta_82 + d_82;
    x_84 == A_83*x_83 + B_83*delta_83 + d_83;
    x_85 == A_84*x_84 + B_84*delta_84 + d_84;
    x_86 == A_85*x_85 + B_85*delta_85 + d_85;
    x_87 == A_86*x_86 + B_86*delta_86 + d_86;
    x_88 == A_87*x_87 + B_87*delta_87 + d_87;
    x_89 == A_88*x_88 + B_88*delta_88 + d_88;
    x_90 == A_89*x_89 + B_89*delta_89 + d_89;
    x_91 == A_90*x_90 + B_90*delta_90 + d_90;
    x_92 == A_91*x_91 + B_91*delta_91 + d_91;
    x_93 == A_92*x_92 + B_92*delta_92 + d_92;
    x_94 == A_93*x_93 + B_93*delta_93 + d_93;
    x_95 == A_94*x_94 + B_94*delta_94 + d_94;
    x_1 == x_0;
    x_95(1) == 0;
    x_95(2) == 0;
    x_1(1) <= widthLeft_1;
    x_2(1) <= widthLeft_2;
    x_3(1) <= widthLeft_3;
    x_4(1) <= widthLeft_4;
    x_5(1) <= widthLeft_5;
    x_6(1) <= widthLeft_6;
    x_7(1) <= widthLeft_7;
    x_8(1) <= widthLeft_8;
    x_9(1) <= widthLeft_9;
    x_10(1) <= widthLeft_10;
    x_11(1) <= widthLeft_11;
    x_12(1) <= widthLeft_12;
    x_13(1) <= widthLeft_13;
    x_14(1) <= widthLeft_14;
    x_15(1) <= widthLeft_15;
    x_16(1) <= widthLeft_16;
    x_17(1) <= widthLeft_17;
    x_18(1) <= widthLeft_18;
    x_19(1) <= widthLeft_19;
    x_20(1) <= widthLeft_20;
    x_21(1) <= widthLeft_21;
    x_22(1) <= widthLeft_22;
    x_23(1) <= widthLeft_23;
    x_24(1) <= widthLeft_24;
    x_25(1) <= widthLeft_25;
    x_26(1) <= widthLeft_26;
    x_27(1) <= widthLeft_27;
    x_28(1) <= widthLeft_28;
    x_29(1) <= widthLeft_29;
    x_30(1) <= widthLeft_30;
    x_31(1) <= widthLeft_31;
    x_32(1) <= widthLeft_32;
    x_33(1) <= widthLeft_33;
    x_34(1) <= widthLeft_34;
    x_35(1) <= widthLeft_35;
    x_36(1) <= widthLeft_36;
    x_37(1) <= widthLeft_37;
    x_38(1) <= widthLeft_38;
    x_39(1) <= widthLeft_39;
    x_40(1) <= widthLeft_40;
    x_41(1) <= widthLeft_41;
    x_42(1) <= widthLeft_42;
    x_43(1) <= widthLeft_43;
    x_44(1) <= widthLeft_44;
    x_45(1) <= widthLeft_45;
    x_46(1) <= widthLeft_46;
    x_47(1) <= widthLeft_47;
    x_48(1) <= widthLeft_48;
    x_49(1) <= widthLeft_49;
    x_50(1) <= widthLeft_50;
    x_51(1) <= widthLeft_51;
    x_52(1) <= widthLeft_52;
    x_53(1) <= widthLeft_53;
    x_54(1) <= widthLeft_54;
    x_55(1) <= widthLeft_55;
    x_56(1) <= widthLeft_56;
    x_57(1) <= widthLeft_57;
    x_58(1) <= widthLeft_58;
    x_59(1) <= widthLeft_59;
    x_60(1) <= widthLeft_60;
    x_61(1) <= widthLeft_61;
    x_62(1) <= widthLeft_62;
    x_63(1) <= widthLeft_63;
    x_64(1) <= widthLeft_64;
    x_65(1) <= widthLeft_65;
    x_66(1) <= widthLeft_66;
    x_67(1) <= widthLeft_67;
    x_68(1) <= widthLeft_68;
    x_69(1) <= widthLeft_69;
    x_70(1) <= widthLeft_70;
    x_71(1) <= widthLeft_71;
    x_72(1) <= widthLeft_72;
    x_73(1) <= widthLeft_73;
    x_74(1) <= widthLeft_74;
    x_75(1) <= widthLeft_75;
    x_76(1) <= widthLeft_76;
    x_77(1) <= widthLeft_77;
    x_78(1) <= widthLeft_78;
    x_79(1) <= widthLeft_79;
    x_80(1) <= widthLeft_80;
    x_81(1) <= widthLeft_81;
    x_82(1) <= widthLeft_82;
    x_83(1) <= widthLeft_83;
    x_84(1) <= widthLeft_84;
    x_85(1) <= widthLeft_85;
    x_86(1) <= widthLeft_86;
    x_87(1) <= widthLeft_87;
    x_88(1) <= widthLeft_88;
    x_89(1) <= widthLeft_89;
    x_90(1) <= widthLeft_90;
    x_91(1) <= widthLeft_91;
    x_92(1) <= widthLeft_92;
    x_93(1) <= widthLeft_93;
    x_94(1) <= widthLeft_94;
    x_95(1) <= widthLeft_95;
    x_1(1) >= widthRight_1;
    x_2(1) >= widthRight_2;
    x_3(1) >= widthRight_3;
    x_4(1) >= widthRight_4;
    x_5(1) >= widthRight_5;
    x_6(1) >= widthRight_6;
    x_7(1) >= widthRight_7;
    x_8(1) >= widthRight_8;
    x_9(1) >= widthRight_9;
    x_10(1) >= widthRight_10;
    x_11(1) >= widthRight_11;
    x_12(1) >= widthRight_12;
    x_13(1) >= widthRight_13;
    x_14(1) >= widthRight_14;
    x_15(1) >= widthRight_15;
    x_16(1) >= widthRight_16;
    x_17(1) >= widthRight_17;
    x_18(1) >= widthRight_18;
    x_19(1) >= widthRight_19;
    x_20(1) >= widthRight_20;
    x_21(1) >= widthRight_21;
    x_22(1) >= widthRight_22;
    x_23(1) >= widthRight_23;
    x_24(1) >= widthRight_24;
    x_25(1) >= widthRight_25;
    x_26(1) >= widthRight_26;
    x_27(1) >= widthRight_27;
    x_28(1) >= widthRight_28;
    x_29(1) >= widthRight_29;
    x_30(1) >= widthRight_30;
    x_31(1) >= widthRight_31;
    x_32(1) >= widthRight_32;
    x_33(1) >= widthRight_33;
    x_34(1) >= widthRight_34;
    x_35(1) >= widthRight_35;
    x_36(1) >= widthRight_36;
    x_37(1) >= widthRight_37;
    x_38(1) >= widthRight_38;
    x_39(1) >= widthRight_39;
    x_40(1) >= widthRight_40;
    x_41(1) >= widthRight_41;
    x_42(1) >= widthRight_42;
    x_43(1) >= widthRight_43;
    x_44(1) >= widthRight_44;
    x_45(1) >= widthRight_45;
    x_46(1) >= widthRight_46;
    x_47(1) >= widthRight_47;
    x_48(1) >= widthRight_48;
    x_49(1) >= widthRight_49;
    x_50(1) >= widthRight_50;
    x_51(1) >= widthRight_51;
    x_52(1) >= widthRight_52;
    x_53(1) >= widthRight_53;
    x_54(1) >= widthRight_54;
    x_55(1) >= widthRight_55;
    x_56(1) >= widthRight_56;
    x_57(1) >= widthRight_57;
    x_58(1) >= widthRight_58;
    x_59(1) >= widthRight_59;
    x_60(1) >= widthRight_60;
    x_61(1) >= widthRight_61;
    x_62(1) >= widthRight_62;
    x_63(1) >= widthRight_63;
    x_64(1) >= widthRight_64;
    x_65(1) >= widthRight_65;
    x_66(1) >= widthRight_66;
    x_67(1) >= widthRight_67;
    x_68(1) >= widthRight_68;
    x_69(1) >= widthRight_69;
    x_70(1) >= widthRight_70;
    x_71(1) >= widthRight_71;
    x_72(1) >= widthRight_72;
    x_73(1) >= widthRight_73;
    x_74(1) >= widthRight_74;
    x_75(1) >= widthRight_75;
    x_76(1) >= widthRight_76;
    x_77(1) >= widthRight_77;
    x_78(1) >= widthRight_78;
    x_79(1) >= widthRight_79;
    x_80(1) >= widthRight_80;
    x_81(1) >= widthRight_81;
    x_82(1) >= widthRight_82;
    x_83(1) >= widthRight_83;
    x_84(1) >= widthRight_84;
    x_85(1) >= widthRight_85;
    x_86(1) >= widthRight_86;
    x_87(1) >= widthRight_87;
    x_88(1) >= widthRight_88;
    x_89(1) >= widthRight_89;
    x_90(1) >= widthRight_90;
    x_91(1) >= widthRight_91;
    x_92(1) >= widthRight_92;
    x_93(1) >= widthRight_93;
    x_94(1) >= widthRight_94;
    x_95(1) >= widthRight_95;
cvx_end
vars.delta_1 = delta_1;
vars.delta{1} = delta_1;
vars.delta_2 = delta_2;
vars.delta{2} = delta_2;
vars.delta_3 = delta_3;
vars.delta{3} = delta_3;
vars.delta_4 = delta_4;
vars.delta{4} = delta_4;
vars.delta_5 = delta_5;
vars.delta{5} = delta_5;
vars.delta_6 = delta_6;
vars.delta{6} = delta_6;
vars.delta_7 = delta_7;
vars.delta{7} = delta_7;
vars.delta_8 = delta_8;
vars.delta{8} = delta_8;
vars.delta_9 = delta_9;
vars.delta{9} = delta_9;
vars.delta_10 = delta_10;
vars.delta{10} = delta_10;
vars.delta_11 = delta_11;
vars.delta{11} = delta_11;
vars.delta_12 = delta_12;
vars.delta{12} = delta_12;
vars.delta_13 = delta_13;
vars.delta{13} = delta_13;
vars.delta_14 = delta_14;
vars.delta{14} = delta_14;
vars.delta_15 = delta_15;
vars.delta{15} = delta_15;
vars.delta_16 = delta_16;
vars.delta{16} = delta_16;
vars.delta_17 = delta_17;
vars.delta{17} = delta_17;
vars.delta_18 = delta_18;
vars.delta{18} = delta_18;
vars.delta_19 = delta_19;
vars.delta{19} = delta_19;
vars.delta_20 = delta_20;
vars.delta{20} = delta_20;
vars.delta_21 = delta_21;
vars.delta{21} = delta_21;
vars.delta_22 = delta_22;
vars.delta{22} = delta_22;
vars.delta_23 = delta_23;
vars.delta{23} = delta_23;
vars.delta_24 = delta_24;
vars.delta{24} = delta_24;
vars.delta_25 = delta_25;
vars.delta{25} = delta_25;
vars.delta_26 = delta_26;
vars.delta{26} = delta_26;
vars.delta_27 = delta_27;
vars.delta{27} = delta_27;
vars.delta_28 = delta_28;
vars.delta{28} = delta_28;
vars.delta_29 = delta_29;
vars.delta{29} = delta_29;
vars.delta_30 = delta_30;
vars.delta{30} = delta_30;
vars.delta_31 = delta_31;
vars.delta{31} = delta_31;
vars.delta_32 = delta_32;
vars.delta{32} = delta_32;
vars.delta_33 = delta_33;
vars.delta{33} = delta_33;
vars.delta_34 = delta_34;
vars.delta{34} = delta_34;
vars.delta_35 = delta_35;
vars.delta{35} = delta_35;
vars.delta_36 = delta_36;
vars.delta{36} = delta_36;
vars.delta_37 = delta_37;
vars.delta{37} = delta_37;
vars.delta_38 = delta_38;
vars.delta{38} = delta_38;
vars.delta_39 = delta_39;
vars.delta{39} = delta_39;
vars.delta_40 = delta_40;
vars.delta{40} = delta_40;
vars.delta_41 = delta_41;
vars.delta{41} = delta_41;
vars.delta_42 = delta_42;
vars.delta{42} = delta_42;
vars.delta_43 = delta_43;
vars.delta{43} = delta_43;
vars.delta_44 = delta_44;
vars.delta{44} = delta_44;
vars.delta_45 = delta_45;
vars.delta{45} = delta_45;
vars.delta_46 = delta_46;
vars.delta{46} = delta_46;
vars.delta_47 = delta_47;
vars.delta{47} = delta_47;
vars.delta_48 = delta_48;
vars.delta{48} = delta_48;
vars.delta_49 = delta_49;
vars.delta{49} = delta_49;
vars.delta_50 = delta_50;
vars.delta{50} = delta_50;
vars.delta_51 = delta_51;
vars.delta{51} = delta_51;
vars.delta_52 = delta_52;
vars.delta{52} = delta_52;
vars.delta_53 = delta_53;
vars.delta{53} = delta_53;
vars.delta_54 = delta_54;
vars.delta{54} = delta_54;
vars.delta_55 = delta_55;
vars.delta{55} = delta_55;
vars.delta_56 = delta_56;
vars.delta{56} = delta_56;
vars.delta_57 = delta_57;
vars.delta{57} = delta_57;
vars.delta_58 = delta_58;
vars.delta{58} = delta_58;
vars.delta_59 = delta_59;
vars.delta{59} = delta_59;
vars.delta_60 = delta_60;
vars.delta{60} = delta_60;
vars.delta_61 = delta_61;
vars.delta{61} = delta_61;
vars.delta_62 = delta_62;
vars.delta{62} = delta_62;
vars.delta_63 = delta_63;
vars.delta{63} = delta_63;
vars.delta_64 = delta_64;
vars.delta{64} = delta_64;
vars.delta_65 = delta_65;
vars.delta{65} = delta_65;
vars.delta_66 = delta_66;
vars.delta{66} = delta_66;
vars.delta_67 = delta_67;
vars.delta{67} = delta_67;
vars.delta_68 = delta_68;
vars.delta{68} = delta_68;
vars.delta_69 = delta_69;
vars.delta{69} = delta_69;
vars.delta_70 = delta_70;
vars.delta{70} = delta_70;
vars.delta_71 = delta_71;
vars.delta{71} = delta_71;
vars.delta_72 = delta_72;
vars.delta{72} = delta_72;
vars.delta_73 = delta_73;
vars.delta{73} = delta_73;
vars.delta_74 = delta_74;
vars.delta{74} = delta_74;
vars.delta_75 = delta_75;
vars.delta{75} = delta_75;
vars.delta_76 = delta_76;
vars.delta{76} = delta_76;
vars.delta_77 = delta_77;
vars.delta{77} = delta_77;
vars.delta_78 = delta_78;
vars.delta{78} = delta_78;
vars.delta_79 = delta_79;
vars.delta{79} = delta_79;
vars.delta_80 = delta_80;
vars.delta{80} = delta_80;
vars.delta_81 = delta_81;
vars.delta{81} = delta_81;
vars.delta_82 = delta_82;
vars.delta{82} = delta_82;
vars.delta_83 = delta_83;
vars.delta{83} = delta_83;
vars.delta_84 = delta_84;
vars.delta{84} = delta_84;
vars.delta_85 = delta_85;
vars.delta{85} = delta_85;
vars.delta_86 = delta_86;
vars.delta{86} = delta_86;
vars.delta_87 = delta_87;
vars.delta{87} = delta_87;
vars.delta_88 = delta_88;
vars.delta{88} = delta_88;
vars.delta_89 = delta_89;
vars.delta{89} = delta_89;
vars.delta_90 = delta_90;
vars.delta{90} = delta_90;
vars.delta_91 = delta_91;
vars.delta{91} = delta_91;
vars.delta_92 = delta_92;
vars.delta{92} = delta_92;
vars.delta_93 = delta_93;
vars.delta{93} = delta_93;
vars.delta_94 = delta_94;
vars.delta{94} = delta_94;
vars.delta_95 = delta_95;
vars.delta{95} = delta_95;
vars.x_1 = x_1;
vars.x{1} = x_1;
vars.x_2 = x_2;
vars.x{2} = x_2;
vars.x_3 = x_3;
vars.x{3} = x_3;
vars.x_4 = x_4;
vars.x{4} = x_4;
vars.x_5 = x_5;
vars.x{5} = x_5;
vars.x_6 = x_6;
vars.x{6} = x_6;
vars.x_7 = x_7;
vars.x{7} = x_7;
vars.x_8 = x_8;
vars.x{8} = x_8;
vars.x_9 = x_9;
vars.x{9} = x_9;
vars.x_10 = x_10;
vars.x{10} = x_10;
vars.x_11 = x_11;
vars.x{11} = x_11;
vars.x_12 = x_12;
vars.x{12} = x_12;
vars.x_13 = x_13;
vars.x{13} = x_13;
vars.x_14 = x_14;
vars.x{14} = x_14;
vars.x_15 = x_15;
vars.x{15} = x_15;
vars.x_16 = x_16;
vars.x{16} = x_16;
vars.x_17 = x_17;
vars.x{17} = x_17;
vars.x_18 = x_18;
vars.x{18} = x_18;
vars.x_19 = x_19;
vars.x{19} = x_19;
vars.x_20 = x_20;
vars.x{20} = x_20;
vars.x_21 = x_21;
vars.x{21} = x_21;
vars.x_22 = x_22;
vars.x{22} = x_22;
vars.x_23 = x_23;
vars.x{23} = x_23;
vars.x_24 = x_24;
vars.x{24} = x_24;
vars.x_25 = x_25;
vars.x{25} = x_25;
vars.x_26 = x_26;
vars.x{26} = x_26;
vars.x_27 = x_27;
vars.x{27} = x_27;
vars.x_28 = x_28;
vars.x{28} = x_28;
vars.x_29 = x_29;
vars.x{29} = x_29;
vars.x_30 = x_30;
vars.x{30} = x_30;
vars.x_31 = x_31;
vars.x{31} = x_31;
vars.x_32 = x_32;
vars.x{32} = x_32;
vars.x_33 = x_33;
vars.x{33} = x_33;
vars.x_34 = x_34;
vars.x{34} = x_34;
vars.x_35 = x_35;
vars.x{35} = x_35;
vars.x_36 = x_36;
vars.x{36} = x_36;
vars.x_37 = x_37;
vars.x{37} = x_37;
vars.x_38 = x_38;
vars.x{38} = x_38;
vars.x_39 = x_39;
vars.x{39} = x_39;
vars.x_40 = x_40;
vars.x{40} = x_40;
vars.x_41 = x_41;
vars.x{41} = x_41;
vars.x_42 = x_42;
vars.x{42} = x_42;
vars.x_43 = x_43;
vars.x{43} = x_43;
vars.x_44 = x_44;
vars.x{44} = x_44;
vars.x_45 = x_45;
vars.x{45} = x_45;
vars.x_46 = x_46;
vars.x{46} = x_46;
vars.x_47 = x_47;
vars.x{47} = x_47;
vars.x_48 = x_48;
vars.x{48} = x_48;
vars.x_49 = x_49;
vars.x{49} = x_49;
vars.x_50 = x_50;
vars.x{50} = x_50;
vars.x_51 = x_51;
vars.x{51} = x_51;
vars.x_52 = x_52;
vars.x{52} = x_52;
vars.x_53 = x_53;
vars.x{53} = x_53;
vars.x_54 = x_54;
vars.x{54} = x_54;
vars.x_55 = x_55;
vars.x{55} = x_55;
vars.x_56 = x_56;
vars.x{56} = x_56;
vars.x_57 = x_57;
vars.x{57} = x_57;
vars.x_58 = x_58;
vars.x{58} = x_58;
vars.x_59 = x_59;
vars.x{59} = x_59;
vars.x_60 = x_60;
vars.x{60} = x_60;
vars.x_61 = x_61;
vars.x{61} = x_61;
vars.x_62 = x_62;
vars.x{62} = x_62;
vars.x_63 = x_63;
vars.x{63} = x_63;
vars.x_64 = x_64;
vars.x{64} = x_64;
vars.x_65 = x_65;
vars.x{65} = x_65;
vars.x_66 = x_66;
vars.x{66} = x_66;
vars.x_67 = x_67;
vars.x{67} = x_67;
vars.x_68 = x_68;
vars.x{68} = x_68;
vars.x_69 = x_69;
vars.x{69} = x_69;
vars.x_70 = x_70;
vars.x{70} = x_70;
vars.x_71 = x_71;
vars.x{71} = x_71;
vars.x_72 = x_72;
vars.x{72} = x_72;
vars.x_73 = x_73;
vars.x{73} = x_73;
vars.x_74 = x_74;
vars.x{74} = x_74;
vars.x_75 = x_75;
vars.x{75} = x_75;
vars.x_76 = x_76;
vars.x{76} = x_76;
vars.x_77 = x_77;
vars.x{77} = x_77;
vars.x_78 = x_78;
vars.x{78} = x_78;
vars.x_79 = x_79;
vars.x{79} = x_79;
vars.x_80 = x_80;
vars.x{80} = x_80;
vars.x_81 = x_81;
vars.x{81} = x_81;
vars.x_82 = x_82;
vars.x{82} = x_82;
vars.x_83 = x_83;
vars.x{83} = x_83;
vars.x_84 = x_84;
vars.x{84} = x_84;
vars.x_85 = x_85;
vars.x{85} = x_85;
vars.x_86 = x_86;
vars.x{86} = x_86;
vars.x_87 = x_87;
vars.x{87} = x_87;
vars.x_88 = x_88;
vars.x{88} = x_88;
vars.x_89 = x_89;
vars.x{89} = x_89;
vars.x_90 = x_90;
vars.x{90} = x_90;
vars.x_91 = x_91;
vars.x{91} = x_91;
vars.x_92 = x_92;
vars.x{92} = x_92;
vars.x_93 = x_93;
vars.x{93} = x_93;
vars.x_94 = x_94;
vars.x{94} = x_94;
vars.x_95 = x_95;
vars.x{95} = x_95;
status.cvx_status = cvx_status;
% Provide a drop-in replacement for csolve.
status.optval = cvx_optval;
status.converged = strcmp(cvx_status, 'Solved');
