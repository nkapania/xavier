/* Produced by CVXGEN, 2015-09-15 02:49:16 -0400.  */
/* CVXGEN is Copyright (C) 2006-2012 Jacob Mattingley, jem@cvxgen.com. */
/* The code in this file is Copyright (C) 2006-2012 Jacob Mattingley. */
/* CVXGEN, or solvers produced by CVXGEN, cannot be used for commercial */
/* applications without prior written permission from Jacob Mattingley. */

/* Filename: solver.c. */
/* Description: Main solver file. */
#include "solver.h"
double eval_gap(void) {
  int i;
  double gap;
  gap = 0;
  for (i = 0; i < 190; i++)
    gap += work.z[i]*work.s[i];
  return gap;
}
void set_defaults(void) {
  settings.resid_tol = 1e-6;
  settings.eps = 1e-4;
  settings.max_iters = 25;
  settings.refine_steps = 1;
  settings.s_init = 1;
  settings.z_init = 1;
  settings.debug = 0;
  settings.verbose = 1;
  settings.verbose_refinement = 0;
  settings.better_start = 1;
  settings.kkt_reg = 1e-7;
}
void setup_pointers(void) {
  work.y = work.x + 663;
  work.s = work.x + 1233;
  work.z = work.x + 1423;
  vars.delta_1 = work.x + 0;
  vars.delta_2 = work.x + 1;
  vars.delta_3 = work.x + 2;
  vars.delta_4 = work.x + 3;
  vars.delta_5 = work.x + 4;
  vars.delta_6 = work.x + 5;
  vars.delta_7 = work.x + 6;
  vars.delta_8 = work.x + 7;
  vars.delta_9 = work.x + 8;
  vars.delta_10 = work.x + 9;
  vars.delta_11 = work.x + 10;
  vars.delta_12 = work.x + 11;
  vars.delta_13 = work.x + 12;
  vars.delta_14 = work.x + 13;
  vars.delta_15 = work.x + 14;
  vars.delta_16 = work.x + 15;
  vars.delta_17 = work.x + 16;
  vars.delta_18 = work.x + 17;
  vars.delta_19 = work.x + 18;
  vars.delta_20 = work.x + 19;
  vars.delta_21 = work.x + 20;
  vars.delta_22 = work.x + 21;
  vars.delta_23 = work.x + 22;
  vars.delta_24 = work.x + 23;
  vars.delta_25 = work.x + 24;
  vars.delta_26 = work.x + 25;
  vars.delta_27 = work.x + 26;
  vars.delta_28 = work.x + 27;
  vars.delta_29 = work.x + 28;
  vars.delta_30 = work.x + 29;
  vars.delta_31 = work.x + 30;
  vars.delta_32 = work.x + 31;
  vars.delta_33 = work.x + 32;
  vars.delta_34 = work.x + 33;
  vars.delta_35 = work.x + 34;
  vars.delta_36 = work.x + 35;
  vars.delta_37 = work.x + 36;
  vars.delta_38 = work.x + 37;
  vars.delta_39 = work.x + 38;
  vars.delta_40 = work.x + 39;
  vars.delta_41 = work.x + 40;
  vars.delta_42 = work.x + 41;
  vars.delta_43 = work.x + 42;
  vars.delta_44 = work.x + 43;
  vars.delta_45 = work.x + 44;
  vars.delta_46 = work.x + 45;
  vars.delta_47 = work.x + 46;
  vars.delta_48 = work.x + 47;
  vars.delta_49 = work.x + 48;
  vars.delta_50 = work.x + 49;
  vars.delta_51 = work.x + 50;
  vars.delta_52 = work.x + 51;
  vars.delta_53 = work.x + 52;
  vars.delta_54 = work.x + 53;
  vars.delta_55 = work.x + 54;
  vars.delta_56 = work.x + 55;
  vars.delta_57 = work.x + 56;
  vars.delta_58 = work.x + 57;
  vars.delta_59 = work.x + 58;
  vars.delta_60 = work.x + 59;
  vars.delta_61 = work.x + 60;
  vars.delta_62 = work.x + 61;
  vars.delta_63 = work.x + 62;
  vars.delta_64 = work.x + 63;
  vars.delta_65 = work.x + 64;
  vars.delta_66 = work.x + 65;
  vars.delta_67 = work.x + 66;
  vars.delta_68 = work.x + 67;
  vars.delta_69 = work.x + 68;
  vars.delta_70 = work.x + 69;
  vars.delta_71 = work.x + 70;
  vars.delta_72 = work.x + 71;
  vars.delta_73 = work.x + 72;
  vars.delta_74 = work.x + 73;
  vars.delta_75 = work.x + 74;
  vars.delta_76 = work.x + 75;
  vars.delta_77 = work.x + 76;
  vars.delta_78 = work.x + 77;
  vars.delta_79 = work.x + 78;
  vars.delta_80 = work.x + 79;
  vars.delta_81 = work.x + 80;
  vars.delta_82 = work.x + 81;
  vars.delta_83 = work.x + 82;
  vars.delta_84 = work.x + 83;
  vars.delta_85 = work.x + 84;
  vars.delta_86 = work.x + 85;
  vars.delta_87 = work.x + 86;
  vars.delta_88 = work.x + 87;
  vars.delta_89 = work.x + 88;
  vars.delta_90 = work.x + 89;
  vars.delta_91 = work.x + 90;
  vars.delta_92 = work.x + 91;
  vars.delta_93 = work.x + 92;
  vars.delta_94 = work.x + 93;
  vars.delta_95 = work.x + 94;
  vars.x_1 = work.x + 283;
  vars.x_2 = work.x + 287;
  vars.x_3 = work.x + 291;
  vars.x_4 = work.x + 295;
  vars.x_5 = work.x + 299;
  vars.x_6 = work.x + 303;
  vars.x_7 = work.x + 307;
  vars.x_8 = work.x + 311;
  vars.x_9 = work.x + 315;
  vars.x_10 = work.x + 319;
  vars.x_11 = work.x + 323;
  vars.x_12 = work.x + 327;
  vars.x_13 = work.x + 331;
  vars.x_14 = work.x + 335;
  vars.x_15 = work.x + 339;
  vars.x_16 = work.x + 343;
  vars.x_17 = work.x + 347;
  vars.x_18 = work.x + 351;
  vars.x_19 = work.x + 355;
  vars.x_20 = work.x + 359;
  vars.x_21 = work.x + 363;
  vars.x_22 = work.x + 367;
  vars.x_23 = work.x + 371;
  vars.x_24 = work.x + 375;
  vars.x_25 = work.x + 379;
  vars.x_26 = work.x + 383;
  vars.x_27 = work.x + 387;
  vars.x_28 = work.x + 391;
  vars.x_29 = work.x + 395;
  vars.x_30 = work.x + 399;
  vars.x_31 = work.x + 403;
  vars.x_32 = work.x + 407;
  vars.x_33 = work.x + 411;
  vars.x_34 = work.x + 415;
  vars.x_35 = work.x + 419;
  vars.x_36 = work.x + 423;
  vars.x_37 = work.x + 427;
  vars.x_38 = work.x + 431;
  vars.x_39 = work.x + 435;
  vars.x_40 = work.x + 439;
  vars.x_41 = work.x + 443;
  vars.x_42 = work.x + 447;
  vars.x_43 = work.x + 451;
  vars.x_44 = work.x + 455;
  vars.x_45 = work.x + 459;
  vars.x_46 = work.x + 463;
  vars.x_47 = work.x + 467;
  vars.x_48 = work.x + 471;
  vars.x_49 = work.x + 475;
  vars.x_50 = work.x + 479;
  vars.x_51 = work.x + 483;
  vars.x_52 = work.x + 487;
  vars.x_53 = work.x + 491;
  vars.x_54 = work.x + 495;
  vars.x_55 = work.x + 499;
  vars.x_56 = work.x + 503;
  vars.x_57 = work.x + 507;
  vars.x_58 = work.x + 511;
  vars.x_59 = work.x + 515;
  vars.x_60 = work.x + 519;
  vars.x_61 = work.x + 523;
  vars.x_62 = work.x + 527;
  vars.x_63 = work.x + 531;
  vars.x_64 = work.x + 535;
  vars.x_65 = work.x + 539;
  vars.x_66 = work.x + 543;
  vars.x_67 = work.x + 547;
  vars.x_68 = work.x + 551;
  vars.x_69 = work.x + 555;
  vars.x_70 = work.x + 559;
  vars.x_71 = work.x + 563;
  vars.x_72 = work.x + 567;
  vars.x_73 = work.x + 571;
  vars.x_74 = work.x + 575;
  vars.x_75 = work.x + 579;
  vars.x_76 = work.x + 583;
  vars.x_77 = work.x + 587;
  vars.x_78 = work.x + 591;
  vars.x_79 = work.x + 595;
  vars.x_80 = work.x + 599;
  vars.x_81 = work.x + 603;
  vars.x_82 = work.x + 607;
  vars.x_83 = work.x + 611;
  vars.x_84 = work.x + 615;
  vars.x_85 = work.x + 619;
  vars.x_86 = work.x + 623;
  vars.x_87 = work.x + 627;
  vars.x_88 = work.x + 631;
  vars.x_89 = work.x + 635;
  vars.x_90 = work.x + 639;
  vars.x_91 = work.x + 643;
  vars.x_92 = work.x + 647;
  vars.x_93 = work.x + 651;
  vars.x_94 = work.x + 655;
  vars.x_95 = work.x + 659;
}
void setup_indexed_params(void) {
  /* In CVXGEN, you can say */
  /*   parameters */
  /*     A[i] (5,3), i=1..4 */
  /*   end */
  /* This function sets up A[2] to be a pointer to A_2, which is a length-15 */
  /* vector of doubles. */
  /* If you access parameters that you haven't defined in CVXGEN, the result */
  /* is undefined. */
  params.ds[1] = params.ds_1;
  params.psiR[2] = params.psiR_2;
  params.psiR[1] = params.psiR_1;
  params.ds[2] = params.ds_2;
  params.psiR[3] = params.psiR_3;
  params.ds[3] = params.ds_3;
  params.psiR[4] = params.psiR_4;
  params.ds[4] = params.ds_4;
  params.psiR[5] = params.psiR_5;
  params.ds[5] = params.ds_5;
  params.psiR[6] = params.psiR_6;
  params.ds[6] = params.ds_6;
  params.psiR[7] = params.psiR_7;
  params.ds[7] = params.ds_7;
  params.psiR[8] = params.psiR_8;
  params.ds[8] = params.ds_8;
  params.psiR[9] = params.psiR_9;
  params.ds[9] = params.ds_9;
  params.psiR[10] = params.psiR_10;
  params.ds[10] = params.ds_10;
  params.psiR[11] = params.psiR_11;
  params.ds[11] = params.ds_11;
  params.psiR[12] = params.psiR_12;
  params.ds[12] = params.ds_12;
  params.psiR[13] = params.psiR_13;
  params.ds[13] = params.ds_13;
  params.psiR[14] = params.psiR_14;
  params.ds[14] = params.ds_14;
  params.psiR[15] = params.psiR_15;
  params.ds[15] = params.ds_15;
  params.psiR[16] = params.psiR_16;
  params.ds[16] = params.ds_16;
  params.psiR[17] = params.psiR_17;
  params.ds[17] = params.ds_17;
  params.psiR[18] = params.psiR_18;
  params.ds[18] = params.ds_18;
  params.psiR[19] = params.psiR_19;
  params.ds[19] = params.ds_19;
  params.psiR[20] = params.psiR_20;
  params.ds[20] = params.ds_20;
  params.psiR[21] = params.psiR_21;
  params.ds[21] = params.ds_21;
  params.psiR[22] = params.psiR_22;
  params.ds[22] = params.ds_22;
  params.psiR[23] = params.psiR_23;
  params.ds[23] = params.ds_23;
  params.psiR[24] = params.psiR_24;
  params.ds[24] = params.ds_24;
  params.psiR[25] = params.psiR_25;
  params.ds[25] = params.ds_25;
  params.psiR[26] = params.psiR_26;
  params.ds[26] = params.ds_26;
  params.psiR[27] = params.psiR_27;
  params.ds[27] = params.ds_27;
  params.psiR[28] = params.psiR_28;
  params.ds[28] = params.ds_28;
  params.psiR[29] = params.psiR_29;
  params.ds[29] = params.ds_29;
  params.psiR[30] = params.psiR_30;
  params.ds[30] = params.ds_30;
  params.psiR[31] = params.psiR_31;
  params.ds[31] = params.ds_31;
  params.psiR[32] = params.psiR_32;
  params.ds[32] = params.ds_32;
  params.psiR[33] = params.psiR_33;
  params.ds[33] = params.ds_33;
  params.psiR[34] = params.psiR_34;
  params.ds[34] = params.ds_34;
  params.psiR[35] = params.psiR_35;
  params.ds[35] = params.ds_35;
  params.psiR[36] = params.psiR_36;
  params.ds[36] = params.ds_36;
  params.psiR[37] = params.psiR_37;
  params.ds[37] = params.ds_37;
  params.psiR[38] = params.psiR_38;
  params.ds[38] = params.ds_38;
  params.psiR[39] = params.psiR_39;
  params.ds[39] = params.ds_39;
  params.psiR[40] = params.psiR_40;
  params.ds[40] = params.ds_40;
  params.psiR[41] = params.psiR_41;
  params.ds[41] = params.ds_41;
  params.psiR[42] = params.psiR_42;
  params.ds[42] = params.ds_42;
  params.psiR[43] = params.psiR_43;
  params.ds[43] = params.ds_43;
  params.psiR[44] = params.psiR_44;
  params.ds[44] = params.ds_44;
  params.psiR[45] = params.psiR_45;
  params.ds[45] = params.ds_45;
  params.psiR[46] = params.psiR_46;
  params.ds[46] = params.ds_46;
  params.psiR[47] = params.psiR_47;
  params.ds[47] = params.ds_47;
  params.psiR[48] = params.psiR_48;
  params.ds[48] = params.ds_48;
  params.psiR[49] = params.psiR_49;
  params.ds[49] = params.ds_49;
  params.psiR[50] = params.psiR_50;
  params.ds[50] = params.ds_50;
  params.psiR[51] = params.psiR_51;
  params.ds[51] = params.ds_51;
  params.psiR[52] = params.psiR_52;
  params.ds[52] = params.ds_52;
  params.psiR[53] = params.psiR_53;
  params.ds[53] = params.ds_53;
  params.psiR[54] = params.psiR_54;
  params.ds[54] = params.ds_54;
  params.psiR[55] = params.psiR_55;
  params.ds[55] = params.ds_55;
  params.psiR[56] = params.psiR_56;
  params.ds[56] = params.ds_56;
  params.psiR[57] = params.psiR_57;
  params.ds[57] = params.ds_57;
  params.psiR[58] = params.psiR_58;
  params.ds[58] = params.ds_58;
  params.psiR[59] = params.psiR_59;
  params.ds[59] = params.ds_59;
  params.psiR[60] = params.psiR_60;
  params.ds[60] = params.ds_60;
  params.psiR[61] = params.psiR_61;
  params.ds[61] = params.ds_61;
  params.psiR[62] = params.psiR_62;
  params.ds[62] = params.ds_62;
  params.psiR[63] = params.psiR_63;
  params.ds[63] = params.ds_63;
  params.psiR[64] = params.psiR_64;
  params.ds[64] = params.ds_64;
  params.psiR[65] = params.psiR_65;
  params.ds[65] = params.ds_65;
  params.psiR[66] = params.psiR_66;
  params.ds[66] = params.ds_66;
  params.psiR[67] = params.psiR_67;
  params.ds[67] = params.ds_67;
  params.psiR[68] = params.psiR_68;
  params.ds[68] = params.ds_68;
  params.psiR[69] = params.psiR_69;
  params.ds[69] = params.ds_69;
  params.psiR[70] = params.psiR_70;
  params.ds[70] = params.ds_70;
  params.psiR[71] = params.psiR_71;
  params.ds[71] = params.ds_71;
  params.psiR[72] = params.psiR_72;
  params.ds[72] = params.ds_72;
  params.psiR[73] = params.psiR_73;
  params.ds[73] = params.ds_73;
  params.psiR[74] = params.psiR_74;
  params.ds[74] = params.ds_74;
  params.psiR[75] = params.psiR_75;
  params.ds[75] = params.ds_75;
  params.psiR[76] = params.psiR_76;
  params.ds[76] = params.ds_76;
  params.psiR[77] = params.psiR_77;
  params.ds[77] = params.ds_77;
  params.psiR[78] = params.psiR_78;
  params.ds[78] = params.ds_78;
  params.psiR[79] = params.psiR_79;
  params.ds[79] = params.ds_79;
  params.psiR[80] = params.psiR_80;
  params.ds[80] = params.ds_80;
  params.psiR[81] = params.psiR_81;
  params.ds[81] = params.ds_81;
  params.psiR[82] = params.psiR_82;
  params.ds[82] = params.ds_82;
  params.psiR[83] = params.psiR_83;
  params.ds[83] = params.ds_83;
  params.psiR[84] = params.psiR_84;
  params.ds[84] = params.ds_84;
  params.psiR[85] = params.psiR_85;
  params.ds[85] = params.ds_85;
  params.psiR[86] = params.psiR_86;
  params.ds[86] = params.ds_86;
  params.psiR[87] = params.psiR_87;
  params.ds[87] = params.ds_87;
  params.psiR[88] = params.psiR_88;
  params.ds[88] = params.ds_88;
  params.psiR[89] = params.psiR_89;
  params.ds[89] = params.ds_89;
  params.psiR[90] = params.psiR_90;
  params.ds[90] = params.ds_90;
  params.psiR[91] = params.psiR_91;
  params.ds[91] = params.ds_91;
  params.psiR[92] = params.psiR_92;
  params.ds[92] = params.ds_92;
  params.psiR[93] = params.psiR_93;
  params.ds[93] = params.ds_93;
  params.psiR[94] = params.psiR_94;
  params.ds[94] = params.ds_94;
  params.psiR[95] = params.psiR_95;
  params.A[1] = params.A_1;
  params.B[1] = params.B_1;
  params.d[1] = params.d_1;
  params.A[2] = params.A_2;
  params.B[2] = params.B_2;
  params.d[2] = params.d_2;
  params.A[3] = params.A_3;
  params.B[3] = params.B_3;
  params.d[3] = params.d_3;
  params.A[4] = params.A_4;
  params.B[4] = params.B_4;
  params.d[4] = params.d_4;
  params.A[5] = params.A_5;
  params.B[5] = params.B_5;
  params.d[5] = params.d_5;
  params.A[6] = params.A_6;
  params.B[6] = params.B_6;
  params.d[6] = params.d_6;
  params.A[7] = params.A_7;
  params.B[7] = params.B_7;
  params.d[7] = params.d_7;
  params.A[8] = params.A_8;
  params.B[8] = params.B_8;
  params.d[8] = params.d_8;
  params.A[9] = params.A_9;
  params.B[9] = params.B_9;
  params.d[9] = params.d_9;
  params.A[10] = params.A_10;
  params.B[10] = params.B_10;
  params.d[10] = params.d_10;
  params.A[11] = params.A_11;
  params.B[11] = params.B_11;
  params.d[11] = params.d_11;
  params.A[12] = params.A_12;
  params.B[12] = params.B_12;
  params.d[12] = params.d_12;
  params.A[13] = params.A_13;
  params.B[13] = params.B_13;
  params.d[13] = params.d_13;
  params.A[14] = params.A_14;
  params.B[14] = params.B_14;
  params.d[14] = params.d_14;
  params.A[15] = params.A_15;
  params.B[15] = params.B_15;
  params.d[15] = params.d_15;
  params.A[16] = params.A_16;
  params.B[16] = params.B_16;
  params.d[16] = params.d_16;
  params.A[17] = params.A_17;
  params.B[17] = params.B_17;
  params.d[17] = params.d_17;
  params.A[18] = params.A_18;
  params.B[18] = params.B_18;
  params.d[18] = params.d_18;
  params.A[19] = params.A_19;
  params.B[19] = params.B_19;
  params.d[19] = params.d_19;
  params.A[20] = params.A_20;
  params.B[20] = params.B_20;
  params.d[20] = params.d_20;
  params.A[21] = params.A_21;
  params.B[21] = params.B_21;
  params.d[21] = params.d_21;
  params.A[22] = params.A_22;
  params.B[22] = params.B_22;
  params.d[22] = params.d_22;
  params.A[23] = params.A_23;
  params.B[23] = params.B_23;
  params.d[23] = params.d_23;
  params.A[24] = params.A_24;
  params.B[24] = params.B_24;
  params.d[24] = params.d_24;
  params.A[25] = params.A_25;
  params.B[25] = params.B_25;
  params.d[25] = params.d_25;
  params.A[26] = params.A_26;
  params.B[26] = params.B_26;
  params.d[26] = params.d_26;
  params.A[27] = params.A_27;
  params.B[27] = params.B_27;
  params.d[27] = params.d_27;
  params.A[28] = params.A_28;
  params.B[28] = params.B_28;
  params.d[28] = params.d_28;
  params.A[29] = params.A_29;
  params.B[29] = params.B_29;
  params.d[29] = params.d_29;
  params.A[30] = params.A_30;
  params.B[30] = params.B_30;
  params.d[30] = params.d_30;
  params.A[31] = params.A_31;
  params.B[31] = params.B_31;
  params.d[31] = params.d_31;
  params.A[32] = params.A_32;
  params.B[32] = params.B_32;
  params.d[32] = params.d_32;
  params.A[33] = params.A_33;
  params.B[33] = params.B_33;
  params.d[33] = params.d_33;
  params.A[34] = params.A_34;
  params.B[34] = params.B_34;
  params.d[34] = params.d_34;
  params.A[35] = params.A_35;
  params.B[35] = params.B_35;
  params.d[35] = params.d_35;
  params.A[36] = params.A_36;
  params.B[36] = params.B_36;
  params.d[36] = params.d_36;
  params.A[37] = params.A_37;
  params.B[37] = params.B_37;
  params.d[37] = params.d_37;
  params.A[38] = params.A_38;
  params.B[38] = params.B_38;
  params.d[38] = params.d_38;
  params.A[39] = params.A_39;
  params.B[39] = params.B_39;
  params.d[39] = params.d_39;
  params.A[40] = params.A_40;
  params.B[40] = params.B_40;
  params.d[40] = params.d_40;
  params.A[41] = params.A_41;
  params.B[41] = params.B_41;
  params.d[41] = params.d_41;
  params.A[42] = params.A_42;
  params.B[42] = params.B_42;
  params.d[42] = params.d_42;
  params.A[43] = params.A_43;
  params.B[43] = params.B_43;
  params.d[43] = params.d_43;
  params.A[44] = params.A_44;
  params.B[44] = params.B_44;
  params.d[44] = params.d_44;
  params.A[45] = params.A_45;
  params.B[45] = params.B_45;
  params.d[45] = params.d_45;
  params.A[46] = params.A_46;
  params.B[46] = params.B_46;
  params.d[46] = params.d_46;
  params.A[47] = params.A_47;
  params.B[47] = params.B_47;
  params.d[47] = params.d_47;
  params.A[48] = params.A_48;
  params.B[48] = params.B_48;
  params.d[48] = params.d_48;
  params.A[49] = params.A_49;
  params.B[49] = params.B_49;
  params.d[49] = params.d_49;
  params.A[50] = params.A_50;
  params.B[50] = params.B_50;
  params.d[50] = params.d_50;
  params.A[51] = params.A_51;
  params.B[51] = params.B_51;
  params.d[51] = params.d_51;
  params.A[52] = params.A_52;
  params.B[52] = params.B_52;
  params.d[52] = params.d_52;
  params.A[53] = params.A_53;
  params.B[53] = params.B_53;
  params.d[53] = params.d_53;
  params.A[54] = params.A_54;
  params.B[54] = params.B_54;
  params.d[54] = params.d_54;
  params.A[55] = params.A_55;
  params.B[55] = params.B_55;
  params.d[55] = params.d_55;
  params.A[56] = params.A_56;
  params.B[56] = params.B_56;
  params.d[56] = params.d_56;
  params.A[57] = params.A_57;
  params.B[57] = params.B_57;
  params.d[57] = params.d_57;
  params.A[58] = params.A_58;
  params.B[58] = params.B_58;
  params.d[58] = params.d_58;
  params.A[59] = params.A_59;
  params.B[59] = params.B_59;
  params.d[59] = params.d_59;
  params.A[60] = params.A_60;
  params.B[60] = params.B_60;
  params.d[60] = params.d_60;
  params.A[61] = params.A_61;
  params.B[61] = params.B_61;
  params.d[61] = params.d_61;
  params.A[62] = params.A_62;
  params.B[62] = params.B_62;
  params.d[62] = params.d_62;
  params.A[63] = params.A_63;
  params.B[63] = params.B_63;
  params.d[63] = params.d_63;
  params.A[64] = params.A_64;
  params.B[64] = params.B_64;
  params.d[64] = params.d_64;
  params.A[65] = params.A_65;
  params.B[65] = params.B_65;
  params.d[65] = params.d_65;
  params.A[66] = params.A_66;
  params.B[66] = params.B_66;
  params.d[66] = params.d_66;
  params.A[67] = params.A_67;
  params.B[67] = params.B_67;
  params.d[67] = params.d_67;
  params.A[68] = params.A_68;
  params.B[68] = params.B_68;
  params.d[68] = params.d_68;
  params.A[69] = params.A_69;
  params.B[69] = params.B_69;
  params.d[69] = params.d_69;
  params.A[70] = params.A_70;
  params.B[70] = params.B_70;
  params.d[70] = params.d_70;
  params.A[71] = params.A_71;
  params.B[71] = params.B_71;
  params.d[71] = params.d_71;
  params.A[72] = params.A_72;
  params.B[72] = params.B_72;
  params.d[72] = params.d_72;
  params.A[73] = params.A_73;
  params.B[73] = params.B_73;
  params.d[73] = params.d_73;
  params.A[74] = params.A_74;
  params.B[74] = params.B_74;
  params.d[74] = params.d_74;
  params.A[75] = params.A_75;
  params.B[75] = params.B_75;
  params.d[75] = params.d_75;
  params.A[76] = params.A_76;
  params.B[76] = params.B_76;
  params.d[76] = params.d_76;
  params.A[77] = params.A_77;
  params.B[77] = params.B_77;
  params.d[77] = params.d_77;
  params.A[78] = params.A_78;
  params.B[78] = params.B_78;
  params.d[78] = params.d_78;
  params.A[79] = params.A_79;
  params.B[79] = params.B_79;
  params.d[79] = params.d_79;
  params.A[80] = params.A_80;
  params.B[80] = params.B_80;
  params.d[80] = params.d_80;
  params.A[81] = params.A_81;
  params.B[81] = params.B_81;
  params.d[81] = params.d_81;
  params.A[82] = params.A_82;
  params.B[82] = params.B_82;
  params.d[82] = params.d_82;
  params.A[83] = params.A_83;
  params.B[83] = params.B_83;
  params.d[83] = params.d_83;
  params.A[84] = params.A_84;
  params.B[84] = params.B_84;
  params.d[84] = params.d_84;
  params.A[85] = params.A_85;
  params.B[85] = params.B_85;
  params.d[85] = params.d_85;
  params.A[86] = params.A_86;
  params.B[86] = params.B_86;
  params.d[86] = params.d_86;
  params.A[87] = params.A_87;
  params.B[87] = params.B_87;
  params.d[87] = params.d_87;
  params.A[88] = params.A_88;
  params.B[88] = params.B_88;
  params.d[88] = params.d_88;
  params.A[89] = params.A_89;
  params.B[89] = params.B_89;
  params.d[89] = params.d_89;
  params.A[90] = params.A_90;
  params.B[90] = params.B_90;
  params.d[90] = params.d_90;
  params.A[91] = params.A_91;
  params.B[91] = params.B_91;
  params.d[91] = params.d_91;
  params.A[92] = params.A_92;
  params.B[92] = params.B_92;
  params.d[92] = params.d_92;
  params.A[93] = params.A_93;
  params.B[93] = params.B_93;
  params.d[93] = params.d_93;
  params.A[94] = params.A_94;
  params.B[94] = params.B_94;
  params.d[94] = params.d_94;
  params.widthLeft[1] = params.widthLeft_1;
  params.widthLeft[2] = params.widthLeft_2;
  params.widthLeft[3] = params.widthLeft_3;
  params.widthLeft[4] = params.widthLeft_4;
  params.widthLeft[5] = params.widthLeft_5;
  params.widthLeft[6] = params.widthLeft_6;
  params.widthLeft[7] = params.widthLeft_7;
  params.widthLeft[8] = params.widthLeft_8;
  params.widthLeft[9] = params.widthLeft_9;
  params.widthLeft[10] = params.widthLeft_10;
  params.widthLeft[11] = params.widthLeft_11;
  params.widthLeft[12] = params.widthLeft_12;
  params.widthLeft[13] = params.widthLeft_13;
  params.widthLeft[14] = params.widthLeft_14;
  params.widthLeft[15] = params.widthLeft_15;
  params.widthLeft[16] = params.widthLeft_16;
  params.widthLeft[17] = params.widthLeft_17;
  params.widthLeft[18] = params.widthLeft_18;
  params.widthLeft[19] = params.widthLeft_19;
  params.widthLeft[20] = params.widthLeft_20;
  params.widthLeft[21] = params.widthLeft_21;
  params.widthLeft[22] = params.widthLeft_22;
  params.widthLeft[23] = params.widthLeft_23;
  params.widthLeft[24] = params.widthLeft_24;
  params.widthLeft[25] = params.widthLeft_25;
  params.widthLeft[26] = params.widthLeft_26;
  params.widthLeft[27] = params.widthLeft_27;
  params.widthLeft[28] = params.widthLeft_28;
  params.widthLeft[29] = params.widthLeft_29;
  params.widthLeft[30] = params.widthLeft_30;
  params.widthLeft[31] = params.widthLeft_31;
  params.widthLeft[32] = params.widthLeft_32;
  params.widthLeft[33] = params.widthLeft_33;
  params.widthLeft[34] = params.widthLeft_34;
  params.widthLeft[35] = params.widthLeft_35;
  params.widthLeft[36] = params.widthLeft_36;
  params.widthLeft[37] = params.widthLeft_37;
  params.widthLeft[38] = params.widthLeft_38;
  params.widthLeft[39] = params.widthLeft_39;
  params.widthLeft[40] = params.widthLeft_40;
  params.widthLeft[41] = params.widthLeft_41;
  params.widthLeft[42] = params.widthLeft_42;
  params.widthLeft[43] = params.widthLeft_43;
  params.widthLeft[44] = params.widthLeft_44;
  params.widthLeft[45] = params.widthLeft_45;
  params.widthLeft[46] = params.widthLeft_46;
  params.widthLeft[47] = params.widthLeft_47;
  params.widthLeft[48] = params.widthLeft_48;
  params.widthLeft[49] = params.widthLeft_49;
  params.widthLeft[50] = params.widthLeft_50;
  params.widthLeft[51] = params.widthLeft_51;
  params.widthLeft[52] = params.widthLeft_52;
  params.widthLeft[53] = params.widthLeft_53;
  params.widthLeft[54] = params.widthLeft_54;
  params.widthLeft[55] = params.widthLeft_55;
  params.widthLeft[56] = params.widthLeft_56;
  params.widthLeft[57] = params.widthLeft_57;
  params.widthLeft[58] = params.widthLeft_58;
  params.widthLeft[59] = params.widthLeft_59;
  params.widthLeft[60] = params.widthLeft_60;
  params.widthLeft[61] = params.widthLeft_61;
  params.widthLeft[62] = params.widthLeft_62;
  params.widthLeft[63] = params.widthLeft_63;
  params.widthLeft[64] = params.widthLeft_64;
  params.widthLeft[65] = params.widthLeft_65;
  params.widthLeft[66] = params.widthLeft_66;
  params.widthLeft[67] = params.widthLeft_67;
  params.widthLeft[68] = params.widthLeft_68;
  params.widthLeft[69] = params.widthLeft_69;
  params.widthLeft[70] = params.widthLeft_70;
  params.widthLeft[71] = params.widthLeft_71;
  params.widthLeft[72] = params.widthLeft_72;
  params.widthLeft[73] = params.widthLeft_73;
  params.widthLeft[74] = params.widthLeft_74;
  params.widthLeft[75] = params.widthLeft_75;
  params.widthLeft[76] = params.widthLeft_76;
  params.widthLeft[77] = params.widthLeft_77;
  params.widthLeft[78] = params.widthLeft_78;
  params.widthLeft[79] = params.widthLeft_79;
  params.widthLeft[80] = params.widthLeft_80;
  params.widthLeft[81] = params.widthLeft_81;
  params.widthLeft[82] = params.widthLeft_82;
  params.widthLeft[83] = params.widthLeft_83;
  params.widthLeft[84] = params.widthLeft_84;
  params.widthLeft[85] = params.widthLeft_85;
  params.widthLeft[86] = params.widthLeft_86;
  params.widthLeft[87] = params.widthLeft_87;
  params.widthLeft[88] = params.widthLeft_88;
  params.widthLeft[89] = params.widthLeft_89;
  params.widthLeft[90] = params.widthLeft_90;
  params.widthLeft[91] = params.widthLeft_91;
  params.widthLeft[92] = params.widthLeft_92;
  params.widthLeft[93] = params.widthLeft_93;
  params.widthLeft[94] = params.widthLeft_94;
  params.widthLeft[95] = params.widthLeft_95;
  params.widthRight[1] = params.widthRight_1;
  params.widthRight[2] = params.widthRight_2;
  params.widthRight[3] = params.widthRight_3;
  params.widthRight[4] = params.widthRight_4;
  params.widthRight[5] = params.widthRight_5;
  params.widthRight[6] = params.widthRight_6;
  params.widthRight[7] = params.widthRight_7;
  params.widthRight[8] = params.widthRight_8;
  params.widthRight[9] = params.widthRight_9;
  params.widthRight[10] = params.widthRight_10;
  params.widthRight[11] = params.widthRight_11;
  params.widthRight[12] = params.widthRight_12;
  params.widthRight[13] = params.widthRight_13;
  params.widthRight[14] = params.widthRight_14;
  params.widthRight[15] = params.widthRight_15;
  params.widthRight[16] = params.widthRight_16;
  params.widthRight[17] = params.widthRight_17;
  params.widthRight[18] = params.widthRight_18;
  params.widthRight[19] = params.widthRight_19;
  params.widthRight[20] = params.widthRight_20;
  params.widthRight[21] = params.widthRight_21;
  params.widthRight[22] = params.widthRight_22;
  params.widthRight[23] = params.widthRight_23;
  params.widthRight[24] = params.widthRight_24;
  params.widthRight[25] = params.widthRight_25;
  params.widthRight[26] = params.widthRight_26;
  params.widthRight[27] = params.widthRight_27;
  params.widthRight[28] = params.widthRight_28;
  params.widthRight[29] = params.widthRight_29;
  params.widthRight[30] = params.widthRight_30;
  params.widthRight[31] = params.widthRight_31;
  params.widthRight[32] = params.widthRight_32;
  params.widthRight[33] = params.widthRight_33;
  params.widthRight[34] = params.widthRight_34;
  params.widthRight[35] = params.widthRight_35;
  params.widthRight[36] = params.widthRight_36;
  params.widthRight[37] = params.widthRight_37;
  params.widthRight[38] = params.widthRight_38;
  params.widthRight[39] = params.widthRight_39;
  params.widthRight[40] = params.widthRight_40;
  params.widthRight[41] = params.widthRight_41;
  params.widthRight[42] = params.widthRight_42;
  params.widthRight[43] = params.widthRight_43;
  params.widthRight[44] = params.widthRight_44;
  params.widthRight[45] = params.widthRight_45;
  params.widthRight[46] = params.widthRight_46;
  params.widthRight[47] = params.widthRight_47;
  params.widthRight[48] = params.widthRight_48;
  params.widthRight[49] = params.widthRight_49;
  params.widthRight[50] = params.widthRight_50;
  params.widthRight[51] = params.widthRight_51;
  params.widthRight[52] = params.widthRight_52;
  params.widthRight[53] = params.widthRight_53;
  params.widthRight[54] = params.widthRight_54;
  params.widthRight[55] = params.widthRight_55;
  params.widthRight[56] = params.widthRight_56;
  params.widthRight[57] = params.widthRight_57;
  params.widthRight[58] = params.widthRight_58;
  params.widthRight[59] = params.widthRight_59;
  params.widthRight[60] = params.widthRight_60;
  params.widthRight[61] = params.widthRight_61;
  params.widthRight[62] = params.widthRight_62;
  params.widthRight[63] = params.widthRight_63;
  params.widthRight[64] = params.widthRight_64;
  params.widthRight[65] = params.widthRight_65;
  params.widthRight[66] = params.widthRight_66;
  params.widthRight[67] = params.widthRight_67;
  params.widthRight[68] = params.widthRight_68;
  params.widthRight[69] = params.widthRight_69;
  params.widthRight[70] = params.widthRight_70;
  params.widthRight[71] = params.widthRight_71;
  params.widthRight[72] = params.widthRight_72;
  params.widthRight[73] = params.widthRight_73;
  params.widthRight[74] = params.widthRight_74;
  params.widthRight[75] = params.widthRight_75;
  params.widthRight[76] = params.widthRight_76;
  params.widthRight[77] = params.widthRight_77;
  params.widthRight[78] = params.widthRight_78;
  params.widthRight[79] = params.widthRight_79;
  params.widthRight[80] = params.widthRight_80;
  params.widthRight[81] = params.widthRight_81;
  params.widthRight[82] = params.widthRight_82;
  params.widthRight[83] = params.widthRight_83;
  params.widthRight[84] = params.widthRight_84;
  params.widthRight[85] = params.widthRight_85;
  params.widthRight[86] = params.widthRight_86;
  params.widthRight[87] = params.widthRight_87;
  params.widthRight[88] = params.widthRight_88;
  params.widthRight[89] = params.widthRight_89;
  params.widthRight[90] = params.widthRight_90;
  params.widthRight[91] = params.widthRight_91;
  params.widthRight[92] = params.widthRight_92;
  params.widthRight[93] = params.widthRight_93;
  params.widthRight[94] = params.widthRight_94;
  params.widthRight[95] = params.widthRight_95;
}
void setup_indexed_optvars(void) {
  /* In CVXGEN, you can say */
  /*   variables */
  /*     x[i] (5), i=2..4 */
  /*   end */
  /* This function sets up x[3] to be a pointer to x_3, which is a length-5 */
  /* vector of doubles. */
  /* If you access variables that you haven't defined in CVXGEN, the result */
  /* is undefined. */
  vars.x[2] = vars.x_2;
  vars.x[1] = vars.x_1;
  vars.x[3] = vars.x_3;
  vars.x[4] = vars.x_4;
  vars.x[5] = vars.x_5;
  vars.x[6] = vars.x_6;
  vars.x[7] = vars.x_7;
  vars.x[8] = vars.x_8;
  vars.x[9] = vars.x_9;
  vars.x[10] = vars.x_10;
  vars.x[11] = vars.x_11;
  vars.x[12] = vars.x_12;
  vars.x[13] = vars.x_13;
  vars.x[14] = vars.x_14;
  vars.x[15] = vars.x_15;
  vars.x[16] = vars.x_16;
  vars.x[17] = vars.x_17;
  vars.x[18] = vars.x_18;
  vars.x[19] = vars.x_19;
  vars.x[20] = vars.x_20;
  vars.x[21] = vars.x_21;
  vars.x[22] = vars.x_22;
  vars.x[23] = vars.x_23;
  vars.x[24] = vars.x_24;
  vars.x[25] = vars.x_25;
  vars.x[26] = vars.x_26;
  vars.x[27] = vars.x_27;
  vars.x[28] = vars.x_28;
  vars.x[29] = vars.x_29;
  vars.x[30] = vars.x_30;
  vars.x[31] = vars.x_31;
  vars.x[32] = vars.x_32;
  vars.x[33] = vars.x_33;
  vars.x[34] = vars.x_34;
  vars.x[35] = vars.x_35;
  vars.x[36] = vars.x_36;
  vars.x[37] = vars.x_37;
  vars.x[38] = vars.x_38;
  vars.x[39] = vars.x_39;
  vars.x[40] = vars.x_40;
  vars.x[41] = vars.x_41;
  vars.x[42] = vars.x_42;
  vars.x[43] = vars.x_43;
  vars.x[44] = vars.x_44;
  vars.x[45] = vars.x_45;
  vars.x[46] = vars.x_46;
  vars.x[47] = vars.x_47;
  vars.x[48] = vars.x_48;
  vars.x[49] = vars.x_49;
  vars.x[50] = vars.x_50;
  vars.x[51] = vars.x_51;
  vars.x[52] = vars.x_52;
  vars.x[53] = vars.x_53;
  vars.x[54] = vars.x_54;
  vars.x[55] = vars.x_55;
  vars.x[56] = vars.x_56;
  vars.x[57] = vars.x_57;
  vars.x[58] = vars.x_58;
  vars.x[59] = vars.x_59;
  vars.x[60] = vars.x_60;
  vars.x[61] = vars.x_61;
  vars.x[62] = vars.x_62;
  vars.x[63] = vars.x_63;
  vars.x[64] = vars.x_64;
  vars.x[65] = vars.x_65;
  vars.x[66] = vars.x_66;
  vars.x[67] = vars.x_67;
  vars.x[68] = vars.x_68;
  vars.x[69] = vars.x_69;
  vars.x[70] = vars.x_70;
  vars.x[71] = vars.x_71;
  vars.x[72] = vars.x_72;
  vars.x[73] = vars.x_73;
  vars.x[74] = vars.x_74;
  vars.x[75] = vars.x_75;
  vars.x[76] = vars.x_76;
  vars.x[77] = vars.x_77;
  vars.x[78] = vars.x_78;
  vars.x[79] = vars.x_79;
  vars.x[80] = vars.x_80;
  vars.x[81] = vars.x_81;
  vars.x[82] = vars.x_82;
  vars.x[83] = vars.x_83;
  vars.x[84] = vars.x_84;
  vars.x[85] = vars.x_85;
  vars.x[86] = vars.x_86;
  vars.x[87] = vars.x_87;
  vars.x[88] = vars.x_88;
  vars.x[89] = vars.x_89;
  vars.x[90] = vars.x_90;
  vars.x[91] = vars.x_91;
  vars.x[92] = vars.x_92;
  vars.x[93] = vars.x_93;
  vars.x[94] = vars.x_94;
  vars.x[95] = vars.x_95;
  vars.delta[2] = vars.delta_2;
  vars.delta[1] = vars.delta_1;
  vars.delta[3] = vars.delta_3;
  vars.delta[4] = vars.delta_4;
  vars.delta[5] = vars.delta_5;
  vars.delta[6] = vars.delta_6;
  vars.delta[7] = vars.delta_7;
  vars.delta[8] = vars.delta_8;
  vars.delta[9] = vars.delta_9;
  vars.delta[10] = vars.delta_10;
  vars.delta[11] = vars.delta_11;
  vars.delta[12] = vars.delta_12;
  vars.delta[13] = vars.delta_13;
  vars.delta[14] = vars.delta_14;
  vars.delta[15] = vars.delta_15;
  vars.delta[16] = vars.delta_16;
  vars.delta[17] = vars.delta_17;
  vars.delta[18] = vars.delta_18;
  vars.delta[19] = vars.delta_19;
  vars.delta[20] = vars.delta_20;
  vars.delta[21] = vars.delta_21;
  vars.delta[22] = vars.delta_22;
  vars.delta[23] = vars.delta_23;
  vars.delta[24] = vars.delta_24;
  vars.delta[25] = vars.delta_25;
  vars.delta[26] = vars.delta_26;
  vars.delta[27] = vars.delta_27;
  vars.delta[28] = vars.delta_28;
  vars.delta[29] = vars.delta_29;
  vars.delta[30] = vars.delta_30;
  vars.delta[31] = vars.delta_31;
  vars.delta[32] = vars.delta_32;
  vars.delta[33] = vars.delta_33;
  vars.delta[34] = vars.delta_34;
  vars.delta[35] = vars.delta_35;
  vars.delta[36] = vars.delta_36;
  vars.delta[37] = vars.delta_37;
  vars.delta[38] = vars.delta_38;
  vars.delta[39] = vars.delta_39;
  vars.delta[40] = vars.delta_40;
  vars.delta[41] = vars.delta_41;
  vars.delta[42] = vars.delta_42;
  vars.delta[43] = vars.delta_43;
  vars.delta[44] = vars.delta_44;
  vars.delta[45] = vars.delta_45;
  vars.delta[46] = vars.delta_46;
  vars.delta[47] = vars.delta_47;
  vars.delta[48] = vars.delta_48;
  vars.delta[49] = vars.delta_49;
  vars.delta[50] = vars.delta_50;
  vars.delta[51] = vars.delta_51;
  vars.delta[52] = vars.delta_52;
  vars.delta[53] = vars.delta_53;
  vars.delta[54] = vars.delta_54;
  vars.delta[55] = vars.delta_55;
  vars.delta[56] = vars.delta_56;
  vars.delta[57] = vars.delta_57;
  vars.delta[58] = vars.delta_58;
  vars.delta[59] = vars.delta_59;
  vars.delta[60] = vars.delta_60;
  vars.delta[61] = vars.delta_61;
  vars.delta[62] = vars.delta_62;
  vars.delta[63] = vars.delta_63;
  vars.delta[64] = vars.delta_64;
  vars.delta[65] = vars.delta_65;
  vars.delta[66] = vars.delta_66;
  vars.delta[67] = vars.delta_67;
  vars.delta[68] = vars.delta_68;
  vars.delta[69] = vars.delta_69;
  vars.delta[70] = vars.delta_70;
  vars.delta[71] = vars.delta_71;
  vars.delta[72] = vars.delta_72;
  vars.delta[73] = vars.delta_73;
  vars.delta[74] = vars.delta_74;
  vars.delta[75] = vars.delta_75;
  vars.delta[76] = vars.delta_76;
  vars.delta[77] = vars.delta_77;
  vars.delta[78] = vars.delta_78;
  vars.delta[79] = vars.delta_79;
  vars.delta[80] = vars.delta_80;
  vars.delta[81] = vars.delta_81;
  vars.delta[82] = vars.delta_82;
  vars.delta[83] = vars.delta_83;
  vars.delta[84] = vars.delta_84;
  vars.delta[85] = vars.delta_85;
  vars.delta[86] = vars.delta_86;
  vars.delta[87] = vars.delta_87;
  vars.delta[88] = vars.delta_88;
  vars.delta[89] = vars.delta_89;
  vars.delta[90] = vars.delta_90;
  vars.delta[91] = vars.delta_91;
  vars.delta[92] = vars.delta_92;
  vars.delta[93] = vars.delta_93;
  vars.delta[94] = vars.delta_94;
  vars.delta[95] = vars.delta_95;
}
void setup_indexing(void) {
  setup_pointers();
  setup_indexed_params();
  setup_indexed_optvars();
}
void set_start(void) {
  int i;
  for (i = 0; i < 663; i++)
    work.x[i] = 0;
  for (i = 0; i < 570; i++)
    work.y[i] = 0;
  for (i = 0; i < 190; i++)
    work.s[i] = (work.h[i] > 0) ? work.h[i] : settings.s_init;
  for (i = 0; i < 190; i++)
    work.z[i] = settings.z_init;
}
double eval_objv(void) {
  int i;
  double objv;
  /* Borrow space in work.rhs. */
  multbyP(work.rhs, work.x);
  objv = 0;
  for (i = 0; i < 663; i++)
    objv += work.x[i]*work.rhs[i];
  objv *= 0.5;
  for (i = 0; i < 663; i++)
    objv += work.q[i]*work.x[i];
  objv += 0;
  return objv;
}
void fillrhs_aff(void) {
  int i;
  double *r1, *r2, *r3, *r4;
  r1 = work.rhs;
  r2 = work.rhs + 663;
  r3 = work.rhs + 853;
  r4 = work.rhs + 1043;
  /* r1 = -A^Ty - G^Tz - Px - q. */
  multbymAT(r1, work.y);
  multbymGT(work.buffer, work.z);
  for (i = 0; i < 663; i++)
    r1[i] += work.buffer[i];
  multbyP(work.buffer, work.x);
  for (i = 0; i < 663; i++)
    r1[i] -= work.buffer[i] + work.q[i];
  /* r2 = -z. */
  for (i = 0; i < 190; i++)
    r2[i] = -work.z[i];
  /* r3 = -Gx - s + h. */
  multbymG(r3, work.x);
  for (i = 0; i < 190; i++)
    r3[i] += -work.s[i] + work.h[i];
  /* r4 = -Ax + b. */
  multbymA(r4, work.x);
  for (i = 0; i < 570; i++)
    r4[i] += work.b[i];
}
void fillrhs_cc(void) {
  int i;
  double *r2;
  double *ds_aff, *dz_aff;
  double mu;
  double alpha;
  double sigma;
  double smu;
  double minval;
  r2 = work.rhs + 663;
  ds_aff = work.lhs_aff + 663;
  dz_aff = work.lhs_aff + 853;
  mu = 0;
  for (i = 0; i < 190; i++)
    mu += work.s[i]*work.z[i];
  /* Don't finish calculating mu quite yet. */
  /* Find min(min(ds./s), min(dz./z)). */
  minval = 0;
  for (i = 0; i < 190; i++)
    if (ds_aff[i] < minval*work.s[i])
      minval = ds_aff[i]/work.s[i];
  for (i = 0; i < 190; i++)
    if (dz_aff[i] < minval*work.z[i])
      minval = dz_aff[i]/work.z[i];
  /* Find alpha. */
  if (-1 < minval)
      alpha = 1;
  else
      alpha = -1/minval;
  sigma = 0;
  for (i = 0; i < 190; i++)
    sigma += (work.s[i] + alpha*ds_aff[i])*
      (work.z[i] + alpha*dz_aff[i]);
  sigma /= mu;
  sigma = sigma*sigma*sigma;
  /* Finish calculating mu now. */
  mu *= 0.005263157894736842;
  smu = sigma*mu;
  /* Fill-in the rhs. */
  for (i = 0; i < 663; i++)
    work.rhs[i] = 0;
  for (i = 853; i < 1613; i++)
    work.rhs[i] = 0;
  for (i = 0; i < 190; i++)
    r2[i] = work.s_inv[i]*(smu - ds_aff[i]*dz_aff[i]);
}
void refine(double *target, double *var) {
  int i, j;
  double *residual = work.buffer;
  double norm2;
  double *new_var = work.buffer2;
  for (j = 0; j < settings.refine_steps; j++) {
    norm2 = 0;
    matrix_multiply(residual, var);
    for (i = 0; i < 1613; i++) {
      residual[i] = residual[i] - target[i];
      norm2 += residual[i]*residual[i];
    }
#ifndef ZERO_LIBRARY_MODE
    if (settings.verbose_refinement) {
      if (j == 0)
        printf("Initial residual before refinement has norm squared %.6g.\n", norm2);
      else
        printf("After refinement we get squared norm %.6g.\n", norm2);
    }
#endif
    /* Solve to find new_var = KKT \ (target - A*var). */
    ldl_solve(residual, new_var);
    /* Update var += new_var, or var += KKT \ (target - A*var). */
    for (i = 0; i < 1613; i++) {
      var[i] -= new_var[i];
    }
  }
#ifndef ZERO_LIBRARY_MODE
  if (settings.verbose_refinement) {
    /* Check the residual once more, but only if we're reporting it, since */
    /* it's expensive. */
    norm2 = 0;
    matrix_multiply(residual, var);
    for (i = 0; i < 1613; i++) {
      residual[i] = residual[i] - target[i];
      norm2 += residual[i]*residual[i];
    }
    if (j == 0)
      printf("Initial residual before refinement has norm squared %.6g.\n", norm2);
    else
      printf("After refinement we get squared norm %.6g.\n", norm2);
  }
#endif
}
double calc_ineq_resid_squared(void) {
  /* Calculates the norm ||-Gx - s + h||. */
  double norm2_squared;
  int i;
  /* Find -Gx. */
  multbymG(work.buffer, work.x);
  /* Add -s + h. */
  for (i = 0; i < 190; i++)
    work.buffer[i] += -work.s[i] + work.h[i];
  /* Now find the squared norm. */
  norm2_squared = 0;
  for (i = 0; i < 190; i++)
    norm2_squared += work.buffer[i]*work.buffer[i];
  return norm2_squared;
}
double calc_eq_resid_squared(void) {
  /* Calculates the norm ||-Ax + b||. */
  double norm2_squared;
  int i;
  /* Find -Ax. */
  multbymA(work.buffer, work.x);
  /* Add +b. */
  for (i = 0; i < 570; i++)
    work.buffer[i] += work.b[i];
  /* Now find the squared norm. */
  norm2_squared = 0;
  for (i = 0; i < 570; i++)
    norm2_squared += work.buffer[i]*work.buffer[i];
  return norm2_squared;
}
void better_start(void) {
  /* Calculates a better starting point, using a similar approach to CVXOPT. */
  /* Not yet speed optimized. */
  int i;
  double *x, *s, *z, *y;
  double alpha;
  work.block_33[0] = -1;
  /* Make sure sinvz is 1 to make hijacked KKT system ok. */
  for (i = 0; i < 190; i++)
    work.s_inv_z[i] = 1;
  fill_KKT();
  ldl_factor();
  fillrhs_start();
  /* Borrow work.lhs_aff for the solution. */
  ldl_solve(work.rhs, work.lhs_aff);
  /* Don't do any refinement for now. Precision doesn't matter too much. */
  x = work.lhs_aff;
  s = work.lhs_aff + 663;
  z = work.lhs_aff + 853;
  y = work.lhs_aff + 1043;
  /* Just set x and y as is. */
  for (i = 0; i < 663; i++)
    work.x[i] = x[i];
  for (i = 0; i < 570; i++)
    work.y[i] = y[i];
  /* Now complete the initialization. Start with s. */
  /* Must have alpha > max(z). */
  alpha = -1e99;
  for (i = 0; i < 190; i++)
    if (alpha < z[i])
      alpha = z[i];
  if (alpha < 0) {
    for (i = 0; i < 190; i++)
      work.s[i] = -z[i];
  } else {
    alpha += 1;
    for (i = 0; i < 190; i++)
      work.s[i] = -z[i] + alpha;
  }
  /* Now initialize z. */
  /* Now must have alpha > max(-z). */
  alpha = -1e99;
  for (i = 0; i < 190; i++)
    if (alpha < -z[i])
      alpha = -z[i];
  if (alpha < 0) {
    for (i = 0; i < 190; i++)
      work.z[i] = z[i];
  } else {
    alpha += 1;
    for (i = 0; i < 190; i++)
      work.z[i] = z[i] + alpha;
  }
}
void fillrhs_start(void) {
  /* Fill rhs with (-q, 0, h, b). */
  int i;
  double *r1, *r2, *r3, *r4;
  r1 = work.rhs;
  r2 = work.rhs + 663;
  r3 = work.rhs + 853;
  r4 = work.rhs + 1043;
  for (i = 0; i < 663; i++)
    r1[i] = -work.q[i];
  for (i = 0; i < 190; i++)
    r2[i] = 0;
  for (i = 0; i < 190; i++)
    r3[i] = work.h[i];
  for (i = 0; i < 570; i++)
    r4[i] = work.b[i];
}
long solve(void) {
  int i;
  int iter;
  double *dx, *ds, *dy, *dz;
  double minval;
  double alpha;
  work.converged = 0;
  setup_pointers();
  pre_ops();
#ifndef ZERO_LIBRARY_MODE
  if (settings.verbose)
    printf("iter     objv        gap       |Ax-b|    |Gx+s-h|    step\n");
#endif
  fillq();
  fillh();
  fillb();
  if (settings.better_start)
    better_start();
  else
    set_start();
  for (iter = 0; iter < settings.max_iters; iter++) {
    for (i = 0; i < 190; i++) {
      work.s_inv[i] = 1.0 / work.s[i];
      work.s_inv_z[i] = work.s_inv[i]*work.z[i];
    }
    work.block_33[0] = 0;
    fill_KKT();
    ldl_factor();
    /* Affine scaling directions. */
    fillrhs_aff();
    ldl_solve(work.rhs, work.lhs_aff);
    refine(work.rhs, work.lhs_aff);
    /* Centering plus corrector directions. */
    fillrhs_cc();
    ldl_solve(work.rhs, work.lhs_cc);
    refine(work.rhs, work.lhs_cc);
    /* Add the two together and store in aff. */
    for (i = 0; i < 1613; i++)
      work.lhs_aff[i] += work.lhs_cc[i];
    /* Rename aff to reflect its new meaning. */
    dx = work.lhs_aff;
    ds = work.lhs_aff + 663;
    dz = work.lhs_aff + 853;
    dy = work.lhs_aff + 1043;
    /* Find min(min(ds./s), min(dz./z)). */
    minval = 0;
    for (i = 0; i < 190; i++)
      if (ds[i] < minval*work.s[i])
        minval = ds[i]/work.s[i];
    for (i = 0; i < 190; i++)
      if (dz[i] < minval*work.z[i])
        minval = dz[i]/work.z[i];
    /* Find alpha. */
    if (-0.99 < minval)
      alpha = 1;
    else
      alpha = -0.99/minval;
    /* Update the primal and dual variables. */
    for (i = 0; i < 663; i++)
      work.x[i] += alpha*dx[i];
    for (i = 0; i < 190; i++)
      work.s[i] += alpha*ds[i];
    for (i = 0; i < 190; i++)
      work.z[i] += alpha*dz[i];
    for (i = 0; i < 570; i++)
      work.y[i] += alpha*dy[i];
    work.gap = eval_gap();
    work.eq_resid_squared = calc_eq_resid_squared();
    work.ineq_resid_squared = calc_ineq_resid_squared();
#ifndef ZERO_LIBRARY_MODE
    if (settings.verbose) {
      work.optval = eval_objv();
      printf("%3d   %10.3e  %9.2e  %9.2e  %9.2e  % 6.4f\n",
          iter+1, work.optval, work.gap, sqrt(work.eq_resid_squared),
          sqrt(work.ineq_resid_squared), alpha);
    }
#endif
    /* Test termination conditions. Requires optimality, and satisfied */
    /* constraints. */
    if (   (work.gap < settings.eps)
        && (work.eq_resid_squared <= settings.resid_tol*settings.resid_tol)
        && (work.ineq_resid_squared <= settings.resid_tol*settings.resid_tol)
       ) {
      work.converged = 1;
      work.optval = eval_objv();
      return iter+1;
    }
  }
  return iter;
}
