// MEDICAL LINAC GEOMETRY FOR A VARIAN 2100C
// 6MV PHOTON BEAM GENERATION
// GEOMETRY PARAMATERS TO BE SET

:P ECUT 700.0*keV
:P PCUT 10.0*keV
:P SMAX 1e10*cm
:P fieldX 40.0*cm
:P fieldY 40.0*cm
:P SSD 100.0*cm

// CREATE THE WORLD VOLUME
:VOLU world BOX 200.0*cm 200.0*cm 200.0*cm G4_AIR
:VIS world OFF

// INITIALIZE THE MATERIALS
// BUILD MEDIUM PROPERTIES
//:MATE_PROPERTIES_TABLE mpt1
//:MATEPT_ADD_ENERGIES mpt1 400.00000*wvnm 700.00000*wvnm 
//:MATEPT_ADD_PROPERTY mpt1 RINDEX 1.33 1.33
//:MATEPT_ADD_PROPERTY mpt1 ABSCOEF 10000000000.*/mm 10000000000.*/mm
//:MATEPT_ATTACH_TO_MATERIAL mpt1 G4_WATER

//:MATE_PROPERTIES_TABLE mpt2
//:MATEPT_ADD_ENERGIES mpt2 400.00000*wvnm 700.00000*wvnm
//:MATEPT_ADD_PROPERTY mpt2 RINDEX 1.0 1.0
//:MATEPT_ADD_PROPERTY mpt2 ABSCOEF 10000000000.*/mm 10000000000.*/mm
//:MATEPT_ATTACH_TO_MATERIAL mpt2 G4_AIR

:MIXT WTARGET700 18.0 2 
       G4_W 0.98
       G4_Cu 0.02

:MIXT WPRIMCOLL700 18.0 2 
       G4_W 0.98
       G4_Cu 0.02

:MIXT WJAWS700 17.0 4 
       G4_W 0.90
       G4_Ni 0.06
       G4_Fe 0.02
       G4_Cu 0.02

:MIXT SAE12L14 7.85 6 
       G4_Fe 0.977
       G4_C 0.0015
       G4_Mn 0.01
       G4_P 0.0065
       G4_S 0.003
       G4_Pb 0.002

:MIXT TA700 16.6 1 
       G4_Ta 1.0

// CREATE THE TARGETS
:P zo1 -0.0235*cm
:P targetA_z 0.0635*cm
:P targetB_z 1.016*cm
:P vacuum_z 0.484*cm

:ROTM RM0 0. 0. 0.
//:VOLU targetA BOX 1.0*cm 1.0*cm ($targetA_z/2) WTARGET700
//:COLOR targetA  0.0 1.0 0.0
//:PLACE targetA  1 world RM0 0.0*cm 0.0*cm ($targetA_z/2+$zo1)
//:VOLU targetB BOX 1.0*cm 1.0*cm ($targetB_z/2) G4_Cu
//:COLOR targetB 1.0 0.0 0.0
//:PLACE targetB 1 world RM0 0.0*cm 0.0*cm ($targetA_z+$zo1+$targetB_z/2)
//:COLOR targetB 0.0 0.0 0.0
:VOLU vacuum BOX 1.0*cm 1.0*cm ($vacuum_z/2) G4_Galactic
:PLACE vacuum 1 world RM0 0.0*cm 0.0*cm ($targetA_z+$zo1+$targetB_z+$vacuum_z/2)
//:VIS targetA ON
//:VIS targetB ON
:VIS vacuum OFF

// CREATE THE PRIMARY COLLIMATOR
:P zo2 1.54*cm
:P upperCollimator_z 5.99*cm
:P lowerCollimator_z 5.99*cm

