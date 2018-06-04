/* Produced by CVXGEN, 2015-09-15 02:49:58 -0400.  */
/* CVXGEN is Copyright (C) 2006-2012 Jacob Mattingley, jem@cvxgen.com. */
/* The code in this file is Copyright (C) 2006-2012 Jacob Mattingley. */
/* CVXGEN, or solvers produced by CVXGEN, cannot be used for commercial */
/* applications without prior written permission from Jacob Mattingley. */

/* Filename: solver.h. */
/* Description: Header file with relevant definitions. */
#ifndef SOLVER_H
#define SOLVER_H
/* Uncomment the next line to remove all library dependencies. */
/*#define ZERO_LIBRARY_MODE */
#ifdef MATLAB_MEX_FILE
/* Matlab functions. MATLAB_MEX_FILE will be defined by the mex compiler. */
/* If you are not using the mex compiler, this functionality will not intrude, */
/* as it will be completely disabled at compile-time. */
#include "mex.h"
#else
#ifndef ZERO_LIBRARY_MODE
#include <stdio.h>
#endif
#endif
/* Space must be allocated somewhere (testsolver.c, csolve.c or your own */
/* program) for the global variables vars, params, work and settings. */
/* At the bottom of this file, they are externed. */
#ifndef ZERO_LIBRARY_MODE
#include <math.h>
#define pm(A, m, n) printmatrix(#A, A, m, n, 1)
#endif
typedef struct Params_t {
  double ds_1[1];
  double psiR_2[1];
  double psiR_1[1];
  double W_psi[1];
  double ds_2[1];
  double psiR_3[1];
  double ds_3[1];
  double psiR_4[1];
  double ds_4[1];
  double psiR_5[1];
  double ds_5[1];
  double psiR_6[1];
  double ds_6[1];
  double psiR_7[1];
  double ds_7[1];
  double psiR_8[1];
  double ds_8[1];
  double psiR_9[1];
  double ds_9[1];
  double psiR_10[1];
  double ds_10[1];
  double psiR_11[1];
  double ds_11[1];
  double psiR_12[1];
  double ds_12[1];
  double psiR_13[1];
  double ds_13[1];
  double psiR_14[1];
  double ds_14[1];
  double psiR_15[1];
  double ds_15[1];
  double psiR_16[1];
  double ds_16[1];
  double psiR_17[1];
  double ds_17[1];
  double psiR_18[1];
  double ds_18[1];
  double psiR_19[1];
  double ds_19[1];
  double psiR_20[1];
  double ds_20[1];
  double psiR_21[1];
  double ds_21[1];
  double psiR_22[1];
  double ds_22[1];
  double psiR_23[1];
  double ds_23[1];
  double psiR_24[1];
  double ds_24[1];
  double psiR_25[1];
  double ds_25[1];
  double psiR_26[1];
  double ds_26[1];
  double psiR_27[1];
  double ds_27[1];
  double psiR_28[1];
  double ds_28[1];
  double psiR_29[1];
  double ds_29[1];
  double psiR_30[1];
  double ds_30[1];
  double psiR_31[1];
  double ds_31[1];
  double psiR_32[1];
  double ds_32[1];
  double psiR_33[1];
  double ds_33[1];
  double psiR_34[1];
  double ds_34[1];
  double psiR_35[1];
  double ds_35[1];
  double psiR_36[1];
  double ds_36[1];
  double psiR_37[1];
  double ds_37[1];
  double psiR_38[1];
  double ds_38[1];
  double psiR_39[1];
  double ds_39[1];
  double psiR_40[1];
  double ds_40[1];
  double psiR_41[1];
  double ds_41[1];
  double psiR_42[1];
  double ds_42[1];
  double psiR_43[1];
  double ds_43[1];
  double psiR_44[1];
  double ds_44[1];
  double psiR_45[1];
  double ds_45[1];
  double psiR_46[1];
  double ds_46[1];
  double psiR_47[1];
  double ds_47[1];
  double psiR_48[1];
  double ds_48[1];
  double psiR_49[1];
  double ds_49[1];
  double psiR_50[1];
  double ds_50[1];
  double psiR_51[1];
  double ds_51[1];
  double psiR_52[1];
  double ds_52[1];
  double psiR_53[1];
  double ds_53[1];
  double psiR_54[1];
  double ds_54[1];
  double psiR_55[1];
  double ds_55[1];
  double psiR_56[1];
  double ds_56[1];
  double psiR_57[1];
  double ds_57[1];
  double psiR_58[1];
  double ds_58[1];
  double psiR_59[1];
  double ds_59[1];
  double psiR_60[1];
  double ds_60[1];
  double psiR_61[1];
  double ds_61[1];
  double psiR_62[1];
  double ds_62[1];
  double psiR_63[1];
  double ds_63[1];
  double psiR_64[1];
  double ds_64[1];
  double psiR_65[1];
  double ds_65[1];
  double psiR_66[1];
  double ds_66[1];
  double psiR_67[1];
  double ds_67[1];
  double psiR_68[1];
  double ds_68[1];
  double psiR_69[1];
  double ds_69[1];
  double psiR_70[1];
  double ds_70[1];
  double psiR_71[1];
  double ds_71[1];
  double psiR_72[1];
  double ds_72[1];
  double psiR_73[1];
  double ds_73[1];
  double psiR_74[1];
  double ds_74[1];
  double psiR_75[1];
  double ds_75[1];
  double psiR_76[1];
  double ds_76[1];
  double psiR_77[1];
  double ds_77[1];
  double psiR_78[1];
  double ds_78[1];
  double psiR_79[1];
  double ds_79[1];
  double psiR_80[1];
  double ds_80[1];
  double psiR_81[1];
  double ds_81[1];
  double psiR_82[1];
  double ds_82[1];
  double psiR_83[1];
  double ds_83[1];
  double psiR_84[1];
  double ds_84[1];
  double psiR_85[1];
  double ds_85[1];
  double psiR_86[1];
  double ds_86[1];
  double psiR_87[1];
  double ds_87[1];
  double psiR_88[1];
  double ds_88[1];
  double psiR_89[1];
  double ds_89[1];
  double psiR_90[1];
  double ds_90[1];
  double psiR_91[1];
  double ds_91[1];
  double psiR_92[1];
  double ds_92[1];
  double psiR_93[1];
  double ds_93[1];
  double psiR_94[1];
  double ds_94[1];
  double psiR_95[1];
  double W_delta[1];
  double A_1[16];
  double B_1[4];
  double d_1[4];
  double A_2[16];
  double B_2[4];
  double d_2[4];
  double A_3[16];
  double B_3[4];
  double d_3[4];
  double A_4[16];
  double B_4[4];
  double d_4[4];
  double A_5[16];
  double B_5[4];
  double d_5[4];
  double A_6[16];
  double B_6[4];
  double d_6[4];
  double A_7[16];
  double B_7[4];
  double d_7[4];
  double A_8[16];
  double B_8[4];
  double d_8[4];
  double A_9[16];
  double B_9[4];
  double d_9[4];
  double A_10[16];
  double B_10[4];
  double d_10[4];
  double A_11[16];
  double B_11[4];
  double d_11[4];
  double A_12[16];
  double B_12[4];
  double d_12[4];
  double A_13[16];
  double B_13[4];
  double d_13[4];
  double A_14[16];
  double B_14[4];
  double d_14[4];
  double A_15[16];
  double B_15[4];
  double d_15[4];
  double A_16[16];
  double B_16[4];
  double d_16[4];
  double A_17[16];
  double B_17[4];
  double d_17[4];
  double A_18[16];
  double B_18[4];
  double d_18[4];
  double A_19[16];
  double B_19[4];
  double d_19[4];
  double A_20[16];
  double B_20[4];
  double d_20[4];
  double A_21[16];
  double B_21[4];
  double d_21[4];
  double A_22[16];
  double B_22[4];
  double d_22[4];
  double A_23[16];
  double B_23[4];
  double d_23[4];
  double A_24[16];
  double B_24[4];
  double d_24[4];
  double A_25[16];
  double B_25[4];
  double d_25[4];
  double A_26[16];
  double B_26[4];
  double d_26[4];
  double A_27[16];
  double B_27[4];
  double d_27[4];
  double A_28[16];
  double B_28[4];
  double d_28[4];
  double A_29[16];
  double B_29[4];
  double d_29[4];
  double A_30[16];
  double B_30[4];
  double d_30[4];
  double A_31[16];
  double B_31[4];
  double d_31[4];
  double A_32[16];
  double B_32[4];
  double d_32[4];
  double A_33[16];
  double B_33[4];
  double d_33[4];
  double A_34[16];
  double B_34[4];
  double d_34[4];
  double A_35[16];
  double B_35[4];
  double d_35[4];
  double A_36[16];
  double B_36[4];
  double d_36[4];
  double A_37[16];
  double B_37[4];
  double d_37[4];
  double A_38[16];
  double B_38[4];
  double d_38[4];
  double A_39[16];
  double B_39[4];
  double d_39[4];
  double A_40[16];
  double B_40[4];
  double d_40[4];
  double A_41[16];
  double B_41[4];
  double d_41[4];
  double A_42[16];
  double B_42[4];
  double d_42[4];
  double A_43[16];
  double B_43[4];
  double d_43[4];
  double A_44[16];
  double B_44[4];
  double d_44[4];
  double A_45[16];
  double B_45[4];
  double d_45[4];
  double A_46[16];
  double B_46[4];
  double d_46[4];
  double A_47[16];
  double B_47[4];
  double d_47[4];
  double A_48[16];
  double B_48[4];
  double d_48[4];
  double A_49[16];
  double B_49[4];
  double d_49[4];
  double A_50[16];
  double B_50[4];
  double d_50[4];
  double A_51[16];
  double B_51[4];
  double d_51[4];
  double A_52[16];
  double B_52[4];
  double d_52[4];
  double A_53[16];
  double B_53[4];
  double d_53[4];
  double A_54[16];
  double B_54[4];
  double d_54[4];
  double A_55[16];
  double B_55[4];
  double d_55[4];
  double A_56[16];
  double B_56[4];
  double d_56[4];
  double A_57[16];
  double B_57[4];
  double d_57[4];
  double A_58[16];
  double B_58[4];
  double d_58[4];
  double A_59[16];
  double B_59[4];
  double d_59[4];
  double A_60[16];
  double B_60[4];
  double d_60[4];
  double A_61[16];
  double B_61[4];
  double d_61[4];
  double A_62[16];
  double B_62[4];
  double d_62[4];
  double A_63[16];
  double B_63[4];
  double d_63[4];
  double A_64[16];
  double B_64[4];
  double d_64[4];
  double A_65[16];
  double B_65[4];
  double d_65[4];
  double A_66[16];
  double B_66[4];
  double d_66[4];
  double A_67[16];
  double B_67[4];
  double d_67[4];
  double A_68[16];
  double B_68[4];
  double d_68[4];
  double A_69[16];
  double B_69[4];
  double d_69[4];
  double A_70[16];
  double B_70[4];
  double d_70[4];
  double A_71[16];
  double B_71[4];
  double d_71[4];
  double A_72[16];
  double B_72[4];
  double d_72[4];
  double A_73[16];
  double B_73[4];
  double d_73[4];
  double A_74[16];
  double B_74[4];
  double d_74[4];
  double A_75[16];
  double B_75[4];
  double d_75[4];
  double A_76[16];
  double B_76[4];
  double d_76[4];
  double A_77[16];
  double B_77[4];
  double d_77[4];
  double A_78[16];
  double B_78[4];
  double d_78[4];
  double A_79[16];
  double B_79[4];
  double d_79[4];
  double A_80[16];
  double B_80[4];
  double d_80[4];
  double A_81[16];
  double B_81[4];
  double d_81[4];
  double A_82[16];
  double B_82[4];
  double d_82[4];
  double A_83[16];
  double B_83[4];
  double d_83[4];
  double A_84[16];
  double B_84[4];
  double d_84[4];
  double A_85[16];
  double B_85[4];
  double d_85[4];
  double A_86[16];
  double B_86[4];
  double d_86[4];
  double A_87[16];
  double B_87[4];
  double d_87[4];
  double A_88[16];
  double B_88[4];
  double d_88[4];
  double A_89[16];
  double B_89[4];
  double d_89[4];
  double A_90[16];
  double B_90[4];
  double d_90[4];
  double A_91[16];
  double B_91[4];
  double d_91[4];
  double A_92[16];
  double B_92[4];
  double d_92[4];
  double A_93[16];
  double B_93[4];
  double d_93[4];
  double A_94[16];
  double B_94[4];
  double d_94[4];
  double x_0[4];
  double widthLeft_1[1];
  double widthLeft_2[1];
  double widthLeft_3[1];
  double widthLeft_4[1];
  double widthLeft_5[1];
  double widthLeft_6[1];
  double widthLeft_7[1];
  double widthLeft_8[1];
  double widthLeft_9[1];
  double widthLeft_10[1];
  double widthLeft_11[1];
  double widthLeft_12[1];
  double widthLeft_13[1];
  double widthLeft_14[1];
  double widthLeft_15[1];
  double widthLeft_16[1];
  double widthLeft_17[1];
  double widthLeft_18[1];
  double widthLeft_19[1];
  double widthLeft_20[1];
  double widthLeft_21[1];
  double widthLeft_22[1];
  double widthLeft_23[1];
  double widthLeft_24[1];
  double widthLeft_25[1];
  double widthLeft_26[1];
  double widthLeft_27[1];
  double widthLeft_28[1];
  double widthLeft_29[1];
  double widthLeft_30[1];
  double widthLeft_31[1];
  double widthLeft_32[1];
  double widthLeft_33[1];
  double widthLeft_34[1];
  double widthLeft_35[1];
  double widthLeft_36[1];
  double widthLeft_37[1];
  double widthLeft_38[1];
  double widthLeft_39[1];
  double widthLeft_40[1];
  double widthLeft_41[1];
  double widthLeft_42[1];
  double widthLeft_43[1];
  double widthLeft_44[1];
  double widthLeft_45[1];
  double widthLeft_46[1];
  double widthLeft_47[1];
  double widthLeft_48[1];
  double widthLeft_49[1];
  double widthLeft_50[1];
  double widthLeft_51[1];
  double widthLeft_52[1];
  double widthLeft_53[1];
  double widthLeft_54[1];
  double widthLeft_55[1];
  double widthLeft_56[1];
  double widthLeft_57[1];
  double widthLeft_58[1];
  double widthLeft_59[1];
  double widthLeft_60[1];
  double widthLeft_61[1];
  double widthLeft_62[1];
  double widthLeft_63[1];
  double widthLeft_64[1];
  double widthLeft_65[1];
  double widthLeft_66[1];
  double widthLeft_67[1];
  double widthLeft_68[1];
  double widthLeft_69[1];
  double widthLeft_70[1];
  double widthLeft_71[1];
  double widthLeft_72[1];
  double widthLeft_73[1];
  double widthLeft_74[1];
  double widthLeft_75[1];
  double widthLeft_76[1];
  double widthLeft_77[1];
  double widthLeft_78[1];
  double widthLeft_79[1];
  double widthLeft_80[1];
  double widthLeft_81[1];
  double widthLeft_82[1];
  double widthLeft_83[1];
  double widthLeft_84[1];
  double widthLeft_85[1];
  double widthLeft_86[1];
  double widthLeft_87[1];
  double widthLeft_88[1];
  double widthLeft_89[1];
  double widthLeft_90[1];
  double widthLeft_91[1];
  double widthLeft_92[1];
  double widthLeft_93[1];
  double widthLeft_94[1];
  double widthLeft_95[1];
  double widthRight_1[1];
  double widthRight_2[1];
  double widthRight_3[1];
  double widthRight_4[1];
  double widthRight_5[1];
  double widthRight_6[1];
  double widthRight_7[1];
  double widthRight_8[1];
  double widthRight_9[1];
  double widthRight_10[1];
  double widthRight_11[1];
  double widthRight_12[1];
  double widthRight_13[1];
  double widthRight_14[1];
  double widthRight_15[1];
  double widthRight_16[1];
  double widthRight_17[1];
  double widthRight_18[1];
  double widthRight_19[1];
  double widthRight_20[1];
  double widthRight_21[1];
  double widthRight_22[1];
  double widthRight_23[1];
  double widthRight_24[1];
  double widthRight_25[1];
  double widthRight_26[1];
  double widthRight_27[1];
  double widthRight_28[1];
  double widthRight_29[1];
  double widthRight_30[1];
  double widthRight_31[1];
  double widthRight_32[1];
  double widthRight_33[1];
  double widthRight_34[1];
  double widthRight_35[1];
  double widthRight_36[1];
  double widthRight_37[1];
  double widthRight_38[1];
  double widthRight_39[1];
  double widthRight_40[1];
  double widthRight_41[1];
  double widthRight_42[1];
  double widthRight_43[1];
  double widthRight_44[1];
  double widthRight_45[1];
  double widthRight_46[1];
  double widthRight_47[1];
  double widthRight_48[1];
  double widthRight_49[1];
  double widthRight_50[1];
  double widthRight_51[1];
  double widthRight_52[1];
  double widthRight_53[1];
  double widthRight_54[1];
  double widthRight_55[1];
  double widthRight_56[1];
  double widthRight_57[1];
  double widthRight_58[1];
  double widthRight_59[1];
  double widthRight_60[1];
  double widthRight_61[1];
  double widthRight_62[1];
  double widthRight_63[1];
  double widthRight_64[1];
  double widthRight_65[1];
  double widthRight_66[1];
  double widthRight_67[1];
  double widthRight_68[1];
  double widthRight_69[1];
  double widthRight_70[1];
  double widthRight_71[1];
  double widthRight_72[1];
  double widthRight_73[1];
  double widthRight_74[1];
  double widthRight_75[1];
  double widthRight_76[1];
  double widthRight_77[1];
  double widthRight_78[1];
  double widthRight_79[1];
  double widthRight_80[1];
  double widthRight_81[1];
  double widthRight_82[1];
  double widthRight_83[1];
  double widthRight_84[1];
  double widthRight_85[1];
  double widthRight_86[1];
  double widthRight_87[1];
  double widthRight_88[1];
  double widthRight_89[1];
  double widthRight_90[1];
  double widthRight_91[1];
  double widthRight_92[1];
  double widthRight_93[1];
  double widthRight_94[1];
  double widthRight_95[1];
  double *ds[95];
  double *psiR[96];
  double *A[95];
  double *B[95];
  double *d[95];
  double *widthLeft[96];
  double *widthRight[96];
} Params;
typedef struct Vars_t {
  double *t_01; /* 1 rows. */
  double *t_02; /* 1 rows. */
  double *t_03; /* 1 rows. */
  double *t_04; /* 1 rows. */
  double *t_05; /* 1 rows. */
  double *t_06; /* 1 rows. */
  double *t_07; /* 1 rows. */
  double *t_08; /* 1 rows. */
  double *t_09; /* 1 rows. */
  double *t_10; /* 1 rows. */
  double *t_11; /* 1 rows. */
  double *t_12; /* 1 rows. */
  double *t_13; /* 1 rows. */
  double *t_14; /* 1 rows. */
  double *t_15; /* 1 rows. */
  double *t_16; /* 1 rows. */
  double *t_17; /* 1 rows. */
  double *t_18; /* 1 rows. */
  double *t_19; /* 1 rows. */
  double *t_20; /* 1 rows. */
  double *t_21; /* 1 rows. */
  double *t_22; /* 1 rows. */
  double *t_23; /* 1 rows. */
  double *t_24; /* 1 rows. */
  double *t_25; /* 1 rows. */
  double *t_26; /* 1 rows. */
  double *t_27; /* 1 rows. */
  double *t_28; /* 1 rows. */
  double *t_29; /* 1 rows. */
  double *t_30; /* 1 rows. */
  double *t_31; /* 1 rows. */
  double *t_32; /* 1 rows. */
  double *t_33; /* 1 rows. */
  double *t_34; /* 1 rows. */
  double *t_35; /* 1 rows. */
  double *t_36; /* 1 rows. */
  double *t_37; /* 1 rows. */
  double *t_38; /* 1 rows. */
  double *t_39; /* 1 rows. */
  double *t_40; /* 1 rows. */
  double *t_41; /* 1 rows. */
  double *t_42; /* 1 rows. */
  double *t_43; /* 1 rows. */
  double *t_44; /* 1 rows. */
  double *t_45; /* 1 rows. */
  double *t_46; /* 1 rows. */
  double *t_47; /* 1 rows. */
  double *t_48; /* 1 rows. */
  double *t_49; /* 1 rows. */
  double *t_50; /* 1 rows. */
  double *t_51; /* 1 rows. */
  double *t_52; /* 1 rows. */
  double *t_53; /* 1 rows. */
  double *t_54; /* 1 rows. */
  double *t_55; /* 1 rows. */
  double *t_56; /* 1 rows. */
  double *t_57; /* 1 rows. */
  double *t_58; /* 1 rows. */
  double *t_59; /* 1 rows. */
  double *t_60; /* 1 rows. */
  double *t_61; /* 1 rows. */
  double *t_62; /* 1 rows. */
  double *t_63; /* 1 rows. */
  double *t_64; /* 1 rows. */
  double *t_65; /* 1 rows. */
  double *t_66; /* 1 rows. */
  double *t_67; /* 1 rows. */
  double *t_68; /* 1 rows. */
  double *t_69; /* 1 rows. */
  double *t_70; /* 1 rows. */
  double *t_71; /* 1 rows. */
  double *t_72; /* 1 rows. */
  double *t_73; /* 1 rows. */
  double *t_74; /* 1 rows. */
  double *t_75; /* 1 rows. */
  double *t_76; /* 1 rows. */
  double *t_77; /* 1 rows. */
  double *t_78; /* 1 rows. */
  double *t_79; /* 1 rows. */
  double *t_80; /* 1 rows. */
  double *t_81; /* 1 rows. */
  double *t_82; /* 1 rows. */
  double *t_83; /* 1 rows. */
  double *t_84; /* 1 rows. */
  double *t_85; /* 1 rows. */
  double *t_86; /* 1 rows. */
  double *t_87; /* 1 rows. */
  double *t_88; /* 1 rows. */
  double *t_89; /* 1 rows. */
  double *t_90; /* 1 rows. */
  double *t_91; /* 1 rows. */
  double *t_92; /* 1 rows. */
  double *t_93; /* 1 rows. */
  double *t_94; /* 1 rows. */
  double *t_95; /* 1 rows. */
  double *t_96; /* 1 rows. */
  double *t_97; /* 1 rows. */
  double *t_98; /* 1 rows. */
  double *t_99; /* 1 rows. */
  double *t_100; /* 1 rows. */
  double *t_101; /* 1 rows. */
  double *t_102; /* 1 rows. */
  double *t_103; /* 1 rows. */
  double *t_104; /* 1 rows. */
  double *t_105; /* 1 rows. */
  double *t_106; /* 1 rows. */
  double *t_107; /* 1 rows. */
  double *t_108; /* 1 rows. */
  double *t_109; /* 1 rows. */
  double *t_110; /* 1 rows. */
  double *t_111; /* 1 rows. */
  double *t_112; /* 1 rows. */
  double *t_113; /* 1 rows. */
  double *t_114; /* 1 rows. */
  double *t_115; /* 1 rows. */
  double *t_116; /* 1 rows. */
  double *t_117; /* 1 rows. */
  double *t_118; /* 1 rows. */
  double *t_119; /* 1 rows. */
  double *t_120; /* 1 rows. */
  double *t_121; /* 1 rows. */
  double *t_122; /* 1 rows. */
  double *t_123; /* 1 rows. */
  double *t_124; /* 1 rows. */
  double *t_125; /* 1 rows. */
  double *t_126; /* 1 rows. */
  double *t_127; /* 1 rows. */
  double *t_128; /* 1 rows. */
  double *t_129; /* 1 rows. */
  double *t_130; /* 1 rows. */
  double *t_131; /* 1 rows. */
  double *t_132; /* 1 rows. */
  double *t_133; /* 1 rows. */
  double *t_134; /* 1 rows. */
  double *t_135; /* 1 rows. */
  double *t_136; /* 1 rows. */
  double *t_137; /* 1 rows. */
  double *t_138; /* 1 rows. */
  double *t_139; /* 1 rows. */
  double *t_140; /* 1 rows. */
  double *t_141; /* 1 rows. */
  double *t_142; /* 1 rows. */
  double *t_143; /* 1 rows. */
  double *t_144; /* 1 rows. */
  double *t_145; /* 1 rows. */
  double *t_146; /* 1 rows. */
  double *t_147; /* 1 rows. */
  double *t_148; /* 1 rows. */
  double *t_149; /* 1 rows. */
  double *t_150; /* 1 rows. */
  double *t_151; /* 1 rows. */
  double *t_152; /* 1 rows. */
  double *t_153; /* 1 rows. */
  double *t_154; /* 1 rows. */
  double *t_155; /* 1 rows. */
  double *t_156; /* 1 rows. */
  double *t_157; /* 1 rows. */
  double *t_158; /* 1 rows. */
  double *t_159; /* 1 rows. */
  double *t_160; /* 1 rows. */
  double *t_161; /* 1 rows. */
  double *t_162; /* 1 rows. */
  double *t_163; /* 1 rows. */
  double *t_164; /* 1 rows. */
  double *t_165; /* 1 rows. */
  double *t_166; /* 1 rows. */
  double *t_167; /* 1 rows. */
  double *t_168; /* 1 rows. */
  double *t_169; /* 1 rows. */
  double *t_170; /* 1 rows. */
  double *t_171; /* 1 rows. */
  double *t_172; /* 1 rows. */
  double *t_173; /* 1 rows. */
  double *t_174; /* 1 rows. */
  double *t_175; /* 1 rows. */
  double *t_176; /* 1 rows. */
  double *t_177; /* 1 rows. */
  double *t_178; /* 1 rows. */
  double *t_179; /* 1 rows. */
  double *t_180; /* 1 rows. */
  double *t_181; /* 1 rows. */
  double *t_182; /* 1 rows. */
  double *t_183; /* 1 rows. */
  double *t_184; /* 1 rows. */
  double *t_185; /* 1 rows. */
  double *t_186; /* 1 rows. */
  double *t_187; /* 1 rows. */
  double *t_188; /* 1 rows. */
  double *x_1; /* 4 rows. */
  double *x_2; /* 4 rows. */
  double *x_3; /* 4 rows. */
  double *x_4; /* 4 rows. */
  double *x_5; /* 4 rows. */
  double *x_6; /* 4 rows. */
  double *x_7; /* 4 rows. */
  double *x_8; /* 4 rows. */
  double *x_9; /* 4 rows. */
  double *x_10; /* 4 rows. */
  double *x_11; /* 4 rows. */
  double *x_12; /* 4 rows. */
  double *x_13; /* 4 rows. */
  double *x_14; /* 4 rows. */
  double *x_15; /* 4 rows. */
  double *x_16; /* 4 rows. */
  double *x_17; /* 4 rows. */
  double *x_18; /* 4 rows. */
  double *x_19; /* 4 rows. */
  double *x_20; /* 4 rows. */
  double *x_21; /* 4 rows. */
  double *x_22; /* 4 rows. */
  double *x_23; /* 4 rows. */
  double *x_24; /* 4 rows. */
  double *x_25; /* 4 rows. */
  double *x_26; /* 4 rows. */
  double *x_27; /* 4 rows. */
  double *x_28; /* 4 rows. */
  double *x_29; /* 4 rows. */
  double *x_30; /* 4 rows. */
  double *x_31; /* 4 rows. */
  double *x_32; /* 4 rows. */
  double *x_33; /* 4 rows. */
  double *x_34; /* 4 rows. */
  double *x_35; /* 4 rows. */
  double *x_36; /* 4 rows. */
  double *x_37; /* 4 rows. */
  double *x_38; /* 4 rows. */
  double *x_39; /* 4 rows. */
  double *x_40; /* 4 rows. */
  double *x_41; /* 4 rows. */
  double *x_42; /* 4 rows. */
  double *x_43; /* 4 rows. */
  double *x_44; /* 4 rows. */
  double *x_45; /* 4 rows. */
  double *x_46; /* 4 rows. */
  double *x_47; /* 4 rows. */
  double *x_48; /* 4 rows. */
  double *x_49; /* 4 rows. */
  double *x_50; /* 4 rows. */
  double *x_51; /* 4 rows. */
  double *x_52; /* 4 rows. */
  double *x_53; /* 4 rows. */
  double *x_54; /* 4 rows. */
  double *x_55; /* 4 rows. */
  double *x_56; /* 4 rows. */
  double *x_57; /* 4 rows. */
  double *x_58; /* 4 rows. */
  double *x_59; /* 4 rows. */
  double *x_60; /* 4 rows. */
  double *x_61; /* 4 rows. */
  double *x_62; /* 4 rows. */
  double *x_63; /* 4 rows. */
  double *x_64; /* 4 rows. */
  double *x_65; /* 4 rows. */
  double *x_66; /* 4 rows. */
  double *x_67; /* 4 rows. */
  double *x_68; /* 4 rows. */
  double *x_69; /* 4 rows. */
  double *x_70; /* 4 rows. */
  double *x_71; /* 4 rows. */
  double *x_72; /* 4 rows. */
  double *x_73; /* 4 rows. */
  double *x_74; /* 4 rows. */
  double *x_75; /* 4 rows. */
  double *x_76; /* 4 rows. */
  double *x_77; /* 4 rows. */
  double *x_78; /* 4 rows. */
  double *x_79; /* 4 rows. */
  double *x_80; /* 4 rows. */
  double *x_81; /* 4 rows. */
  double *x_82; /* 4 rows. */
  double *x_83; /* 4 rows. */
  double *x_84; /* 4 rows. */
  double *x_85; /* 4 rows. */
  double *x_86; /* 4 rows. */
  double *x_87; /* 4 rows. */
  double *x_88; /* 4 rows. */
  double *x_89; /* 4 rows. */
  double *x_90; /* 4 rows. */
  double *x_91; /* 4 rows. */
  double *x_92; /* 4 rows. */
  double *x_93; /* 4 rows. */
  double *x_94; /* 4 rows. */
  double *x_95; /* 4 rows. */
  double *delta_2; /* 1 rows. */
  double *delta_1; /* 1 rows. */
  double *delta_3; /* 1 rows. */
  double *delta_4; /* 1 rows. */
  double *delta_5; /* 1 rows. */
  double *delta_6; /* 1 rows. */
  double *delta_7; /* 1 rows. */
  double *delta_8; /* 1 rows. */
  double *delta_9; /* 1 rows. */
  double *delta_10; /* 1 rows. */
  double *delta_11; /* 1 rows. */
  double *delta_12; /* 1 rows. */
  double *delta_13; /* 1 rows. */
  double *delta_14; /* 1 rows. */
  double *delta_15; /* 1 rows. */
  double *delta_16; /* 1 rows. */
  double *delta_17; /* 1 rows. */
  double *delta_18; /* 1 rows. */
  double *delta_19; /* 1 rows. */
  double *delta_20; /* 1 rows. */
  double *delta_21; /* 1 rows. */
  double *delta_22; /* 1 rows. */
  double *delta_23; /* 1 rows. */
  double *delta_24; /* 1 rows. */
  double *delta_25; /* 1 rows. */
  double *delta_26; /* 1 rows. */
  double *delta_27; /* 1 rows. */
  double *delta_28; /* 1 rows. */
  double *delta_29; /* 1 rows. */
  double *delta_30; /* 1 rows. */
  double *delta_31; /* 1 rows. */
  double *delta_32; /* 1 rows. */
  double *delta_33; /* 1 rows. */
  double *delta_34; /* 1 rows. */
  double *delta_35; /* 1 rows. */
  double *delta_36; /* 1 rows. */
  double *delta_37; /* 1 rows. */
  double *delta_38; /* 1 rows. */
  double *delta_39; /* 1 rows. */
  double *delta_40; /* 1 rows. */
  double *delta_41; /* 1 rows. */
  double *delta_42; /* 1 rows. */
  double *delta_43; /* 1 rows. */
  double *delta_44; /* 1 rows. */
  double *delta_45; /* 1 rows. */
  double *delta_46; /* 1 rows. */
  double *delta_47; /* 1 rows. */
  double *delta_48; /* 1 rows. */
  double *delta_49; /* 1 rows. */
  double *delta_50; /* 1 rows. */
  double *delta_51; /* 1 rows. */
  double *delta_52; /* 1 rows. */
  double *delta_53; /* 1 rows. */
  double *delta_54; /* 1 rows. */
  double *delta_55; /* 1 rows. */
  double *delta_56; /* 1 rows. */
  double *delta_57; /* 1 rows. */
  double *delta_58; /* 1 rows. */
  double *delta_59; /* 1 rows. */
  double *delta_60; /* 1 rows. */
  double *delta_61; /* 1 rows. */
  double *delta_62; /* 1 rows. */
  double *delta_63; /* 1 rows. */
  double *delta_64; /* 1 rows. */
  double *delta_65; /* 1 rows. */
  double *delta_66; /* 1 rows. */
  double *delta_67; /* 1 rows. */
  double *delta_68; /* 1 rows. */
  double *delta_69; /* 1 rows. */
  double *delta_70; /* 1 rows. */
  double *delta_71; /* 1 rows. */
  double *delta_72; /* 1 rows. */
  double *delta_73; /* 1 rows. */
  double *delta_74; /* 1 rows. */
  double *delta_75; /* 1 rows. */
  double *delta_76; /* 1 rows. */
  double *delta_77; /* 1 rows. */
  double *delta_78; /* 1 rows. */
  double *delta_79; /* 1 rows. */
  double *delta_80; /* 1 rows. */
  double *delta_81; /* 1 rows. */
  double *delta_82; /* 1 rows. */
  double *delta_83; /* 1 rows. */
  double *delta_84; /* 1 rows. */
  double *delta_85; /* 1 rows. */
  double *delta_86; /* 1 rows. */
  double *delta_87; /* 1 rows. */
  double *delta_88; /* 1 rows. */
  double *delta_89; /* 1 rows. */
  double *delta_90; /* 1 rows. */
  double *delta_91; /* 1 rows. */
  double *delta_92; /* 1 rows. */
  double *delta_93; /* 1 rows. */
  double *delta_94; /* 1 rows. */
  double *delta_95; /* 1 rows. */
  double *x[96];
  double *delta[96];
} Vars;
typedef struct Workspace_t {
  double h[190];
  double s_inv[190];
  double s_inv_z[190];
  double b[570];
  double q[663];
  double rhs[1613];
  double x[1613];
  double *s;
  double *z;
  double *y;
  double lhs_aff[1613];
  double lhs_cc[1613];
  double buffer[1613];
  double buffer2[1613];
  double KKT[3774];
  double L[5909];
  double d[1613];
  double v[1613];
  double d_inv[1613];
  double gap;
  double optval;
  double ineq_resid_squared;
  double eq_resid_squared;
  double block_33[1];
  /* Pre-op symbols. */
  double frac_617480216576;
  double frac_868245876736;
  double frac_544695152640;
  double frac_119885570048;
  double frac_913577877504;
  double frac_256219545600;
  double frac_487308353536;
  double frac_294862921728;
  double frac_314508603392;
  double frac_51978178560;
  double frac_395863916544;
  double frac_2420826112;
  double frac_415166021632;
  double frac_935321366528;
  double frac_351955853312;
  double frac_816916123648;
  double frac_353429897216;
  double frac_811372339200;
  double frac_900999950336;
  double frac_848147484672;
  double frac_498956341248;
  double frac_528325033984;
  double frac_130653519872;
  double frac_852215087104;
  double frac_232222343168;
  double frac_546935545856;
  double frac_48860688384;
  double frac_769699512320;
  double frac_507632697344;
  double frac_833092071424;
  double frac_908671115264;
  double frac_783192035328;
  double frac_683027623936;
  double frac_685767340032;
  double frac_170306400256;
  double frac_414206939136;
  double frac_175752015872;
  double frac_954611564544;
  double frac_102219894784;
  double frac_7767060480;
  double frac_670279720960;
  double frac_848887627776;
  double frac_68134641664;
  double frac_169466073088;
  double frac_823967133696;
  double frac_344458350592;
  double frac_242905395200;
  double frac_715035406336;
  double frac_936563838976;
  double frac_405680791552;
  double frac_32642809856;
  double frac_923456720896;
  double frac_333362827264;
  double frac_315140706304;
  double frac_528082149376;
  double frac_872456323072;
  double frac_357762514944;
  double frac_189810651136;
  double frac_994235092992;
  double frac_60758339584;
  double frac_357529456640;
  double frac_72833347584;
  double frac_984200486912;
  double frac_234546737152;
  double frac_921553440768;
  double frac_737100427264;
  double frac_88879312896;
  double frac_442242203648;
  double frac_865477357568;
  double frac_663379828736;
  double frac_914296725504;
  double frac_524985544704;
  double frac_975677837312;
  double frac_893782491136;
  double frac_638799654912;
  double frac_716375146496;
  double frac_837310730240;
  double frac_975050878976;
  double frac_770138312704;
  double frac_25697841152;
  double frac_477107707904;
  double frac_991531724800;
  double frac_914203652096;
  double frac_135204241408;
  double frac_691766775808;
  double frac_946287493120;
  double frac_274154803200;
  double frac_372847624192;
  double frac_216747266048;
  double frac_9988182016;
  double frac_848589377536;
  double frac_515898818560;
  double frac_414690803712;
  double frac_790115229696;
  int converged;
} Workspace;
typedef struct Settings_t {
  double resid_tol;
  double eps;
  int max_iters;
  int refine_steps;
  int better_start;
  /* Better start obviates the need for s_init and z_init. */
  double s_init;
  double z_init;
  int verbose;
  /* Show extra details of the iterative refinement steps. */
  int verbose_refinement;
  int debug;
  /* For regularization. Minimum value of abs(D_ii) in the kkt D factor. */
  double kkt_reg;
} Settings;
extern Vars vars;
extern Params params;
extern Workspace work;
extern Settings settings;
/* Function definitions in ldl.c: */
void ldl_solve(double *target, double *var);
void ldl_factor(void);
double check_factorization(void);
void matrix_multiply(double *result, double *source);
double check_residual(double *target, double *multiplicand);
void fill_KKT(void);

