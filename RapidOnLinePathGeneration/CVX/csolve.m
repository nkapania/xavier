% csolve  Solves a custom quadratic program very rapidly.
%
% [vars, status] = csolve(params, settings)
%
% solves the convex optimization problem
%
%   minimize(quad_form((1/ds_1)*(psiR_2 - psiR_1 + x_2(2) - x_1(2)), W_psi) + quad_form((1/ds_2)*(psiR_3 - psiR_2 + x_3(2) - x_2(2)), W_psi) + quad_form((1/ds_3)*(psiR_4 - psiR_3 + x_4(2) - x_3(2)), W_psi) + quad_form((1/ds_4)*(psiR_5 - psiR_4 + x_5(2) - x_4(2)), W_psi) + quad_form((1/ds_5)*(psiR_6 - psiR_5 + x_6(2) - x_5(2)), W_psi) + quad_form((1/ds_6)*(psiR_7 - psiR_6 + x_7(2) - x_6(2)), W_psi) + quad_form((1/ds_7)*(psiR_8 - psiR_7 + x_8(2) - x_7(2)), W_psi) + quad_form((1/ds_8)*(psiR_9 - psiR_8 + x_9(2) - x_8(2)), W_psi) + quad_form((1/ds_9)*(psiR_10 - psiR_9 + x_10(2) - x_9(2)), W_psi) + quad_form((1/ds_10)*(psiR_11 - psiR_10 + x_11(2) - x_10(2)), W_psi) + quad_form((1/ds_11)*(psiR_12 - psiR_11 + x_12(2) - x_11(2)), W_psi) + quad_form((1/ds_12)*(psiR_13 - psiR_12 + x_13(2) - x_12(2)), W_psi) + quad_form((1/ds_13)*(psiR_14 - psiR_13 + x_14(2) - x_13(2)), W_psi) + quad_form((1/ds_14)*(psiR_15 - psiR_14 + x_15(2) - x_14(2)), W_psi) + quad_form((1/ds_15)*(psiR_16 - psiR_15 + x_16(2) - x_15(2)), W_psi) + quad_form((1/ds_16)*(psiR_17 - psiR_16 + x_17(2) - x_16(2)), W_psi) + quad_form((1/ds_17)*(psiR_18 - psiR_17 + x_18(2) - x_17(2)), W_psi) + quad_form((1/ds_18)*(psiR_19 - psiR_18 + x_19(2) - x_18(2)), W_psi) + quad_form((1/ds_19)*(psiR_20 - psiR_19 + x_20(2) - x_19(2)), W_psi) + quad_form((1/ds_20)*(psiR_21 - psiR_20 + x_21(2) - x_20(2)), W_psi) + quad_form((1/ds_21)*(psiR_22 - psiR_21 + x_22(2) - x_21(2)), W_psi) + quad_form((1/ds_22)*(psiR_23 - psiR_22 + x_23(2) - x_22(2)), W_psi) + quad_form((1/ds_23)*(psiR_24 - psiR_23 + x_24(2) - x_23(2)), W_psi) + quad_form((1/ds_24)*(psiR_25 - psiR_24 + x_25(2) - x_24(2)), W_psi) + quad_form((1/ds_25)*(psiR_26 - psiR_25 + x_26(2) - x_25(2)), W_psi) + quad_form((1/ds_26)*(psiR_27 - psiR_26 + x_27(2) - x_26(2)), W_psi) + quad_form((1/ds_27)*(psiR_28 - psiR_27 + x_28(2) - x_27(2)), W_psi) + quad_form((1/ds_28)*(psiR_29 - psiR_28 + x_29(2) - x_28(2)), W_psi) + quad_form((1/ds_29)*(psiR_30 - psiR_29 + x_30(2) - x_29(2)), W_psi) + quad_form((1/ds_30)*(psiR_31 - psiR_30 + x_31(2) - x_30(2)), W_psi) + quad_form((1/ds_31)*(psiR_32 - psiR_31 + x_32(2) - x_31(2)), W_psi) + quad_form((1/ds_32)*(psiR_33 - psiR_32 + x_33(2) - x_32(2)), W_psi) + quad_form((1/ds_33)*(psiR_34 - psiR_33 + x_34(2) - x_33(2)), W_psi) + quad_form((1/ds_34)*(psiR_35 - psiR_34 + x_35(2) - x_34(2)), W_psi) + quad_form((1/ds_35)*(psiR_36 - psiR_35 + x_36(2) - x_35(2)), W_psi) + quad_form((1/ds_36)*(psiR_37 - psiR_36 + x_37(2) - x_36(2)), W_psi) + quad_form((1/ds_37)*(psiR_38 - psiR_37 + x_38(2) - x_37(2)), W_psi) + quad_form((1/ds_38)*(psiR_39 - psiR_38 + x_39(2) - x_38(2)), W_psi) + quad_form((1/ds_39)*(psiR_40 - psiR_39 + x_40(2) - x_39(2)), W_psi) + quad_form((1/ds_40)*(psiR_41 - psiR_40 + x_41(2) - x_40(2)), W_psi) + quad_form((1/ds_41)*(psiR_42 - psiR_41 + x_42(2) - x_41(2)), W_psi) + quad_form((1/ds_42)*(psiR_43 - psiR_42 + x_43(2) - x_42(2)), W_psi) + quad_form((1/ds_43)*(psiR_44 - psiR_43 + x_44(2) - x_43(2)), W_psi) + quad_form((1/ds_44)*(psiR_45 - psiR_44 + x_45(2) - x_44(2)), W_psi) + quad_form((1/ds_45)*(psiR_46 - psiR_45 + x_46(2) - x_45(2)), W_psi) + quad_form((1/ds_46)*(psiR_47 - psiR_46 + x_47(2) - x_46(2)), W_psi) + quad_form((1/ds_47)*(psiR_48 - psiR_47 + x_48(2) - x_47(2)), W_psi) + quad_form((1/ds_48)*(psiR_49 - psiR_48 + x_49(2) - x_48(2)), W_psi) + quad_form((1/ds_49)*(psiR_50 - psiR_49 + x_50(2) - x_49(2)), W_psi) + quad_form((1/ds_50)*(psiR_51 - psiR_50 + x_51(2) - x_50(2)), W_psi) + quad_form((1/ds_51)*(psiR_52 - psiR_51 + x_52(2) - x_51(2)), W_psi) + quad_form((1/ds_52)*(psiR_53 - psiR_52 + x_53(2) - x_52(2)), W_psi) + quad_form((1/ds_53)*(psiR_54 - psiR_53 + x_54(2) - x_53(2)), W_psi) + quad_form((1/ds_54)*(psiR_55 - psiR_54 + x_55(2) - x_54(2)), W_psi) + quad_form((1/ds_55)*(psiR_56 - psiR_55 + x_56(2) - x_55(2)), W_psi) + quad_form((1/ds_56)*(psiR_57 - psiR_56 + x_57(2) - x_56(2)), W_psi) + quad_form((1/ds_57)*(psiR_58 - psiR_57 + x_58(2) - x_57(2)), W_psi) + quad_form((1/ds_58)*(psiR_59 - psiR_58 + x_59(2) - x_58(2)), W_psi) + quad_form((1/ds_59)*(psiR_60 - psiR_59 + x_60(2) - x_59(2)), W_psi) + quad_form((1/ds_60)*(psiR_61 - psiR_60 + x_61(2) - x_60(2)), W_psi) + quad_form((1/ds_61)*(psiR_62 - psiR_61 + x_62(2) - x_61(2)), W_psi) + quad_form((1/ds_62)*(psiR_63 - psiR_62 + x_63(2) - x_62(2)), W_psi) + quad_form((1/ds_63)*(psiR_64 - psiR_63 + x_64(2) - x_63(2)), W_psi) + quad_form((1/ds_64)*(psiR_65 - psiR_64 + x_65(2) - x_64(2)), W_psi) + quad_form((1/ds_65)*(psiR_66 - psiR_65 + x_66(2) - x_65(2)), W_psi) + quad_form((1/ds_66)*(psiR_67 - psiR_66 + x_67(2) - x_66(2)), W_psi) + quad_form((1/ds_67)*(psiR_68 - psiR_67 + x_68(2) - x_67(2)), W_psi) + quad_form((1/ds_68)*(psiR_69 - psiR_68 + x_69(2) - x_68(2)), W_psi) + quad_form((1/ds_69)*(psiR_70 - psiR_69 + x_70(2) - x_69(2)), W_psi) + quad_form((1/ds_70)*(psiR_71 - psiR_70 + x_71(2) - x_70(2)), W_psi) + quad_form((1/ds_71)*(psiR_72 - psiR_71 + x_72(2) - x_71(2)), W_psi) + quad_form((1/ds_72)*(psiR_73 - psiR_72 + x_73(2) - x_72(2)), W_psi) + quad_form((1/ds_73)*(psiR_74 - psiR_73 + x_74(2) - x_73(2)), W_psi) + quad_form((1/ds_74)*(psiR_75 - psiR_74 + x_75(2) - x_74(2)), W_psi) + quad_form((1/ds_75)*(psiR_76 - psiR_75 + x_76(2) - x_75(2)), W_psi) + quad_form((1/ds_76)*(psiR_77 - psiR_76 + x_77(2) - x_76(2)), W_psi) + quad_form((1/ds_77)*(psiR_78 - psiR_77 + x_78(2) - x_77(2)), W_psi) + quad_form((1/ds_78)*(psiR_79 - psiR_78 + x_79(2) - x_78(2)), W_psi) + quad_form((1/ds_79)*(psiR_80 - psiR_79 + x_80(2) - x_79(2)), W_psi) + quad_form((1/ds_80)*(psiR_81 - psiR_80 + x_81(2) - x_80(2)), W_psi) + quad_form((1/ds_81)*(psiR_82 - psiR_81 + x_82(2) - x_81(2)), W_psi) + quad_form((1/ds_82)*(psiR_83 - psiR_82 + x_83(2) - x_82(2)), W_psi) + quad_form((1/ds_83)*(psiR_84 - psiR_83 + x_84(2) - x_83(2)), W_psi) + quad_form((1/ds_84)*(psiR_85 - psiR_84 + x_85(2) - x_84(2)), W_psi) + quad_form((1/ds_85)*(psiR_86 - psiR_85 + x_86(2) - x_85(2)), W_psi) + quad_form((1/ds_86)*(psiR_87 - psiR_86 + x_87(2) - x_86(2)), W_psi) + quad_form((1/ds_87)*(psiR_88 - psiR_87 + x_88(2) - x_87(2)), W_psi) + quad_form((1/ds_88)*(psiR_89 - psiR_88 + x_89(2) - x_88(2)), W_psi) + quad_form((1/ds_89)*(psiR_90 - psiR_89 + x_90(2) - x_89(2)), W_psi) + quad_form((1/ds_90)*(psiR_91 - psiR_90 + x_91(2) - x_90(2)), W_psi) + quad_form((1/ds_91)*(psiR_92 - psiR_91 + x_92(2) - x_91(2)), W_psi) + quad_form((1/ds_92)*(psiR_93 - psiR_92 + x_93(2) - x_92(2)), W_psi) + quad_form((1/ds_93)*(psiR_94 - psiR_93 + x_94(2) - x_93(2)), W_psi) + quad_form((1/ds_94)*(psiR_95 - psiR_94 + x_95(2) - x_94(2)), W_psi) + quad_form(delta_2 - delta_1, W_delta) + quad_form(delta_3 - delta_2, W_delta) + quad_form(delta_4 - delta_3, W_delta) + quad_form(delta_5 - delta_4, W_delta) + quad_form(delta_6 - delta_5, W_delta) + quad_form(delta_7 - delta_6, W_delta) + quad_form(delta_8 - delta_7, W_delta) + quad_form(delta_9 - delta_8, W_delta) + quad_form(delta_10 - delta_9, W_delta) + quad_form(delta_11 - delta_10, W_delta) + quad_form(delta_12 - delta_11, W_delta) + quad_form(delta_13 - delta_12, W_delta) + quad_form(delta_14 - delta_13, W_delta) + quad_form(delta_15 - delta_14, W_delta) + quad_form(delta_16 - delta_15, W_delta) + quad_form(delta_17 - delta_16, W_delta) + quad_form(delta_18 - delta_17, W_delta) + quad_form(delta_19 - delta_18, W_delta) + quad_form(delta_20 - delta_19, W_delta) + quad_form(delta_21 - delta_20, W_delta) + quad_form(delta_22 - delta_21, W_delta) + quad_form(delta_23 - delta_22, W_delta) + quad_form(delta_24 - delta_23, W_delta) + quad_form(delta_25 - delta_24, W_delta) + quad_form(delta_26 - delta_25, W_delta) + quad_form(delta_27 - delta_26, W_delta) + quad_form(delta_28 - delta_27, W_delta) + quad_form(delta_29 - delta_28, W_delta) + quad_form(delta_30 - delta_29, W_delta) + quad_form(delta_31 - delta_30, W_delta) + quad_form(delta_32 - delta_31, W_delta) + quad_form(delta_33 - delta_32, W_delta) + quad_form(delta_34 - delta_33, W_delta) + quad_form(delta_35 - delta_34, W_delta) + quad_form(delta_36 - delta_35, W_delta) + quad_form(delta_37 - delta_36, W_delta) + quad_form(delta_38 - delta_37, W_delta) + quad_form(delta_39 - delta_38, W_delta) + quad_form(delta_40 - delta_39, W_delta) + quad_form(delta_41 - delta_40, W_delta) + quad_form(delta_42 - delta_41, W_delta) + quad_form(delta_43 - delta_42, W_delta) + quad_form(delta_44 - delta_43, W_delta) + quad_form(delta_45 - delta_44, W_delta) + quad_form(delta_46 - delta_45, W_delta) + quad_form(delta_47 - delta_46, W_delta) + quad_form(delta_48 - delta_47, W_delta) + quad_form(delta_49 - delta_48, W_delta) + quad_form(delta_50 - delta_49, W_delta) + quad_form(delta_51 - delta_50, W_delta) + quad_form(delta_52 - delta_51, W_delta) + quad_form(delta_53 - delta_52, W_delta) + quad_form(delta_54 - delta_53, W_delta) + quad_form(delta_55 - delta_54, W_delta) + quad_form(delta_56 - delta_55, W_delta) + quad_form(delta_57 - delta_56, W_delta) + quad_form(delta_58 - delta_57, W_delta) + quad_form(delta_59 - delta_58, W_delta) + quad_form(delta_60 - delta_59, W_delta) + quad_form(delta_61 - delta_60, W_delta) + quad_form(delta_62 - delta_61, W_delta) + quad_form(delta_63 - delta_62, W_delta) + quad_form(delta_64 - delta_63, W_delta) + quad_form(delta_65 - delta_64, W_delta) + quad_form(delta_66 - delta_65, W_delta) + quad_form(delta_67 - delta_66, W_delta) + quad_form(delta_68 - delta_67, W_delta) + quad_form(delta_69 - delta_68, W_delta) + quad_form(delta_70 - delta_69, W_delta) + quad_form(delta_71 - delta_70, W_delta) + quad_form(delta_72 - delta_71, W_delta) + quad_form(delta_73 - delta_72, W_delta) + quad_form(delta_74 - delta_73, W_delta) + quad_form(delta_75 - delta_74, W_delta) + quad_form(delta_76 - delta_75, W_delta) + quad_form(delta_77 - delta_76, W_delta) + quad_form(delta_78 - delta_77, W_delta) + quad_form(delta_79 - delta_78, W_delta) + quad_form(delta_80 - delta_79, W_delta) + quad_form(delta_81 - delta_80, W_delta) + quad_form(delta_82 - delta_81, W_delta) + quad_form(delta_83 - delta_82, W_delta) + quad_form(delta_84 - delta_83, W_delta) + quad_form(delta_85 - delta_84, W_delta) + quad_form(delta_86 - delta_85, W_delta) + quad_form(delta_87 - delta_86, W_delta) + quad_form(delta_88 - delta_87, W_delta) + quad_form(delta_89 - delta_88, W_delta) + quad_form(delta_90 - delta_89, W_delta) + quad_form(delta_91 - delta_90, W_delta) + quad_form(delta_92 - delta_91, W_delta) + quad_form(delta_93 - delta_92, W_delta) + quad_form(delta_94 - delta_93, W_delta) + quad_form(delta_95 - delta_94, W_delta))
%   subject to
%     x_2 == A_1*x_1 + B_1*delta_1 + d_1
%     x_3 == A_2*x_2 + B_2*delta_2 + d_2
%     x_4 == A_3*x_3 + B_3*delta_3 + d_3
%     x_5 == A_4*x_4 + B_4*delta_4 + d_4
%     x_6 == A_5*x_5 + B_5*delta_5 + d_5
%     x_7 == A_6*x_6 + B_6*delta_6 + d_6
%     x_8 == A_7*x_7 + B_7*delta_7 + d_7
%     x_9 == A_8*x_8 + B_8*delta_8 + d_8
%     x_10 == A_9*x_9 + B_9*delta_9 + d_9
%     x_11 == A_10*x_10 + B_10*delta_10 + d_10
%     x_12 == A_11*x_11 + B_11*delta_11 + d_11
%     x_13 == A_12*x_12 + B_12*delta_12 + d_12
%     x_14 == A_13*x_13 + B_13*delta_13 + d_13
%     x_15 == A_14*x_14 + B_14*delta_14 + d_14
%     x_16 == A_15*x_15 + B_15*delta_15 + d_15
%     x_17 == A_16*x_16 + B_16*delta_16 + d_16
%     x_18 == A_17*x_17 + B_17*delta_17 + d_17
%     x_19 == A_18*x_18 + B_18*delta_18 + d_18
%     x_20 == A_19*x_19 + B_19*delta_19 + d_19
%     x_21 == A_20*x_20 + B_20*delta_20 + d_20
%     x_22 == A_21*x_21 + B_21*delta_21 + d_21
%     x_23 == A_22*x_22 + B_22*delta_22 + d_22
%     x_24 == A_23*x_23 + B_23*delta_23 + d_23
%     x_25 == A_24*x_24 + B_24*delta_24 + d_24
%     x_26 == A_25*x_25 + B_25*delta_25 + d_25
%     x_27 == A_26*x_26 + B_26*delta_26 + d_26
%     x_28 == A_27*x_27 + B_27*delta_27 + d_27
%     x_29 == A_28*x_28 + B_28*delta_28 + d_28
%     x_30 == A_29*x_29 + B_29*delta_29 + d_29
%     x_31 == A_30*x_30 + B_30*delta_30 + d_30
%     x_32 == A_31*x_31 + B_31*delta_31 + d_31
%     x_33 == A_32*x_32 + B_32*delta_32 + d_32
%     x_34 == A_33*x_33 + B_33*delta_33 + d_33
%     x_35 == A_34*x_34 + B_34*delta_34 + d_34
%     x_36 == A_35*x_35 + B_35*delta_35 + d_35
%     x_37 == A_36*x_36 + B_36*delta_36 + d_36
%     x_38 == A_37*x_37 + B_37*delta_37 + d_37
%     x_39 == A_38*x_38 + B_38*delta_38 + d_38
%     x_40 == A_39*x_39 + B_39*delta_39 + d_39
%     x_41 == A_40*x_40 + B_40*delta_40 + d_40
%     x_42 == A_41*x_41 + B_41*delta_41 + d_41
%     x_43 == A_42*x_42 + B_42*delta_42 + d_42
%     x_44 == A_43*x_43 + B_43*delta_43 + d_43
%     x_45 == A_44*x_44 + B_44*delta_44 + d_44
%     x_46 == A_45*x_45 + B_45*delta_45 + d_45
%     x_47 == A_46*x_46 + B_46*delta_46 + d_46
%     x_48 == A_47*x_47 + B_47*delta_47 + d_47
%     x_49 == A_48*x_48 + B_48*delta_48 + d_48
%     x_50 == A_49*x_49 + B_49*delta_49 + d_49
%     x_51 == A_50*x_50 + B_50*delta_50 + d_50
%     x_52 == A_51*x_51 + B_51*delta_51 + d_51
%     x_53 == A_52*x_52 + B_52*delta_52 + d_52
%     x_54 == A_53*x_53 + B_53*delta_53 + d_53
%     x_55 == A_54*x_54 + B_54*delta_54 + d_54
%     x_56 == A_55*x_55 + B_55*delta_55 + d_55
%     x_57 == A_56*x_56 + B_56*delta_56 + d_56
%     x_58 == A_57*x_57 + B_57*delta_57 + d_57
%     x_59 == A_58*x_58 + B_58*delta_58 + d_58
%     x_60 == A_59*x_59 + B_59*delta_59 + d_59
%     x_61 == A_60*x_60 + B_60*delta_60 + d_60
%     x_62 == A_61*x_61 + B_61*delta_61 + d_61
%     x_63 == A_62*x_62 + B_62*delta_62 + d_62
%     x_64 == A_63*x_63 + B_63*delta_63 + d_63
%     x_65 == A_64*x_64 + B_64*delta_64 + d_64
%     x_66 == A_65*x_65 + B_65*delta_65 + d_65
%     x_67 == A_66*x_66 + B_66*delta_66 + d_66
%     x_68 == A_67*x_67 + B_67*delta_67 + d_67
%     x_69 == A_68*x_68 + B_68*delta_68 + d_68
%     x_70 == A_69*x_69 + B_69*delta_69 + d_69
%     x_71 == A_70*x_70 + B_70*delta_70 + d_70
%     x_72 == A_71*x_71 + B_71*delta_71 + d_71
%     x_73 == A_72*x_72 + B_72*delta_72 + d_72
%     x_74 == A_73*x_73 + B_73*delta_73 + d_73
%     x_75 == A_74*x_74 + B_74*delta_74 + d_74
%     x_76 == A_75*x_75 + B_75*delta_75 + d_75
%     x_77 == A_76*x_76 + B_76*delta_76 + d_76
%     x_78 == A_77*x_77 + B_77*delta_77 + d_77
%     x_79 == A_78*x_78 + B_78*delta_78 + d_78
%     x_80 == A_79*x_79 + B_79*delta_79 + d_79
%     x_81 == A_80*x_80 + B_80*delta_80 + d_80
%     x_82 == A_81*x_81 + B_81*delta_81 + d_81
%     x_83 == A_82*x_82 + B_82*delta_82 + d_82
%     x_84 == A_83*x_83 + B_83*delta_83 + d_83
%     x_85 == A_84*x_84 + B_84*delta_84 + d_84
%     x_86 == A_85*x_85 + B_85*delta_85 + d_85
%     x_87 == A_86*x_86 + B_86*delta_86 + d_86
%     x_88 == A_87*x_87 + B_87*delta_87 + d_87
%     x_89 == A_88*x_88 + B_88*delta_88 + d_88
%     x_90 == A_89*x_89 + B_89*delta_89 + d_89
%     x_91 == A_90*x_90 + B_90*delta_90 + d_90
%     x_92 == A_91*x_91 + B_91*delta_91 + d_91
%     x_93 == A_92*x_92 + B_92*delta_92 + d_92
%     x_94 == A_93*x_93 + B_93*delta_93 + d_93
%     x_95 == A_94*x_94 + B_94*delta_94 + d_94
%     x_1 == x_0
%     x_95(1) == 0
%     x_95(2) == 0
%     x_1(1) <= widthLeft_1
%     x_2(1) <= widthLeft_2
%     x_3(1) <= widthLeft_3
%     x_4(1) <= widthLeft_4
%     x_5(1) <= widthLeft_5
%     x_6(1) <= widthLeft_6
%     x_7(1) <= widthLeft_7
%     x_8(1) <= widthLeft_8
%     x_9(1) <= widthLeft_9
%     x_10(1) <= widthLeft_10
%     x_11(1) <= widthLeft_11
%     x_12(1) <= widthLeft_12
%     x_13(1) <= widthLeft_13
%     x_14(1) <= widthLeft_14
%     x_15(1) <= widthLeft_15
%     x_16(1) <= widthLeft_16
%     x_17(1) <= widthLeft_17
%     x_18(1) <= widthLeft_18
%     x_19(1) <= widthLeft_19
%     x_20(1) <= widthLeft_20
%     x_21(1) <= widthLeft_21
%     x_22(1) <= widthLeft_22
%     x_23(1) <= widthLeft_23
%     x_24(1) <= widthLeft_24
%     x_25(1) <= widthLeft_25
%     x_26(1) <= widthLeft_26
%     x_27(1) <= widthLeft_27
%     x_28(1) <= widthLeft_28
%     x_29(1) <= widthLeft_29
%     x_30(1) <= widthLeft_30
%     x_31(1) <= widthLeft_31
%     x_32(1) <= widthLeft_32
%     x_33(1) <= widthLeft_33
%     x_34(1) <= widthLeft_34
%     x_35(1) <= widthLeft_35
%     x_36(1) <= widthLeft_36
%     x_37(1) <= widthLeft_37
%     x_38(1) <= widthLeft_38
%     x_39(1) <= widthLeft_39
%     x_40(1) <= widthLeft_40
%     x_41(1) <= widthLeft_41
%     x_42(1) <= widthLeft_42
%     x_43(1) <= widthLeft_43
%     x_44(1) <= widthLeft_44
%     x_45(1) <= widthLeft_45
%     x_46(1) <= widthLeft_46
%     x_47(1) <= widthLeft_47
%     x_48(1) <= widthLeft_48
%     x_49(1) <= widthLeft_49
%     x_50(1) <= widthLeft_50
%     x_51(1) <= widthLeft_51
%     x_52(1) <= widthLeft_52
%     x_53(1) <= widthLeft_53
%     x_54(1) <= widthLeft_54
%     x_55(1) <= widthLeft_55
%     x_56(1) <= widthLeft_56
%     x_57(1) <= widthLeft_57
%     x_58(1) <= widthLeft_58
%     x_59(1) <= widthLeft_59
%     x_60(1) <= widthLeft_60
%     x_61(1) <= widthLeft_61
%     x_62(1) <= widthLeft_62
%     x_63(1) <= widthLeft_63
%     x_64(1) <= widthLeft_64
%     x_65(1) <= widthLeft_65
%     x_66(1) <= widthLeft_66
%     x_67(1) <= widthLeft_67
%     x_68(1) <= widthLeft_68
%     x_69(1) <= widthLeft_69
%     x_70(1) <= widthLeft_70
%     x_71(1) <= widthLeft_71
%     x_72(1) <= widthLeft_72
%     x_73(1) <= widthLeft_73
%     x_74(1) <= widthLeft_74
%     x_75(1) <= widthLeft_75
%     x_76(1) <= widthLeft_76
%     x_77(1) <= widthLeft_77
%     x_78(1) <= widthLeft_78
%     x_79(1) <= widthLeft_79
%     x_80(1) <= widthLeft_80
%     x_81(1) <= widthLeft_81
%     x_82(1) <= widthLeft_82
%     x_83(1) <= widthLeft_83
%     x_84(1) <= widthLeft_84
%     x_85(1) <= widthLeft_85
%     x_86(1) <= widthLeft_86
%     x_87(1) <= widthLeft_87
%     x_88(1) <= widthLeft_88
%     x_89(1) <= widthLeft_89
%     x_90(1) <= widthLeft_90
%     x_91(1) <= widthLeft_91
%     x_92(1) <= widthLeft_92
%     x_93(1) <= widthLeft_93
%     x_94(1) <= widthLeft_94
%     x_95(1) <= widthLeft_95
%     x_1(1) >= widthRight_1
%     x_2(1) >= widthRight_2
%     x_3(1) >= widthRight_3
%     x_4(1) >= widthRight_4
%     x_5(1) >= widthRight_5
%     x_6(1) >= widthRight_6
%     x_7(1) >= widthRight_7
%     x_8(1) >= widthRight_8
%     x_9(1) >= widthRight_9
%     x_10(1) >= widthRight_10
%     x_11(1) >= widthRight_11
%     x_12(1) >= widthRight_12
%     x_13(1) >= widthRight_13
%     x_14(1) >= widthRight_14
%     x_15(1) >= widthRight_15
%     x_16(1) >= widthRight_16
%     x_17(1) >= widthRight_17
%     x_18(1) >= widthRight_18
%     x_19(1) >= widthRight_19
%     x_20(1) >= widthRight_20
%     x_21(1) >= widthRight_21
%     x_22(1) >= widthRight_22
%     x_23(1) >= widthRight_23
%     x_24(1) >= widthRight_24
%     x_25(1) >= widthRight_25
%     x_26(1) >= widthRight_26
%     x_27(1) >= widthRight_27
%     x_28(1) >= widthRight_28
%     x_29(1) >= widthRight_29
%     x_30(1) >= widthRight_30
%     x_31(1) >= widthRight_31
%     x_32(1) >= widthRight_32
%     x_33(1) >= widthRight_33
%     x_34(1) >= widthRight_34
%     x_35(1) >= widthRight_35
%     x_36(1) >= widthRight_36
%     x_37(1) >= widthRight_37
%     x_38(1) >= widthRight_38
%     x_39(1) >= widthRight_39
%     x_40(1) >= widthRight_40
%     x_41(1) >= widthRight_41
%     x_42(1) >= widthRight_42
%     x_43(1) >= widthRight_43
%     x_44(1) >= widthRight_44
%     x_45(1) >= widthRight_45
%     x_46(1) >= widthRight_46
%     x_47(1) >= widthRight_47
%     x_48(1) >= widthRight_48
%     x_49(1) >= widthRight_49
%     x_50(1) >= widthRight_50
%     x_51(1) >= widthRight_51
%     x_52(1) >= widthRight_52
%     x_53(1) >= widthRight_53
%     x_54(1) >= widthRight_54
%     x_55(1) >= widthRight_55
%     x_56(1) >= widthRight_56
%     x_57(1) >= widthRight_57
%     x_58(1) >= widthRight_58
%     x_59(1) >= widthRight_59
%     x_60(1) >= widthRight_60
%     x_61(1) >= widthRight_61
%     x_62(1) >= widthRight_62
%     x_63(1) >= widthRight_63
%     x_64(1) >= widthRight_64
%     x_65(1) >= widthRight_65
%     x_66(1) >= widthRight_66
%     x_67(1) >= widthRight_67
%     x_68(1) >= widthRight_68
%     x_69(1) >= widthRight_69
%     x_70(1) >= widthRight_70
%     x_71(1) >= widthRight_71
%     x_72(1) >= widthRight_72
%     x_73(1) >= widthRight_73
%     x_74(1) >= widthRight_74
%     x_75(1) >= widthRight_75
%     x_76(1) >= widthRight_76
%     x_77(1) >= widthRight_77
%     x_78(1) >= widthRight_78
%     x_79(1) >= widthRight_79
%     x_80(1) >= widthRight_80
%     x_81(1) >= widthRight_81
%     x_82(1) >= widthRight_82
%     x_83(1) >= widthRight_83
%     x_84(1) >= widthRight_84
%     x_85(1) >= widthRight_85
%     x_86(1) >= widthRight_86
%     x_87(1) >= widthRight_87
%     x_88(1) >= widthRight_88
%     x_89(1) >= widthRight_89
%     x_90(1) >= widthRight_90
%     x_91(1) >= widthRight_91
%     x_92(1) >= widthRight_92
%     x_93(1) >= widthRight_93
%     x_94(1) >= widthRight_94
%     x_95(1) >= widthRight_95
%
% with variables
%  delta_1   1 x 1
%  delta_2   1 x 1
%  delta_3   1 x 1
%  delta_4   1 x 1
%  delta_5   1 x 1
%  delta_6   1 x 1
%  delta_7   1 x 1
%  delta_8   1 x 1
%  delta_9   1 x 1
% delta_10   1 x 1
% delta_11   1 x 1
% delta_12   1 x 1
% delta_13   1 x 1
% delta_14   1 x 1
% delta_15   1 x 1
% delta_16   1 x 1
% delta_17   1 x 1
% delta_18   1 x 1
% delta_19   1 x 1
% delta_20   1 x 1
% delta_21   1 x 1
% delta_22   1 x 1
% delta_23   1 x 1
% delta_24   1 x 1
% delta_25   1 x 1
% delta_26   1 x 1
% delta_27   1 x 1
% delta_28   1 x 1
% delta_29   1 x 1
% delta_30   1 x 1
% delta_31   1 x 1
% delta_32   1 x 1
% delta_33   1 x 1
% delta_34   1 x 1
% delta_35   1 x 1
% delta_36   1 x 1
% delta_37   1 x 1
% delta_38   1 x 1
% delta_39   1 x 1
% delta_40   1 x 1
% delta_41   1 x 1
% delta_42   1 x 1
% delta_43   1 x 1
% delta_44   1 x 1
% delta_45   1 x 1
% delta_46   1 x 1
% delta_47   1 x 1
% delta_48   1 x 1
% delta_49   1 x 1
% delta_50   1 x 1
% delta_51   1 x 1
% delta_52   1 x 1
% delta_53   1 x 1
% delta_54   1 x 1
% delta_55   1 x 1
% delta_56   1 x 1
% delta_57   1 x 1
% delta_58   1 x 1
% delta_59   1 x 1
% delta_60   1 x 1
% delta_61   1 x 1
% delta_62   1 x 1
% delta_63   1 x 1
% delta_64   1 x 1
% delta_65   1 x 1
% delta_66   1 x 1
% delta_67   1 x 1
% delta_68   1 x 1
% delta_69   1 x 1
% delta_70   1 x 1
% delta_71   1 x 1
% delta_72   1 x 1
% delta_73   1 x 1
% delta_74   1 x 1
% delta_75   1 x 1
% delta_76   1 x 1
% delta_77   1 x 1
% delta_78   1 x 1
% delta_79   1 x 1
% delta_80   1 x 1
% delta_81   1 x 1
% delta_82   1 x 1
% delta_83   1 x 1
% delta_84   1 x 1
% delta_85   1 x 1
% delta_86   1 x 1
% delta_87   1 x 1
% delta_88   1 x 1
% delta_89   1 x 1
% delta_90   1 x 1
% delta_91   1 x 1
% delta_92   1 x 1
% delta_93   1 x 1
% delta_94   1 x 1
% delta_95   1 x 1
%      x_1   4 x 1
%      x_2   4 x 1
%      x_3   4 x 1
%      x_4   4 x 1
%      x_5   4 x 1
%      x_6   4 x 1
%      x_7   4 x 1
%      x_8   4 x 1
%      x_9   4 x 1
%     x_10   4 x 1
%     x_11   4 x 1
%     x_12   4 x 1
%     x_13   4 x 1
%     x_14   4 x 1
%     x_15   4 x 1
%     x_16   4 x 1
%     x_17   4 x 1
%     x_18   4 x 1
%     x_19   4 x 1
%     x_20   4 x 1
%     x_21   4 x 1
%     x_22   4 x 1
%     x_23   4 x 1
%     x_24   4 x 1
%     x_25   4 x 1
%     x_26   4 x 1
%     x_27   4 x 1
%     x_28   4 x 1
%     x_29   4 x 1
%     x_30   4 x 1
%     x_31   4 x 1
%     x_32   4 x 1
%     x_33   4 x 1
%     x_34   4 x 1
%     x_35   4 x 1
%     x_36   4 x 1
%     x_37   4 x 1
%     x_38   4 x 1
%     x_39   4 x 1
%     x_40   4 x 1
%     x_41   4 x 1
%     x_42   4 x 1
%     x_43   4 x 1
%     x_44   4 x 1
%     x_45   4 x 1
%     x_46   4 x 1
%     x_47   4 x 1
%     x_48   4 x 1
%     x_49   4 x 1
%     x_50   4 x 1
%     x_51   4 x 1
%     x_52   4 x 1
%     x_53   4 x 1
%     x_54   4 x 1
%     x_55   4 x 1
%     x_56   4 x 1
%     x_57   4 x 1
%     x_58   4 x 1
%     x_59   4 x 1
%     x_60   4 x 1
%     x_61   4 x 1
%     x_62   4 x 1
%     x_63   4 x 1
%     x_64   4 x 1
%     x_65   4 x 1
%     x_66   4 x 1
%     x_67   4 x 1
%     x_68   4 x 1
%     x_69   4 x 1
%     x_70   4 x 1
%     x_71   4 x 1
%     x_72   4 x 1
%     x_73   4 x 1
%     x_74   4 x 1
%     x_75   4 x 1
%     x_76   4 x 1
%     x_77   4 x 1
%     x_78   4 x 1
%     x_79   4 x 1
%     x_80   4 x 1
%     x_81   4 x 1
%     x_82   4 x 1
%     x_83   4 x 1
%     x_84   4 x 1
%     x_85   4 x 1
%     x_86   4 x 1
%     x_87   4 x 1
%     x_88   4 x 1
%     x_89   4 x 1
%     x_90   4 x 1
%     x_91   4 x 1
%     x_92   4 x 1
%     x_93   4 x 1
%     x_94   4 x 1
%     x_95   4 x 1
%
% and parameters
%      A_1   4 x 4
%      A_2   4 x 4
%      A_3   4 x 4
%      A_4   4 x 4
%      A_5   4 x 4
%      A_6   4 x 4
%      A_7   4 x 4
%      A_8   4 x 4
%      A_9   4 x 4
%     A_10   4 x 4
%     A_11   4 x 4
%     A_12   4 x 4
%     A_13   4 x 4
%     A_14   4 x 4
%     A_15   4 x 4
%     A_16   4 x 4
%     A_17   4 x 4
%     A_18   4 x 4
%     A_19   4 x 4
%     A_20   4 x 4
%     A_21   4 x 4
%     A_22   4 x 4
%     A_23   4 x 4
%     A_24   4 x 4
%     A_25   4 x 4
%     A_26   4 x 4
%     A_27   4 x 4
%     A_28   4 x 4
%     A_29   4 x 4
%     A_30   4 x 4
%     A_31   4 x 4
%     A_32   4 x 4
%     A_33   4 x 4
%     A_34   4 x 4
%     A_35   4 x 4
%     A_36   4 x 4
%     A_37   4 x 4
%     A_38   4 x 4
%     A_39   4 x 4
%     A_40   4 x 4
%     A_41   4 x 4
%     A_42   4 x 4
%     A_43   4 x 4
%     A_44   4 x 4
%     A_45   4 x 4
%     A_46   4 x 4
%     A_47   4 x 4
%     A_48   4 x 4
%     A_49   4 x 4
%     A_50   4 x 4
%     A_51   4 x 4
%     A_52   4 x 4
%     A_53   4 x 4
%     A_54   4 x 4
%     A_55   4 x 4
%     A_56   4 x 4
%     A_57   4 x 4
%     A_58   4 x 4
%     A_59   4 x 4
%     A_60   4 x 4
%     A_61   4 x 4
%     A_62   4 x 4
%     A_63   4 x 4
%     A_64   4 x 4
%     A_65   4 x 4
%     A_66   4 x 4
%     A_67   4 x 4
%     A_68   4 x 4
%     A_69   4 x 4
%     A_70   4 x 4
%     A_71   4 x 4
%     A_72   4 x 4
%     A_73   4 x 4
%     A_74   4 x 4
%     A_75   4 x 4
%     A_76   4 x 4
%     A_77   4 x 4
%     A_78   4 x 4
%     A_79   4 x 4
%     A_80   4 x 4
%     A_81   4 x 4
%     A_82   4 x 4
%     A_83   4 x 4
%     A_84   4 x 4
%     A_85   4 x 4
%     A_86   4 x 4
%     A_87   4 x 4
%     A_88   4 x 4
%     A_89   4 x 4
%     A_90   4 x 4
%     A_91   4 x 4
%     A_92   4 x 4
%     A_93   4 x 4
%     A_94   4 x 4
%      B_1   4 x 1
%      B_2   4 x 1
%      B_3   4 x 1
%      B_4   4 x 1
%      B_5   4 x 1
%      B_6   4 x 1
%      B_7   4 x 1
%      B_8   4 x 1
%      B_9   4 x 1
%     B_10   4 x 1
%     B_11   4 x 1
%     B_12   4 x 1
%     B_13   4 x 1
%     B_14   4 x 1
%     B_15   4 x 1
%     B_16   4 x 1
%     B_17   4 x 1
%     B_18   4 x 1
%     B_19   4 x 1
%     B_20   4 x 1
%     B_21   4 x 1
%     B_22   4 x 1
%     B_23   4 x 1
%     B_24   4 x 1
%     B_25   4 x 1
%     B_26   4 x 1
%     B_27   4 x 1
%     B_28   4 x 1
%     B_29   4 x 1
%     B_30   4 x 1
%     B_31   4 x 1
%     B_32   4 x 1
%     B_33   4 x 1
%     B_34   4 x 1
%     B_35   4 x 1
%     B_36   4 x 1
%     B_37   4 x 1
%     B_38   4 x 1
%     B_39   4 x 1
%     B_40   4 x 1
%     B_41   4 x 1
%     B_42   4 x 1
%     B_43   4 x 1
%     B_44   4 x 1
%     B_45   4 x 1
%     B_46   4 x 1
%     B_47   4 x 1
%     B_48   4 x 1
%     B_49   4 x 1
%     B_50   4 x 1
%     B_51   4 x 1
%     B_52   4 x 1
%     B_53   4 x 1
%     B_54   4 x 1
%     B_55   4 x 1
%     B_56   4 x 1
%     B_57   4 x 1
%     B_58   4 x 1
%     B_59   4 x 1
%     B_60   4 x 1
%     B_61   4 x 1
%     B_62   4 x 1
%     B_63   4 x 1
%     B_64   4 x 1
%     B_65   4 x 1
%     B_66   4 x 1
%     B_67   4 x 1
%     B_68   4 x 1
%     B_69   4 x 1
%     B_70   4 x 1
%     B_71   4 x 1
%     B_72   4 x 1
%     B_73   4 x 1
%     B_74   4 x 1
%     B_75   4 x 1
%     B_76   4 x 1
%     B_77   4 x 1
%     B_78   4 x 1
%     B_79   4 x 1
%     B_80   4 x 1
%     B_81   4 x 1
%     B_82   4 x 1
%     B_83   4 x 1
%     B_84   4 x 1
%     B_85   4 x 1
%     B_86   4 x 1
%     B_87   4 x 1
%     B_88   4 x 1
%     B_89   4 x 1
%     B_90   4 x 1
%     B_91   4 x 1
%     B_92   4 x 1
%     B_93   4 x 1
%     B_94   4 x 1
%  W_delta   1 x 1    positive, PSD
%    W_psi   1 x 1    positive, PSD
%      d_1   4 x 1
%      d_2   4 x 1
%      d_3   4 x 1
%      d_4   4 x 1
%      d_5   4 x 1
%      d_6   4 x 1
%      d_7   4 x 1
%      d_8   4 x 1
%      d_9   4 x 1
%     d_10   4 x 1
%     d_11   4 x 1
%     d_12   4 x 1
%     d_13   4 x 1
%     d_14   4 x 1
%     d_15   4 x 1
%     d_16   4 x 1
%     d_17   4 x 1
%     d_18   4 x 1
%     d_19   4 x 1
%     d_20   4 x 1
%     d_21   4 x 1
%     d_22   4 x 1
%     d_23   4 x 1
%     d_24   4 x 1
%     d_25   4 x 1
%     d_26   4 x 1
%     d_27   4 x 1
%     d_28   4 x 1
%     d_29   4 x 1
%     d_30   4 x 1
%     d_31   4 x 1
%     d_32   4 x 1
%     d_33   4 x 1
%     d_34   4 x 1
%     d_35   4 x 1
%     d_36   4 x 1
%     d_37   4 x 1
%     d_38   4 x 1
%     d_39   4 x 1
%     d_40   4 x 1
%     d_41   4 x 1
%     d_42   4 x 1
%     d_43   4 x 1
%     d_44   4 x 1
%     d_45   4 x 1
%     d_46   4 x 1
%     d_47   4 x 1
%     d_48   4 x 1
%     d_49   4 x 1
%     d_50   4 x 1
%     d_51   4 x 1
%     d_52   4 x 1
%     d_53   4 x 1
%     d_54   4 x 1
%     d_55   4 x 1
%     d_56   4 x 1
%     d_57   4 x 1
%     d_58   4 x 1
%     d_59   4 x 1
%     d_60   4 x 1
%     d_61   4 x 1
%     d_62   4 x 1
%     d_63   4 x 1
%     d_64   4 x 1
%     d_65   4 x 1
%     d_66   4 x 1
%     d_67   4 x 1
%     d_68   4 x 1
%     d_69   4 x 1
%     d_70   4 x 1
%     d_71   4 x 1
%     d_72   4 x 1
%     d_73   4 x 1
%     d_74   4 x 1
%     d_75   4 x 1
%     d_76   4 x 1
%     d_77   4 x 1
%     d_78   4 x 1
%     d_79   4 x 1
%     d_80   4 x 1
%     d_81   4 x 1
%     d_82   4 x 1
%     d_83   4 x 1
%     d_84   4 x 1
%     d_85   4 x 1
%     d_86   4 x 1
%     d_87   4 x 1
%     d_88   4 x 1
%     d_89   4 x 1
%     d_90   4 x 1
%     d_91   4 x 1
%     d_92   4 x 1
%     d_93   4 x 1
%     d_94   4 x 1
%     ds_1   1 x 1
%     ds_2   1 x 1
%     ds_3   1 x 1
%     ds_4   1 x 1
%     ds_5   1 x 1
%     ds_6   1 x 1
%     ds_7   1 x 1
%     ds_8   1 x 1
%     ds_9   1 x 1
%    ds_10   1 x 1
%    ds_11   1 x 1
%    ds_12   1 x 1
%    ds_13   1 x 1
%    ds_14   1 x 1
%    ds_15   1 x 1
%    ds_16   1 x 1
%    ds_17   1 x 1
%    ds_18   1 x 1
%    ds_19   1 x 1
%    ds_20   1 x 1
%    ds_21   1 x 1
%    ds_22   1 x 1
%    ds_23   1 x 1
%    ds_24   1 x 1
%    ds_25   1 x 1
%    ds_26   1 x 1
%    ds_27   1 x 1
%    ds_28   1 x 1
%    ds_29   1 x 1
%    ds_30   1 x 1
%    ds_31   1 x 1
%    ds_32   1 x 1
%    ds_33   1 x 1
%    ds_34   1 x 1
%    ds_35   1 x 1
%    ds_36   1 x 1
%    ds_37   1 x 1
%    ds_38   1 x 1
%    ds_39   1 x 1
%    ds_40   1 x 1
%    ds_41   1 x 1
%    ds_42   1 x 1
%    ds_43   1 x 1
%    ds_44   1 x 1
%    ds_45   1 x 1
%    ds_46   1 x 1
%    ds_47   1 x 1
%    ds_48   1 x 1
%    ds_49   1 x 1
%    ds_50   1 x 1
%    ds_51   1 x 1
%    ds_52   1 x 1
%    ds_53   1 x 1
%    ds_54   1 x 1
%    ds_55   1 x 1
%    ds_56   1 x 1
%    ds_57   1 x 1
%    ds_58   1 x 1
%    ds_59   1 x 1
%    ds_60   1 x 1
%    ds_61   1 x 1
%    ds_62   1 x 1
%    ds_63   1 x 1
%    ds_64   1 x 1
%    ds_65   1 x 1
%    ds_66   1 x 1
%    ds_67   1 x 1
%    ds_68   1 x 1
%    ds_69   1 x 1
%    ds_70   1 x 1
%    ds_71   1 x 1
%    ds_72   1 x 1
%    ds_73   1 x 1
%    ds_74   1 x 1
%    ds_75   1 x 1
%    ds_76   1 x 1
%    ds_77   1 x 1
%    ds_78   1 x 1
%    ds_79   1 x 1
%    ds_80   1 x 1
%    ds_81   1 x 1
%    ds_82   1 x 1
%    ds_83   1 x 1
%    ds_84   1 x 1
%    ds_85   1 x 1
%    ds_86   1 x 1
%    ds_87   1 x 1
%    ds_88   1 x 1
%    ds_89   1 x 1
%    ds_90   1 x 1
%    ds_91   1 x 1
%    ds_92   1 x 1
%    ds_93   1 x 1
%    ds_94   1 x 1
%   psiR_1   1 x 1
%   psiR_2   1 x 1
%   psiR_3   1 x 1
%   psiR_4   1 x 1
%   psiR_5   1 x 1
%   psiR_6   1 x 1
%   psiR_7   1 x 1
%   psiR_8   1 x 1
%   psiR_9   1 x 1
%  psiR_10   1 x 1
%  psiR_11   1 x 1
%  psiR_12   1 x 1
%  psiR_13   1 x 1
%  psiR_14   1 x 1
%  psiR_15   1 x 1
%  psiR_16   1 x 1
%  psiR_17   1 x 1
%  psiR_18   1 x 1
%  psiR_19   1 x 1
%  psiR_20   1 x 1
%  psiR_21   1 x 1
%  psiR_22   1 x 1
%  psiR_23   1 x 1
%  psiR_24   1 x 1
%  psiR_25   1 x 1
%  psiR_26   1 x 1
%  psiR_27   1 x 1
%  psiR_28   1 x 1
%  psiR_29   1 x 1
%  psiR_30   1 x 1
%  psiR_31   1 x 1
%  psiR_32   1 x 1
%  psiR_33   1 x 1
%  psiR_34   1 x 1
%  psiR_35   1 x 1
%  psiR_36   1 x 1
%  psiR_37   1 x 1
%  psiR_38   1 x 1
%  psiR_39   1 x 1
%  psiR_40   1 x 1
%  psiR_41   1 x 1
%  psiR_42   1 x 1
%  psiR_43   1 x 1
%  psiR_44   1 x 1
%  psiR_45   1 x 1
%  psiR_46   1 x 1
%  psiR_47   1 x 1
%  psiR_48   1 x 1
%  psiR_49   1 x 1
%  psiR_50   1 x 1
%  psiR_51   1 x 1
%  psiR_52   1 x 1
%  psiR_53   1 x 1
%  psiR_54   1 x 1
%  psiR_55   1 x 1
%  psiR_56   1 x 1
%  psiR_57   1 x 1
%  psiR_58   1 x 1
%  psiR_59   1 x 1
%  psiR_60   1 x 1
%  psiR_61   1 x 1
%  psiR_62   1 x 1
%  psiR_63   1 x 1
%  psiR_64   1 x 1
%  psiR_65   1 x 1
%  psiR_66   1 x 1
%  psiR_67   1 x 1
%  psiR_68   1 x 1
%  psiR_69   1 x 1
%  psiR_70   1 x 1
%  psiR_71   1 x 1
%  psiR_72   1 x 1
%  psiR_73   1 x 1
%  psiR_74   1 x 1
%  psiR_75   1 x 1
%  psiR_76   1 x 1
%  psiR_77   1 x 1
%  psiR_78   1 x 1
%  psiR_79   1 x 1
%  psiR_80   1 x 1
%  psiR_81   1 x 1
%  psiR_82   1 x 1
%  psiR_83   1 x 1
%  psiR_84   1 x 1
%  psiR_85   1 x 1
%  psiR_86   1 x 1
%  psiR_87   1 x 1
%  psiR_88   1 x 1
%  psiR_89   1 x 1
%  psiR_90   1 x 1
%  psiR_91   1 x 1
%  psiR_92   1 x 1
%  psiR_93   1 x 1
%  psiR_94   1 x 1
%  psiR_95   1 x 1
% widthLeft_1   1 x 1
% widthLeft_2   1 x 1
% widthLeft_3   1 x 1
% widthLeft_4   1 x 1
% widthLeft_5   1 x 1
% widthLeft_6   1 x 1
% widthLeft_7   1 x 1
% widthLeft_8   1 x 1
% widthLeft_9   1 x 1
% widthLeft_10   1 x 1
% widthLeft_11   1 x 1
% widthLeft_12   1 x 1
% widthLeft_13   1 x 1
% widthLeft_14   1 x 1
% widthLeft_15   1 x 1
% widthLeft_16   1 x 1
% widthLeft_17   1 x 1
% widthLeft_18   1 x 1
% widthLeft_19   1 x 1
% widthLeft_20   1 x 1
% widthLeft_21   1 x 1
% widthLeft_22   1 x 1
% widthLeft_23   1 x 1
% widthLeft_24   1 x 1
% widthLeft_25   1 x 1
% widthLeft_26   1 x 1
% widthLeft_27   1 x 1
% widthLeft_28   1 x 1
% widthLeft_29   1 x 1
% widthLeft_30   1 x 1
% widthLeft_31   1 x 1
% widthLeft_32   1 x 1
% widthLeft_33   1 x 1
% widthLeft_34   1 x 1
% widthLeft_35   1 x 1
% widthLeft_36   1 x 1
% widthLeft_37   1 x 1
% widthLeft_38   1 x 1
% widthLeft_39   1 x 1
% widthLeft_40   1 x 1
% widthLeft_41   1 x 1
% widthLeft_42   1 x 1
% widthLeft_43   1 x 1
% widthLeft_44   1 x 1
% widthLeft_45   1 x 1
% widthLeft_46   1 x 1
% widthLeft_47   1 x 1
% widthLeft_48   1 x 1
% widthLeft_49   1 x 1
% widthLeft_50   1 x 1
% widthLeft_51   1 x 1
% widthLeft_52   1 x 1
% widthLeft_53   1 x 1
% widthLeft_54   1 x 1
% widthLeft_55   1 x 1
% widthLeft_56   1 x 1
% widthLeft_57   1 x 1
% widthLeft_58   1 x 1
% widthLeft_59   1 x 1
% widthLeft_60   1 x 1
% widthLeft_61   1 x 1
% widthLeft_62   1 x 1
% widthLeft_63   1 x 1
% widthLeft_64   1 x 1
% widthLeft_65   1 x 1
% widthLeft_66   1 x 1
% widthLeft_67   1 x 1
% widthLeft_68   1 x 1
% widthLeft_69   1 x 1
% widthLeft_70   1 x 1
% widthLeft_71   1 x 1
% widthLeft_72   1 x 1
% widthLeft_73   1 x 1
% widthLeft_74   1 x 1
% widthLeft_75   1 x 1
% widthLeft_76   1 x 1
% widthLeft_77   1 x 1
% widthLeft_78   1 x 1
% widthLeft_79   1 x 1
% widthLeft_80   1 x 1
% widthLeft_81   1 x 1
% widthLeft_82   1 x 1
% widthLeft_83   1 x 1
% widthLeft_84   1 x 1
% widthLeft_85   1 x 1
% widthLeft_86   1 x 1
% widthLeft_87   1 x 1
% widthLeft_88   1 x 1
% widthLeft_89   1 x 1
% widthLeft_90   1 x 1
% widthLeft_91   1 x 1
% widthLeft_92   1 x 1
% widthLeft_93   1 x 1
% widthLeft_94   1 x 1
% widthLeft_95   1 x 1
% widthRight_1   1 x 1
% widthRight_2   1 x 1
% widthRight_3   1 x 1
% widthRight_4   1 x 1
% widthRight_5   1 x 1
% widthRight_6   1 x 1
% widthRight_7   1 x 1
% widthRight_8   1 x 1
% widthRight_9   1 x 1
% widthRight_10   1 x 1
% widthRight_11   1 x 1
% widthRight_12   1 x 1
% widthRight_13   1 x 1
% widthRight_14   1 x 1
% widthRight_15   1 x 1
% widthRight_16   1 x 1
% widthRight_17   1 x 1
% widthRight_18   1 x 1
% widthRight_19   1 x 1
% widthRight_20   1 x 1
% widthRight_21   1 x 1
% widthRight_22   1 x 1
% widthRight_23   1 x 1
% widthRight_24   1 x 1
% widthRight_25   1 x 1
% widthRight_26   1 x 1
% widthRight_27   1 x 1
% widthRight_28   1 x 1
% widthRight_29   1 x 1
% widthRight_30   1 x 1
% widthRight_31   1 x 1
% widthRight_32   1 x 1
% widthRight_33   1 x 1
% widthRight_34   1 x 1
% widthRight_35   1 x 1
% widthRight_36   1 x 1
% widthRight_37   1 x 1
% widthRight_38   1 x 1
% widthRight_39   1 x 1
% widthRight_40   1 x 1
% widthRight_41   1 x 1
% widthRight_42   1 x 1
% widthRight_43   1 x 1
% widthRight_44   1 x 1
% widthRight_45   1 x 1
% widthRight_46   1 x 1
% widthRight_47   1 x 1
% widthRight_48   1 x 1
% widthRight_49   1 x 1
% widthRight_50   1 x 1
% widthRight_51   1 x 1
% widthRight_52   1 x 1
% widthRight_53   1 x 1
% widthRight_54   1 x 1
% widthRight_55   1 x 1
% widthRight_56   1 x 1
% widthRight_57   1 x 1
% widthRight_58   1 x 1
% widthRight_59   1 x 1
% widthRight_60   1 x 1
% widthRight_61   1 x 1
% widthRight_62   1 x 1
% widthRight_63   1 x 1
% widthRight_64   1 x 1
% widthRight_65   1 x 1
% widthRight_66   1 x 1
% widthRight_67   1 x 1
% widthRight_68   1 x 1
% widthRight_69   1 x 1
% widthRight_70   1 x 1
% widthRight_71   1 x 1
% widthRight_72   1 x 1
% widthRight_73   1 x 1
% widthRight_74   1 x 1
% widthRight_75   1 x 1
% widthRight_76   1 x 1
% widthRight_77   1 x 1
% widthRight_78   1 x 1
% widthRight_79   1 x 1
% widthRight_80   1 x 1
% widthRight_81   1 x 1
% widthRight_82   1 x 1
% widthRight_83   1 x 1
% widthRight_84   1 x 1
% widthRight_85   1 x 1
% widthRight_86   1 x 1
% widthRight_87   1 x 1
% widthRight_88   1 x 1
% widthRight_89   1 x 1
% widthRight_90   1 x 1
% widthRight_91   1 x 1
% widthRight_92   1 x 1
% widthRight_93   1 x 1
% widthRight_94   1 x 1
% widthRight_95   1 x 1
%      x_0   4 x 1
%
% Note:
%   - Check status.converged, which will be 1 if optimization succeeded.
%   - You don't have to specify settings if you don't want to.
%   - To hide output, use settings.verbose = 0.
%   - To change iterations, use settings.max_iters = 20.
%   - You may wish to compare with cvxsolve to check the solver is correct.
%
% Specify params.A_1, ..., params.x_0, then run
%   [vars, status] = csolve(params, settings)
% Produced by CVXGEN, 2015-09-15 02:48:02 -0400.
% CVXGEN is Copyright (C) 2006-2012 Jacob Mattingley, jem@cvxgen.com.
% The code in this file is Copyright (C) 2006-2012 Jacob Mattingley.
% CVXGEN, or solvers produced by CVXGEN, cannot be used for commercial
% applications without prior written permission from Jacob Mattingley.

% Filename: csolve.m.
% Description: Help file for the Matlab solver interface.