:ROTM RM1 180.*deg 0. 0.
:VOLU upperCollimator TUBS 0.0*cm 10.0*cm ($upperCollimator_z/2) 0.*deg 360.*deg WPRIMCOLL700
:VOLU lowerCollimator CONS 0.0*cm 0.6101*cm 0.0*cm 2.08915*cm ($lowerCollimator_z/2) 0.0*deg 360.0*deg G4_Galactic
:COLOR upperCollimator 0.5 0.5 0.5
:COLOR lowerCollimator 0.0 0.0 0.0
:PLACE lowerCollimator 1 upperCollimator RM0 0.0*cm 0.0*cm 0.0*cm
:PLACE upperCollimator 1 world RM1 0.0*cm 0.0*cm ($zo2+$upperCollimator_z/2)
:VIS upperCollimator ON
:VIS lowerCollimator ON

// CREATE THE Be WINDOW
:P zo3 7.530001*cm
:P vacuum2_z 1.295399*cm
:P window_z 0.0254*cm

:VOLU vacuum2 BOX 10.0*cm 10.0*cm ($vacuum2_z/2) G4_Galactic
:COLOR vacuum2 0.0 0.0 0.0
:PLACE vacuum2 1 world RM0 0.0*cm 0.0*cm ($zo3+$vacuum2_z/2)
:VOLU window BOX 10.0*cm 10.0*cm ($window_z/2) G4_Be
:COLOR window 0.0 0.25 0.0
:PLACE window 1 world RM0 0.0*mm 0.0*mm ($zo3+$vacuum2_z+$window_z/2)
:VIS window ON
:VIS vacuum2 OFF

// CREATE THE SCATTERING FOIL
//:P szo1 9.1049*cm
//:P szo2 12.576*cm
//:P slayer1_z 0.0051*cm
//:P slayer2_z 0.022*cm
//:P slayer3_z 0.102*cm

//:VOLU slayer1 CONE 0.0*cm 0.635*cm 0.0*cm 0.0635*cm ($slayer1_z/2) TA700
//:VOLU slayer2 CONE 0.0*cm 0.4*cm 0.0*cm 0.4*cm ($slayer2_z/2) G4_Al
//:VOLU slayer3 CONE 0.0*cm 0.499*cm 0.0*cm 0.499*cm ($slayer3_z/2) G4_Al

//:PLACE slayer1 1 world RM0 0.0*mm 0.0*mm ($szo1+$slayer1_z/2)
//:PLACE slayer2 1 world RM0 0.0*mm 0.0*mm ($szo2+$slayer2_z/2)
//:PLACE slayer3 1 world RM0 0.0*mm 0.0*mm ($szo2+$slayer2_z+$slayer3_z/2)

//:VIS slayer1 ON
//:VIS slayer2 ON
//:VIS slayer3 ON

// CREATE THE FLATTENING FILTER
//:P zo4 9.2136*cm
//:P layer1_z 0.0127*cm
//:P layer2_z 0.0274*cm
//:P layer3_z 0.0429*cm
//:P layer4_z 0.0554*cm
//:P layer5_z 0.161*cm
//:P layer6_z 0.2327*cm
//:P layer7_z 0.1554*cm
//:P layer8_z 0.2543*cm
//:P layer9_z 0.112*cm
//:P layer10_z 0.0203*cm
//:P layer11_z 0.0376*cm
//:P layer12_z 0.0559*cm
//:P layer13_z 0.1412*cm
//:P layer14_z 0.2037*cm
//:P layer15_z 0.3559*cm
//:P layer16_z 0.267*cm
//:P layer17_z 1.0952*cm
//:P layer18_z 0.2383*cm
//:P layer19_z 0.0635*cm
//:P layer20_z 0.1539*cm
//:P layer21_z 0.0254*cm
//:P layer22_z 0.1123*cm
//:P layer23_z 0.1981*cm
//:P layer24_z 0.2029*cm
//:P layer25_z 0.03556*cm
//:P layer26_z 0.0608*cm
//:P layer27_z 0.0785*cm
//:P layer28_z 0.016*cm