/* Function definitions in matrix_support.c: */
void multbymA(double *lhs, double *rhs);
void multbymAT(double *lhs, double *rhs);
void multbymG(double *lhs, double *rhs);
void multbymGT(double *lhs, double *rhs);
void multbyP(double *lhs, double *rhs);
void fillq(void);
void fillh(void);
void fillb(void);
void pre_ops(void);

/* Function definitions in solver.c: */
double eval_gap(void);
void set_defaults(void);
void setup_pointers(void);
void setup_indexed_params(void);
void setup_indexed_optvars(void);
void setup_indexing(void);
void set_start(void);
double eval_objv(void);
void fillrhs_aff(void);
void fillrhs_cc(void);
void refine(double *target, double *var);
double calc_ineq_resid_squared(void);
double calc_eq_resid_squared(void);
void better_start(void);
void fillrhs_start(void);
long solve(void);

/* Function definitions in testsolver.c: */
int main(int argc, char **argv);
void load_default_data(void);

/* Function definitions in util.c: */
void tic(void);
float toc(void);
float tocq(void);
void printmatrix(char *name, double *A, int m, int n, int sparse);
double unif(double lower, double upper);
float ran1(long*idum, int reset);
float randn_internal(long *idum, int reset);
double randn(void);
void reset_rand(void);

#endif