//:VOLU layer1 CONE 0.0*cm 0.0*cm 0.0*cm 0.0635*cm ($layer1_z/2) SAE12L14
//:VOLU layer2 CONE 0.0*cm 0.0635*cm 0.0*cm 0.1016*cm ($layer2_z/2) SAE12L14
//:VOLU layer3 CONE 0.0*cm 0.1016*cm 0.0*cm 0.1473*cm ($layer3_z/2) SAE12L14
//:VOLU layer4 CONE 0.0*cm 0.1473*cm 0.0*cm 0.1905*cm ($layer4_z/2) SAE12L14
//:VOLU layer5 CONE 0.0*cm 0.1905*cm 0.0*cm 0.254*cm ($layer5_z/2) SAE12L14
//:VOLU layer6 CONE 0.0*cm 0.254*cm 0.0*cm 0.381*cm ($layer6_z/2) SAE12L14
//:VOLU layer7 CONE 0.0*cm 0.381*cm 0.0*cm 0.508*cm ($layer7_z/2) SAE12L14
//:VOLU layer8 CONE 0.0*cm 0.508*cm 0.0*cm 0.762*cm ($layer8_z/2) SAE12L14
//:VOLU layer9 CONE 0.0*cm 0.762*cm 0.0*cm 0.9144*cm ($layer9_z/2) SAE12L14
//:VOLU layer10 CONE 0.0*cm 0.9144*cm 0.0*cm 0.9652*cm ($layer10_z/2) SAE12L14
//:VOLU layer11 CONE 0.0*cm 0.9652*cm 0.0*cm 1.016*cm ($layer11_z/2) SAE12L14
//:VOLU layer12 CONE 0.0*cm 1.016*cm 0.0*cm 1.0668*cm ($layer12_z/2) SAE12L14
//:VOLU layer13 CONE 0.0*cm 1.0668*cm 0.0*cm 1.143*cm ($layer13_z/2) SAE12L14
//:VOLU layer14 CONE 0.0*cm 1.143*cm 0.0*cm 1.27*cm ($layer14_z/2) SAE12L14
//:VOLU layer15 CONE 0.0*cm 1.27*cm 0.0*cm 1.524*cm ($layer15_z/2) SAE12L14
//:VOLU layer16 CONE 0.0*cm 1.524*cm 0.0*cm 1.778*cm ($layer16_z/2) SAE12L14
//:VOLU layer17 CONE 0.0*cm 1.778*cm 0*cm 2.794*cm ($layer17_z/2) SAE12L14
//:VOLU layer18 CONE 0.0*cm 3.8*cm 0*cm 3.8*cm ($layer18_z/2) SAE12L14
//:VOLU layer19 CONE 0.0*cm 3.8*cm 0*cm 3.8*cm ($layer19_z/2) G4_AIR
//:VOLU layer20 CONE 0.0*cm 3.8*cm 0*cm 3.8*cm ($layer20_z/2) SAE12L14
//:VOLU layer21 CONE 0.0*cm 2.794*cm 0*cm 2.515*cm ($layer21_z/2) SAE12L14
//:VOLU layer22 CONE 0.0*cm 2.515*cm 0*cm 2.2708*cm ($layer22_z/2) SAE12L14
//:VOLU layer23 CONE 0.0*cm 2.2708*cm 0*cm 2.0295*cm ($layer23_z/2) SAE12L14
//:VOLU layer24 CONE 0.0*cm 2.0295*cm 0*cm 1.7882*cm ($layer24_z/2) SAE12L14
//:VOLU layer25 CONE 0.0*cm 1.7882*cm 0*cm 1.7272*cm ($layer25_z/2) SAE12L14
//:VOLU layer26 CONE 0.0*cm 0.8092*cm 0*cm 0.4153*cm ($layer26_z/2) SAE12L14
//:VOLU layer26s CONE 0.8902*cm 1.7272*cm 1.3081*cm 1.6606*cm ($layer26_z/2) SAE12L14
//:VOLU layer27 CONE 0.0*cm 0.4153*cm 0.0*cm 0.0597*cm ($layer27_z/2) SAE12L14
//:VOLU layer27s CONE 1.3081*cm 1.6606*cm 1.4275*cm 1.4276*cm ($layer27_z/2) SAE12L14
//:VOLU layer28 CONE 0.0*cm 0.0597*cm 0.0*cm 0.0*cm ($layer28_z/2) SAE12L14
//:VOLU inside17 CONE 0.0*cm 0.0*cm 0.0*cm 1.0952*cm ($layer17_z/2) TA700
//:VOLU inside18 CONE 0.0*cm 1.0952*cm 0.0*cm 1.3335*cm ($layer18_z/2) TA700

//:PLACE layer1 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z/2)
//:PLACE layer2 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z/2)
//:PLACE layer3 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z/2)
//:PLACE layer4 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z/2)
//:PLACE layer5 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z+$layer5_z/2)
//:PLACE layer6 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z+$layer5_z+$layer6_z/2)
//:PLACE layer7 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z+$layer5_z+$layer6_z+$layer7_z/2)
//:PLACE layer8 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z+$layer5_z+$layer6_z+$layer7_z+$layer8_z/2)
//:PLACE layer9 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z+$layer5_z+$layer6_z+$layer7_z+$layer8_z+$layer9_z/2)
//:PLACE layer10 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z+$layer5_z+$layer6_z+$layer7_z+$layer8_z+$layer9_z+$layer10_z/2)
//:PLACE layer11 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z+$layer5_z+$layer6_z+$layer7_z+$layer8_z+$layer9_z+$layer10_z+$layer11_z/2)
//:PLACE layer12 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z+$layer5_z+$layer6_z+$layer7_z+$layer8_z+$layer9_z+$layer10_z+$layer11_z+$layer12_z/2)
//:PLACE layer13 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z+$layer5_z+$layer6_z+$layer7_z+$layer8_z+$layer9_z+$layer10_z+$layer11_z+$layer12_z+$layer13_z/2)
//:PLACE layer14 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z+$layer5_z+$layer6_z+$layer7_z+$layer8_z+$layer9_z+$layer10_z+$layer11_z+$layer12_z+$layer13_z+$layer14_z/2)
//:PLACE layer15 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z+$layer5_z+$layer6_z+$layer7_z+$layer8_z+$layer9_z+$layer10_z+$layer11_z+$layer12_z+$layer13_z+$layer14_z+$layer15_z/2)
//:PLACE layer16 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z+$layer5_z+$layer6_z+$layer7_z+$layer8_z+$layer9_z+$layer10_z+$layer11_z+$layer12_z+$layer13_z+$layer14_z+$layer15_z+$layer16_z/2)
//:PLACE layer17 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z+$layer5_z+$layer6_z+$layer7_z+$layer8_z+$layer9_z+$layer10_z+$layer11_z+$layer12_z+$layer13_z+$layer14_z+$layer15_z+$layer16_z+$layer17_z/2)
//:PLACE inside17 1 layer17 RM0 0.0*mm 0.0*mm 0.0*mm
//:PLACE layer18 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z+$layer5_z+$layer6_z+$layer7_z+$layer8_z+$layer9_z+$layer10_z+$layer11_z+$layer12_z+$layer13_z+$layer14_z+$layer15_z+$layer16_z+$layer17_z+$layer18_z/2)
//:PLACE inside18 1 layer18 RM0 0.0*mm 0.0*mm 0.0*mm
//:PLACE layer19 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z+$layer5_z+$layer6_z+$layer7_z+$layer8_z+$layer9_z+$layer10_z+$layer11_z+$layer12_z+$layer13_z+$layer14_z+$layer15_z+$layer16_z+$layer17_z+$layer18_z+$layer19_z/2)
//:PLACE layer20 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z+$layer5_z+$layer6_z+$layer7_z+$layer8_z+$layer9_z+$layer10_z+$layer11_z+$layer12_z+$layer13_z+$layer14_z+$layer15_z+$layer16_z+$layer17_z+$layer18_z+$layer19_z+$layer20_z/2)
//:PLACE layer21 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z+$layer5_z+$layer6_z+$layer7_z+$layer8_z+$layer9_z+$layer10_z+$layer11_z+$layer12_z+$layer13_z+$layer14_z+$layer15_z+$layer16_z+$layer17_z+$layer18_z+$layer19_z+$layer20_z+$layer21_z/2)
//:PLACE layer22 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z+$layer5_z+$layer6_z+$layer7_z+$layer8_z+$layer9_z+$layer10_z+$layer11_z+$layer12_z+$layer13_z+$layer14_z+$layer15_z+$layer16_z+$layer17_z+$layer18_z+$layer19_z+$layer20_z+$layer21_z+$layer22_z/2)
//:PLACE layer23 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z+$layer5_z+$layer6_z+$layer7_z+$layer8_z+$layer9_z+$layer10_z+$layer11_z+$layer12_z+$layer13_z+$layer14_z+$layer15_z+$layer16_z+$layer17_z+$layer18_z+$layer19_z+$layer20_z+$layer21_z+$layer22_z+$layer23_z/2)
//:PLACE layer24 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z+$layer5_z+$layer6_z+$layer7_z+$layer8_z+$layer9_z+$layer10_z+$layer11_z+$layer12_z+$layer13_z+$layer14_z+$layer15_z+$layer16_z+$layer17_z+$layer18_z+$layer19_z+$layer20_z+$layer21_z+$layer22_z+$layer23_z+$layer24_z/2)
//:PLACE layer25 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z+$layer5_z+$layer6_z+$layer7_z+$layer8_z+$layer9_z+$layer10_z+$layer11_z+$layer12_z+$layer13_z+$layer14_z+$layer15_z+$layer16_z+$layer17_z+$layer18_z+$layer19_z+$layer20_z+$layer21_z+$layer22_z+$layer23_z+$layer24_z+$layer25_z/2)
//:PLACE layer26 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z+$layer5_z+$layer6_z+$layer7_z+$layer8_z+$layer9_z+$layer10_z+$layer11_z+$layer12_z+$layer13_z+$layer14_z+$layer15_z+$layer16_z+$layer17_z+$layer18_z+$layer19_z+$layer20_z+$layer21_z+$layer22_z+$layer23_z+$layer24_z+$layer25_z+$layer26_z/2)
//:PLACE layer26s 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z+$layer5_z+$layer6_z+$layer7_z+$layer8_z+$layer9_z+$layer10_z+$layer11_z+$layer12_z+$layer13_z+$layer14_z+$layer15_z+$layer16_z+$layer17_z+$layer18_z+$layer19_z+$layer20_z+$layer21_z+$layer22_z+$layer23_z+$layer24_z+$layer25_z+$layer26_z/2)
//:PLACE layer27 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z+$layer5_z+$layer6_z+$layer7_z+$layer8_z+$layer9_z+$layer10_z+$layer11_z+$layer12_z+$layer13_z+$layer14_z+$layer15_z+$layer16_z+$layer17_z+$layer18_z+$layer19_z+$layer20_z+$layer21_z+$layer22_z+$layer23_z+$layer24_z+$layer25_z+$layer26_z+$layer27_z/2)
//:PLACE layer27s 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z+$layer5_z+$layer6_z+$layer7_z+$layer8_z+$layer9_z+$layer10_z+$layer11_z+$layer12_z+$layer13_z+$layer14_z+$layer15_z+$layer16_z+$layer17_z+$layer18_z+$layer19_z+$layer20_z+$layer21_z+$layer22_z+$layer23_z+$layer24_z+$layer25_z+$layer26_z+$layer27_z/2)
//:PLACE layer28 1 world RM0 0.0*mm 0.0*mm ($zo4+$layer1_z+$layer2_z+$layer3_z+$layer4_z+$layer5_z+$layer6_z+$layer7_z+$layer8_z+$layer9_z+$layer10_z+$layer11_z+$layer12_z+$layer13_z+$layer14_z+$layer15_z+$layer16_z+$layer17_z+$layer18_z+$layer19_z+$layer20_z+$layer21_z+$layer22_z+$layer23_z+$layer24_z+$layer25_z+$layer26_z+$layer27_z+$layer28_z/2)

//:COLOR layer1 0.2 0.8 0.1
//:COLOR layer2 0.2 0.8 0.1
//:COLOR layer3 0.2 0.8 0.1
//:COLOR layer4 0.2 0.8 0.1
//:COLOR layer5 0.2 0.8 0.1
//:COLOR layer6 0.2 0.8 0.1
//:COLOR layer7 0.2 0.8 0.1
//:COLOR layer8 0.2 0.8 0.1
//:COLOR layer9 0.2 0.8 0.1
//:COLOR layer10 0.2 0.8 0.1
//:COLOR layer11 0.2 0.8 0.1
//:COLOR layer12 0.2 0.8 0.1
//:COLOR layer13 0.2 0.8 0.1
//:COLOR layer14 0.2 0.8 0.1
//:COLOR layer15 0.2 0.8 0.1
//:COLOR layer16 0.2 0.8 0.1
//:COLOR layer17 0.2 0.8 0.1
//:COLOR layer18 0.2 0.8 0.1
//:COLOR layer19 0.2 0.8 0.1
//:COLOR layer20 0.2 0.8 0.1
//:COLOR layer21 0.2 0.8 0.1
//:COLOR layer22 0.2 0.8 0.1
//:COLOR layer23 0.2 0.8 0.1
//:COLOR layer24 0.2 0.8 0.1
//:COLOR layer25 0.2 0.8 0.1
//:COLOR layer26 0.2 0.8 0.1
//:COLOR layer26s 0.2 0.8 0.1
//:COLOR layer27 0.2 0.8 0.1
//:COLOR layer27s 0.2 0.8 0.1
//:COLOR layer28 0.2 0.8 0.1
//:COLOR inside17 0.6 0.8 0.1
//:COLOR inside18 0.6 0.8 0.1
//:VIS layer1 ON
//:VIS layer2 ON
//:VIS layer3 ON
//:VIS layer4 ON
//:VIS layer5 ON
//:VIS layer6 ON
//:VIS layer7 ON
//:VIS layer8 ON
//:VIS layer9 ON
//:VIS layer10 ON
//:VIS layer11 ON
//:VIS layer12 ON
//:VIS layer13 ON
//:VIS layer14 ON
//:VIS layer15 ON
//:VIS layer16 ON
//:VIS layer17 ON
//:VIS layer18 ON
//:VIS layer19 ON
//:VIS layer20 ON
//:VIS layer21 ON
//:VIS layer22 ON
//:VIS layer23 ON
//:VIS layer24 ON
//:VIS layer25 ON
//:VIS layer26 ON
//:VIS layer26s ON
//:VIS layer27 ON
//:VIS layer27s ON
//:VIS layer28 ON
//:VIS inside17 ON
//:VIS inside18 ON

// CREATE THE IONIZATION CHAMBERS
:P zo5 14.83*cm
:P airGap_z 1.99273*cm
:P icWall_z 1.4388*cm
:P iclayer1_z 0.0127*cm
:P iclayer2_z 0.2273*cm
:P iclayer3_z 0.0051*cm
:P iclayer4_z 0.234*cm
:P iclayer5_z 0.0051*cm
:P iclayer6_z 0.229*cm
:P iclayer7_z 0.0127*cm
:P iclayer8_z 0.229*cm
:P iclayer9_z 0.0051*cm
:P iclayer10_z 0.234*cm
:P iclayer11_z 0.0051*cm
:P iclayer12_z 0.227*cm
:P iclayer13_z 0.0127*cm

:VOLU icWall CONE 9.525*cm 10.0*cm 9.525*cm 10.0*cm ($icWall_z/2) G4_KAPTON
:VOLU iclayer1 CONE 0.0*cm 9.525*cm 0.0*cm 9.525*cm ($iclayer1_z/2) G4_KAPTON
:VOLU iclayer3 CONE 0.0*cm 9.525*cm 0.0*cm 9.525*cm ($iclayer3_z/2) G4_KAPTON
:VOLU iclayer5 CONE 0.0*cm 9.525*cm 0.0*cm 9.525*cm ($iclayer5_z/2) G4_KAPTON
:VOLU iclayer7 CONE 0.0*cm 9.525*cm 0.0*cm 9.525*cm ($iclayer7_z/2) G4_KAPTON
:VOLU iclayer9 CONE 0.0*cm 9.525*cm 0.0*cm 9.525*cm ($iclayer9_z/2) G4_KAPTON
:VOLU iclayer11 CONE 0.0*cm 9.525*cm 0.0*cm 9.525*cm ($iclayer11_z/2) G4_KAPTON
:VOLU iclayer13 CONE 0.0*cm 9.525*cm 0.0*cm 9.525*cm ($iclayer13_z/2) G4_KAPTON
:PLACE icWall 1 world RM0 0.0*mm 0.0*mm ($zo5+$icWall_z/2)
:PLACE iclayer1 1 world RM0 0.0*mm 0.0*mm ($zo5+$iclayer1_z/2)
:PLACE iclayer3 1 world RM0 0.0*mm 0.0*mm ($zo5+$iclayer1_z+$iclayer2_z+$iclayer3_z/2)
:PLACE iclayer5 1 world RM0 0.0*mm 0.0*mm ($zo5+$iclayer1_z+$iclayer2_z+$iclayer3_z+$iclayer4_z+$iclayer5_z/2)
:PLACE iclayer7 1 world RM0 0.0*mm 0.0*mm ($zo5+$iclayer1_z+$iclayer2_z+$iclayer3_z+$iclayer4_z+$iclayer5_z+$iclayer6_z+$iclayer7_z/2)
:PLACE iclayer9 1 world RM0 0.0*mm 0.0*mm ($zo5+$iclayer1_z+$iclayer2_z+$iclayer3_z+$iclayer4_z+$iclayer5_z+$iclayer6_z+$iclayer7_z+$iclayer8_z+$iclayer9_z/2)
:PLACE iclayer11 1 world RM0 0.0*mm 0.0*mm ($zo5+$iclayer1_z+$iclayer2_z+$iclayer3_z+$iclayer4_z+$iclayer5_z+$iclayer6_z+$iclayer7_z+$iclayer8_z+$iclayer9_z+$iclayer10_z+$iclayer11_z/2)
:PLACE iclayer13 1 world RM0 0.0*mm 0.0*mm ($zo5+$iclayer1_z+$iclayer2_z+$iclayer3_z+$iclayer4_z+$iclayer5_z+$iclayer6_z+$iclayer7_z+$iclayer8_z+$iclayer9_z+$iclayer10_z+$iclayer11_z+$iclayer12_z+$iclayer13_z/2)

:COLOR icWall 0.8 0.8 0.1
:COLOR iclayer1 0.8 0.8 0.1
:COLOR iclayer3 0.8 0.8 0.1
:COLOR iclayer5 0.8 0.8 0.1
:COLOR iclayer7 0.8 0.8 0.1
:COLOR iclayer9 0.8 0.8 0.1
:COLOR iclayer11 0.8 0.8 0.1
:VIS icWall ON
:VIS iclayer1 ON
:VIS iclayer3 ON
:VIS iclayer5 ON
:VIS iclayer7 ON
:VIS iclayer9 ON
:VIS iclayer11 ON
:VIS iclayer13 ON

// CREATE THE MIRROR
:P zo6 22.0*cm
:P mirror_z 0.00508*cm 
:VOLU mirror BOX 10.0*cm 10.0*cm ($mirror_z/2) G4_MYLAR
:PLACE mirror 1 world RM0 0.0*mm 0.0*mm ($zo6+$mirror_z/2)
:COLOR mirror 0.0 0.75 1.0
:VIS mirror ON

// CREATE THE SHIELD
:P zo7 24.2*cm
:P shield_z 2.8*cm

:VOLU outerShield BOX 20.0*cm 20.0*cm ($shield_z/2) G4_Pb
:VOLU innerShield BOX 5.97*cm 5.97*cm ($shield_z/2) G4_AIR
:PLACE innerShield 1 outerShield RM0 0.0*cm 0.0*cm 0.0*cm
:PLACE outerShield 1 world RM0 0.0*mm 0.0*mm ($zo7+$shield_z/2)
:COLOR innerShield 0.0 0.0 0.0
:COLOR outerShield 0.3 0.1 0.8
:VIS innerShield ON
:VIS outerShield ON

// CREATE THE JAW MODULES
:P zo8 28.0*cm
:P zo9 36.7*cm
:P xJaws_z 7.64853*cm
:P yJaws_z 7.64853*cm

:MODULE JAWS jaws_X X STRAIGHT 20.0*cm 20.0*cm ($xJaws_z/2) 
0.0*cm ($zo9) ($zo9) ($SSD)
-($fieldX/2) ($fieldX/2)
WJAWS700 world

:MODULE JAWS jaws_Y Y STRAIGHT 20.0*cm 20.0*cm ($xJaws_z/2) 
0.0*cm ($zo8) ($zo8) ($SSD)
-($fieldY/2) ($fieldY/2)
WJAWS700 world

// CREATE THE REGIONS

//:REGION targetA targetA
//:REGION targetB targetB
//:REGION collimator upperCollimator lowerCollimator vacuum2
//:REGION window window
//:REGION flatfilt layer1 layer2 layer3 layer4 layer5 layer6 layer7 layer8 layer9 layer10 layer11 layer12 layer13 layer14 layer15 layer16 layer17 layer18 layer19 layer20 layer21 layer22 layer23 layer24 layer25 layer26 layer27 layer28
//:REGION ffinside inside17 inside18
//:REGION ionchamb icWall iclayer1 iclayer3 iclayer5 iclayer7 iclayer9 iclayer11 iclayer13
//:REGION mirror mirror
//:REGION shield outerShield innerShield
//:REGION jaws jaws_X jaws_Y

// CREATE THE CUTS

//:CUTS targetA 0.0160987 0.272386 0.272386
//:CUTS targetB 0.18166 0.429256 0.429256
//:CUTS collimator 0.0160987 0.272386 0.272386
//:CUTS flatfilt 0.244844 0.474161 0.474161
//:CUTS ffinside 0.0175318 0.296635 0.296635
//:CUTS window 55.6379 1.72844 1.72844
//:CUTS ionchamb 21.5443 2.02814 2.02814
//:CUTS mirror 20.2095 2.02095 2.02095
//:CUTS shield 0.0210899 0.446366 0.446366
//:CUTS jaws 0.0182307 0.28024 0.28024

//CREATE THE DETECTOR

:VOLU container BOX 125.*mm 125.*mm 40.*mm G4_WATER
:VOLU voxel BOX 0.5*mm 0.5*mm 0.5*mm G4_WATER
:VIS voxel OFF
:PLACE container 1 world RM0 0. 0. 1040.
:PLACE_PARAM voxel 1 container PHANTOM 250. 250. 80. 1. 1. 1.

//CREATE AIR KERMA DETECTOR
//:VOLU world BOX 200.0*cm 200.0*cm 200.0*cm G4_AIR
//:VIS world OFF
