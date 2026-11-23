/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.Omega4Q.Sound
import P2qJumps.Omega4Q.Kernel.C000
import P2qJumps.Omega4Q.Kernel.C001
import P2qJumps.Omega4Q.Kernel.C002
import P2qJumps.Omega4Q.Kernel.C003
import P2qJumps.Omega4Q.Kernel.C004
import P2qJumps.Omega4Q.Kernel.C005
import P2qJumps.Omega4Q.Kernel.C006
import P2qJumps.Omega4Q.Kernel.C007
import P2qJumps.Omega4Q.Kernel.C008
import P2qJumps.Omega4Q.Kernel.C009
import P2qJumps.Omega4Q.Kernel.C010
import P2qJumps.Omega4Q.Kernel.C011
import P2qJumps.Omega4Q.Kernel.C012
import P2qJumps.Omega4Q.Kernel.C013
import P2qJumps.Omega4Q.Kernel.C014
import P2qJumps.Omega4Q.Kernel.C015
import P2qJumps.Omega4Q.Kernel.C016
import P2qJumps.Omega4Q.Kernel.C017
import P2qJumps.Omega4Q.Kernel.C018
import P2qJumps.Omega4Q.Kernel.C019
import P2qJumps.Omega4Q.Kernel.C020
import P2qJumps.Omega4Q.Kernel.C021
import P2qJumps.Omega4Q.Kernel.C022
import P2qJumps.Omega4Q.Kernel.C023
import P2qJumps.Omega4Q.Kernel.C024
import P2qJumps.Omega4Q.Kernel.C025
import P2qJumps.Omega4Q.Kernel.C026
import P2qJumps.Omega4Q.Kernel.C027
import P2qJumps.Omega4Q.Kernel.C028
import P2qJumps.Omega4Q.Kernel.C029
import P2qJumps.Omega4Q.Kernel.C030
import P2qJumps.Omega4Q.Kernel.C031
import P2qJumps.Omega4Q.Kernel.C032
import P2qJumps.Omega4Q.Kernel.C033
import P2qJumps.Omega4Q.Kernel.C034
import P2qJumps.Omega4Q.Kernel.C035
import P2qJumps.Omega4Q.Kernel.C036
import P2qJumps.Omega4Q.Kernel.C037
import P2qJumps.Omega4Q.Kernel.C038
import P2qJumps.Omega4Q.Kernel.C039
import P2qJumps.Omega4Q.Kernel.C040
import P2qJumps.Omega4Q.Kernel.C041
import P2qJumps.Omega4Q.Kernel.C042
import P2qJumps.Omega4Q.Kernel.C043
import P2qJumps.Omega4Q.Kernel.C044
import P2qJumps.Omega4Q.Kernel.C045
import P2qJumps.Omega4Q.Kernel.C046
import P2qJumps.Omega4Q.Kernel.C047
import P2qJumps.Omega4Q.Kernel.C048
import P2qJumps.Omega4Q.Kernel.C049
import P2qJumps.Omega4Q.Kernel.C050
import P2qJumps.Omega4Q.Kernel.C051
import P2qJumps.Omega4Q.Kernel.C052
import P2qJumps.Omega4Q.Kernel.C053
import P2qJumps.Omega4Q.Kernel.C054
import P2qJumps.Omega4Q.Kernel.C055
import P2qJumps.Omega4Q.Kernel.C056
import P2qJumps.Omega4Q.Kernel.C057
import P2qJumps.Omega4Q.Kernel.C058
import P2qJumps.Omega4Q.Kernel.C059
import P2qJumps.Omega4Q.Kernel.C060
import P2qJumps.Omega4Q.Kernel.C061
import P2qJumps.Omega4Q.Kernel.C062
import P2qJumps.Omega4Q.Kernel.C063
import P2qJumps.Omega4Q.Kernel.C064
import P2qJumps.Omega4Q.Kernel.C065
import P2qJumps.Omega4Q.Kernel.C066
import P2qJumps.Omega4Q.Kernel.C067
import P2qJumps.Omega4Q.Kernel.C068
import P2qJumps.Omega4Q.Kernel.C069
import P2qJumps.Omega4Q.Kernel.C070
import P2qJumps.Omega4Q.Kernel.C071
import P2qJumps.Omega4Q.Kernel.C072
import P2qJumps.Omega4Q.Kernel.C073
import P2qJumps.Omega4Q.Kernel.C074
import P2qJumps.Omega4Q.Kernel.C075
import P2qJumps.Omega4Q.Kernel.C076
import P2qJumps.Omega4Q.Kernel.C077
import P2qJumps.Omega4Q.Kernel.C078
import P2qJumps.Omega4Q.Kernel.C079
import P2qJumps.Omega4Q.Kernel.C080
import P2qJumps.Omega4Q.Kernel.C081
import P2qJumps.Omega4Q.Kernel.C082
import P2qJumps.Omega4Q.Kernel.C083
import P2qJumps.Omega4Q.Kernel.C084
import P2qJumps.Omega4Q.Kernel.C085
import P2qJumps.Omega4Q.Kernel.C086
import P2qJumps.Omega4Q.Kernel.C087
import P2qJumps.Omega4Q.Kernel.C088
import P2qJumps.Omega4Q.Kernel.C089
import P2qJumps.Omega4Q.Kernel.C090
import P2qJumps.Omega4Q.Kernel.C091
import P2qJumps.Omega4Q.Kernel.C092
import P2qJumps.Omega4Q.Kernel.C093
import P2qJumps.Omega4Q.Kernel.C094
import P2qJumps.Omega4Q.Kernel.C095
import P2qJumps.Omega4Q.Kernel.C096
import P2qJumps.Omega4Q.Kernel.C097
import P2qJumps.Omega4Q.Kernel.C098
import P2qJumps.Omega4Q.Kernel.C099
import P2qJumps.Omega4Q.Kernel.C100
import P2qJumps.Omega4Q.Kernel.C101
import P2qJumps.Omega4Q.Kernel.C102
import P2qJumps.Omega4Q.Kernel.C103
import P2qJumps.Omega4Q.Kernel.C104
import P2qJumps.Omega4Q.Kernel.C105
import P2qJumps.Omega4Q.Kernel.C106
import P2qJumps.Omega4Q.Kernel.C107
import P2qJumps.Omega4Q.Kernel.C108
import P2qJumps.Omega4Q.Kernel.C109
import P2qJumps.Omega4Q.Kernel.C110
import P2qJumps.Omega4Q.Kernel.C111
import P2qJumps.Omega4Q.Kernel.C112
import P2qJumps.Omega4Q.Kernel.C113
import P2qJumps.Omega4Q.Kernel.C114
import P2qJumps.Omega4Q.Kernel.C115
import P2qJumps.Omega4Q.Kernel.C116
import P2qJumps.Omega4Q.Kernel.C117
import P2qJumps.Omega4Q.Kernel.C118
import P2qJumps.Omega4Q.Kernel.C119
import P2qJumps.Omega4Q.Kernel.C120
import P2qJumps.Omega4Q.Kernel.C121
import P2qJumps.Omega4Q.Kernel.C122
import P2qJumps.Omega4Q.Kernel.C123
import P2qJumps.Omega4Q.Kernel.C124
import P2qJumps.Omega4Q.Kernel.C125
import P2qJumps.Omega4Q.Kernel.C126
import P2qJumps.Omega4Q.Kernel.C127
import P2qJumps.Omega4Q.Kernel.C128
import P2qJumps.Omega4Q.Kernel.C129
import P2qJumps.Omega4Q.Kernel.C130
import P2qJumps.Omega4Q.Kernel.C131
import P2qJumps.Omega4Q.Kernel.C132

/-!
# P2qJumps.Omega4Q.Kernel

Assembles the kernel certificates `c_<p>_<lo>` with `chkP_sound`: for every prime `5 ≤ p ≤ 577`
and every odd `q` with `3 p^2 ≤ q ≤ 10^6` and `16 ∣ p (p - 1) (q - 1) + 12`, `chkQ` passes.
Generated by `scripts/omega4q/gen_kernel.py`.
-/

namespace P2qJumps

namespace Omega4Q

theorem okp_5 (q : ℕ) (hlo : 75 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (5 * (5 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 5 (fct 5) (fct 1000) q = true := by
  by_cases hc75 : q ≤ 750074
  · exact chkP_sound c_5_75 q (by omega) hc75 hqo h16
  replace hlo : 750075 ≤ q := by omega
  exact chkP_sound c_5_750075 q hlo hhi hqo h16

theorem okp_7 (q : ℕ) (hlo : 147 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (7 * (7 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 7 (fct 7) (fct 1000) q = true := by
  by_cases hc147 : q ≤ 37019
  · exact chkP_sound c_7_147 q (by omega) hc147 hqo h16
  replace hlo : 37020 ≤ q := by omega
  by_cases hc37020 : q ≤ 70019
  · exact chkP_sound c_7_37020 q (by omega) hc37020 hqo h16
  replace hlo : 70020 ≤ q := by omega
  by_cases hc70020 : q ≤ 101483
  · exact chkP_sound c_7_70020 q (by omega) hc70020 hqo h16
  replace hlo : 101484 ≤ q := by omega
  by_cases hc101484 : q ≤ 131363
  · exact chkP_sound c_7_101484 q (by omega) hc101484 hqo h16
  replace hlo : 131364 ≤ q := by omega
  by_cases hc131364 : q ≤ 162059
  · exact chkP_sound c_7_131364 q (by omega) hc131364 hqo h16
  replace hlo : 162060 ≤ q := by omega
  by_cases hc162060 : q ≤ 192179
  · exact chkP_sound c_7_162060 q (by omega) hc162060 hqo h16
  replace hlo : 192180 ≤ q := by omega
  by_cases hc192180 : q ≤ 219851
  · exact chkP_sound c_7_192180 q (by omega) hc192180 hqo h16
  replace hlo : 219852 ≤ q := by omega
  by_cases hc219852 : q ≤ 247151
  · exact chkP_sound c_7_219852 q (by omega) hc219852 hqo h16
  replace hlo : 247152 ≤ q := by omega
  by_cases hc247152 : q ≤ 275459
  · exact chkP_sound c_7_247152 q (by omega) hc247152 hqo h16
  replace hlo : 275460 ≤ q := by omega
  by_cases hc275460 : q ≤ 304163
  · exact chkP_sound c_7_275460 q (by omega) hc275460 hqo h16
  replace hlo : 304164 ≤ q := by omega
  by_cases hc304164 : q ≤ 330843
  · exact chkP_sound c_7_304164 q (by omega) hc304164 hqo h16
  replace hlo : 330844 ≤ q := by omega
  by_cases hc330844 : q ≤ 357619
  · exact chkP_sound c_7_330844 q (by omega) hc330844 hqo h16
  replace hlo : 357620 ≤ q := by omega
  by_cases hc357620 : q ≤ 384299
  · exact chkP_sound c_7_357620 q (by omega) hc357620 hqo h16
  replace hlo : 384300 ≤ q := by omega
  by_cases hc384300 : q ≤ 411371
  · exact chkP_sound c_7_384300 q (by omega) hc384300 hqo h16
  replace hlo : 411372 ≤ q := by omega
  by_cases hc411372 : q ≤ 436483
  · exact chkP_sound c_7_411372 q (by omega) hc411372 hqo h16
  replace hlo : 436484 ≤ q := by omega
  by_cases hc436484 : q ≤ 463235
  · exact chkP_sound c_7_436484 q (by omega) hc436484 hqo h16
  replace hlo : 463236 ≤ q := by omega
  by_cases hc463236 : q ≤ 488003
  · exact chkP_sound c_7_463236 q (by omega) hc463236 hqo h16
  replace hlo : 488004 ≤ q := by omega
  by_cases hc488004 : q ≤ 513755
  · exact chkP_sound c_7_488004 q (by omega) hc488004 hqo h16
  replace hlo : 513756 ≤ q := by omega
  by_cases hc513756 : q ≤ 540283
  · exact chkP_sound c_7_513756 q (by omega) hc513756 hqo h16
  replace hlo : 540284 ≤ q := by omega
  by_cases hc540284 : q ≤ 564779
  · exact chkP_sound c_7_540284 q (by omega) hc540284 hqo h16
  replace hlo : 564780 ≤ q := by omega
  by_cases hc564780 : q ≤ 590363
  · exact chkP_sound c_7_564780 q (by omega) hc564780 hqo h16
  replace hlo : 590364 ≤ q := by omega
  by_cases hc590364 : q ≤ 616723
  · exact chkP_sound c_7_590364 q (by omega) hc590364 hqo h16
  replace hlo : 616724 ≤ q := by omega
  by_cases hc616724 : q ≤ 641891
  · exact chkP_sound c_7_616724 q (by omega) hc616724 hqo h16
  replace hlo : 641892 ≤ q := by omega
  by_cases hc641892 : q ≤ 664043
  · exact chkP_sound c_7_641892 q (by omega) hc641892 hqo h16
  replace hlo : 664044 ≤ q := by omega
  by_cases hc664044 : q ≤ 688179
  · exact chkP_sound c_7_664044 q (by omega) hc664044 hqo h16
  replace hlo : 688180 ≤ q := by omega
  by_cases hc688180 : q ≤ 710683
  · exact chkP_sound c_7_688180 q (by omega) hc688180 hqo h16
  replace hlo : 710684 ≤ q := by omega
  by_cases hc710684 : q ≤ 735019
  · exact chkP_sound c_7_710684 q (by omega) hc710684 hqo h16
  replace hlo : 735020 ≤ q := by omega
  by_cases hc735020 : q ≤ 758179
  · exact chkP_sound c_7_735020 q (by omega) hc735020 hqo h16
  replace hlo : 758180 ≤ q := by omega
  by_cases hc758180 : q ≤ 782955
  · exact chkP_sound c_7_758180 q (by omega) hc758180 hqo h16
  replace hlo : 782956 ≤ q := by omega
  by_cases hc782956 : q ≤ 808363
  · exact chkP_sound c_7_782956 q (by omega) hc782956 hqo h16
  replace hlo : 808364 ≤ q := by omega
  by_cases hc808364 : q ≤ 831683
  · exact chkP_sound c_7_808364 q (by omega) hc808364 hqo h16
  replace hlo : 831684 ≤ q := by omega
  by_cases hc831684 : q ≤ 855603
  · exact chkP_sound c_7_831684 q (by omega) hc831684 hqo h16
  replace hlo : 855604 ≤ q := by omega
  by_cases hc855604 : q ≤ 879371
  · exact chkP_sound c_7_855604 q (by omega) hc855604 hqo h16
  replace hlo : 879372 ≤ q := by omega
  by_cases hc879372 : q ≤ 904219
  · exact chkP_sound c_7_879372 q (by omega) hc879372 hqo h16
  replace hlo : 904220 ≤ q := by omega
  by_cases hc904220 : q ≤ 926363
  · exact chkP_sound c_7_904220 q (by omega) hc904220 hqo h16
  replace hlo : 926364 ≤ q := by omega
  by_cases hc926364 : q ≤ 951259
  · exact chkP_sound c_7_926364 q (by omega) hc926364 hqo h16
  replace hlo : 951260 ≤ q := by omega
  by_cases hc951260 : q ≤ 975083
  · exact chkP_sound c_7_951260 q (by omega) hc951260 hqo h16
  replace hlo : 975084 ≤ q := by omega
  exact chkP_sound c_7_975084 q hlo hhi hqo h16

theorem okp_11 (q : ℕ) (hlo : 363 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (11 * (11 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 11 (fct 11) (fct 1000) q = true := by
  by_cases hc363 : q ≤ 38327
  · exact chkP_sound c_11_363 q (by omega) hc363 hqo h16
  replace hlo : 38328 ≤ q := by omega
  by_cases hc38328 : q ≤ 71887
  · exact chkP_sound c_11_38328 q (by omega) hc38328 hqo h16
  replace hlo : 71888 ≤ q := by omega
  by_cases hc71888 : q ≤ 104999
  · exact chkP_sound c_11_71888 q (by omega) hc71888 hqo h16
  replace hlo : 105000 ≤ q := by omega
  by_cases hc105000 : q ≤ 135911
  · exact chkP_sound c_11_105000 q (by omega) hc105000 hqo h16
  replace hlo : 135912 ≤ q := by omega
  by_cases hc135912 : q ≤ 166383
  · exact chkP_sound c_11_135912 q (by omega) hc135912 hqo h16
  replace hlo : 166384 ≤ q := by omega
  by_cases hc166384 : q ≤ 196087
  · exact chkP_sound c_11_166384 q (by omega) hc166384 hqo h16
  replace hlo : 196088 ≤ q := by omega
  by_cases hc196088 : q ≤ 225119
  · exact chkP_sound c_11_196088 q (by omega) hc196088 hqo h16
  replace hlo : 225120 ≤ q := by omega
  by_cases hc225120 : q ≤ 254831
  · exact chkP_sound c_11_225120 q (by omega) hc225120 hqo h16
  replace hlo : 254832 ≤ q := by omega
  by_cases hc254832 : q ≤ 282959
  · exact chkP_sound c_11_254832 q (by omega) hc254832 hqo h16
  replace hlo : 282960 ≤ q := by omega
  by_cases hc282960 : q ≤ 311191
  · exact chkP_sound c_11_282960 q (by omega) hc282960 hqo h16
  replace hlo : 311192 ≤ q := by omega
  by_cases hc311192 : q ≤ 338135
  · exact chkP_sound c_11_311192 q (by omega) hc311192 hqo h16
  replace hlo : 338136 ≤ q := by omega
  by_cases hc338136 : q ≤ 366599
  · exact chkP_sound c_11_338136 q (by omega) hc338136 hqo h16
  replace hlo : 366600 ≤ q := by omega
  by_cases hc366600 : q ≤ 393871
  · exact chkP_sound c_11_366600 q (by omega) hc366600 hqo h16
  replace hlo : 393872 ≤ q := by omega
  by_cases hc393872 : q ≤ 421921
  · exact chkP_sound c_11_393872 q (by omega) hc393872 hqo h16
  replace hlo : 421922 ≤ q := by omega
  by_cases hc421922 : q ≤ 449311
  · exact chkP_sound c_11_421922 q (by omega) hc421922 hqo h16
  replace hlo : 449312 ≤ q := by omega
  by_cases hc449312 : q ≤ 476111
  · exact chkP_sound c_11_449312 q (by omega) hc449312 hqo h16
  replace hlo : 476112 ≤ q := by omega
  by_cases hc476112 : q ≤ 502039
  · exact chkP_sound c_11_476112 q (by omega) hc476112 hqo h16
  replace hlo : 502040 ≤ q := by omega
  by_cases hc502040 : q ≤ 527399
  · exact chkP_sound c_11_502040 q (by omega) hc502040 hqo h16
  replace hlo : 527400 ≤ q := by omega
  by_cases hc527400 : q ≤ 553759
  · exact chkP_sound c_11_527400 q (by omega) hc527400 hqo h16
  replace hlo : 553760 ≤ q := by omega
  by_cases hc553760 : q ≤ 580909
  · exact chkP_sound c_11_553760 q (by omega) hc553760 hqo h16
  replace hlo : 580910 ≤ q := by omega
  by_cases hc580910 : q ≤ 607759
  · exact chkP_sound c_11_580910 q (by omega) hc580910 hqo h16
  replace hlo : 607760 ≤ q := by omega
  by_cases hc607760 : q ≤ 634279
  · exact chkP_sound c_11_607760 q (by omega) hc607760 hqo h16
  replace hlo : 634280 ≤ q := by omega
  by_cases hc634280 : q ≤ 659327
  · exact chkP_sound c_11_634280 q (by omega) hc634280 hqo h16
  replace hlo : 659328 ≤ q := by omega
  by_cases hc659328 : q ≤ 684007
  · exact chkP_sound c_11_659328 q (by omega) hc659328 hqo h16
  replace hlo : 684008 ≤ q := by omega
  by_cases hc684008 : q ≤ 709151
  · exact chkP_sound c_11_684008 q (by omega) hc684008 hqo h16
  replace hlo : 709152 ≤ q := by omega
  by_cases hc709152 : q ≤ 734047
  · exact chkP_sound c_11_709152 q (by omega) hc709152 hqo h16
  replace hlo : 734048 ≤ q := by omega
  by_cases hc734048 : q ≤ 758551
  · exact chkP_sound c_11_734048 q (by omega) hc734048 hqo h16
  replace hlo : 758552 ≤ q := by omega
  by_cases hc758552 : q ≤ 783167
  · exact chkP_sound c_11_758552 q (by omega) hc758552 hqo h16
  replace hlo : 783168 ≤ q := by omega
  by_cases hc783168 : q ≤ 809839
  · exact chkP_sound c_11_783168 q (by omega) hc783168 hqo h16
  replace hlo : 809840 ≤ q := by omega
  by_cases hc809840 : q ≤ 835319
  · exact chkP_sound c_11_809840 q (by omega) hc809840 hqo h16
  replace hlo : 835320 ≤ q := by omega
  by_cases hc835320 : q ≤ 860071
  · exact chkP_sound c_11_835320 q (by omega) hc835320 hqo h16
  replace hlo : 860072 ≤ q := by omega
  by_cases hc860072 : q ≤ 884791
  · exact chkP_sound c_11_860072 q (by omega) hc860072 hqo h16
  replace hlo : 884792 ≤ q := by omega
  by_cases hc884792 : q ≤ 909047
  · exact chkP_sound c_11_884792 q (by omega) hc884792 hqo h16
  replace hlo : 909048 ≤ q := by omega
  by_cases hc909048 : q ≤ 935071
  · exact chkP_sound c_11_909048 q (by omega) hc909048 hqo h16
  replace hlo : 935072 ≤ q := by omega
  by_cases hc935072 : q ≤ 959927
  · exact chkP_sound c_11_935072 q (by omega) hc935072 hqo h16
  replace hlo : 959928 ≤ q := by omega
  by_cases hc959928 : q ≤ 962959
  · exact chkP_sound c_11_959928 q (by omega) hc959928 hqo h16
  replace hlo : 962960 ≤ q := by omega
  by_cases hc962960 : q ≤ 986255
  · exact chkP_sound c_11_962960 q (by omega) hc962960 hqo h16
  replace hlo : 986256 ≤ q := by omega
  exact chkP_sound c_11_986256 q hlo hhi hqo h16

theorem okp_13 (q : ℕ) (hlo : 507 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (13 * (13 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 13 (fct 13) (fct 1000) q = true := by
  by_cases hc507 : q ≤ 750506
  · exact chkP_sound c_13_507 q (by omega) hc507 hqo h16
  replace hlo : 750507 ≤ q := by omega
  exact chkP_sound c_13_750507 q hlo hhi hqo h16

theorem okp_17 (q : ℕ) (hlo : 867 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (17 * (17 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 17 (fct 17) (fct 1000) q = true := by
  by_cases hc867 : q ≤ 750866
  · exact chkP_sound c_17_867 q (by omega) hc867 hqo h16
  replace hlo : 750867 ≤ q := by omega
  exact chkP_sound c_17_750867 q hlo hhi hqo h16

theorem okp_19 (q : ℕ) (hlo : 1083 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (19 * (19 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 19 (fct 19) (fct 1000) q = true := by
  by_cases hc1083 : q ≤ 42455
  · exact chkP_sound c_19_1083 q (by omega) hc1083 hqo h16
  replace hlo : 42456 ≤ q := by omega
  by_cases hc42456 : q ≤ 78543
  · exact chkP_sound c_19_42456 q (by omega) hc42456 hqo h16
  replace hlo : 78544 ≤ q := by omega
  by_cases hc78544 : q ≤ 113095
  · exact chkP_sound c_19_78544 q (by omega) hc78544 hqo h16
  replace hlo : 113096 ≤ q := by omega
  by_cases hc113096 : q ≤ 145127
  · exact chkP_sound c_19_113096 q (by omega) hc113096 hqo h16
  replace hlo : 145128 ≤ q := by omega
  by_cases hc145128 : q ≤ 177319
  · exact chkP_sound c_19_145128 q (by omega) hc145128 hqo h16
  replace hlo : 177320 ≤ q := by omega
  by_cases hc177320 : q ≤ 208703
  · exact chkP_sound c_19_177320 q (by omega) hc177320 hqo h16
  replace hlo : 208704 ≤ q := by omega
  by_cases hc208704 : q ≤ 240551
  · exact chkP_sound c_19_208704 q (by omega) hc208704 hqo h16
  replace hlo : 240552 ≤ q := by omega
  by_cases hc240552 : q ≤ 271695
  · exact chkP_sound c_19_240552 q (by omega) hc240552 hqo h16
  replace hlo : 271696 ≤ q := by omega
  by_cases hc271696 : q ≤ 301215
  · exact chkP_sound c_19_271696 q (by omega) hc271696 hqo h16
  replace hlo : 301216 ≤ q := by omega
  by_cases hc301216 : q ≤ 330287
  · exact chkP_sound c_19_301216 q (by omega) hc301216 hqo h16
  replace hlo : 330288 ≤ q := by omega
  by_cases hc330288 : q ≤ 359719
  · exact chkP_sound c_19_330288 q (by omega) hc330288 hqo h16
  replace hlo : 359720 ≤ q := by omega
  by_cases hc359720 : q ≤ 389591
  · exact chkP_sound c_19_359720 q (by omega) hc359720 hqo h16
  replace hlo : 389592 ≤ q := by omega
  by_cases hc389592 : q ≤ 418415
  · exact chkP_sound c_19_389592 q (by omega) hc389592 hqo h16
  replace hlo : 418416 ≤ q := by omega
  by_cases hc418416 : q ≤ 447439
  · exact chkP_sound c_19_418416 q (by omega) hc418416 hqo h16
  replace hlo : 447440 ≤ q := by omega
  by_cases hc447440 : q ≤ 475599
  · exact chkP_sound c_19_447440 q (by omega) hc447440 hqo h16
  replace hlo : 475600 ≤ q := by omega
  by_cases hc475600 : q ≤ 503287
  · exact chkP_sound c_19_475600 q (by omega) hc475600 hqo h16
  replace hlo : 503288 ≤ q := by omega
  by_cases hc503288 : q ≤ 530287
  · exact chkP_sound c_19_503288 q (by omega) hc503288 hqo h16
  replace hlo : 530288 ≤ q := by omega
  by_cases hc530288 : q ≤ 559231
  · exact chkP_sound c_19_530288 q (by omega) hc530288 hqo h16
  replace hlo : 559232 ≤ q := by omega
  by_cases hc559232 : q ≤ 586951
  · exact chkP_sound c_19_559232 q (by omega) hc559232 hqo h16
  replace hlo : 586952 ≤ q := by omega
  by_cases hc586952 : q ≤ 615799
  · exact chkP_sound c_19_586952 q (by omega) hc586952 hqo h16
  replace hlo : 615800 ≤ q := by omega
  by_cases hc615800 : q ≤ 644519
  · exact chkP_sound c_19_615800 q (by omega) hc615800 hqo h16
  replace hlo : 644520 ≤ q := by omega
  by_cases hc644520 : q ≤ 670399
  · exact chkP_sound c_19_644520 q (by omega) hc644520 hqo h16
  replace hlo : 670400 ≤ q := by omega
  by_cases hc670400 : q ≤ 696959
  · exact chkP_sound c_19_670400 q (by omega) hc670400 hqo h16
  replace hlo : 696960 ≤ q := by omega
  by_cases hc696960 : q ≤ 723071
  · exact chkP_sound c_19_696960 q (by omega) hc696960 hqo h16
  replace hlo : 723072 ≤ q := by omega
  by_cases hc723072 : q ≤ 749927
  · exact chkP_sound c_19_723072 q (by omega) hc723072 hqo h16
  replace hlo : 749928 ≤ q := by omega
  by_cases hc749928 : q ≤ 776871
  · exact chkP_sound c_19_749928 q (by omega) hc749928 hqo h16
  replace hlo : 776872 ≤ q := by omega
  by_cases hc776872 : q ≤ 801551
  · exact chkP_sound c_19_776872 q (by omega) hc776872 hqo h16
  replace hlo : 801552 ≤ q := by omega
  by_cases hc801552 : q ≤ 828527
  · exact chkP_sound c_19_801552 q (by omega) hc801552 hqo h16
  replace hlo : 828528 ≤ q := by omega
  by_cases hc828528 : q ≤ 855431
  · exact chkP_sound c_19_828528 q (by omega) hc828528 hqo h16
  replace hlo : 855432 ≤ q := by omega
  by_cases hc855432 : q ≤ 882391
  · exact chkP_sound c_19_855432 q (by omega) hc855432 hqo h16
  replace hlo : 882392 ≤ q := by omega
  by_cases hc882392 : q ≤ 907927
  · exact chkP_sound c_19_882392 q (by omega) hc882392 hqo h16
  replace hlo : 907928 ≤ q := by omega
  by_cases hc907928 : q ≤ 935351
  · exact chkP_sound c_19_907928 q (by omega) hc907928 hqo h16
  replace hlo : 935352 ≤ q := by omega
  by_cases hc935352 : q ≤ 962807
  · exact chkP_sound c_19_935352 q (by omega) hc935352 hqo h16
  replace hlo : 962808 ≤ q := by omega
  by_cases hc962808 : q ≤ 988711
  · exact chkP_sound c_19_962808 q (by omega) hc962808 hqo h16
  replace hlo : 988712 ≤ q := by omega
  exact chkP_sound c_19_988712 q hlo hhi hqo h16

theorem okp_23 (q : ℕ) (hlo : 1587 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (23 * (23 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 23 (fct 23) (fct 1000) q = true := by
  by_cases hc1587 : q ≤ 42923
  · exact chkP_sound c_23_1587 q (by omega) hc1587 hqo h16
  replace hlo : 42924 ≤ q := by omega
  by_cases hc42924 : q ≤ 77611
  · exact chkP_sound c_23_42924 q (by omega) hc42924 hqo h16
  replace hlo : 77612 ≤ q := by omega
  by_cases hc77612 : q ≤ 110939
  · exact chkP_sound c_23_77612 q (by omega) hc77612 hqo h16
  replace hlo : 110940 ≤ q := by omega
  by_cases hc110940 : q ≤ 143291
  · exact chkP_sound c_23_110940 q (by omega) hc110940 hqo h16
  replace hlo : 143292 ≤ q := by omega
  by_cases hc143292 : q ≤ 174755
  · exact chkP_sound c_23_143292 q (by omega) hc143292 hqo h16
  replace hlo : 174756 ≤ q := by omega
  by_cases hc174756 : q ≤ 206251
  · exact chkP_sound c_23_174756 q (by omega) hc174756 hqo h16
  replace hlo : 206252 ≤ q := by omega
  by_cases hc206252 : q ≤ 235891
  · exact chkP_sound c_23_206252 q (by omega) hc206252 hqo h16
  replace hlo : 235892 ≤ q := by omega
  by_cases hc235892 : q ≤ 264811
  · exact chkP_sound c_23_235892 q (by omega) hc235892 hqo h16
  replace hlo : 264812 ≤ q := by omega
  by_cases hc264812 : q ≤ 293827
  · exact chkP_sound c_23_264812 q (by omega) hc264812 hqo h16
  replace hlo : 293828 ≤ q := by omega
  by_cases hc293828 : q ≤ 321827
  · exact chkP_sound c_23_293828 q (by omega) hc293828 hqo h16
  replace hlo : 321828 ≤ q := by omega
  by_cases hc321828 : q ≤ 351179
  · exact chkP_sound c_23_321828 q (by omega) hc321828 hqo h16
  replace hlo : 351180 ≤ q := by omega
  by_cases hc351180 : q ≤ 379691
  · exact chkP_sound c_23_351180 q (by omega) hc351180 hqo h16
  replace hlo : 379692 ≤ q := by omega
  by_cases hc379692 : q ≤ 407755
  · exact chkP_sound c_23_379692 q (by omega) hc379692 hqo h16
  replace hlo : 407756 ≤ q := by omega
  by_cases hc407756 : q ≤ 435155
  · exact chkP_sound c_23_407756 q (by omega) hc407756 hqo h16
  replace hlo : 435156 ≤ q := by omega
  by_cases hc435156 : q ≤ 463805
  · exact chkP_sound c_23_435156 q (by omega) hc435156 hqo h16
  replace hlo : 463806 ≤ q := by omega
  by_cases hc463806 : q ≤ 490499
  · exact chkP_sound c_23_463806 q (by omega) hc463806 hqo h16
  replace hlo : 490500 ≤ q := by omega
  by_cases hc490500 : q ≤ 516267
  · exact chkP_sound c_23_490500 q (by omega) hc490500 hqo h16
  replace hlo : 516268 ≤ q := by omega
  by_cases hc516268 : q ≤ 544123
  · exact chkP_sound c_23_516268 q (by omega) hc516268 hqo h16
  replace hlo : 544124 ≤ q := by omega
  by_cases hc544124 : q ≤ 570499
  · exact chkP_sound c_23_544124 q (by omega) hc544124 hqo h16
  replace hlo : 570500 ≤ q := by omega
  by_cases hc570500 : q ≤ 596403
  · exact chkP_sound c_23_570500 q (by omega) hc570500 hqo h16
  replace hlo : 596404 ≤ q := by omega
  by_cases hc596404 : q ≤ 624323
  · exact chkP_sound c_23_596404 q (by omega) hc596404 hqo h16
  replace hlo : 624324 ≤ q := by omega
  by_cases hc624324 : q ≤ 650179
  · exact chkP_sound c_23_624324 q (by omega) hc624324 hqo h16
  replace hlo : 650180 ≤ q := by omega
  by_cases hc650180 : q ≤ 677539
  · exact chkP_sound c_23_650180 q (by omega) hc650180 hqo h16
  replace hlo : 677540 ≤ q := by omega
  by_cases hc677540 : q ≤ 703411
  · exact chkP_sound c_23_677540 q (by omega) hc677540 hqo h16
  replace hlo : 703412 ≤ q := by omega
  by_cases hc703412 : q ≤ 729059
  · exact chkP_sound c_23_703412 q (by omega) hc703412 hqo h16
  replace hlo : 729060 ≤ q := by omega
  by_cases hc729060 : q ≤ 754771
  · exact chkP_sound c_23_729060 q (by omega) hc729060 hqo h16
  replace hlo : 754772 ≤ q := by omega
  by_cases hc754772 : q ≤ 780515
  · exact chkP_sound c_23_754772 q (by omega) hc754772 hqo h16
  replace hlo : 780516 ≤ q := by omega
  by_cases hc780516 : q ≤ 805843
  · exact chkP_sound c_23_780516 q (by omega) hc780516 hqo h16
  replace hlo : 805844 ≤ q := by omega
  by_cases hc805844 : q ≤ 829123
  · exact chkP_sound c_23_805844 q (by omega) hc805844 hqo h16
  replace hlo : 829124 ≤ q := by omega
  by_cases hc829124 : q ≤ 855555
  · exact chkP_sound c_23_829124 q (by omega) hc829124 hqo h16
  replace hlo : 855556 ≤ q := by omega
  by_cases hc855556 : q ≤ 879539
  · exact chkP_sound c_23_855556 q (by omega) hc855556 hqo h16
  replace hlo : 879540 ≤ q := by omega
  by_cases hc879540 : q ≤ 905339
  · exact chkP_sound c_23_879540 q (by omega) hc879540 hqo h16
  replace hlo : 905340 ≤ q := by omega
  by_cases hc905340 : q ≤ 929083
  · exact chkP_sound c_23_905340 q (by omega) hc905340 hqo h16
  replace hlo : 929084 ≤ q := by omega
  by_cases hc929084 : q ≤ 954539
  · exact chkP_sound c_23_929084 q (by omega) hc929084 hqo h16
  replace hlo : 954540 ≤ q := by omega
  by_cases hc954540 : q ≤ 979659
  · exact chkP_sound c_23_954540 q (by omega) hc954540 hqo h16
  replace hlo : 979660 ≤ q := by omega
  exact chkP_sound c_23_979660 q hlo hhi hqo h16

theorem okp_29 (q : ℕ) (hlo : 2523 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (29 * (29 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 29 (fct 29) (fct 1000) q = true := by
  by_cases hc2523 : q ≤ 752522
  · exact chkP_sound c_29_2523 q (by omega) hc2523 hqo h16
  replace hlo : 752523 ≤ q := by omega
  exact chkP_sound c_29_752523 q hlo hhi hqo h16

theorem okp_31 (q : ℕ) (hlo : 2883 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (31 * (31 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 31 (fct 31) (fct 1000) q = true := by
  by_cases hc2883 : q ≤ 45139
  · exact chkP_sound c_31_2883 q (by omega) hc2883 hqo h16
  replace hlo : 45140 ≤ q := by omega
  by_cases hc45140 : q ≤ 80611
  · exact chkP_sound c_31_45140 q (by omega) hc45140 hqo h16
  replace hlo : 80612 ≤ q := by omega
  by_cases hc80612 : q ≤ 113523
  · exact chkP_sound c_31_80612 q (by omega) hc80612 hqo h16
  replace hlo : 113524 ≤ q := by omega
  by_cases hc113524 : q ≤ 146203
  · exact chkP_sound c_31_113524 q (by omega) hc113524 hqo h16
  replace hlo : 146204 ≤ q := by omega
  by_cases hc146204 : q ≤ 177347
  · exact chkP_sound c_31_146204 q (by omega) hc146204 hqo h16
  replace hlo : 177348 ≤ q := by omega
  by_cases hc177348 : q ≤ 209247
  · exact chkP_sound c_31_177348 q (by omega) hc177348 hqo h16
  replace hlo : 209248 ≤ q := by omega
  by_cases hc209248 : q ≤ 237595
  · exact chkP_sound c_31_209248 q (by omega) hc209248 hqo h16
  replace hlo : 237596 ≤ q := by omega
  by_cases hc237596 : q ≤ 267299
  · exact chkP_sound c_31_237596 q (by omega) hc237596 hqo h16
  replace hlo : 267300 ≤ q := by omega
  by_cases hc267300 : q ≤ 298211
  · exact chkP_sound c_31_267300 q (by omega) hc267300 hqo h16
  replace hlo : 298212 ≤ q := by omega
  by_cases hc298212 : q ≤ 326107
  · exact chkP_sound c_31_298212 q (by omega) hc298212 hqo h16
  replace hlo : 326108 ≤ q := by omega
  by_cases hc326108 : q ≤ 352451
  · exact chkP_sound c_31_326108 q (by omega) hc326108 hqo h16
  replace hlo : 352452 ≤ q := by omega
  by_cases hc352452 : q ≤ 379459
  · exact chkP_sound c_31_352452 q (by omega) hc352452 hqo h16
  replace hlo : 379460 ≤ q := by omega
  by_cases hc379460 : q ≤ 406907
  · exact chkP_sound c_31_379460 q (by omega) hc379460 hqo h16
  replace hlo : 406908 ≤ q := by omega
  by_cases hc406908 : q ≤ 433267
  · exact chkP_sound c_31_406908 q (by omega) hc406908 hqo h16
  replace hlo : 433268 ≤ q := by omega
  by_cases hc433268 : q ≤ 460619
  · exact chkP_sound c_31_433268 q (by omega) hc433268 hqo h16
  replace hlo : 460620 ≤ q := by omega
  by_cases hc460620 : q ≤ 486491
  · exact chkP_sound c_31_460620 q (by omega) hc460620 hqo h16
  replace hlo : 486492 ≤ q := by omega
  by_cases hc486492 : q ≤ 513739
  · exact chkP_sound c_31_486492 q (by omega) hc486492 hqo h16
  replace hlo : 513740 ≤ q := by omega
  by_cases hc513740 : q ≤ 541531
  · exact chkP_sound c_31_513740 q (by omega) hc513740 hqo h16
  replace hlo : 541532 ≤ q := by omega
  by_cases hc541532 : q ≤ 567667
  · exact chkP_sound c_31_541532 q (by omega) hc541532 hqo h16
  replace hlo : 567668 ≤ q := by omega
  by_cases hc567668 : q ≤ 593387
  · exact chkP_sound c_31_567668 q (by omega) hc567668 hqo h16
  replace hlo : 593388 ≤ q := by omega
  by_cases hc593388 : q ≤ 619771
  · exact chkP_sound c_31_593388 q (by omega) hc593388 hqo h16
  replace hlo : 619772 ≤ q := by omega
  by_cases hc619772 : q ≤ 645467
  · exact chkP_sound c_31_619772 q (by omega) hc619772 hqo h16
  replace hlo : 645468 ≤ q := by omega
  by_cases hc645468 : q ≤ 671283
  · exact chkP_sound c_31_645468 q (by omega) hc645468 hqo h16
  replace hlo : 671284 ≤ q := by omega
  by_cases hc671284 : q ≤ 696659
  · exact chkP_sound c_31_671284 q (by omega) hc671284 hqo h16
  replace hlo : 696660 ≤ q := by omega
  by_cases hc696660 : q ≤ 722971
  · exact chkP_sound c_31_696660 q (by omega) hc696660 hqo h16
  replace hlo : 722972 ≤ q := by omega
  by_cases hc722972 : q ≤ 748691
  · exact chkP_sound c_31_722972 q (by omega) hc722972 hqo h16
  replace hlo : 748692 ≤ q := by omega
  by_cases hc748692 : q ≤ 774427
  · exact chkP_sound c_31_748692 q (by omega) hc748692 hqo h16
  replace hlo : 774428 ≤ q := by omega
  by_cases hc774428 : q ≤ 799891
  · exact chkP_sound c_31_774428 q (by omega) hc774428 hqo h16
  replace hlo : 799892 ≤ q := by omega
  by_cases hc799892 : q ≤ 824539
  · exact chkP_sound c_31_799892 q (by omega) hc799892 hqo h16
  replace hlo : 824540 ≤ q := by omega
  by_cases hc824540 : q ≤ 849931
  · exact chkP_sound c_31_824540 q (by omega) hc824540 hqo h16
  replace hlo : 849932 ≤ q := by omega
  by_cases hc849932 : q ≤ 874267
  · exact chkP_sound c_31_849932 q (by omega) hc849932 hqo h16
  replace hlo : 874268 ≤ q := by omega
  by_cases hc874268 : q ≤ 898419
  · exact chkP_sound c_31_874268 q (by omega) hc874268 hqo h16
  replace hlo : 898420 ≤ q := by omega
  by_cases hc898420 : q ≤ 922331
  · exact chkP_sound c_31_898420 q (by omega) hc898420 hqo h16
  replace hlo : 922332 ≤ q := by omega
  by_cases hc922332 : q ≤ 946931
  · exact chkP_sound c_31_922332 q (by omega) hc922332 hqo h16
  replace hlo : 946932 ≤ q := by omega
  by_cases hc946932 : q ≤ 970867
  · exact chkP_sound c_31_946932 q (by omega) hc946932 hqo h16
  replace hlo : 970868 ≤ q := by omega
  by_cases hc970868 : q ≤ 995067
  · exact chkP_sound c_31_970868 q (by omega) hc970868 hqo h16
  replace hlo : 995068 ≤ q := by omega
  exact chkP_sound c_31_995068 q hlo hhi hqo h16

theorem okp_37 (q : ℕ) (hlo : 4107 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (37 * (37 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 37 (fct 37) (fct 1000) q = true := by
  by_cases hc4107 : q ≤ 754106
  · exact chkP_sound c_37_4107 q (by omega) hc4107 hqo h16
  replace hlo : 754107 ≤ q := by omega
  exact chkP_sound c_37_754107 q hlo hhi hqo h16

theorem okp_41 (q : ℕ) (hlo : 5043 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (41 * (41 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 41 (fct 41) (fct 1000) q = true := by
  by_cases hc5043 : q ≤ 755042
  · exact chkP_sound c_41_5043 q (by omega) hc5043 hqo h16
  replace hlo : 755043 ≤ q := by omega
  exact chkP_sound c_41_755043 q hlo hhi hqo h16

theorem okp_43 (q : ℕ) (hlo : 5547 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (43 * (43 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 43 (fct 43) (fct 1000) q = true := by
  by_cases hc5547 : q ≤ 47591
  · exact chkP_sound c_43_5547 q (by omega) hc5547 hqo h16
  replace hlo : 47592 ≤ q := by omega
  by_cases hc47592 : q ≤ 83241
  · exact chkP_sound c_43_47592 q (by omega) hc47592 hqo h16
  replace hlo : 83242 ≤ q := by omega
  by_cases hc83242 : q ≤ 115871
  · exact chkP_sound c_43_83242 q (by omega) hc83242 hqo h16
  replace hlo : 115872 ≤ q := by omega
  by_cases hc115872 : q ≤ 147631
  · exact chkP_sound c_43_115872 q (by omega) hc115872 hqo h16
  replace hlo : 147632 ≤ q := by omega
  by_cases hc147632 : q ≤ 178223
  · exact chkP_sound c_43_147632 q (by omega) hc147632 hqo h16
  replace hlo : 178224 ≤ q := by omega
  by_cases hc178224 : q ≤ 207479
  · exact chkP_sound c_43_178224 q (by omega) hc178224 hqo h16
  replace hlo : 207480 ≤ q := by omega
  by_cases hc207480 : q ≤ 234791
  · exact chkP_sound c_43_207480 q (by omega) hc207480 hqo h16
  replace hlo : 234792 ≤ q := by omega
  by_cases hc234792 : q ≤ 262783
  · exact chkP_sound c_43_234792 q (by omega) hc234792 hqo h16
  replace hlo : 262784 ≤ q := by omega
  by_cases hc262784 : q ≤ 291271
  · exact chkP_sound c_43_262784 q (by omega) hc262784 hqo h16
  replace hlo : 291272 ≤ q := by omega
  by_cases hc291272 : q ≤ 318023
  · exact chkP_sound c_43_291272 q (by omega) hc291272 hqo h16
  replace hlo : 318024 ≤ q := by omega
  by_cases hc318024 : q ≤ 345143
  · exact chkP_sound c_43_318024 q (by omega) hc318024 hqo h16
  replace hlo : 345144 ≤ q := by omega
  by_cases hc345144 : q ≤ 373693
  · exact chkP_sound c_43_345144 q (by omega) hc345144 hqo h16
  replace hlo : 373694 ≤ q := by omega
  by_cases hc373694 : q ≤ 400151
  · exact chkP_sound c_43_373694 q (by omega) hc373694 hqo h16
  replace hlo : 400152 ≤ q := by omega
  by_cases hc400152 : q ≤ 426775
  · exact chkP_sound c_43_400152 q (by omega) hc400152 hqo h16
  replace hlo : 426776 ≤ q := by omega
  by_cases hc426776 : q ≤ 452983
  · exact chkP_sound c_43_426776 q (by omega) hc426776 hqo h16
  replace hlo : 452984 ≤ q := by omega
  by_cases hc452984 : q ≤ 478871
  · exact chkP_sound c_43_452984 q (by omega) hc452984 hqo h16
  replace hlo : 478872 ≤ q := by omega
  by_cases hc478872 : q ≤ 504951
  · exact chkP_sound c_43_478872 q (by omega) hc478872 hqo h16
  replace hlo : 504952 ≤ q := by omega
  by_cases hc504952 : q ≤ 528799
  · exact chkP_sound c_43_504952 q (by omega) hc504952 hqo h16
  replace hlo : 528800 ≤ q := by omega
  by_cases hc528800 : q ≤ 554959
  · exact chkP_sound c_43_528800 q (by omega) hc528800 hqo h16
  replace hlo : 554960 ≤ q := by omega
  by_cases hc554960 : q ≤ 580079
  · exact chkP_sound c_43_554960 q (by omega) hc554960 hqo h16
  replace hlo : 580080 ≤ q := by omega
  by_cases hc580080 : q ≤ 603431
  · exact chkP_sound c_43_580080 q (by omega) hc580080 hqo h16
  replace hlo : 603432 ≤ q := by omega
  by_cases hc603432 : q ≤ 629263
  · exact chkP_sound c_43_603432 q (by omega) hc603432 hqo h16
  replace hlo : 629264 ≤ q := by omega
  by_cases hc629264 : q ≤ 654775
  · exact chkP_sound c_43_629264 q (by omega) hc629264 hqo h16
  replace hlo : 654776 ≤ q := by omega
  by_cases hc654776 : q ≤ 678103
  · exact chkP_sound c_43_654776 q (by omega) hc654776 hqo h16
  replace hlo : 678104 ≤ q := by omega
  by_cases hc678104 : q ≤ 701719
  · exact chkP_sound c_43_678104 q (by omega) hc678104 hqo h16
  replace hlo : 701720 ≤ q := by omega
  by_cases hc701720 : q ≤ 726559
  · exact chkP_sound c_43_701720 q (by omega) hc701720 hqo h16
  replace hlo : 726560 ≤ q := by omega
  by_cases hc726560 : q ≤ 749183
  · exact chkP_sound c_43_726560 q (by omega) hc726560 hqo h16
  replace hlo : 749184 ≤ q := by omega
  by_cases hc749184 : q ≤ 771679
  · exact chkP_sound c_43_749184 q (by omega) hc749184 hqo h16
  replace hlo : 771680 ≤ q := by omega
  by_cases hc771680 : q ≤ 795695
  · exact chkP_sound c_43_771680 q (by omega) hc771680 hqo h16
  replace hlo : 795696 ≤ q := by omega
  by_cases hc795696 : q ≤ 819391
  · exact chkP_sound c_43_795696 q (by omega) hc795696 hqo h16
  replace hlo : 819392 ≤ q := by omega
  by_cases hc819392 : q ≤ 843455
  · exact chkP_sound c_43_819392 q (by omega) hc819392 hqo h16
  replace hlo : 843456 ≤ q := by omega
  by_cases hc843456 : q ≤ 866431
  · exact chkP_sound c_43_843456 q (by omega) hc843456 hqo h16
  replace hlo : 866432 ≤ q := by omega
  by_cases hc866432 : q ≤ 888431
  · exact chkP_sound c_43_866432 q (by omega) hc866432 hqo h16
  replace hlo : 888432 ≤ q := by omega
  by_cases hc888432 : q ≤ 911783
  · exact chkP_sound c_43_888432 q (by omega) hc888432 hqo h16
  replace hlo : 911784 ≤ q := by omega
  by_cases hc911784 : q ≤ 935423
  · exact chkP_sound c_43_911784 q (by omega) hc911784 hqo h16
  replace hlo : 935424 ≤ q := by omega
  by_cases hc935424 : q ≤ 959351
  · exact chkP_sound c_43_935424 q (by omega) hc935424 hqo h16
  replace hlo : 959352 ≤ q := by omega
  by_cases hc959352 : q ≤ 980831
  · exact chkP_sound c_43_959352 q (by omega) hc959352 hqo h16
  replace hlo : 980832 ≤ q := by omega
  exact chkP_sound c_43_980832 q hlo hhi hqo h16

theorem okp_47 (q : ℕ) (hlo : 6627 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (47 * (47 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 47 (fct 47) (fct 1000) q = true := by
  by_cases hc6627 : q ≤ 47843
  · exact chkP_sound c_47_6627 q (by omega) hc6627 hqo h16
  replace hlo : 47844 ≤ q := by omega
  by_cases hc47844 : q ≤ 84059
  · exact chkP_sound c_47_47844 q (by omega) hc47844 hqo h16
  replace hlo : 84060 ≤ q := by omega
  by_cases hc84060 : q ≤ 116539
  · exact chkP_sound c_47_84060 q (by omega) hc84060 hqo h16
  replace hlo : 116540 ≤ q := by omega
  by_cases hc116540 : q ≤ 147995
  · exact chkP_sound c_47_116540 q (by omega) hc116540 hqo h16
  replace hlo : 147996 ≤ q := by omega
  by_cases hc147996 : q ≤ 177323
  · exact chkP_sound c_47_147996 q (by omega) hc147996 hqo h16
  replace hlo : 177324 ≤ q := by omega
  by_cases hc177324 : q ≤ 208099
  · exact chkP_sound c_47_177324 q (by omega) hc177324 hqo h16
  replace hlo : 208100 ≤ q := by omega
  by_cases hc208100 : q ≤ 236699
  · exact chkP_sound c_47_208100 q (by omega) hc208100 hqo h16
  replace hlo : 236700 ≤ q := by omega
  by_cases hc236700 : q ≤ 264371
  · exact chkP_sound c_47_236700 q (by omega) hc236700 hqo h16
  replace hlo : 264372 ≤ q := by omega
  by_cases hc264372 : q ≤ 292363
  · exact chkP_sound c_47_264372 q (by omega) hc264372 hqo h16
  replace hlo : 292364 ≤ q := by omega
  by_cases hc292364 : q ≤ 319483
  · exact chkP_sound c_47_292364 q (by omega) hc292364 hqo h16
  replace hlo : 319484 ≤ q := by omega
  by_cases hc319484 : q ≤ 346699
  · exact chkP_sound c_47_319484 q (by omega) hc319484 hqo h16
  replace hlo : 346700 ≤ q := by omega
  by_cases hc346700 : q ≤ 371939
  · exact chkP_sound c_47_346700 q (by omega) hc346700 hqo h16
  replace hlo : 371940 ≤ q := by omega
  by_cases hc371940 : q ≤ 397811
  · exact chkP_sound c_47_371940 q (by omega) hc371940 hqo h16
  replace hlo : 397812 ≤ q := by omega
  by_cases hc397812 : q ≤ 424147
  · exact chkP_sound c_47_397812 q (by omega) hc397812 hqo h16
  replace hlo : 424148 ≤ q := by omega
  by_cases hc424148 : q ≤ 450507
  · exact chkP_sound c_47_424148 q (by omega) hc424148 hqo h16
  replace hlo : 450508 ≤ q := by omega
  by_cases hc450508 : q ≤ 474659
  · exact chkP_sound c_47_450508 q (by omega) hc450508 hqo h16
  replace hlo : 474660 ≤ q := by omega
  by_cases hc474660 : q ≤ 499211
  · exact chkP_sound c_47_474660 q (by omega) hc474660 hqo h16
  replace hlo : 499212 ≤ q := by omega
  by_cases hc499212 : q ≤ 524971
  · exact chkP_sound c_47_499212 q (by omega) hc499212 hqo h16
  replace hlo : 524972 ≤ q := by omega
  by_cases hc524972 : q ≤ 550843
  · exact chkP_sound c_47_524972 q (by omega) hc524972 hqo h16
  replace hlo : 550844 ≤ q := by omega
  by_cases hc550844 : q ≤ 575923
  · exact chkP_sound c_47_550844 q (by omega) hc550844 hqo h16
  replace hlo : 575924 ≤ q := by omega
  by_cases hc575924 : q ≤ 600451
  · exact chkP_sound c_47_575924 q (by omega) hc575924 hqo h16
  replace hlo : 600452 ≤ q := by omega
  by_cases hc600452 : q ≤ 626251
  · exact chkP_sound c_47_600452 q (by omega) hc600452 hqo h16
  replace hlo : 626252 ≤ q := by omega
  by_cases hc626252 : q ≤ 648763
  · exact chkP_sound c_47_626252 q (by omega) hc626252 hqo h16
  replace hlo : 648764 ≤ q := by omega
  by_cases hc648764 : q ≤ 672803
  · exact chkP_sound c_47_648764 q (by omega) hc648764 hqo h16
  replace hlo : 672804 ≤ q := by omega
  by_cases hc672804 : q ≤ 697515
  · exact chkP_sound c_47_672804 q (by omega) hc672804 hqo h16
  replace hlo : 697516 ≤ q := by omega
  by_cases hc697516 : q ≤ 721051
  · exact chkP_sound c_47_697516 q (by omega) hc697516 hqo h16
  replace hlo : 721052 ≤ q := by omega
  by_cases hc721052 : q ≤ 744539
  · exact chkP_sound c_47_721052 q (by omega) hc721052 hqo h16
  replace hlo : 744540 ≤ q := by omega
  by_cases hc744540 : q ≤ 768931
  · exact chkP_sound c_47_744540 q (by omega) hc744540 hqo h16
  replace hlo : 768932 ≤ q := by omega
  by_cases hc768932 : q ≤ 793739
  · exact chkP_sound c_47_768932 q (by omega) hc768932 hqo h16
  replace hlo : 793740 ≤ q := by omega
  by_cases hc793740 : q ≤ 816251
  · exact chkP_sound c_47_793740 q (by omega) hc793740 hqo h16
  replace hlo : 816252 ≤ q := by omega
  by_cases hc816252 : q ≤ 838755
  · exact chkP_sound c_47_816252 q (by omega) hc816252 hqo h16
  replace hlo : 838756 ≤ q := by omega
  by_cases hc838756 : q ≤ 861803
  · exact chkP_sound c_47_838756 q (by omega) hc838756 hqo h16
  replace hlo : 861804 ≤ q := by omega
  by_cases hc861804 : q ≤ 884363
  · exact chkP_sound c_47_861804 q (by omega) hc861804 hqo h16
  replace hlo : 884364 ≤ q := by omega
  by_cases hc884364 : q ≤ 907379
  · exact chkP_sound c_47_884364 q (by omega) hc884364 hqo h16
  replace hlo : 907380 ≤ q := by omega
  by_cases hc907380 : q ≤ 929323
  · exact chkP_sound c_47_907380 q (by omega) hc907380 hqo h16
  replace hlo : 929324 ≤ q := by omega
  by_cases hc929324 : q ≤ 952355
  · exact chkP_sound c_47_929324 q (by omega) hc929324 hqo h16
  replace hlo : 952356 ≤ q := by omega
  by_cases hc952356 : q ≤ 975731
  · exact chkP_sound c_47_952356 q (by omega) hc952356 hqo h16
  replace hlo : 975732 ≤ q := by omega
  exact chkP_sound c_47_975732 q hlo hhi hqo h16

theorem okp_53 (q : ℕ) (hlo : 8427 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (53 * (53 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 53 (fct 53) (fct 1000) q = true := by
  by_cases hc8427 : q ≤ 758426
  · exact chkP_sound c_53_8427 q (by omega) hc8427 hqo h16
  replace hlo : 758427 ≤ q := by omega
  exact chkP_sound c_53_758427 q hlo hhi hqo h16

theorem okp_59 (q : ℕ) (hlo : 10443 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (59 * (59 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 59 (fct 59) (fct 1000) q = true := by
  by_cases hc10443 : q ≤ 52999
  · exact chkP_sound c_59_10443 q (by omega) hc10443 hqo h16
  replace hlo : 53000 ≤ q := by omega
  by_cases hc53000 : q ≤ 89159
  · exact chkP_sound c_59_53000 q (by omega) hc53000 hqo h16
  replace hlo : 89160 ≤ q := by omega
  by_cases hc89160 : q ≤ 123551
  · exact chkP_sound c_59_89160 q (by omega) hc89160 hqo h16
  replace hlo : 123552 ≤ q := by omega
  by_cases hc123552 : q ≤ 153703
  · exact chkP_sound c_59_123552 q (by omega) hc123552 hqo h16
  replace hlo : 153704 ≤ q := by omega
  by_cases hc153704 : q ≤ 183871
  · exact chkP_sound c_59_153704 q (by omega) hc153704 hqo h16
  replace hlo : 183872 ≤ q := by omega
  by_cases hc183872 : q ≤ 213247
  · exact chkP_sound c_59_183872 q (by omega) hc183872 hqo h16
  replace hlo : 213248 ≤ q := by omega
  by_cases hc213248 : q ≤ 242303
  · exact chkP_sound c_59_213248 q (by omega) hc213248 hqo h16
  replace hlo : 242304 ≤ q := by omega
  by_cases hc242304 : q ≤ 271063
  · exact chkP_sound c_59_242304 q (by omega) hc242304 hqo h16
  replace hlo : 271064 ≤ q := by omega
  by_cases hc271064 : q ≤ 298847
  · exact chkP_sound c_59_271064 q (by omega) hc271064 hqo h16
  replace hlo : 298848 ≤ q := by omega
  by_cases hc298848 : q ≤ 324319
  · exact chkP_sound c_59_298848 q (by omega) hc298848 hqo h16
  replace hlo : 324320 ≤ q := by omega
  by_cases hc324320 : q ≤ 350439
  · exact chkP_sound c_59_324320 q (by omega) hc324320 hqo h16
  replace hlo : 350440 ≤ q := by omega
  by_cases hc350440 : q ≤ 376351
  · exact chkP_sound c_59_350440 q (by omega) hc350440 hqo h16
  replace hlo : 376352 ≤ q := by omega
  by_cases hc376352 : q ≤ 402559
  · exact chkP_sound c_59_376352 q (by omega) hc376352 hqo h16
  replace hlo : 402560 ≤ q := by omega
  by_cases hc402560 : q ≤ 429271
  · exact chkP_sound c_59_402560 q (by omega) hc402560 hqo h16
  replace hlo : 429272 ≤ q := by omega
  by_cases hc429272 : q ≤ 455159
  · exact chkP_sound c_59_429272 q (by omega) hc429272 hqo h16
  replace hlo : 455160 ≤ q := by omega
  by_cases hc455160 : q ≤ 480839
  · exact chkP_sound c_59_455160 q (by omega) hc455160 hqo h16
  replace hlo : 480840 ≤ q := by omega
  by_cases hc480840 : q ≤ 504727
  · exact chkP_sound c_59_480840 q (by omega) hc480840 hqo h16
  replace hlo : 504728 ≤ q := by omega
  by_cases hc504728 : q ≤ 528391
  · exact chkP_sound c_59_504728 q (by omega) hc504728 hqo h16
  replace hlo : 528392 ≤ q := by omega
  by_cases hc528392 : q ≤ 551231
  · exact chkP_sound c_59_528392 q (by omega) hc528392 hqo h16
  replace hlo : 551232 ≤ q := by omega
  by_cases hc551232 : q ≤ 577807
  · exact chkP_sound c_59_551232 q (by omega) hc551232 hqo h16
  replace hlo : 577808 ≤ q := by omega
  by_cases hc577808 : q ≤ 602431
  · exact chkP_sound c_59_577808 q (by omega) hc577808 hqo h16
  replace hlo : 602432 ≤ q := by omega
  by_cases hc602432 : q ≤ 626159
  · exact chkP_sound c_59_602432 q (by omega) hc602432 hqo h16
  replace hlo : 626160 ≤ q := by omega
  by_cases hc626160 : q ≤ 649511
  · exact chkP_sound c_59_626160 q (by omega) hc626160 hqo h16
  replace hlo : 649512 ≤ q := by omega
  by_cases hc649512 : q ≤ 672439
  · exact chkP_sound c_59_649512 q (by omega) hc649512 hqo h16
  replace hlo : 672440 ≤ q := by omega
  by_cases hc672440 : q ≤ 695407
  · exact chkP_sound c_59_672440 q (by omega) hc672440 hqo h16
  replace hlo : 695408 ≤ q := by omega
  by_cases hc695408 : q ≤ 717559
  · exact chkP_sound c_59_695408 q (by omega) hc695408 hqo h16
  replace hlo : 717560 ≤ q := by omega
  by_cases hc717560 : q ≤ 738847
  · exact chkP_sound c_59_717560 q (by omega) hc717560 hqo h16
  replace hlo : 738848 ≤ q := by omega
  by_cases hc738848 : q ≤ 762319
  · exact chkP_sound c_59_738848 q (by omega) hc738848 hqo h16
  replace hlo : 762320 ≤ q := by omega
  by_cases hc762320 : q ≤ 783599
  · exact chkP_sound c_59_762320 q (by omega) hc762320 hqo h16
  replace hlo : 783600 ≤ q := by omega
  by_cases hc783600 : q ≤ 806111
  · exact chkP_sound c_59_783600 q (by omega) hc783600 hqo h16
  replace hlo : 806112 ≤ q := by omega
  by_cases hc806112 : q ≤ 830567
  · exact chkP_sound c_59_806112 q (by omega) hc806112 hqo h16
  replace hlo : 830568 ≤ q := by omega
  by_cases hc830568 : q ≤ 853917
  · exact chkP_sound c_59_830568 q (by omega) hc830568 hqo h16
  replace hlo : 853918 ≤ q := by omega
  by_cases hc853918 : q ≤ 877959
  · exact chkP_sound c_59_853918 q (by omega) hc853918 hqo h16
  replace hlo : 877960 ≤ q := by omega
  by_cases hc877960 : q ≤ 899447
  · exact chkP_sound c_59_877960 q (by omega) hc877960 hqo h16
  replace hlo : 899448 ≤ q := by omega
  by_cases hc899448 : q ≤ 921031
  · exact chkP_sound c_59_899448 q (by omega) hc899448 hqo h16
  replace hlo : 921032 ≤ q := by omega
  by_cases hc921032 : q ≤ 941999
  · exact chkP_sound c_59_921032 q (by omega) hc921032 hqo h16
  replace hlo : 942000 ≤ q := by omega
  by_cases hc942000 : q ≤ 964679
  · exact chkP_sound c_59_942000 q (by omega) hc942000 hqo h16
  replace hlo : 964680 ≤ q := by omega
  by_cases hc964680 : q ≤ 986599
  · exact chkP_sound c_59_964680 q (by omega) hc964680 hqo h16
  replace hlo : 986600 ≤ q := by omega
  exact chkP_sound c_59_986600 q hlo hhi hqo h16

theorem okp_61 (q : ℕ) (hlo : 11163 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (61 * (61 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 61 (fct 61) (fct 1000) q = true := by
  by_cases hc11163 : q ≤ 761162
  · exact chkP_sound c_61_11163 q (by omega) hc11163 hqo h16
  replace hlo : 761163 ≤ q := by omega
  exact chkP_sound c_61_761163 q hlo hhi hqo h16

theorem okp_67 (q : ℕ) (hlo : 13467 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (67 * (67 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 67 (fct 67) (fct 1000) q = true := by
  by_cases hc13467 : q ≤ 56463
  · exact chkP_sound c_67_13467 q (by omega) hc13467 hqo h16
  replace hlo : 56464 ≤ q := by omega
  by_cases hc56464 : q ≤ 91063
  · exact chkP_sound c_67_56464 q (by omega) hc56464 hqo h16
  replace hlo : 91064 ≤ q := by omega
  by_cases hc91064 : q ≤ 125383
  · exact chkP_sound c_67_91064 q (by omega) hc91064 hqo h16
  replace hlo : 125384 ≤ q := by omega
  by_cases hc125384 : q ≤ 155055
  · exact chkP_sound c_67_125384 q (by omega) hc125384 hqo h16
  replace hlo : 155056 ≤ q := by omega
  by_cases hc155056 : q ≤ 185007
  · exact chkP_sound c_67_155056 q (by omega) hc155056 hqo h16
  replace hlo : 185008 ≤ q := by omega
  by_cases hc185008 : q ≤ 213799
  · exact chkP_sound c_67_185008 q (by omega) hc185008 hqo h16
  replace hlo : 213800 ≤ q := by omega
  by_cases hc213800 : q ≤ 241639
  · exact chkP_sound c_67_213800 q (by omega) hc213800 hqo h16
  replace hlo : 241640 ≤ q := by omega
  by_cases hc241640 : q ≤ 272351
  · exact chkP_sound c_67_241640 q (by omega) hc241640 hqo h16
  replace hlo : 272352 ≤ q := by omega
  by_cases hc272352 : q ≤ 299711
  · exact chkP_sound c_67_272352 q (by omega) hc272352 hqo h16
  replace hlo : 299712 ≤ q := by omega
  by_cases hc299712 : q ≤ 326279
  · exact chkP_sound c_67_299712 q (by omega) hc299712 hqo h16
  replace hlo : 326280 ≤ q := by omega
  by_cases hc326280 : q ≤ 351079
  · exact chkP_sound c_67_326280 q (by omega) hc326280 hqo h16
  replace hlo : 351080 ≤ q := by omega
  by_cases hc351080 : q ≤ 377815
  · exact chkP_sound c_67_351080 q (by omega) hc351080 hqo h16
  replace hlo : 377816 ≤ q := by omega
  by_cases hc377816 : q ≤ 402631
  · exact chkP_sound c_67_377816 q (by omega) hc377816 hqo h16
  replace hlo : 402632 ≤ q := by omega
  by_cases hc402632 : q ≤ 429551
  · exact chkP_sound c_67_402632 q (by omega) hc402632 hqo h16
  replace hlo : 429552 ≤ q := by omega
  by_cases hc429552 : q ≤ 456623
  · exact chkP_sound c_67_429552 q (by omega) hc429552 hqo h16
  replace hlo : 456624 ≤ q := by omega
  by_cases hc456624 : q ≤ 482711
  · exact chkP_sound c_67_456624 q (by omega) hc456624 hqo h16
  replace hlo : 482712 ≤ q := by omega
  by_cases hc482712 : q ≤ 508223
  · exact chkP_sound c_67_482712 q (by omega) hc482712 hqo h16
  replace hlo : 508224 ≤ q := by omega
  by_cases hc508224 : q ≤ 531919
  · exact chkP_sound c_67_508224 q (by omega) hc508224 hqo h16
  replace hlo : 531920 ≤ q := by omega
  by_cases hc531920 : q ≤ 555743
  · exact chkP_sound c_67_531920 q (by omega) hc531920 hqo h16
  replace hlo : 555744 ≤ q := by omega
  by_cases hc555744 : q ≤ 580631
  · exact chkP_sound c_67_555744 q (by omega) hc555744 hqo h16
  replace hlo : 580632 ≤ q := by omega
  by_cases hc580632 : q ≤ 603607
  · exact chkP_sound c_67_580632 q (by omega) hc580632 hqo h16
  replace hlo : 603608 ≤ q := by omega
  by_cases hc603608 : q ≤ 627511
  · exact chkP_sound c_67_603608 q (by omega) hc603608 hqo h16
  replace hlo : 627512 ≤ q := by omega
  by_cases hc627512 : q ≤ 652063
  · exact chkP_sound c_67_627512 q (by omega) hc627512 hqo h16
  replace hlo : 652064 ≤ q := by omega
  by_cases hc652064 : q ≤ 674263
  · exact chkP_sound c_67_652064 q (by omega) hc652064 hqo h16
  replace hlo : 674264 ≤ q := by omega
  by_cases hc674264 : q ≤ 698359
  · exact chkP_sound c_67_674264 q (by omega) hc674264 hqo h16
  replace hlo : 698360 ≤ q := by omega
  by_cases hc698360 : q ≤ 720151
  · exact chkP_sound c_67_698360 q (by omega) hc698360 hqo h16
  replace hlo : 720152 ≤ q := by omega
  by_cases hc720152 : q ≤ 744511
  · exact chkP_sound c_67_720152 q (by omega) hc720152 hqo h16
  replace hlo : 744512 ≤ q := by omega
  by_cases hc744512 : q ≤ 766079
  · exact chkP_sound c_67_744512 q (by omega) hc744512 hqo h16
  replace hlo : 766080 ≤ q := by omega
  by_cases hc766080 : q ≤ 786823
  · exact chkP_sound c_67_766080 q (by omega) hc766080 hqo h16
  replace hlo : 786824 ≤ q := by omega
  by_cases hc786824 : q ≤ 809983
  · exact chkP_sound c_67_786824 q (by omega) hc786824 hqo h16
  replace hlo : 809984 ≤ q := by omega
  by_cases hc809984 : q ≤ 835319
  · exact chkP_sound c_67_809984 q (by omega) hc809984 hqo h16
  replace hlo : 835320 ≤ q := by omega
  by_cases hc835320 : q ≤ 858479
  · exact chkP_sound c_67_835320 q (by omega) hc835320 hqo h16
  replace hlo : 858480 ≤ q := by omega
  by_cases hc858480 : q ≤ 878863
  · exact chkP_sound c_67_858480 q (by omega) hc858480 hqo h16
  replace hlo : 878864 ≤ q := by omega
  by_cases hc878864 : q ≤ 900575
  · exact chkP_sound c_67_878864 q (by omega) hc878864 hqo h16
  replace hlo : 900576 ≤ q := by omega
  by_cases hc900576 : q ≤ 919903
  · exact chkP_sound c_67_900576 q (by omega) hc900576 hqo h16
  replace hlo : 919904 ≤ q := by omega
  by_cases hc919904 : q ≤ 942311
  · exact chkP_sound c_67_919904 q (by omega) hc919904 hqo h16
  replace hlo : 942312 ≤ q := by omega
  by_cases hc942312 : q ≤ 965823
  · exact chkP_sound c_67_942312 q (by omega) hc942312 hqo h16
  replace hlo : 965824 ≤ q := by omega
  by_cases hc965824 : q ≤ 986599
  · exact chkP_sound c_67_965824 q (by omega) hc965824 hqo h16
  replace hlo : 986600 ≤ q := by omega
  exact chkP_sound c_67_986600 q hlo hhi hqo h16

theorem okp_71 (q : ℕ) (hlo : 15123 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (71 * (71 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 71 (fct 71) (fct 1000) q = true := by
  by_cases hc15123 : q ≤ 58411
  · exact chkP_sound c_71_15123 q (by omega) hc15123 hqo h16
  replace hlo : 58412 ≤ q := by omega
  by_cases hc58412 : q ≤ 93491
  · exact chkP_sound c_71_58412 q (by omega) hc58412 hqo h16
  replace hlo : 93492 ≤ q := by omega
  by_cases hc93492 : q ≤ 124339
  · exact chkP_sound c_71_93492 q (by omega) hc93492 hqo h16
  replace hlo : 124340 ≤ q := by omega
  by_cases hc124340 : q ≤ 156131
  · exact chkP_sound c_71_124340 q (by omega) hc124340 hqo h16
  replace hlo : 156132 ≤ q := by omega
  by_cases hc156132 : q ≤ 186379
  · exact chkP_sound c_71_156132 q (by omega) hc156132 hqo h16
  replace hlo : 186380 ≤ q := by omega
  by_cases hc186380 : q ≤ 214787
  · exact chkP_sound c_71_186380 q (by omega) hc186380 hqo h16
  replace hlo : 214788 ≤ q := by omega
  by_cases hc214788 : q ≤ 244451
  · exact chkP_sound c_71_214788 q (by omega) hc214788 hqo h16
  replace hlo : 244452 ≤ q := by omega
  by_cases hc244452 : q ≤ 272347
  · exact chkP_sound c_71_244452 q (by omega) hc244452 hqo h16
  replace hlo : 272348 ≤ q := by omega
  by_cases hc272348 : q ≤ 300427
  · exact chkP_sound c_71_272348 q (by omega) hc272348 hqo h16
  replace hlo : 300428 ≤ q := by omega
  by_cases hc300428 : q ≤ 326659
  · exact chkP_sound c_71_300428 q (by omega) hc300428 hqo h16
  replace hlo : 326660 ≤ q := by omega
  by_cases hc326660 : q ≤ 351427
  · exact chkP_sound c_71_326660 q (by omega) hc326660 hqo h16
  replace hlo : 351428 ≤ q := by omega
  by_cases hc351428 : q ≤ 377171
  · exact chkP_sound c_71_351428 q (by omega) hc351428 hqo h16
  replace hlo : 377172 ≤ q := by omega
  by_cases hc377172 : q ≤ 402947
  · exact chkP_sound c_71_377172 q (by omega) hc377172 hqo h16
  replace hlo : 402948 ≤ q := by omega
  by_cases hc402948 : q ≤ 427787
  · exact chkP_sound c_71_402948 q (by omega) hc402948 hqo h16
  replace hlo : 427788 ≤ q := by omega
  by_cases hc427788 : q ≤ 454387
  · exact chkP_sound c_71_427788 q (by omega) hc427788 hqo h16
  replace hlo : 454388 ≤ q := by omega
  by_cases hc454388 : q ≤ 479891
  · exact chkP_sound c_71_454388 q (by omega) hc454388 hqo h16
  replace hlo : 479892 ≤ q := by omega
  by_cases hc479892 : q ≤ 506507
  · exact chkP_sound c_71_479892 q (by omega) hc479892 hqo h16
  replace hlo : 506508 ≤ q := by omega
  by_cases hc506508 : q ≤ 532027
  · exact chkP_sound c_71_506508 q (by omega) hc506508 hqo h16
  replace hlo : 532028 ≤ q := by omega
  by_cases hc532028 : q ≤ 555931
  · exact chkP_sound c_71_532028 q (by omega) hc532028 hqo h16
  replace hlo : 555932 ≤ q := by omega
  by_cases hc555932 : q ≤ 579907
  · exact chkP_sound c_71_555932 q (by omega) hc555932 hqo h16
  replace hlo : 579908 ≤ q := by omega
  by_cases hc579908 : q ≤ 602867
  · exact chkP_sound c_71_579908 q (by omega) hc579908 hqo h16
  replace hlo : 602868 ≤ q := by omega
  by_cases hc602868 : q ≤ 627427
  · exact chkP_sound c_71_602868 q (by omega) hc602868 hqo h16
  replace hlo : 627428 ≤ q := by omega
  by_cases hc627428 : q ≤ 649851
  · exact chkP_sound c_71_627428 q (by omega) hc627428 hqo h16
  replace hlo : 649852 ≤ q := by omega
  by_cases hc649852 : q ≤ 674827
  · exact chkP_sound c_71_649852 q (by omega) hc649852 hqo h16
  replace hlo : 674828 ≤ q := by omega
  by_cases hc674828 : q ≤ 697677
  · exact chkP_sound c_71_674828 q (by omega) hc674828 hqo h16
  replace hlo : 697678 ≤ q := by omega
  by_cases hc697678 : q ≤ 719659
  · exact chkP_sound c_71_697678 q (by omega) hc697678 hqo h16
  replace hlo : 719660 ≤ q := by omega
  by_cases hc719660 : q ≤ 744859
  · exact chkP_sound c_71_719660 q (by omega) hc719660 hqo h16
  replace hlo : 744860 ≤ q := by omega
  by_cases hc744860 : q ≤ 766067
  · exact chkP_sound c_71_744860 q (by omega) hc744860 hqo h16
  replace hlo : 766068 ≤ q := by omega
  by_cases hc766068 : q ≤ 789067
  · exact chkP_sound c_71_766068 q (by omega) hc766068 hqo h16
  replace hlo : 789068 ≤ q := by omega
  by_cases hc789068 : q ≤ 811387
  · exact chkP_sound c_71_789068 q (by omega) hc789068 hqo h16
  replace hlo : 811388 ≤ q := by omega
  by_cases hc811388 : q ≤ 831619
  · exact chkP_sound c_71_811388 q (by omega) hc811388 hqo h16
  replace hlo : 831620 ≤ q := by omega
  by_cases hc831620 : q ≤ 854611
  · exact chkP_sound c_71_831620 q (by omega) hc831620 hqo h16
  replace hlo : 854612 ≤ q := by omega
  by_cases hc854612 : q ≤ 876611
  · exact chkP_sound c_71_854612 q (by omega) hc854612 hqo h16
  replace hlo : 876612 ≤ q := by omega
  by_cases hc876612 : q ≤ 898427
  · exact chkP_sound c_71_876612 q (by omega) hc876612 hqo h16
  replace hlo : 898428 ≤ q := by omega
  by_cases hc898428 : q ≤ 919939
  · exact chkP_sound c_71_898428 q (by omega) hc898428 hqo h16
  replace hlo : 919940 ≤ q := by omega
  by_cases hc919940 : q ≤ 941947
  · exact chkP_sound c_71_919940 q (by omega) hc919940 hqo h16
  replace hlo : 941948 ≤ q := by omega
  by_cases hc941948 : q ≤ 963307
  · exact chkP_sound c_71_941948 q (by omega) hc941948 hqo h16
  replace hlo : 963308 ≤ q := by omega
  by_cases hc963308 : q ≤ 984707
  · exact chkP_sound c_71_963308 q (by omega) hc963308 hqo h16
  replace hlo : 984708 ≤ q := by omega
  exact chkP_sound c_71_984708 q hlo hhi hqo h16

theorem okp_73 (q : ℕ) (hlo : 15987 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (73 * (73 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 73 (fct 73) (fct 1000) q = true := by
  by_cases hc15987 : q ≤ 765986
  · exact chkP_sound c_73_15987 q (by omega) hc15987 hqo h16
  replace hlo : 765987 ≤ q := by omega
  exact chkP_sound c_73_765987 q hlo hhi hqo h16

theorem okp_79 (q : ℕ) (hlo : 18723 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (79 * (79 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 79 (fct 79) (fct 1000) q = true := by
  by_cases hc18723 : q ≤ 61147
  · exact chkP_sound c_79_18723 q (by omega) hc18723 hqo h16
  replace hlo : 61148 ≤ q := by omega
  by_cases hc61148 : q ≤ 96779
  · exact chkP_sound c_79_61148 q (by omega) hc61148 hqo h16
  replace hlo : 96780 ≤ q := by omega
  by_cases hc96780 : q ≤ 128979
  · exact chkP_sound c_79_96780 q (by omega) hc96780 hqo h16
  replace hlo : 128980 ≤ q := by omega
  by_cases hc128980 : q ≤ 159403
  · exact chkP_sound c_79_128980 q (by omega) hc128980 hqo h16
  replace hlo : 159404 ≤ q := by omega
  by_cases hc159404 : q ≤ 189859
  · exact chkP_sound c_79_159404 q (by omega) hc159404 hqo h16
  replace hlo : 189860 ≤ q := by omega
  by_cases hc189860 : q ≤ 217979
  · exact chkP_sound c_79_189860 q (by omega) hc189860 hqo h16
  replace hlo : 217980 ≤ q := by omega
  by_cases hc217980 : q ≤ 246251
  · exact chkP_sound c_79_217980 q (by omega) hc217980 hqo h16
  replace hlo : 246252 ≤ q := by omega
  by_cases hc246252 : q ≤ 273547
  · exact chkP_sound c_79_246252 q (by omega) hc246252 hqo h16
  replace hlo : 273548 ≤ q := by omega
  by_cases hc273548 : q ≤ 301979
  · exact chkP_sound c_79_273548 q (by omega) hc273548 hqo h16
  replace hlo : 301980 ≤ q := by omega
  by_cases hc301980 : q ≤ 327707
  · exact chkP_sound c_79_301980 q (by omega) hc301980 hqo h16
  replace hlo : 327708 ≤ q := by omega
  by_cases hc327708 : q ≤ 352619
  · exact chkP_sound c_79_327708 q (by omega) hc327708 hqo h16
  replace hlo : 352620 ≤ q := by omega
  by_cases hc352620 : q ≤ 378779
  · exact chkP_sound c_79_352620 q (by omega) hc352620 hqo h16
  replace hlo : 378780 ≤ q := by omega
  by_cases hc378780 : q ≤ 405091
  · exact chkP_sound c_79_378780 q (by omega) hc378780 hqo h16
  replace hlo : 405092 ≤ q := by omega
  by_cases hc405092 : q ≤ 430611
  · exact chkP_sound c_79_405092 q (by omega) hc405092 hqo h16
  replace hlo : 430612 ≤ q := by omega
  by_cases hc430612 : q ≤ 455899
  · exact chkP_sound c_79_430612 q (by omega) hc430612 hqo h16
  replace hlo : 455900 ≤ q := by omega
  by_cases hc455900 : q ≤ 478627
  · exact chkP_sound c_79_455900 q (by omega) hc455900 hqo h16
  replace hlo : 478628 ≤ q := by omega
  by_cases hc478628 : q ≤ 502819
  · exact chkP_sound c_79_478628 q (by omega) hc478628 hqo h16
  replace hlo : 502820 ≤ q := by omega
  by_cases hc502820 : q ≤ 528131
  · exact chkP_sound c_79_502820 q (by omega) hc502820 hqo h16
  replace hlo : 528132 ≤ q := by omega
  by_cases hc528132 : q ≤ 552491
  · exact chkP_sound c_79_528132 q (by omega) hc528132 hqo h16
  replace hlo : 552492 ≤ q := by omega
  by_cases hc552492 : q ≤ 575651
  · exact chkP_sound c_79_552492 q (by omega) hc552492 hqo h16
  replace hlo : 575652 ≤ q := by omega
  by_cases hc575652 : q ≤ 598379
  · exact chkP_sound c_79_575652 q (by omega) hc575652 hqo h16
  replace hlo : 598380 ≤ q := by omega
  by_cases hc598380 : q ≤ 623947
  · exact chkP_sound c_79_598380 q (by omega) hc598380 hqo h16
  replace hlo : 623948 ≤ q := by omega
  by_cases hc623948 : q ≤ 647491
  · exact chkP_sound c_79_623948 q (by omega) hc623948 hqo h16
  replace hlo : 647492 ≤ q := by omega
  by_cases hc647492 : q ≤ 670987
  · exact chkP_sound c_79_647492 q (by omega) hc647492 hqo h16
  replace hlo : 670988 ≤ q := by omega
  by_cases hc670988 : q ≤ 692347
  · exact chkP_sound c_79_670988 q (by omega) hc670988 hqo h16
  replace hlo : 692348 ≤ q := by omega
  by_cases hc692348 : q ≤ 715019
  · exact chkP_sound c_79_692348 q (by omega) hc692348 hqo h16
  replace hlo : 715020 ≤ q := by omega
  by_cases hc715020 : q ≤ 739787
  · exact chkP_sound c_79_715020 q (by omega) hc715020 hqo h16
  replace hlo : 739788 ≤ q := by omega
  by_cases hc739788 : q ≤ 763027
  · exact chkP_sound c_79_739788 q (by omega) hc739788 hqo h16
  replace hlo : 763028 ≤ q := by omega
  by_cases hc763028 : q ≤ 784827
  · exact chkP_sound c_79_763028 q (by omega) hc763028 hqo h16
  replace hlo : 784828 ≤ q := by omega
  by_cases hc784828 : q ≤ 805859
  · exact chkP_sound c_79_784828 q (by omega) hc784828 hqo h16
  replace hlo : 805860 ≤ q := by omega
  by_cases hc805860 : q ≤ 826483
  · exact chkP_sound c_79_805860 q (by omega) hc805860 hqo h16
  replace hlo : 826484 ≤ q := by omega
  by_cases hc826484 : q ≤ 848091
  · exact chkP_sound c_79_826484 q (by omega) hc826484 hqo h16
  replace hlo : 848092 ≤ q := by omega
  by_cases hc848092 : q ≤ 871475
  · exact chkP_sound c_79_848092 q (by omega) hc848092 hqo h16
  replace hlo : 871476 ≤ q := by omega
  by_cases hc871476 : q ≤ 893339
  · exact chkP_sound c_79_871476 q (by omega) hc871476 hqo h16
  replace hlo : 893340 ≤ q := by omega
  by_cases hc893340 : q ≤ 914819
  · exact chkP_sound c_79_893340 q (by omega) hc893340 hqo h16
  replace hlo : 914820 ≤ q := by omega
  by_cases hc914820 : q ≤ 935339
  · exact chkP_sound c_79_914820 q (by omega) hc914820 hqo h16
  replace hlo : 935340 ≤ q := by omega
  by_cases hc935340 : q ≤ 956467
  · exact chkP_sound c_79_935340 q (by omega) hc935340 hqo h16
  replace hlo : 956468 ≤ q := by omega
  by_cases hc956468 : q ≤ 978923
  · exact chkP_sound c_79_956468 q (by omega) hc956468 hqo h16
  replace hlo : 978924 ≤ q := by omega
  exact chkP_sound c_79_978924 q hlo hhi hqo h16

theorem okp_83 (q : ℕ) (hlo : 20667 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (83 * (83 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 83 (fct 83) (fct 1000) q = true := by
  by_cases hc20667 : q ≤ 62999
  · exact chkP_sound c_83_20667 q (by omega) hc20667 hqo h16
  replace hlo : 63000 ≤ q := by omega
  by_cases hc63000 : q ≤ 98543
  · exact chkP_sound c_83_63000 q (by omega) hc63000 hqo h16
  replace hlo : 98544 ≤ q := by omega
  by_cases hc98544 : q ≤ 133183
  · exact chkP_sound c_83_98544 q (by omega) hc98544 hqo h16
  replace hlo : 133184 ≤ q := by omega
  by_cases hc133184 : q ≤ 164071
  · exact chkP_sound c_83_133184 q (by omega) hc133184 hqo h16
  replace hlo : 164072 ≤ q := by omega
  by_cases hc164072 : q ≤ 192343
  · exact chkP_sound c_83_164072 q (by omega) hc164072 hqo h16
  replace hlo : 192344 ≤ q := by omega
  by_cases hc192344 : q ≤ 220543
  · exact chkP_sound c_83_192344 q (by omega) hc192344 hqo h16
  replace hlo : 220544 ≤ q := by omega
  by_cases hc220544 : q ≤ 247439
  · exact chkP_sound c_83_220544 q (by omega) hc220544 hqo h16
  replace hlo : 247440 ≤ q := by omega
  by_cases hc247440 : q ≤ 275399
  · exact chkP_sound c_83_247440 q (by omega) hc247440 hqo h16
  replace hlo : 275400 ≤ q := by omega
  by_cases hc275400 : q ≤ 302399
  · exact chkP_sound c_83_275400 q (by omega) hc275400 hqo h16
  replace hlo : 302400 ≤ q := by omega
  by_cases hc302400 : q ≤ 327847
  · exact chkP_sound c_83_302400 q (by omega) hc302400 hqo h16
  replace hlo : 327848 ≤ q := by omega
  by_cases hc327848 : q ≤ 354143
  · exact chkP_sound c_83_327848 q (by omega) hc327848 hqo h16
  replace hlo : 354144 ≤ q := by omega
  by_cases hc354144 : q ≤ 382583
  · exact chkP_sound c_83_354144 q (by omega) hc354144 hqo h16
  replace hlo : 382584 ≤ q := by omega
  by_cases hc382584 : q ≤ 407503
  · exact chkP_sound c_83_382584 q (by omega) hc382584 hqo h16
  replace hlo : 407504 ≤ q := by omega
  by_cases hc407504 : q ≤ 432391
  · exact chkP_sound c_83_407504 q (by omega) hc407504 hqo h16
  replace hlo : 432392 ≤ q := by omega
  by_cases hc432392 : q ≤ 457341
  · exact chkP_sound c_83_432392 q (by omega) hc432392 hqo h16
  replace hlo : 457342 ≤ q := by omega
  by_cases hc457342 : q ≤ 480887
  · exact chkP_sound c_83_457342 q (by omega) hc457342 hqo h16
  replace hlo : 480888 ≤ q := by omega
  by_cases hc480888 : q ≤ 505711
  · exact chkP_sound c_83_480888 q (by omega) hc480888 hqo h16
  replace hlo : 505712 ≤ q := by omega
  by_cases hc505712 : q ≤ 529519
  · exact chkP_sound c_83_505712 q (by omega) hc505712 hqo h16
  replace hlo : 529520 ≤ q := by omega
  by_cases hc529520 : q ≤ 552223
  · exact chkP_sound c_83_529520 q (by omega) hc529520 hqo h16
  replace hlo : 552224 ≤ q := by omega
  by_cases hc552224 : q ≤ 576439
  · exact chkP_sound c_83_552224 q (by omega) hc552224 hqo h16
  replace hlo : 576440 ≤ q := by omega
  by_cases hc576440 : q ≤ 599591
  · exact chkP_sound c_83_576440 q (by omega) hc576440 hqo h16
  replace hlo : 599592 ≤ q := by omega
  by_cases hc599592 : q ≤ 620743
  · exact chkP_sound c_83_599592 q (by omega) hc599592 hqo h16
  replace hlo : 620744 ≤ q := by omega
  by_cases hc620744 : q ≤ 645327
  · exact chkP_sound c_83_620744 q (by omega) hc620744 hqo h16
  replace hlo : 645328 ≤ q := by omega
  by_cases hc645328 : q ≤ 669463
  · exact chkP_sound c_83_645328 q (by omega) hc645328 hqo h16
  replace hlo : 669464 ≤ q := by omega
  by_cases hc669464 : q ≤ 691919
  · exact chkP_sound c_83_669464 q (by omega) hc669464 hqo h16
  replace hlo : 691920 ≤ q := by omega
  by_cases hc691920 : q ≤ 715823
  · exact chkP_sound c_83_691920 q (by omega) hc691920 hqo h16
  replace hlo : 715824 ≤ q := by omega
  by_cases hc715824 : q ≤ 735431
  · exact chkP_sound c_83_715824 q (by omega) hc715824 hqo h16
  replace hlo : 735432 ≤ q := by omega
  by_cases hc735432 : q ≤ 757751
  · exact chkP_sound c_83_735432 q (by omega) hc735432 hqo h16
  replace hlo : 757752 ≤ q := by omega
  by_cases hc757752 : q ≤ 780191
  · exact chkP_sound c_83_757752 q (by omega) hc757752 hqo h16
  replace hlo : 780192 ≤ q := by omega
  by_cases hc780192 : q ≤ 802231
  · exact chkP_sound c_83_780192 q (by omega) hc780192 hqo h16
  replace hlo : 802232 ≤ q := by omega
  by_cases hc802232 : q ≤ 823531
  · exact chkP_sound c_83_802232 q (by omega) hc802232 hqo h16
  replace hlo : 823532 ≤ q := by omega
  by_cases hc823532 : q ≤ 846943
  · exact chkP_sound c_83_823532 q (by omega) hc823532 hqo h16
  replace hlo : 846944 ≤ q := by omega
  by_cases hc846944 : q ≤ 868055
  · exact chkP_sound c_83_846944 q (by omega) hc846944 hqo h16
  replace hlo : 868056 ≤ q := by omega
  by_cases hc868056 : q ≤ 888431
  · exact chkP_sound c_83_868056 q (by omega) hc868056 hqo h16
  replace hlo : 888432 ≤ q := by omega
  by_cases hc888432 : q ≤ 911879
  · exact chkP_sound c_83_888432 q (by omega) hc888432 hqo h16
  replace hlo : 911880 ≤ q := by omega
  by_cases hc911880 : q ≤ 932431
  · exact chkP_sound c_83_911880 q (by omega) hc911880 hqo h16
  replace hlo : 932432 ≤ q := by omega
  by_cases hc932432 : q ≤ 953503
  · exact chkP_sound c_83_932432 q (by omega) hc932432 hqo h16
  replace hlo : 953504 ≤ q := by omega
  by_cases hc953504 : q ≤ 972319
  · exact chkP_sound c_83_953504 q (by omega) hc953504 hqo h16
  replace hlo : 972320 ≤ q := by omega
  by_cases hc972320 : q ≤ 993319
  · exact chkP_sound c_83_972320 q (by omega) hc972320 hqo h16
  replace hlo : 993320 ≤ q := by omega
  exact chkP_sound c_83_993320 q hlo hhi hqo h16

theorem okp_89 (q : ℕ) (hlo : 23763 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (89 * (89 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 89 (fct 89) (fct 1000) q = true := by
  by_cases hc23763 : q ≤ 773762
  · exact chkP_sound c_89_23763 q (by omega) hc23763 hqo h16
  replace hlo : 773763 ≤ q := by omega
  exact chkP_sound c_89_773763 q hlo hhi hqo h16

theorem okp_97 (q : ℕ) (hlo : 28227 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (97 * (97 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 97 (fct 97) (fct 1000) q = true := by
  by_cases hc28227 : q ≤ 778226
  · exact chkP_sound c_97_28227 q (by omega) hc28227 hqo h16
  replace hlo : 778227 ≤ q := by omega
  exact chkP_sound c_97_778227 q hlo hhi hqo h16

theorem okp_101 (q : ℕ) (hlo : 30603 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (101 * (101 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 101 (fct 101) (fct 1000) q = true := by
  by_cases hc30603 : q ≤ 780602
  · exact chkP_sound c_101_30603 q (by omega) hc30603 hqo h16
  replace hlo : 780603 ≤ q := by omega
  exact chkP_sound c_101_780603 q hlo hhi hqo h16

theorem okp_103 (q : ℕ) (hlo : 31827 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (103 * (103 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 103 (fct 103) (fct 1000) q = true := by
  by_cases hc31827 : q ≤ 73571
  · exact chkP_sound c_103_31827 q (by omega) hc31827 hqo h16
  replace hlo : 73572 ≤ q := by omega
  by_cases hc73572 : q ≤ 108739
  · exact chkP_sound c_103_73572 q (by omega) hc73572 hqo h16
  replace hlo : 108740 ≤ q := by omega
  by_cases hc108740 : q ≤ 141723
  · exact chkP_sound c_103_108740 q (by omega) hc108740 hqo h16
  replace hlo : 141724 ≤ q := by omega
  by_cases hc141724 : q ≤ 171403
  · exact chkP_sound c_103_141724 q (by omega) hc141724 hqo h16
  replace hlo : 171404 ≤ q := by omega
  by_cases hc171404 : q ≤ 202707
  · exact chkP_sound c_103_171404 q (by omega) hc171404 hqo h16
  replace hlo : 202708 ≤ q := by omega
  by_cases hc202708 : q ≤ 232171
  · exact chkP_sound c_103_202708 q (by omega) hc202708 hqo h16
  replace hlo : 232172 ≤ q := by omega
  by_cases hc232172 : q ≤ 259643
  · exact chkP_sound c_103_232172 q (by omega) hc232172 hqo h16
  replace hlo : 259644 ≤ q := by omega
  by_cases hc259644 : q ≤ 286019
  · exact chkP_sound c_103_259644 q (by omega) hc259644 hqo h16
  replace hlo : 286020 ≤ q := by omega
  by_cases hc286020 : q ≤ 312979
  · exact chkP_sound c_103_286020 q (by omega) hc286020 hqo h16
  replace hlo : 312980 ≤ q := by omega
  by_cases hc312980 : q ≤ 340643
  · exact chkP_sound c_103_312980 q (by omega) hc312980 hqo h16
  replace hlo : 340644 ≤ q := by omega
  by_cases hc340644 : q ≤ 364499
  · exact chkP_sound c_103_340644 q (by omega) hc340644 hqo h16
  replace hlo : 364500 ≤ q := by omega
  by_cases hc364500 : q ≤ 389651
  · exact chkP_sound c_103_364500 q (by omega) hc364500 hqo h16
  replace hlo : 389652 ≤ q := by omega
  by_cases hc389652 : q ≤ 414899
  · exact chkP_sound c_103_389652 q (by omega) hc389652 hqo h16
  replace hlo : 414900 ≤ q := by omega
  by_cases hc414900 : q ≤ 438499
  · exact chkP_sound c_103_414900 q (by omega) hc414900 hqo h16
  replace hlo : 438500 ≤ q := by omega
  by_cases hc438500 : q ≤ 463891
  · exact chkP_sound c_103_438500 q (by omega) hc438500 hqo h16
  replace hlo : 463892 ≤ q := by omega
  by_cases hc463892 : q ≤ 485131
  · exact chkP_sound c_103_463892 q (by omega) hc463892 hqo h16
  replace hlo : 485132 ≤ q := by omega
  by_cases hc485132 : q ≤ 509011
  · exact chkP_sound c_103_485132 q (by omega) hc485132 hqo h16
  replace hlo : 509012 ≤ q := by omega
  by_cases hc509012 : q ≤ 533219
  · exact chkP_sound c_103_509012 q (by omega) hc509012 hqo h16
  replace hlo : 533220 ≤ q := by omega
  by_cases hc533220 : q ≤ 556635
  · exact chkP_sound c_103_533220 q (by omega) hc533220 hqo h16
  replace hlo : 556636 ≤ q := by omega
  by_cases hc556636 : q ≤ 579179
  · exact chkP_sound c_103_556636 q (by omega) hc556636 hqo h16
  replace hlo : 579180 ≤ q := by omega
  by_cases hc579180 : q ≤ 602411
  · exact chkP_sound c_103_579180 q (by omega) hc579180 hqo h16
  replace hlo : 602412 ≤ q := by omega
  by_cases hc602412 : q ≤ 626323
  · exact chkP_sound c_103_602412 q (by omega) hc602412 hqo h16
  replace hlo : 626324 ≤ q := by omega
  by_cases hc626324 : q ≤ 647963
  · exact chkP_sound c_103_626324 q (by omega) hc626324 hqo h16
  replace hlo : 647964 ≤ q := by omega
  by_cases hc647964 : q ≤ 670811
  · exact chkP_sound c_103_647964 q (by omega) hc647964 hqo h16
  replace hlo : 670812 ≤ q := by omega
  by_cases hc670812 : q ≤ 693019
  · exact chkP_sound c_103_670812 q (by omega) hc670812 hqo h16
  replace hlo : 693020 ≤ q := by omega
  by_cases hc693020 : q ≤ 716683
  · exact chkP_sound c_103_693020 q (by omega) hc693020 hqo h16
  replace hlo : 716684 ≤ q := by omega
  by_cases hc716684 : q ≤ 737683
  · exact chkP_sound c_103_716684 q (by omega) hc716684 hqo h16
  replace hlo : 737684 ≤ q := by omega
  by_cases hc737684 : q ≤ 758971
  · exact chkP_sound c_103_737684 q (by omega) hc737684 hqo h16
  replace hlo : 758972 ≤ q := by omega
  by_cases hc758972 : q ≤ 782299
  · exact chkP_sound c_103_758972 q (by omega) hc758972 hqo h16
  replace hlo : 782300 ≤ q := by omega
  by_cases hc782300 : q ≤ 805891
  · exact chkP_sound c_103_782300 q (by omega) hc782300 hqo h16
  replace hlo : 805892 ≤ q := by omega
  by_cases hc805892 : q ≤ 828043
  · exact chkP_sound c_103_805892 q (by omega) hc805892 hqo h16
  replace hlo : 828044 ≤ q := by omega
  by_cases hc828044 : q ≤ 848851
  · exact chkP_sound c_103_828044 q (by omega) hc828044 hqo h16
  replace hlo : 848852 ≤ q := by omega
  by_cases hc848852 : q ≤ 870931
  · exact chkP_sound c_103_848852 q (by omega) hc848852 hqo h16
  replace hlo : 870932 ≤ q := by omega
  by_cases hc870932 : q ≤ 890963
  · exact chkP_sound c_103_870932 q (by omega) hc870932 hqo h16
  replace hlo : 890964 ≤ q := by omega
  by_cases hc890964 : q ≤ 910883
  · exact chkP_sound c_103_890964 q (by omega) hc890964 hqo h16
  replace hlo : 910884 ≤ q := by omega
  by_cases hc910884 : q ≤ 930763
  · exact chkP_sound c_103_910884 q (by omega) hc910884 hqo h16
  replace hlo : 930764 ≤ q := by omega
  by_cases hc930764 : q ≤ 951931
  · exact chkP_sound c_103_930764 q (by omega) hc930764 hqo h16
  replace hlo : 951932 ≤ q := by omega
  by_cases hc951932 : q ≤ 973411
  · exact chkP_sound c_103_951932 q (by omega) hc951932 hqo h16
  replace hlo : 973412 ≤ q := by omega
  by_cases hc973412 : q ≤ 995363
  · exact chkP_sound c_103_973412 q (by omega) hc973412 hqo h16
  replace hlo : 995364 ≤ q := by omega
  exact chkP_sound c_103_995364 q hlo hhi hqo h16

theorem okp_107 (q : ℕ) (hlo : 34347 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (107 * (107 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 107 (fct 107) (fct 1000) q = true := by
  by_cases hc34347 : q ≤ 76975
  · exact chkP_sound c_107_34347 q (by omega) hc34347 hqo h16
  replace hlo : 76976 ≤ q := by omega
  by_cases hc76976 : q ≤ 113063
  · exact chkP_sound c_107_76976 q (by omega) hc76976 hqo h16
  replace hlo : 113064 ≤ q := by omega
  by_cases hc113064 : q ≤ 146239
  · exact chkP_sound c_107_113064 q (by omega) hc113064 hqo h16
  replace hlo : 146240 ≤ q := by omega
  by_cases hc146240 : q ≤ 176951
  · exact chkP_sound c_107_146240 q (by omega) hc146240 hqo h16
  replace hlo : 176952 ≤ q := by omega
  by_cases hc176952 : q ≤ 207871
  · exact chkP_sound c_107_176952 q (by omega) hc176952 hqo h16
  replace hlo : 207872 ≤ q := by omega
  by_cases hc207872 : q ≤ 236063
  · exact chkP_sound c_107_207872 q (by omega) hc207872 hqo h16
  replace hlo : 236064 ≤ q := by omega
  by_cases hc236064 : q ≤ 265087
  · exact chkP_sound c_107_236064 q (by omega) hc236064 hqo h16
  replace hlo : 265088 ≤ q := by omega
  by_cases hc265088 : q ≤ 292319
  · exact chkP_sound c_107_265088 q (by omega) hc265088 hqo h16
  replace hlo : 292320 ≤ q := by omega
  by_cases hc292320 : q ≤ 317599
  · exact chkP_sound c_107_292320 q (by omega) hc292320 hqo h16
  replace hlo : 317600 ≤ q := by omega
  by_cases hc317600 : q ≤ 341575
  · exact chkP_sound c_107_317600 q (by omega) hc317600 hqo h16
  replace hlo : 341576 ≤ q := by omega
  by_cases hc341576 : q ≤ 369263
  · exact chkP_sound c_107_341576 q (by omega) hc341576 hqo h16
  replace hlo : 369264 ≤ q := by omega
  by_cases hc369264 : q ≤ 395191
  · exact chkP_sound c_107_369264 q (by omega) hc369264 hqo h16
  replace hlo : 395192 ≤ q := by omega
  by_cases hc395192 : q ≤ 420231
  · exact chkP_sound c_107_395192 q (by omega) hc395192 hqo h16
  replace hlo : 420232 ≤ q := by omega
  by_cases hc420232 : q ≤ 445871
  · exact chkP_sound c_107_420232 q (by omega) hc420232 hqo h16
  replace hlo : 445872 ≤ q := by omega
  by_cases hc445872 : q ≤ 468391
  · exact chkP_sound c_107_445872 q (by omega) hc445872 hqo h16
  replace hlo : 468392 ≤ q := by omega
  by_cases hc468392 : q ≤ 492319
  · exact chkP_sound c_107_468392 q (by omega) hc468392 hqo h16
  replace hlo : 492320 ≤ q := by omega
  by_cases hc492320 : q ≤ 515663
  · exact chkP_sound c_107_492320 q (by omega) hc492320 hqo h16
  replace hlo : 515664 ≤ q := by omega
  by_cases hc515664 : q ≤ 539639
  · exact chkP_sound c_107_515664 q (by omega) hc515664 hqo h16
  replace hlo : 539640 ≤ q := by omega
  by_cases hc539640 : q ≤ 564959
  · exact chkP_sound c_107_539640 q (by omega) hc539640 hqo h16
  replace hlo : 564960 ≤ q := by omega
  by_cases hc564960 : q ≤ 588191
  · exact chkP_sound c_107_564960 q (by omega) hc564960 hqo h16
  replace hlo : 588192 ≤ q := by omega
  by_cases hc588192 : q ≤ 610391
  · exact chkP_sound c_107_588192 q (by omega) hc588192 hqo h16
  replace hlo : 610392 ≤ q := by omega
  by_cases hc610392 : q ≤ 634511
  · exact chkP_sound c_107_610392 q (by omega) hc610392 hqo h16
  replace hlo : 634512 ≤ q := by omega
  by_cases hc634512 : q ≤ 656951
  · exact chkP_sound c_107_634512 q (by omega) hc634512 hqo h16
  replace hlo : 656952 ≤ q := by omega
  by_cases hc656952 : q ≤ 678501
  · exact chkP_sound c_107_656952 q (by omega) hc656952 hqo h16
  replace hlo : 678502 ≤ q := by omega
  by_cases hc678502 : q ≤ 700831
  · exact chkP_sound c_107_678502 q (by omega) hc678502 hqo h16
  replace hlo : 700832 ≤ q := by omega
  by_cases hc700832 : q ≤ 722331
  · exact chkP_sound c_107_700832 q (by omega) hc700832 hqo h16
  replace hlo : 722332 ≤ q := by omega
  by_cases hc722332 : q ≤ 745471
  · exact chkP_sound c_107_722332 q (by omega) hc722332 hqo h16
  replace hlo : 745472 ≤ q := by omega
  by_cases hc745472 : q ≤ 767423
  · exact chkP_sound c_107_745472 q (by omega) hc745472 hqo h16
  replace hlo : 767424 ≤ q := by omega
  by_cases hc767424 : q ≤ 786823
  · exact chkP_sound c_107_767424 q (by omega) hc767424 hqo h16
  replace hlo : 786824 ≤ q := by omega
  by_cases hc786824 : q ≤ 808751
  · exact chkP_sound c_107_786824 q (by omega) hc786824 hqo h16
  replace hlo : 808752 ≤ q := by omega
  by_cases hc808752 : q ≤ 829695
  · exact chkP_sound c_107_808752 q (by omega) hc808752 hqo h16
  replace hlo : 829696 ≤ q := by omega
  by_cases hc829696 : q ≤ 850711
  · exact chkP_sound c_107_829696 q (by omega) hc829696 hqo h16
  replace hlo : 850712 ≤ q := by omega
  by_cases hc850712 : q ≤ 870911
  · exact chkP_sound c_107_850712 q (by omega) hc850712 hqo h16
  replace hlo : 870912 ≤ q := by omega
  by_cases hc870912 : q ≤ 890303
  · exact chkP_sound c_107_870912 q (by omega) hc870912 hqo h16
  replace hlo : 890304 ≤ q := by omega
  by_cases hc890304 : q ≤ 912847
  · exact chkP_sound c_107_890304 q (by omega) hc890304 hqo h16
  replace hlo : 912848 ≤ q := by omega
  by_cases hc912848 : q ≤ 932951
  · exact chkP_sound c_107_912848 q (by omega) hc912848 hqo h16
  replace hlo : 932952 ≤ q := by omega
  by_cases hc932952 : q ≤ 953039
  · exact chkP_sound c_107_932952 q (by omega) hc932952 hqo h16
  replace hlo : 953040 ≤ q := by omega
  by_cases hc953040 : q ≤ 973279
  · exact chkP_sound c_107_953040 q (by omega) hc953040 hqo h16
  replace hlo : 973280 ≤ q := by omega
  by_cases hc973280 : q ≤ 992623
  · exact chkP_sound c_107_973280 q (by omega) hc973280 hqo h16
  replace hlo : 992624 ≤ q := by omega
  exact chkP_sound c_107_992624 q hlo hhi hqo h16

theorem okp_109 (q : ℕ) (hlo : 35643 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (109 * (109 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 109 (fct 109) (fct 1000) q = true := by
  by_cases hc35643 : q ≤ 785642
  · exact chkP_sound c_109_35643 q (by omega) hc35643 hqo h16
  replace hlo : 785643 ≤ q := by omega
  exact chkP_sound c_109_785643 q hlo hhi hqo h16

theorem okp_113 (q : ℕ) (hlo : 38307 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (113 * (113 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 113 (fct 113) (fct 1000) q = true := by
  by_cases hc38307 : q ≤ 788306
  · exact chkP_sound c_113_38307 q (by omega) hc38307 hqo h16
  replace hlo : 788307 ≤ q := by omega
  exact chkP_sound c_113_788307 q hlo hhi hqo h16

theorem okp_127 (q : ℕ) (hlo : 48387 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (127 * (127 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 127 (fct 127) (fct 1000) q = true := by
  by_cases hc48387 : q ≤ 90019
  · exact chkP_sound c_127_48387 q (by omega) hc48387 hqo h16
  replace hlo : 90020 ≤ q := by omega
  by_cases hc90020 : q ≤ 126691
  · exact chkP_sound c_127_90020 q (by omega) hc90020 hqo h16
  replace hlo : 126692 ≤ q := by omega
  by_cases hc126692 : q ≤ 160883
  · exact chkP_sound c_127_126692 q (by omega) hc126692 hqo h16
  replace hlo : 160884 ≤ q := by omega
  by_cases hc160884 : q ≤ 191379
  · exact chkP_sound c_127_160884 q (by omega) hc160884 hqo h16
  replace hlo : 191380 ≤ q := by omega
  by_cases hc191380 : q ≤ 222515
  · exact chkP_sound c_127_191380 q (by omega) hc191380 hqo h16
  replace hlo : 222516 ≤ q := by omega
  by_cases hc222516 : q ≤ 250683
  · exact chkP_sound c_127_222516 q (by omega) hc222516 hqo h16
  replace hlo : 250684 ≤ q := by omega
  by_cases hc250684 : q ≤ 278363
  · exact chkP_sound c_127_250684 q (by omega) hc250684 hqo h16
  replace hlo : 278364 ≤ q := by omega
  by_cases hc278364 : q ≤ 306331
  · exact chkP_sound c_127_278364 q (by omega) hc278364 hqo h16
  replace hlo : 306332 ≤ q := by omega
  by_cases hc306332 : q ≤ 332099
  · exact chkP_sound c_127_306332 q (by omega) hc306332 hqo h16
  replace hlo : 332100 ≤ q := by omega
  by_cases hc332100 : q ≤ 358331
  · exact chkP_sound c_127_332100 q (by omega) hc332100 hqo h16
  replace hlo : 358332 ≤ q := by omega
  by_cases hc358332 : q ≤ 382203
  · exact chkP_sound c_127_358332 q (by omega) hc358332 hqo h16
  replace hlo : 382204 ≤ q := by omega
  by_cases hc382204 : q ≤ 408491
  · exact chkP_sound c_127_382204 q (by omega) hc382204 hqo h16
  replace hlo : 408492 ≤ q := by omega
  by_cases hc408492 : q ≤ 434141
  · exact chkP_sound c_127_408492 q (by omega) hc408492 hqo h16
  replace hlo : 434142 ≤ q := by omega
  by_cases hc434142 : q ≤ 459523
  · exact chkP_sound c_127_434142 q (by omega) hc434142 hqo h16
  replace hlo : 459524 ≤ q := by omega
  by_cases hc459524 : q ≤ 483603
  · exact chkP_sound c_127_459524 q (by omega) hc459524 hqo h16
  replace hlo : 483604 ≤ q := by omega
  by_cases hc483604 : q ≤ 506731
  · exact chkP_sound c_127_483604 q (by omega) hc483604 hqo h16
  replace hlo : 506732 ≤ q := by omega
  by_cases hc506732 : q ≤ 530443
  · exact chkP_sound c_127_506732 q (by omega) hc506732 hqo h16
  replace hlo : 530444 ≤ q := by omega
  by_cases hc530444 : q ≤ 554299
  · exact chkP_sound c_127_530444 q (by omega) hc530444 hqo h16
  replace hlo : 554300 ≤ q := by omega
  by_cases hc554300 : q ≤ 577979
  · exact chkP_sound c_127_554300 q (by omega) hc554300 hqo h16
  replace hlo : 577980 ≤ q := by omega
  by_cases hc577980 : q ≤ 601529
  · exact chkP_sound c_127_577980 q (by omega) hc577980 hqo h16
  replace hlo : 601530 ≤ q := by omega
  by_cases hc601530 : q ≤ 625891
  · exact chkP_sound c_127_601530 q (by omega) hc601530 hqo h16
  replace hlo : 625892 ≤ q := by omega
  by_cases hc625892 : q ≤ 647891
  · exact chkP_sound c_127_625892 q (by omega) hc625892 hqo h16
  replace hlo : 647892 ≤ q := by omega
  by_cases hc647892 : q ≤ 671003
  · exact chkP_sound c_127_647892 q (by omega) hc647892 hqo h16
  replace hlo : 671004 ≤ q := by omega
  by_cases hc671004 : q ≤ 693731
  · exact chkP_sound c_127_671004 q (by omega) hc671004 hqo h16
  replace hlo : 693732 ≤ q := by omega
  by_cases hc693732 : q ≤ 717139
  · exact chkP_sound c_127_693732 q (by omega) hc693732 hqo h16
  replace hlo : 717140 ≤ q := by omega
  by_cases hc717140 : q ≤ 737523
  · exact chkP_sound c_127_717140 q (by omega) hc717140 hqo h16
  replace hlo : 737524 ≤ q := by omega
  by_cases hc737524 : q ≤ 759523
  · exact chkP_sound c_127_737524 q (by omega) hc737524 hqo h16
  replace hlo : 759524 ≤ q := by omega
  by_cases hc759524 : q ≤ 781163
  · exact chkP_sound c_127_759524 q (by omega) hc759524 hqo h16
  replace hlo : 781164 ≤ q := by omega
  by_cases hc781164 : q ≤ 801707
  · exact chkP_sound c_127_781164 q (by omega) hc781164 hqo h16
  replace hlo : 801708 ≤ q := by omega
  by_cases hc801708 : q ≤ 821099
  · exact chkP_sound c_127_801708 q (by omega) hc801708 hqo h16
  replace hlo : 821100 ≤ q := by omega
  by_cases hc821100 : q ≤ 843147
  · exact chkP_sound c_127_821100 q (by omega) hc821100 hqo h16
  replace hlo : 843148 ≤ q := by omega
  by_cases hc843148 : q ≤ 864379
  · exact chkP_sound c_127_843148 q (by omega) hc843148 hqo h16
  replace hlo : 864380 ≤ q := by omega
  by_cases hc864380 : q ≤ 885611
  · exact chkP_sound c_127_864380 q (by omega) hc864380 hqo h16
  replace hlo : 885612 ≤ q := by omega
  by_cases hc885612 : q ≤ 907723
  · exact chkP_sound c_127_885612 q (by omega) hc885612 hqo h16
  replace hlo : 907724 ≤ q := by omega
  by_cases hc907724 : q ≤ 927763
  · exact chkP_sound c_127_907724 q (by omega) hc907724 hqo h16
  replace hlo : 927764 ≤ q := by omega
  by_cases hc927764 : q ≤ 949051
  · exact chkP_sound c_127_927764 q (by omega) hc927764 hqo h16
  replace hlo : 949052 ≤ q := by omega
  by_cases hc949052 : q ≤ 968363
  · exact chkP_sound c_127_949052 q (by omega) hc949052 hqo h16
  replace hlo : 968364 ≤ q := by omega
  by_cases hc968364 : q ≤ 989291
  · exact chkP_sound c_127_968364 q (by omega) hc968364 hqo h16
  replace hlo : 989292 ≤ q := by omega
  exact chkP_sound c_127_989292 q hlo hhi hqo h16

theorem okp_131 (q : ℕ) (hlo : 51483 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (131 * (131 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 131 (fct 131) (fct 1000) q = true := by
  by_cases hc51483 : q ≤ 93607
  · exact chkP_sound c_131_51483 q (by omega) hc51483 hqo h16
  replace hlo : 93608 ≤ q := by omega
  by_cases hc93608 : q ≤ 129303
  · exact chkP_sound c_131_93608 q (by omega) hc93608 hqo h16
  replace hlo : 129304 ≤ q := by omega
  by_cases hc129304 : q ≤ 161639
  · exact chkP_sound c_131_129304 q (by omega) hc129304 hqo h16
  replace hlo : 161640 ≤ q := by omega
  by_cases hc161640 : q ≤ 192887
  · exact chkP_sound c_131_161640 q (by omega) hc161640 hqo h16
  replace hlo : 192888 ≤ q := by omega
  by_cases hc192888 : q ≤ 222799
  · exact chkP_sound c_131_192888 q (by omega) hc192888 hqo h16
  replace hlo : 222800 ≤ q := by omega
  by_cases hc222800 : q ≤ 253143
  · exact chkP_sound c_131_222800 q (by omega) hc222800 hqo h16
  replace hlo : 253144 ≤ q := by omega
  by_cases hc253144 : q ≤ 281431
  · exact chkP_sound c_131_253144 q (by omega) hc253144 hqo h16
  replace hlo : 281432 ≤ q := by omega
  by_cases hc281432 : q ≤ 308639
  · exact chkP_sound c_131_281432 q (by omega) hc281432 hqo h16
  replace hlo : 308640 ≤ q := by omega
  by_cases hc308640 : q ≤ 336239
  · exact chkP_sound c_131_308640 q (by omega) hc308640 hqo h16
  replace hlo : 336240 ≤ q := by omega
  by_cases hc336240 : q ≤ 362991
  · exact chkP_sound c_131_336240 q (by omega) hc336240 hqo h16
  replace hlo : 362992 ≤ q := by omega
  by_cases hc362992 : q ≤ 389591
  · exact chkP_sound c_131_362992 q (by omega) hc362992 hqo h16
  replace hlo : 389592 ≤ q := by omega
  by_cases hc389592 : q ≤ 416887
  · exact chkP_sound c_131_389592 q (by omega) hc389592 hqo h16
  replace hlo : 416888 ≤ q := by omega
  by_cases hc416888 : q ≤ 440551
  · exact chkP_sound c_131_416888 q (by omega) hc416888 hqo h16
  replace hlo : 440552 ≤ q := by omega
  by_cases hc440552 : q ≤ 465799
  · exact chkP_sound c_131_440552 q (by omega) hc440552 hqo h16
  replace hlo : 465800 ≤ q := by omega
  by_cases hc465800 : q ≤ 488943
  · exact chkP_sound c_131_465800 q (by omega) hc465800 hqo h16
  replace hlo : 488944 ≤ q := by omega
  by_cases hc488944 : q ≤ 512207
  · exact chkP_sound c_131_488944 q (by omega) hc488944 hqo h16
  replace hlo : 512208 ≤ q := by omega
  by_cases hc512208 : q ≤ 535879
  · exact chkP_sound c_131_512208 q (by omega) hc512208 hqo h16
  replace hlo : 535880 ≤ q := by omega
  by_cases hc535880 : q ≤ 560239
  · exact chkP_sound c_131_535880 q (by omega) hc535880 hqo h16
  replace hlo : 560240 ≤ q := by omega
  by_cases hc560240 : q ≤ 585139
  · exact chkP_sound c_131_560240 q (by omega) hc560240 hqo h16
  replace hlo : 585140 ≤ q := by omega
  by_cases hc585140 : q ≤ 606791
  · exact chkP_sound c_131_585140 q (by omega) hc585140 hqo h16
  replace hlo : 606792 ≤ q := by omega
  by_cases hc606792 : q ≤ 631223
  · exact chkP_sound c_131_606792 q (by omega) hc606792 hqo h16
  replace hlo : 631224 ≤ q := by omega
  by_cases hc631224 : q ≤ 654727
  · exact chkP_sound c_131_631224 q (by omega) hc631224 hqo h16
  replace hlo : 654728 ≤ q := by omega
  by_cases hc654728 : q ≤ 675079
  · exact chkP_sound c_131_654728 q (by omega) hc654728 hqo h16
  replace hlo : 675080 ≤ q := by omega
  by_cases hc675080 : q ≤ 695879
  · exact chkP_sound c_131_675080 q (by omega) hc675080 hqo h16
  replace hlo : 695880 ≤ q := by omega
  by_cases hc695880 : q ≤ 717327
  · exact chkP_sound c_131_695880 q (by omega) hc695880 hqo h16
  replace hlo : 717328 ≤ q := by omega
  by_cases hc717328 : q ≤ 738919
  · exact chkP_sound c_131_717328 q (by omega) hc717328 hqo h16
  replace hlo : 738920 ≤ q := by omega
  by_cases hc738920 : q ≤ 760943
  · exact chkP_sound c_131_738920 q (by omega) hc738920 hqo h16
  replace hlo : 760944 ≤ q := by omega
  by_cases hc760944 : q ≤ 781199
  · exact chkP_sound c_131_760944 q (by omega) hc760944 hqo h16
  replace hlo : 781200 ≤ q := by omega
  by_cases hc781200 : q ≤ 800159
  · exact chkP_sound c_131_781200 q (by omega) hc781200 hqo h16
  replace hlo : 800160 ≤ q := by omega
  by_cases hc800160 : q ≤ 822391
  · exact chkP_sound c_131_800160 q (by omega) hc800160 hqo h16
  replace hlo : 822392 ≤ q := by omega
  by_cases hc822392 : q ≤ 842759
  · exact chkP_sound c_131_822392 q (by omega) hc822392 hqo h16
  replace hlo : 842760 ≤ q := by omega
  by_cases hc842760 : q ≤ 865247
  · exact chkP_sound c_131_842760 q (by omega) hc842760 hqo h16
  replace hlo : 865248 ≤ q := by omega
  by_cases hc865248 : q ≤ 886199
  · exact chkP_sound c_131_865248 q (by omega) hc865248 hqo h16
  replace hlo : 886200 ≤ q := by omega
  by_cases hc886200 : q ≤ 907567
  · exact chkP_sound c_131_886200 q (by omega) hc886200 hqo h16
  replace hlo : 907568 ≤ q := by omega
  by_cases hc907568 : q ≤ 930191
  · exact chkP_sound c_131_907568 q (by omega) hc907568 hqo h16
  replace hlo : 930192 ≤ q := by omega
  by_cases hc930192 : q ≤ 950207
  · exact chkP_sound c_131_930192 q (by omega) hc930192 hqo h16
  replace hlo : 950208 ≤ q := by omega
  by_cases hc950208 : q ≤ 971111
  · exact chkP_sound c_131_950208 q (by omega) hc950208 hqo h16
  replace hlo : 971112 ≤ q := by omega
  by_cases hc971112 : q ≤ 992231
  · exact chkP_sound c_131_971112 q (by omega) hc971112 hqo h16
  replace hlo : 992232 ≤ q := by omega
  exact chkP_sound c_131_992232 q hlo hhi hqo h16

theorem okp_137 (q : ℕ) (hlo : 56307 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (137 * (137 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 137 (fct 137) (fct 1000) q = true := by
  by_cases hc56307 : q ≤ 806306
  · exact chkP_sound c_137_56307 q (by omega) hc56307 hqo h16
  replace hlo : 806307 ≤ q := by omega
  exact chkP_sound c_137_806307 q hlo hhi hqo h16

theorem okp_139 (q : ℕ) (hlo : 57963 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (139 * (139 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 139 (fct 139) (fct 1000) q = true := by
  by_cases hc57963 : q ≤ 100159
  · exact chkP_sound c_139_57963 q (by omega) hc57963 hqo h16
  replace hlo : 100160 ≤ q := by omega
  by_cases hc100160 : q ≤ 135479
  · exact chkP_sound c_139_100160 q (by omega) hc100160 hqo h16
  replace hlo : 135480 ≤ q := by omega
  by_cases hc135480 : q ≤ 168391
  · exact chkP_sound c_139_135480 q (by omega) hc135480 hqo h16
  replace hlo : 168392 ≤ q := by omega
  by_cases hc168392 : q ≤ 199679
  · exact chkP_sound c_139_168392 q (by omega) hc168392 hqo h16
  replace hlo : 199680 ≤ q := by omega
  by_cases hc199680 : q ≤ 229223
  · exact chkP_sound c_139_199680 q (by omega) hc199680 hqo h16
  replace hlo : 229224 ≤ q := by omega
  by_cases hc229224 : q ≤ 258551
  · exact chkP_sound c_139_229224 q (by omega) hc229224 hqo h16
  replace hlo : 258552 ≤ q := by omega
  by_cases hc258552 : q ≤ 284831
  · exact chkP_sound c_139_258552 q (by omega) hc258552 hqo h16
  replace hlo : 284832 ≤ q := by omega
  by_cases hc284832 : q ≤ 314359
  · exact chkP_sound c_139_284832 q (by omega) hc284832 hqo h16
  replace hlo : 314360 ≤ q := by omega
  by_cases hc314360 : q ≤ 338927
  · exact chkP_sound c_139_314360 q (by omega) hc314360 hqo h16
  replace hlo : 338928 ≤ q := by omega
  by_cases hc338928 : q ≤ 366967
  · exact chkP_sound c_139_338928 q (by omega) hc338928 hqo h16
  replace hlo : 366968 ≤ q := by omega
  by_cases hc366968 : q ≤ 392167
  · exact chkP_sound c_139_366968 q (by omega) hc366968 hqo h16
  replace hlo : 392168 ≤ q := by omega
  by_cases hc392168 : q ≤ 416263
  · exact chkP_sound c_139_392168 q (by omega) hc392168 hqo h16
  replace hlo : 416264 ≤ q := by omega
  by_cases hc416264 : q ≤ 439759
  · exact chkP_sound c_139_416264 q (by omega) hc416264 hqo h16
  replace hlo : 439760 ≤ q := by omega
  by_cases hc439760 : q ≤ 465055
  · exact chkP_sound c_139_439760 q (by omega) hc439760 hqo h16
  replace hlo : 465056 ≤ q := by omega
  by_cases hc465056 : q ≤ 491039
  · exact chkP_sound c_139_465056 q (by omega) hc465056 hqo h16
  replace hlo : 491040 ≤ q := by omega
  by_cases hc491040 : q ≤ 512959
  · exact chkP_sound c_139_491040 q (by omega) hc491040 hqo h16
  replace hlo : 512960 ≤ q := by omega
  by_cases hc512960 : q ≤ 536591
  · exact chkP_sound c_139_512960 q (by omega) hc512960 hqo h16
  replace hlo : 536592 ≤ q := by omega
  by_cases hc536592 : q ≤ 558599
  · exact chkP_sound c_139_536592 q (by omega) hc536592 hqo h16
  replace hlo : 558600 ≤ q := by omega
  by_cases hc558600 : q ≤ 580031
  · exact chkP_sound c_139_558600 q (by omega) hc558600 hqo h16
  replace hlo : 580032 ≤ q := by omega
  by_cases hc580032 : q ≤ 602839
  · exact chkP_sound c_139_580032 q (by omega) hc580032 hqo h16
  replace hlo : 602840 ≤ q := by omega
  by_cases hc602840 : q ≤ 625871
  · exact chkP_sound c_139_602840 q (by omega) hc602840 hqo h16
  replace hlo : 625872 ≤ q := by omega
  by_cases hc625872 : q ≤ 649751
  · exact chkP_sound c_139_625872 q (by omega) hc625872 hqo h16
  replace hlo : 649752 ≤ q := by omega
  by_cases hc649752 : q ≤ 672767
  · exact chkP_sound c_139_649752 q (by omega) hc649752 hqo h16
  replace hlo : 672768 ≤ q := by omega
  by_cases hc672768 : q ≤ 695687
  · exact chkP_sound c_139_672768 q (by omega) hc672768 hqo h16
  replace hlo : 695688 ≤ q := by omega
  by_cases hc695688 : q ≤ 719183
  · exact chkP_sound c_139_695688 q (by omega) hc695688 hqo h16
  replace hlo : 719184 ≤ q := by omega
  by_cases hc719184 : q ≤ 737535
  · exact chkP_sound c_139_719184 q (by omega) hc719184 hqo h16
  replace hlo : 737536 ≤ q := by omega
  by_cases hc737536 : q ≤ 762007
  · exact chkP_sound c_139_737536 q (by omega) hc737536 hqo h16
  replace hlo : 762008 ≤ q := by omega
  by_cases hc762008 : q ≤ 783151
  · exact chkP_sound c_139_762008 q (by omega) hc762008 hqo h16
  replace hlo : 783152 ≤ q := by omega
  by_cases hc783152 : q ≤ 804191
  · exact chkP_sound c_139_783152 q (by omega) hc783152 hqo h16
  replace hlo : 804192 ≤ q := by omega
  by_cases hc804192 : q ≤ 825191
  · exact chkP_sound c_139_804192 q (by omega) hc804192 hqo h16
  replace hlo : 825192 ≤ q := by omega
  by_cases hc825192 : q ≤ 844511
  · exact chkP_sound c_139_825192 q (by omega) hc825192 hqo h16
  replace hlo : 844512 ≤ q := by omega
  by_cases hc844512 : q ≤ 864631
  · exact chkP_sound c_139_844512 q (by omega) hc844512 hqo h16
  replace hlo : 864632 ≤ q := by omega
  by_cases hc864632 : q ≤ 886367
  · exact chkP_sound c_139_864632 q (by omega) hc864632 hqo h16
  replace hlo : 886368 ≤ q := by omega
  by_cases hc886368 : q ≤ 908311
  · exact chkP_sound c_139_886368 q (by omega) hc886368 hqo h16
  replace hlo : 908312 ≤ q := by omega
  by_cases hc908312 : q ≤ 927631
  · exact chkP_sound c_139_908312 q (by omega) hc908312 hqo h16
  replace hlo : 927632 ≤ q := by omega
  by_cases hc927632 : q ≤ 947351
  · exact chkP_sound c_139_927632 q (by omega) hc927632 hqo h16
  replace hlo : 947352 ≤ q := by omega
  by_cases hc947352 : q ≤ 968647
  · exact chkP_sound c_139_947352 q (by omega) hc947352 hqo h16
  replace hlo : 968648 ≤ q := by omega
  by_cases hc968648 : q ≤ 986767
  · exact chkP_sound c_139_968648 q (by omega) hc968648 hqo h16
  replace hlo : 986768 ≤ q := by omega
  exact chkP_sound c_139_986768 q hlo hhi hqo h16

theorem okp_149 (q : ℕ) (hlo : 66603 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (149 * (149 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 149 (fct 149) (fct 1000) q = true := by
  by_cases hc66603 : q ≤ 816602
  · exact chkP_sound c_149_66603 q (by omega) hc66603 hqo h16
  replace hlo : 816603 ≤ q := by omega
  exact chkP_sound c_149_816603 q hlo hhi hqo h16

theorem okp_151 (q : ℕ) (hlo : 68403 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (151 * (151 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 151 (fct 151) (fct 1000) q = true := by
  by_cases hc68403 : q ≤ 108707
  · exact chkP_sound c_151_68403 q (by omega) hc68403 hqo h16
  replace hlo : 108708 ≤ q := by omega
  by_cases hc108708 : q ≤ 145283
  · exact chkP_sound c_151_108708 q (by omega) hc108708 hqo h16
  replace hlo : 145284 ≤ q := by omega
  by_cases hc145284 : q ≤ 177983
  · exact chkP_sound c_151_145284 q (by omega) hc145284 hqo h16
  replace hlo : 177984 ≤ q := by omega
  by_cases hc177984 : q ≤ 211571
  · exact chkP_sound c_151_177984 q (by omega) hc177984 hqo h16
  replace hlo : 211572 ≤ q := by omega
  by_cases hc211572 : q ≤ 239579
  · exact chkP_sound c_151_211572 q (by omega) hc211572 hqo h16
  replace hlo : 239580 ≤ q := by omega
  by_cases hc239580 : q ≤ 268129
  · exact chkP_sound c_151_239580 q (by omega) hc239580 hqo h16
  replace hlo : 268130 ≤ q := by omega
  by_cases hc268130 : q ≤ 296299
  · exact chkP_sound c_151_268130 q (by omega) hc268130 hqo h16
  replace hlo : 296300 ≤ q := by omega
  by_cases hc296300 : q ≤ 323467
  · exact chkP_sound c_151_296300 q (by omega) hc296300 hqo h16
  replace hlo : 323468 ≤ q := by omega
  by_cases hc323468 : q ≤ 347891
  · exact chkP_sound c_151_323468 q (by omega) hc323468 hqo h16
  replace hlo : 347892 ≤ q := by omega
  by_cases hc347892 : q ≤ 374299
  · exact chkP_sound c_151_347892 q (by omega) hc347892 hqo h16
  replace hlo : 374300 ≤ q := by omega
  by_cases hc374300 : q ≤ 401587
  · exact chkP_sound c_151_374300 q (by omega) hc374300 hqo h16
  replace hlo : 401588 ≤ q := by omega
  by_cases hc401588 : q ≤ 426195
  · exact chkP_sound c_151_401588 q (by omega) hc401588 hqo h16
  replace hlo : 426196 ≤ q := by omega
  by_cases hc426196 : q ≤ 451939
  · exact chkP_sound c_151_426196 q (by omega) hc426196 hqo h16
  replace hlo : 451940 ≤ q := by omega
  by_cases hc451940 : q ≤ 474723
  · exact chkP_sound c_151_451940 q (by omega) hc451940 hqo h16
  replace hlo : 474724 ≤ q := by omega
  by_cases hc474724 : q ≤ 499819
  · exact chkP_sound c_151_474724 q (by omega) hc474724 hqo h16
  replace hlo : 499820 ≤ q := by omega
  by_cases hc499820 : q ≤ 524731
  · exact chkP_sound c_151_499820 q (by omega) hc499820 hqo h16
  replace hlo : 524732 ≤ q := by omega
  by_cases hc524732 : q ≤ 548939
  · exact chkP_sound c_151_524732 q (by omega) hc524732 hqo h16
  replace hlo : 548940 ≤ q := by omega
  by_cases hc548940 : q ≤ 570643
  · exact chkP_sound c_151_548940 q (by omega) hc548940 hqo h16
  replace hlo : 570644 ≤ q := by omega
  by_cases hc570644 : q ≤ 593743
  · exact chkP_sound c_151_570644 q (by omega) hc570644 hqo h16
  replace hlo : 593744 ≤ q := by omega
  by_cases hc593744 : q ≤ 616243
  · exact chkP_sound c_151_593744 q (by omega) hc593744 hqo h16
  replace hlo : 616244 ≤ q := by omega
  by_cases hc616244 : q ≤ 640267
  · exact chkP_sound c_151_616244 q (by omega) hc616244 hqo h16
  replace hlo : 640268 ≤ q := by omega
  by_cases hc640268 : q ≤ 662491
  · exact chkP_sound c_151_640268 q (by omega) hc640268 hqo h16
  replace hlo : 662492 ≤ q := by omega
  by_cases hc662492 : q ≤ 686011
  · exact chkP_sound c_151_662492 q (by omega) hc662492 hqo h16
  replace hlo : 686012 ≤ q := by omega
  by_cases hc686012 : q ≤ 707219
  · exact chkP_sound c_151_686012 q (by omega) hc686012 hqo h16
  replace hlo : 707220 ≤ q := by omega
  by_cases hc707220 : q ≤ 729451
  · exact chkP_sound c_151_707220 q (by omega) hc707220 hqo h16
  replace hlo : 729452 ≤ q := by omega
  by_cases hc729452 : q ≤ 752251
  · exact chkP_sound c_151_729452 q (by omega) hc729452 hqo h16
  replace hlo : 752252 ≤ q := by omega
  by_cases hc752252 : q ≤ 773867
  · exact chkP_sound c_151_752252 q (by omega) hc752252 hqo h16
  replace hlo : 773868 ≤ q := by omega
  by_cases hc773868 : q ≤ 795827
  · exact chkP_sound c_151_773868 q (by omega) hc773868 hqo h16
  replace hlo : 795828 ≤ q := by omega
  by_cases hc795828 : q ≤ 816667
  · exact chkP_sound c_151_795828 q (by omega) hc795828 hqo h16
  replace hlo : 816668 ≤ q := by omega
  by_cases hc816668 : q ≤ 837731
  · exact chkP_sound c_151_816668 q (by omega) hc816668 hqo h16
  replace hlo : 837732 ≤ q := by omega
  by_cases hc837732 : q ≤ 858771
  · exact chkP_sound c_151_837732 q (by omega) hc837732 hqo h16
  replace hlo : 858772 ≤ q := by omega
  by_cases hc858772 : q ≤ 880027
  · exact chkP_sound c_151_858772 q (by omega) hc858772 hqo h16
  replace hlo : 880028 ≤ q := by omega
  by_cases hc880028 : q ≤ 899891
  · exact chkP_sound c_151_880028 q (by omega) hc880028 hqo h16
  replace hlo : 899892 ≤ q := by omega
  by_cases hc899892 : q ≤ 919939
  · exact chkP_sound c_151_899892 q (by omega) hc899892 hqo h16
  replace hlo : 919940 ≤ q := by omega
  by_cases hc919940 : q ≤ 939019
  · exact chkP_sound c_151_919940 q (by omega) hc919940 hqo h16
  replace hlo : 939020 ≤ q := by omega
  by_cases hc939020 : q ≤ 957851
  · exact chkP_sound c_151_939020 q (by omega) hc939020 hqo h16
  replace hlo : 957852 ≤ q := by omega
  by_cases hc957852 : q ≤ 981011
  · exact chkP_sound c_151_957852 q (by omega) hc957852 hqo h16
  replace hlo : 981012 ≤ q := by omega
  exact chkP_sound c_151_981012 q hlo hhi hqo h16

theorem okp_157 (q : ℕ) (hlo : 73947 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (157 * (157 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 157 (fct 157) (fct 1000) q = true := by
  by_cases hc73947 : q ≤ 823946
  · exact chkP_sound c_157_73947 q (by omega) hc73947 hqo h16
  replace hlo : 823947 ≤ q := by omega
  exact chkP_sound c_157_823947 q hlo hhi hqo h16

theorem okp_163 (q : ℕ) (hlo : 79707 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (163 * (163 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 163 (fct 163) (fct 1000) q = true := by
  by_cases hc79707 : q ≤ 120375
  · exact chkP_sound c_163_79707 q (by omega) hc79707 hqo h16
  replace hlo : 120376 ≤ q := by omega
  by_cases hc120376 : q ≤ 154871
  · exact chkP_sound c_163_120376 q (by omega) hc120376 hqo h16
  replace hlo : 154872 ≤ q := by omega
  by_cases hc154872 : q ≤ 188431
  · exact chkP_sound c_163_154872 q (by omega) hc154872 hqo h16
  replace hlo : 188432 ≤ q := by omega
  by_cases hc188432 : q ≤ 221951
  · exact chkP_sound c_163_188432 q (by omega) hc188432 hqo h16
  replace hlo : 221952 ≤ q := by omega
  by_cases hc221952 : q ≤ 251231
  · exact chkP_sound c_163_221952 q (by omega) hc221952 hqo h16
  replace hlo : 251232 ≤ q := by omega
  by_cases hc251232 : q ≤ 280751
  · exact chkP_sound c_163_251232 q (by omega) hc251232 hqo h16
  replace hlo : 280752 ≤ q := by omega
  by_cases hc280752 : q ≤ 308303
  · exact chkP_sound c_163_280752 q (by omega) hc280752 hqo h16
  replace hlo : 308304 ≤ q := by omega
  by_cases hc308304 : q ≤ 335663
  · exact chkP_sound c_163_308304 q (by omega) hc308304 hqo h16
  replace hlo : 335664 ≤ q := by omega
  by_cases hc335664 : q ≤ 361903
  · exact chkP_sound c_163_335664 q (by omega) hc335664 hqo h16
  replace hlo : 361904 ≤ q := by omega
  by_cases hc361904 : q ≤ 388159
  · exact chkP_sound c_163_361904 q (by omega) hc361904 hqo h16
  replace hlo : 388160 ≤ q := by omega
  by_cases hc388160 : q ≤ 412303
  · exact chkP_sound c_163_388160 q (by omega) hc388160 hqo h16
  replace hlo : 412304 ≤ q := by omega
  by_cases hc412304 : q ≤ 436403
  · exact chkP_sound c_163_412304 q (by omega) hc412304 hqo h16
  replace hlo : 436404 ≤ q := by omega
  by_cases hc436404 : q ≤ 459479
  · exact chkP_sound c_163_436404 q (by omega) hc436404 hqo h16
  replace hlo : 459480 ≤ q := by omega
  by_cases hc459480 : q ≤ 484951
  · exact chkP_sound c_163_459480 q (by omega) hc459480 hqo h16
  replace hlo : 484952 ≤ q := by omega
  by_cases hc484952 : q ≤ 508471
  · exact chkP_sound c_163_484952 q (by omega) hc484952 hqo h16
  replace hlo : 508472 ≤ q := by omega
  by_cases hc508472 : q ≤ 532521
  · exact chkP_sound c_163_508472 q (by omega) hc508472 hqo h16
  replace hlo : 532522 ≤ q := by omega
  by_cases hc532522 : q ≤ 555119
  · exact chkP_sound c_163_532522 q (by omega) hc532522 hqo h16
  replace hlo : 555120 ≤ q := by omega
  by_cases hc555120 : q ≤ 580183
  · exact chkP_sound c_163_555120 q (by omega) hc555120 hqo h16
  replace hlo : 580184 ≤ q := by omega
  by_cases hc580184 : q ≤ 605023
  · exact chkP_sound c_163_580184 q (by omega) hc580184 hqo h16
  replace hlo : 605024 ≤ q := by omega
  by_cases hc605024 : q ≤ 628063
  · exact chkP_sound c_163_605024 q (by omega) hc605024 hqo h16
  replace hlo : 628064 ≤ q := by omega
  by_cases hc628064 : q ≤ 651143
  · exact chkP_sound c_163_628064 q (by omega) hc628064 hqo h16
  replace hlo : 651144 ≤ q := by omega
  by_cases hc651144 : q ≤ 671303
  · exact chkP_sound c_163_651144 q (by omega) hc651144 hqo h16
  replace hlo : 671304 ≤ q := by omega
  by_cases hc671304 : q ≤ 694831
  · exact chkP_sound c_163_671304 q (by omega) hc671304 hqo h16
  replace hlo : 694832 ≤ q := by omega
  by_cases hc694832 : q ≤ 715423
  · exact chkP_sound c_163_694832 q (by omega) hc694832 hqo h16
  replace hlo : 715424 ≤ q := by omega
  by_cases hc715424 : q ≤ 734879
  · exact chkP_sound c_163_715424 q (by omega) hc715424 hqo h16
  replace hlo : 734880 ≤ q := by omega
  by_cases hc734880 : q ≤ 756463
  · exact chkP_sound c_163_734880 q (by omega) hc734880 hqo h16
  replace hlo : 756464 ≤ q := by omega
  by_cases hc756464 : q ≤ 777839
  · exact chkP_sound c_163_756464 q (by omega) hc756464 hqo h16
  replace hlo : 777840 ≤ q := by omega
  by_cases hc777840 : q ≤ 798079
  · exact chkP_sound c_163_777840 q (by omega) hc777840 hqo h16
  replace hlo : 798080 ≤ q := by omega
  by_cases hc798080 : q ≤ 819503
  · exact chkP_sound c_163_798080 q (by omega) hc798080 hqo h16
  replace hlo : 819504 ≤ q := by omega
  by_cases hc819504 : q ≤ 841191
  · exact chkP_sound c_163_819504 q (by omega) hc819504 hqo h16
  replace hlo : 841192 ≤ q := by omega
  by_cases hc841192 : q ≤ 862559
  · exact chkP_sound c_163_841192 q (by omega) hc841192 hqo h16
  replace hlo : 862560 ≤ q := by omega
  by_cases hc862560 : q ≤ 881351
  · exact chkP_sound c_163_862560 q (by omega) hc862560 hqo h16
  replace hlo : 881352 ≤ q := by omega
  by_cases hc881352 : q ≤ 903359
  · exact chkP_sound c_163_881352 q (by omega) hc881352 hqo h16
  replace hlo : 903360 ≤ q := by omega
  by_cases hc903360 : q ≤ 923151
  · exact chkP_sound c_163_903360 q (by omega) hc903360 hqo h16
  replace hlo : 923152 ≤ q := by omega
  by_cases hc923152 : q ≤ 944071
  · exact chkP_sound c_163_923152 q (by omega) hc923152 hqo h16
  replace hlo : 944072 ≤ q := by omega
  by_cases hc944072 : q ≤ 964703
  · exact chkP_sound c_163_944072 q (by omega) hc944072 hqo h16
  replace hlo : 964704 ≤ q := by omega
  by_cases hc964704 : q ≤ 984583
  · exact chkP_sound c_163_964704 q (by omega) hc964704 hqo h16
  replace hlo : 984584 ≤ q := by omega
  exact chkP_sound c_163_984584 q hlo hhi hqo h16

theorem okp_167 (q : ℕ) (hlo : 83667 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (167 * (167 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 167 (fct 167) (fct 1000) q = true := by
  by_cases hc83667 : q ≤ 122051
  · exact chkP_sound c_167_83667 q (by omega) hc83667 hqo h16
  replace hlo : 122052 ≤ q := by omega
  by_cases hc122052 : q ≤ 156707
  · exact chkP_sound c_167_122052 q (by omega) hc122052 hqo h16
  replace hlo : 156708 ≤ q := by omega
  by_cases hc156708 : q ≤ 189851
  · exact chkP_sound c_167_156708 q (by omega) hc156708 hqo h16
  replace hlo : 189852 ≤ q := by omega
  by_cases hc189852 : q ≤ 220403
  · exact chkP_sound c_167_189852 q (by omega) hc189852 hqo h16
  replace hlo : 220404 ≤ q := by omega
  by_cases hc220404 : q ≤ 249947
  · exact chkP_sound c_167_220404 q (by omega) hc220404 hqo h16
  replace hlo : 249948 ≤ q := by omega
  by_cases hc249948 : q ≤ 279155
  · exact chkP_sound c_167_249948 q (by omega) hc249948 hqo h16
  replace hlo : 279156 ≤ q := by omega
  by_cases hc279156 : q ≤ 307091
  · exact chkP_sound c_167_279156 q (by omega) hc279156 hqo h16
  replace hlo : 307092 ≤ q := by omega
  by_cases hc307092 : q ≤ 333723
  · exact chkP_sound c_167_307092 q (by omega) hc307092 hqo h16
  replace hlo : 333724 ≤ q := by omega
  by_cases hc333724 : q ≤ 359539
  · exact chkP_sound c_167_333724 q (by omega) hc333724 hqo h16
  replace hlo : 359540 ≤ q := by omega
  by_cases hc359540 : q ≤ 385531
  · exact chkP_sound c_167_359540 q (by omega) hc359540 hqo h16
  replace hlo : 385532 ≤ q := by omega
  by_cases hc385532 : q ≤ 411491
  · exact chkP_sound c_167_385532 q (by omega) hc385532 hqo h16
  replace hlo : 411492 ≤ q := by omega
  by_cases hc411492 : q ≤ 437651
  · exact chkP_sound c_167_411492 q (by omega) hc411492 hqo h16
  replace hlo : 437652 ≤ q := by omega
  by_cases hc437652 : q ≤ 463963
  · exact chkP_sound c_167_437652 q (by omega) hc437652 hqo h16
  replace hlo : 463964 ≤ q := by omega
  by_cases hc463964 : q ≤ 486203
  · exact chkP_sound c_167_463964 q (by omega) hc463964 hqo h16
  replace hlo : 486204 ≤ q := by omega
  by_cases hc486204 : q ≤ 512419
  · exact chkP_sound c_167_486204 q (by omega) hc486204 hqo h16
  replace hlo : 512420 ≤ q := by omega
  by_cases hc512420 : q ≤ 536243
  · exact chkP_sound c_167_512420 q (by omega) hc512420 hqo h16
  replace hlo : 536244 ≤ q := by omega
  by_cases hc536244 : q ≤ 559451
  · exact chkP_sound c_167_536244 q (by omega) hc536244 hqo h16
  replace hlo : 559452 ≤ q := by omega
  by_cases hc559452 : q ≤ 582203
  · exact chkP_sound c_167_559452 q (by omega) hc559452 hqo h16
  replace hlo : 582204 ≤ q := by omega
  by_cases hc582204 : q ≤ 604571
  · exact chkP_sound c_167_582204 q (by omega) hc582204 hqo h16
  replace hlo : 604572 ≤ q := by omega
  by_cases hc604572 : q ≤ 628811
  · exact chkP_sound c_167_604572 q (by omega) hc604572 hqo h16
  replace hlo : 628812 ≤ q := by omega
  by_cases hc628812 : q ≤ 650851
  · exact chkP_sound c_167_628812 q (by omega) hc628812 hqo h16
  replace hlo : 650852 ≤ q := by omega
  by_cases hc650852 : q ≤ 672099
  · exact chkP_sound c_167_650852 q (by omega) hc650852 hqo h16
  replace hlo : 672100 ≤ q := by omega
  by_cases hc672100 : q ≤ 694651
  · exact chkP_sound c_167_672100 q (by omega) hc672100 hqo h16
  replace hlo : 694652 ≤ q := by omega
  by_cases hc694652 : q ≤ 715571
  · exact chkP_sound c_167_694652 q (by omega) hc694652 hqo h16
  replace hlo : 715572 ≤ q := by omega
  by_cases hc715572 : q ≤ 736979
  · exact chkP_sound c_167_715572 q (by omega) hc715572 hqo h16
  replace hlo : 736980 ≤ q := by omega
  by_cases hc736980 : q ≤ 760411
  · exact chkP_sound c_167_736980 q (by omega) hc736980 hqo h16
  replace hlo : 760412 ≤ q := by omega
  by_cases hc760412 : q ≤ 781771
  · exact chkP_sound c_167_760412 q (by omega) hc760412 hqo h16
  replace hlo : 781772 ≤ q := by omega
  by_cases hc781772 : q ≤ 805019
  · exact chkP_sound c_167_781772 q (by omega) hc781772 hqo h16
  replace hlo : 805020 ≤ q := by omega
  by_cases hc805020 : q ≤ 825403
  · exact chkP_sound c_167_805020 q (by omega) hc805020 hqo h16
  replace hlo : 825404 ≤ q := by omega
  by_cases hc825404 : q ≤ 847139
  · exact chkP_sound c_167_825404 q (by omega) hc825404 hqo h16
  replace hlo : 847140 ≤ q := by omega
  by_cases hc847140 : q ≤ 869419
  · exact chkP_sound c_167_847140 q (by omega) hc847140 hqo h16
  replace hlo : 869420 ≤ q := by omega
  by_cases hc869420 : q ≤ 890531
  · exact chkP_sound c_167_869420 q (by omega) hc869420 hqo h16
  replace hlo : 890532 ≤ q := by omega
  by_cases hc890532 : q ≤ 911179
  · exact chkP_sound c_167_890532 q (by omega) hc890532 hqo h16
  replace hlo : 911180 ≤ q := by omega
  by_cases hc911180 : q ≤ 931123
  · exact chkP_sound c_167_911180 q (by omega) hc911180 hqo h16
  replace hlo : 931124 ≤ q := by omega
  by_cases hc931124 : q ≤ 951283
  · exact chkP_sound c_167_931124 q (by omega) hc931124 hqo h16
  replace hlo : 951284 ≤ q := by omega
  by_cases hc951284 : q ≤ 971563
  · exact chkP_sound c_167_951284 q (by omega) hc951284 hqo h16
  replace hlo : 971564 ≤ q := by omega
  by_cases hc971564 : q ≤ 993611
  · exact chkP_sound c_167_971564 q (by omega) hc971564 hqo h16
  replace hlo : 993612 ≤ q := by omega
  exact chkP_sound c_167_993612 q hlo hhi hqo h16

theorem okp_173 (q : ℕ) (hlo : 89787 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (173 * (173 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 173 (fct 173) (fct 1000) q = true := by
  by_cases hc89787 : q ≤ 839786
  · exact chkP_sound c_173_89787 q (by omega) hc89787 hqo h16
  replace hlo : 839787 ≤ q := by omega
  exact chkP_sound c_173_839787 q hlo hhi hqo h16

theorem okp_179 (q : ℕ) (hlo : 96123 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (179 * (179 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 179 (fct 179) (fct 1000) q = true := by
  by_cases hc96123 : q ≤ 136519
  · exact chkP_sound c_179_96123 q (by omega) hc96123 hqo h16
  replace hlo : 136520 ≤ q := by omega
  by_cases hc136520 : q ≤ 171479
  · exact chkP_sound c_179_136520 q (by omega) hc136520 hqo h16
  replace hlo : 171480 ≤ q := by omega
  by_cases hc171480 : q ≤ 204871
  · exact chkP_sound c_179_171480 q (by omega) hc171480 hqo h16
  replace hlo : 204872 ≤ q := by omega
  by_cases hc204872 : q ≤ 237151
  · exact chkP_sound c_179_204872 q (by omega) hc204872 hqo h16
  replace hlo : 237152 ≤ q := by omega
  by_cases hc237152 : q ≤ 267391
  · exact chkP_sound c_179_237152 q (by omega) hc237152 hqo h16
  replace hlo : 267392 ≤ q := by omega
  by_cases hc267392 : q ≤ 295839
  · exact chkP_sound c_179_267392 q (by omega) hc267392 hqo h16
  replace hlo : 295840 ≤ q := by omega
  by_cases hc295840 : q ≤ 322607
  · exact chkP_sound c_179_295840 q (by omega) hc295840 hqo h16
  replace hlo : 322608 ≤ q := by omega
  by_cases hc322608 : q ≤ 349199
  · exact chkP_sound c_179_322608 q (by omega) hc322608 hqo h16
  replace hlo : 349200 ≤ q := by omega
  by_cases hc349200 : q ≤ 375247
  · exact chkP_sound c_179_349200 q (by omega) hc349200 hqo h16
  replace hlo : 375248 ≤ q := by omega
  by_cases hc375248 : q ≤ 401597
  · exact chkP_sound c_179_375248 q (by omega) hc375248 hqo h16
  replace hlo : 401598 ≤ q := by omega
  by_cases hc401598 : q ≤ 428039
  · exact chkP_sound c_179_401598 q (by omega) hc401598 hqo h16
  replace hlo : 428040 ≤ q := by omega
  by_cases hc428040 : q ≤ 452807
  · exact chkP_sound c_179_428040 q (by omega) hc428040 hqo h16
  replace hlo : 452808 ≤ q := by omega
  by_cases hc452808 : q ≤ 476039
  · exact chkP_sound c_179_452808 q (by omega) hc452808 hqo h16
  replace hlo : 476040 ≤ q := by omega
  by_cases hc476040 : q ≤ 500111
  · exact chkP_sound c_179_476040 q (by omega) hc476040 hqo h16
  replace hlo : 500112 ≤ q := by omega
  by_cases hc500112 : q ≤ 523527
  · exact chkP_sound c_179_500112 q (by omega) hc500112 hqo h16
  replace hlo : 523528 ≤ q := by omega
  by_cases hc523528 : q ≤ 546719
  · exact chkP_sound c_179_523528 q (by omega) hc523528 hqo h16
  replace hlo : 546720 ≤ q := by omega
  by_cases hc546720 : q ≤ 572519
  · exact chkP_sound c_179_546720 q (by omega) hc546720 hqo h16
  replace hlo : 572520 ≤ q := by omega
  by_cases hc572520 : q ≤ 596399
  · exact chkP_sound c_179_572520 q (by omega) hc572520 hqo h16
  replace hlo : 596400 ≤ q := by omega
  by_cases hc596400 : q ≤ 619511
  · exact chkP_sound c_179_596400 q (by omega) hc596400 hqo h16
  replace hlo : 619512 ≤ q := by omega
  by_cases hc619512 : q ≤ 642231
  · exact chkP_sound c_179_619512 q (by omega) hc619512 hqo h16
  replace hlo : 642232 ≤ q := by omega
  by_cases hc642232 : q ≤ 663967
  · exact chkP_sound c_179_642232 q (by omega) hc642232 hqo h16
  replace hlo : 663968 ≤ q := by omega
  by_cases hc663968 : q ≤ 683087
  · exact chkP_sound c_179_663968 q (by omega) hc663968 hqo h16
  replace hlo : 683088 ≤ q := by omega
  by_cases hc683088 : q ≤ 706207
  · exact chkP_sound c_179_683088 q (by omega) hc683088 hqo h16
  replace hlo : 706208 ≤ q := by omega
  by_cases hc706208 : q ≤ 728527
  · exact chkP_sound c_179_706208 q (by omega) hc706208 hqo h16
  replace hlo : 728528 ≤ q := by omega
  by_cases hc728528 : q ≤ 749807
  · exact chkP_sound c_179_728528 q (by omega) hc728528 hqo h16
  replace hlo : 749808 ≤ q := by omega
  by_cases hc749808 : q ≤ 770207
  · exact chkP_sound c_179_749808 q (by omega) hc749808 hqo h16
  replace hlo : 770208 ≤ q := by omega
  by_cases hc770208 : q ≤ 790815
  · exact chkP_sound c_179_770208 q (by omega) hc770208 hqo h16
  replace hlo : 790816 ≤ q := by omega
  by_cases hc790816 : q ≤ 813015
  · exact chkP_sound c_179_790816 q (by omega) hc790816 hqo h16
  replace hlo : 813016 ≤ q := by omega
  by_cases hc813016 : q ≤ 835847
  · exact chkP_sound c_179_813016 q (by omega) hc813016 hqo h16
  replace hlo : 835848 ≤ q := by omega
  by_cases hc835848 : q ≤ 860087
  · exact chkP_sound c_179_835848 q (by omega) hc835848 hqo h16
  replace hlo : 860088 ≤ q := by omega
  by_cases hc860088 : q ≤ 881311
  · exact chkP_sound c_179_860088 q (by omega) hc860088 hqo h16
  replace hlo : 881312 ≤ q := by omega
  by_cases hc881312 : q ≤ 901503
  · exact chkP_sound c_179_881312 q (by omega) hc881312 hqo h16
  replace hlo : 901504 ≤ q := by omega
  by_cases hc901504 : q ≤ 921959
  · exact chkP_sound c_179_901504 q (by omega) hc901504 hqo h16
  replace hlo : 921960 ≤ q := by omega
  by_cases hc921960 : q ≤ 942583
  · exact chkP_sound c_179_921960 q (by omega) hc921960 hqo h16
  replace hlo : 942584 ≤ q := by omega
  by_cases hc942584 : q ≤ 964767
  · exact chkP_sound c_179_942584 q (by omega) hc942584 hqo h16
  replace hlo : 964768 ≤ q := by omega
  by_cases hc964768 : q ≤ 984359
  · exact chkP_sound c_179_964768 q (by omega) hc964768 hqo h16
  replace hlo : 984360 ≤ q := by omega
  exact chkP_sound c_179_984360 q hlo hhi hqo h16

theorem okp_181 (q : ℕ) (hlo : 98283 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (181 * (181 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 181 (fct 181) (fct 1000) q = true := by
  by_cases hc98283 : q ≤ 848282
  · exact chkP_sound c_181_98283 q (by omega) hc98283 hqo h16
  replace hlo : 848283 ≤ q := by omega
  exact chkP_sound c_181_848283 q hlo hhi hqo h16

theorem okp_191 (q : ℕ) (hlo : 109443 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (191 * (191 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 191 (fct 191) (fct 1000) q = true := by
  by_cases hc109443 : q ≤ 148331
  · exact chkP_sound c_191_109443 q (by omega) hc109443 hqo h16
  replace hlo : 148332 ≤ q := by omega
  by_cases hc148332 : q ≤ 185027
  · exact chkP_sound c_191_148332 q (by omega) hc148332 hqo h16
  replace hlo : 185028 ≤ q := by omega
  by_cases hc185028 : q ≤ 216915
  · exact chkP_sound c_191_185028 q (by omega) hc185028 hqo h16
  replace hlo : 216916 ≤ q := by omega
  by_cases hc216916 : q ≤ 248515
  · exact chkP_sound c_191_216916 q (by omega) hc216916 hqo h16
  replace hlo : 248516 ≤ q := by omega
  by_cases hc248516 : q ≤ 278347
  · exact chkP_sound c_191_248516 q (by omega) hc248516 hqo h16
  replace hlo : 278348 ≤ q := by omega
  by_cases hc278348 : q ≤ 307019
  · exact chkP_sound c_191_278348 q (by omega) hc278348 hqo h16
  replace hlo : 307020 ≤ q := by omega
  by_cases hc307020 : q ≤ 333299
  · exact chkP_sound c_191_307020 q (by omega) hc307020 hqo h16
  replace hlo : 333300 ≤ q := by omega
  by_cases hc333300 : q ≤ 358571
  · exact chkP_sound c_191_333300 q (by omega) hc333300 hqo h16
  replace hlo : 358572 ≤ q := by omega
  by_cases hc358572 : q ≤ 385939
  · exact chkP_sound c_191_358572 q (by omega) hc358572 hqo h16
  replace hlo : 385940 ≤ q := by omega
  by_cases hc385940 : q ≤ 412467
  · exact chkP_sound c_191_385940 q (by omega) hc385940 hqo h16
  replace hlo : 412468 ≤ q := by omega
  by_cases hc412468 : q ≤ 437587
  · exact chkP_sound c_191_412468 q (by omega) hc412468 hqo h16
  replace hlo : 437588 ≤ q := by omega
  by_cases hc437588 : q ≤ 463627
  · exact chkP_sound c_191_437588 q (by omega) hc437588 hqo h16
  replace hlo : 463628 ≤ q := by omega
  by_cases hc463628 : q ≤ 486379
  · exact chkP_sound c_191_463628 q (by omega) hc463628 hqo h16
  replace hlo : 486380 ≤ q := by omega
  by_cases hc486380 : q ≤ 508931
  · exact chkP_sound c_191_486380 q (by omega) hc486380 hqo h16
  replace hlo : 508932 ≤ q := by omega
  by_cases hc508932 : q ≤ 535499
  · exact chkP_sound c_191_508932 q (by omega) hc508932 hqo h16
  replace hlo : 535500 ≤ q := by omega
  by_cases hc535500 : q ≤ 560827
  · exact chkP_sound c_191_535500 q (by omega) hc535500 hqo h16
  replace hlo : 560828 ≤ q := by omega
  by_cases hc560828 : q ≤ 585915
  · exact chkP_sound c_191_560828 q (by omega) hc560828 hqo h16
  replace hlo : 585916 ≤ q := by omega
  by_cases hc585916 : q ≤ 608235
  · exact chkP_sound c_191_585916 q (by omega) hc585916 hqo h16
  replace hlo : 608236 ≤ q := by omega
  by_cases hc608236 : q ≤ 630507
  · exact chkP_sound c_191_608236 q (by omega) hc608236 hqo h16
  replace hlo : 630508 ≤ q := by omega
  by_cases hc630508 : q ≤ 654739
  · exact chkP_sound c_191_630508 q (by omega) hc630508 hqo h16
  replace hlo : 654740 ≤ q := by omega
  by_cases hc654740 : q ≤ 676363
  · exact chkP_sound c_191_654740 q (by omega) hc654740 hqo h16
  replace hlo : 676364 ≤ q := by omega
  by_cases hc676364 : q ≤ 700027
  · exact chkP_sound c_191_676364 q (by omega) hc676364 hqo h16
  replace hlo : 700028 ≤ q := by omega
  by_cases hc700028 : q ≤ 722027
  · exact chkP_sound c_191_700028 q (by omega) hc700028 hqo h16
  replace hlo : 722028 ≤ q := by omega
  by_cases hc722028 : q ≤ 745011
  · exact chkP_sound c_191_722028 q (by omega) hc722028 hqo h16
  replace hlo : 745012 ≤ q := by omega
  by_cases hc745012 : q ≤ 766939
  · exact chkP_sound c_191_745012 q (by omega) hc745012 hqo h16
  replace hlo : 766940 ≤ q := by omega
  by_cases hc766940 : q ≤ 788363
  · exact chkP_sound c_191_766940 q (by omega) hc766940 hqo h16
  replace hlo : 788364 ≤ q := by omega
  by_cases hc788364 : q ≤ 809147
  · exact chkP_sound c_191_788364 q (by omega) hc788364 hqo h16
  replace hlo : 809148 ≤ q := by omega
  by_cases hc809148 : q ≤ 829115
  · exact chkP_sound c_191_809148 q (by omega) hc809148 hqo h16
  replace hlo : 829116 ≤ q := by omega
  by_cases hc829116 : q ≤ 853115
  · exact chkP_sound c_191_829116 q (by omega) hc829116 hqo h16
  replace hlo : 853116 ≤ q := by omega
  by_cases hc853116 : q ≤ 872227
  · exact chkP_sound c_191_853116 q (by omega) hc853116 hqo h16
  replace hlo : 872228 ≤ q := by omega
  by_cases hc872228 : q ≤ 892387
  · exact chkP_sound c_191_872228 q (by omega) hc872228 hqo h16
  replace hlo : 892388 ≤ q := by omega
  by_cases hc892388 : q ≤ 913811
  · exact chkP_sound c_191_892388 q (by omega) hc892388 hqo h16
  replace hlo : 913812 ≤ q := by omega
  by_cases hc913812 : q ≤ 934939
  · exact chkP_sound c_191_913812 q (by omega) hc913812 hqo h16
  replace hlo : 934940 ≤ q := by omega
  by_cases hc934940 : q ≤ 954451
  · exact chkP_sound c_191_934940 q (by omega) hc934940 hqo h16
  replace hlo : 954452 ≤ q := by omega
  by_cases hc954452 : q ≤ 976211
  · exact chkP_sound c_191_954452 q (by omega) hc954452 hqo h16
  replace hlo : 976212 ≤ q := by omega
  by_cases hc976212 : q ≤ 998819
  · exact chkP_sound c_191_976212 q (by omega) hc976212 hqo h16
  replace hlo : 998820 ≤ q := by omega
  exact chkP_sound c_191_998820 q hlo hhi hqo h16

theorem okp_193 (q : ℕ) (hlo : 111747 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (193 * (193 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 193 (fct 193) (fct 1000) q = true := by
  by_cases hc111747 : q ≤ 861746
  · exact chkP_sound c_193_111747 q (by omega) hc111747 hqo h16
  replace hlo : 861747 ≤ q := by omega
  exact chkP_sound c_193_861747 q hlo hhi hqo h16

theorem okp_197 (q : ℕ) (hlo : 116427 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (197 * (197 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 197 (fct 197) (fct 1000) q = true := by
  by_cases hc116427 : q ≤ 866426
  · exact chkP_sound c_197_116427 q (by omega) hc116427 hqo h16
  replace hlo : 866427 ≤ q := by omega
  exact chkP_sound c_197_866427 q hlo hhi hqo h16

theorem okp_199 (q : ℕ) (hlo : 118803 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (199 * (199 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 199 (fct 199) (fct 1000) q = true := by
  by_cases hc118803 : q ≤ 158371
  · exact chkP_sound c_199_118803 q (by omega) hc118803 hqo h16
  replace hlo : 158372 ≤ q := by omega
  by_cases hc158372 : q ≤ 194179
  · exact chkP_sound c_199_158372 q (by omega) hc158372 hqo h16
  replace hlo : 194180 ≤ q := by omega
  by_cases hc194180 : q ≤ 227419
  · exact chkP_sound c_199_194180 q (by omega) hc194180 hqo h16
  replace hlo : 227420 ≤ q := by omega
  by_cases hc227420 : q ≤ 259139
  · exact chkP_sound c_199_227420 q (by omega) hc227420 hqo h16
  replace hlo : 259140 ≤ q := by omega
  by_cases hc259140 : q ≤ 290291
  · exact chkP_sound c_199_259140 q (by omega) hc259140 hqo h16
  replace hlo : 290292 ≤ q := by omega
  by_cases hc290292 : q ≤ 317339
  · exact chkP_sound c_199_290292 q (by omega) hc290292 hqo h16
  replace hlo : 317340 ≤ q := by omega
  by_cases hc317340 : q ≤ 343531
  · exact chkP_sound c_199_317340 q (by omega) hc317340 hqo h16
  replace hlo : 343532 ≤ q := by omega
  by_cases hc343532 : q ≤ 369851
  · exact chkP_sound c_199_343532 q (by omega) hc343532 hqo h16
  replace hlo : 369852 ≤ q := by omega
  by_cases hc369852 : q ≤ 397547
  · exact chkP_sound c_199_369852 q (by omega) hc369852 hqo h16
  replace hlo : 397548 ≤ q := by omega
  by_cases hc397548 : q ≤ 424155
  · exact chkP_sound c_199_397548 q (by omega) hc397548 hqo h16
  replace hlo : 424156 ≤ q := by omega
  by_cases hc424156 : q ≤ 447827
  · exact chkP_sound c_199_424156 q (by omega) hc424156 hqo h16
  replace hlo : 447828 ≤ q := by omega
  by_cases hc447828 : q ≤ 474499
  · exact chkP_sound c_199_447828 q (by omega) hc447828 hqo h16
  replace hlo : 474500 ≤ q := by omega
  by_cases hc474500 : q ≤ 496459
  · exact chkP_sound c_199_474500 q (by omega) hc474500 hqo h16
  replace hlo : 496460 ≤ q := by omega
  by_cases hc496460 : q ≤ 521323
  · exact chkP_sound c_199_496460 q (by omega) hc496460 hqo h16
  replace hlo : 521324 ≤ q := by omega
  by_cases hc521324 : q ≤ 545947
  · exact chkP_sound c_199_521324 q (by omega) hc521324 hqo h16
  replace hlo : 545948 ≤ q := by omega
  by_cases hc545948 : q ≤ 570139
  · exact chkP_sound c_199_545948 q (by omega) hc545948 hqo h16
  replace hlo : 570140 ≤ q := by omega
  by_cases hc570140 : q ≤ 595139
  · exact chkP_sound c_199_570140 q (by omega) hc570140 hqo h16
  replace hlo : 595140 ≤ q := by omega
  by_cases hc595140 : q ≤ 618571
  · exact chkP_sound c_199_595140 q (by omega) hc595140 hqo h16
  replace hlo : 618572 ≤ q := by omega
  by_cases hc618572 : q ≤ 643187
  · exact chkP_sound c_199_618572 q (by omega) hc618572 hqo h16
  replace hlo : 643188 ≤ q := by omega
  by_cases hc643188 : q ≤ 664811
  · exact chkP_sound c_199_643188 q (by omega) hc643188 hqo h16
  replace hlo : 664812 ≤ q := by omega
  by_cases hc664812 : q ≤ 687019
  · exact chkP_sound c_199_664812 q (by omega) hc664812 hqo h16
  replace hlo : 687020 ≤ q := by omega
  by_cases hc687020 : q ≤ 710051
  · exact chkP_sound c_199_687020 q (by omega) hc687020 hqo h16
  replace hlo : 710052 ≤ q := by omega
  by_cases hc710052 : q ≤ 732211
  · exact chkP_sound c_199_710052 q (by omega) hc710052 hqo h16
  replace hlo : 732212 ≤ q := by omega
  by_cases hc732212 : q ≤ 756331
  · exact chkP_sound c_199_732212 q (by omega) hc732212 hqo h16
  replace hlo : 756332 ≤ q := by omega
  by_cases hc756332 : q ≤ 777571
  · exact chkP_sound c_199_756332 q (by omega) hc756332 hqo h16
  replace hlo : 777572 ≤ q := by omega
  by_cases hc777572 : q ≤ 799147
  · exact chkP_sound c_199_777572 q (by omega) hc777572 hqo h16
  replace hlo : 799148 ≤ q := by omega
  by_cases hc799148 : q ≤ 820067
  · exact chkP_sound c_199_799148 q (by omega) hc799148 hqo h16
  replace hlo : 820068 ≤ q := by omega
  by_cases hc820068 : q ≤ 840331
  · exact chkP_sound c_199_820068 q (by omega) hc820068 hqo h16
  replace hlo : 840332 ≤ q := by omega
  by_cases hc840332 : q ≤ 861691
  · exact chkP_sound c_199_840332 q (by omega) hc840332 hqo h16
  replace hlo : 861692 ≤ q := by omega
  by_cases hc861692 : q ≤ 884251
  · exact chkP_sound c_199_861692 q (by omega) hc861692 hqo h16
  replace hlo : 884252 ≤ q := by omega
  by_cases hc884252 : q ≤ 905347
  · exact chkP_sound c_199_884252 q (by omega) hc884252 hqo h16
  replace hlo : 905348 ≤ q := by omega
  by_cases hc905348 : q ≤ 924443
  · exact chkP_sound c_199_905348 q (by omega) hc905348 hqo h16
  replace hlo : 924444 ≤ q := by omega
  by_cases hc924444 : q ≤ 945731
  · exact chkP_sound c_199_924444 q (by omega) hc924444 hqo h16
  replace hlo : 945732 ≤ q := by omega
  by_cases hc945732 : q ≤ 965411
  · exact chkP_sound c_199_945732 q (by omega) hc945732 hqo h16
  replace hlo : 965412 ≤ q := by omega
  by_cases hc965412 : q ≤ 988067
  · exact chkP_sound c_199_965412 q (by omega) hc965412 hqo h16
  replace hlo : 988068 ≤ q := by omega
  exact chkP_sound c_199_988068 q hlo hhi hqo h16

theorem okp_211 (q : ℕ) (hlo : 133563 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (211 * (211 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 211 (fct 211) (fct 1000) q = true := by
  by_cases hc133563 : q ≤ 170551
  · exact chkP_sound c_211_133563 q (by omega) hc133563 hqo h16
  replace hlo : 170552 ≤ q := by omega
  by_cases hc170552 : q ≤ 206447
  · exact chkP_sound c_211_170552 q (by omega) hc170552 hqo h16
  replace hlo : 206448 ≤ q := by omega
  by_cases hc206448 : q ≤ 240807
  · exact chkP_sound c_211_206448 q (by omega) hc206448 hqo h16
  replace hlo : 240808 ≤ q := by omega
  by_cases hc240808 : q ≤ 271015
  · exact chkP_sound c_211_240808 q (by omega) hc240808 hqo h16
  replace hlo : 271016 ≤ q := by omega
  by_cases hc271016 : q ≤ 299407
  · exact chkP_sound c_211_271016 q (by omega) hc271016 hqo h16
  replace hlo : 299408 ≤ q := by omega
  by_cases hc299408 : q ≤ 330271
  · exact chkP_sound c_211_299408 q (by omega) hc299408 hqo h16
  replace hlo : 330272 ≤ q := by omega
  by_cases hc330272 : q ≤ 357671
  · exact chkP_sound c_211_330272 q (by omega) hc330272 hqo h16
  replace hlo : 357672 ≤ q := by omega
  by_cases hc357672 : q ≤ 387007
  · exact chkP_sound c_211_357672 q (by omega) hc357672 hqo h16
  replace hlo : 387008 ≤ q := by omega
  by_cases hc387008 : q ≤ 414991
  · exact chkP_sound c_211_387008 q (by omega) hc387008 hqo h16
  replace hlo : 414992 ≤ q := by omega
  by_cases hc414992 : q ≤ 440311
  · exact chkP_sound c_211_414992 q (by omega) hc414992 hqo h16
  replace hlo : 440312 ≤ q := by omega
  by_cases hc440312 : q ≤ 466095
  · exact chkP_sound c_211_440312 q (by omega) hc440312 hqo h16
  replace hlo : 466096 ≤ q := by omega
  by_cases hc466096 : q ≤ 490951
  · exact chkP_sound c_211_466096 q (by omega) hc466096 hqo h16
  replace hlo : 490952 ≤ q := by omega
  by_cases hc490952 : q ≤ 515927
  · exact chkP_sound c_211_490952 q (by omega) hc490952 hqo h16
  replace hlo : 515928 ≤ q := by omega
  by_cases hc515928 : q ≤ 539783
  · exact chkP_sound c_211_515928 q (by omega) hc515928 hqo h16
  replace hlo : 539784 ≤ q := by omega
  by_cases hc539784 : q ≤ 566567
  · exact chkP_sound c_211_539784 q (by omega) hc539784 hqo h16
  replace hlo : 566568 ≤ q := by omega
  by_cases hc566568 : q ≤ 591287
  · exact chkP_sound c_211_566568 q (by omega) hc566568 hqo h16
  replace hlo : 591288 ≤ q := by omega
  by_cases hc591288 : q ≤ 615431
  · exact chkP_sound c_211_591288 q (by omega) hc591288 hqo h16
  replace hlo : 615432 ≤ q := by omega
  by_cases hc615432 : q ≤ 640095
  · exact chkP_sound c_211_615432 q (by omega) hc615432 hqo h16
  replace hlo : 640096 ≤ q := by omega
  by_cases hc640096 : q ≤ 663191
  · exact chkP_sound c_211_640096 q (by omega) hc640096 hqo h16
  replace hlo : 663192 ≤ q := by omega
  by_cases hc663192 : q ≤ 687175
  · exact chkP_sound c_211_663192 q (by omega) hc663192 hqo h16
  replace hlo : 687176 ≤ q := by omega
  by_cases hc687176 : q ≤ 708751
  · exact chkP_sound c_211_687176 q (by omega) hc687176 hqo h16
  replace hlo : 708752 ≤ q := by omega
  by_cases hc708752 : q ≤ 731951
  · exact chkP_sound c_211_708752 q (by omega) hc708752 hqo h16
  replace hlo : 731952 ≤ q := by omega
  by_cases hc731952 : q ≤ 753751
  · exact chkP_sound c_211_731952 q (by omega) hc731952 hqo h16
  replace hlo : 753752 ≤ q := by omega
  by_cases hc753752 : q ≤ 773599
  · exact chkP_sound c_211_753752 q (by omega) hc753752 hqo h16
  replace hlo : 773600 ≤ q := by omega
  by_cases hc773600 : q ≤ 795127
  · exact chkP_sound c_211_773600 q (by omega) hc773600 hqo h16
  replace hlo : 795128 ≤ q := by omega
  by_cases hc795128 : q ≤ 817919
  · exact chkP_sound c_211_795128 q (by omega) hc795128 hqo h16
  replace hlo : 817920 ≤ q := by omega
  by_cases hc817920 : q ≤ 839471
  · exact chkP_sound c_211_817920 q (by omega) hc817920 hqo h16
  replace hlo : 839472 ≤ q := by omega
  by_cases hc839472 : q ≤ 862607
  · exact chkP_sound c_211_839472 q (by omega) hc839472 hqo h16
  replace hlo : 862608 ≤ q := by omega
  by_cases hc862608 : q ≤ 884087
  · exact chkP_sound c_211_862608 q (by omega) hc862608 hqo h16
  replace hlo : 884088 ≤ q := by omega
  by_cases hc884088 : q ≤ 904399
  · exact chkP_sound c_211_884088 q (by omega) hc884088 hqo h16
  replace hlo : 904400 ≤ q := by omega
  by_cases hc904400 : q ≤ 923591
  · exact chkP_sound c_211_904400 q (by omega) hc904400 hqo h16
  replace hlo : 923592 ≤ q := by omega
  by_cases hc923592 : q ≤ 945671
  · exact chkP_sound c_211_923592 q (by omega) hc923592 hqo h16
  replace hlo : 945672 ≤ q := by omega
  by_cases hc945672 : q ≤ 966431
  · exact chkP_sound c_211_945672 q (by omega) hc945672 hqo h16
  replace hlo : 966432 ≤ q := by omega
  by_cases hc966432 : q ≤ 986767
  · exact chkP_sound c_211_966432 q (by omega) hc966432 hqo h16
  replace hlo : 986768 ≤ q := by omega
  exact chkP_sound c_211_986768 q hlo hhi hqo h16

theorem okp_223 (q : ℕ) (hlo : 149187 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (223 * (223 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 223 (fct 223) (fct 1000) q = true := by
  by_cases hc149187 : q ≤ 187995
  · exact chkP_sound c_223_149187 q (by omega) hc149187 hqo h16
  replace hlo : 187996 ≤ q := by omega
  by_cases hc187996 : q ≤ 221275
  · exact chkP_sound c_223_187996 q (by omega) hc187996 hqo h16
  replace hlo : 221276 ≤ q := by omega
  by_cases hc221276 : q ≤ 254899
  · exact chkP_sound c_223_221276 q (by omega) hc221276 hqo h16
  replace hlo : 254900 ≤ q := by omega
  by_cases hc254900 : q ≤ 285211
  · exact chkP_sound c_223_254900 q (by omega) hc254900 hqo h16
  replace hlo : 285212 ≤ q := by omega
  by_cases hc285212 : q ≤ 316195
  · exact chkP_sound c_223_285212 q (by omega) hc285212 hqo h16
  replace hlo : 316196 ≤ q := by omega
  by_cases hc316196 : q ≤ 345731
  · exact chkP_sound c_223_316196 q (by omega) hc316196 hqo h16
  replace hlo : 345732 ≤ q := by omega
  by_cases hc345732 : q ≤ 372523
  · exact chkP_sound c_223_345732 q (by omega) hc345732 hqo h16
  replace hlo : 372524 ≤ q := by omega
  by_cases hc372524 : q ≤ 397811
  · exact chkP_sound c_223_372524 q (by omega) hc372524 hqo h16
  replace hlo : 397812 ≤ q := by omega
  by_cases hc397812 : q ≤ 425443
  · exact chkP_sound c_223_397812 q (by omega) hc397812 hqo h16
  replace hlo : 425444 ≤ q := by omega
  by_cases hc425444 : q ≤ 452171
  · exact chkP_sound c_223_425444 q (by omega) hc425444 hqo h16
  replace hlo : 452172 ≤ q := by omega
  by_cases hc452172 : q ≤ 478523
  · exact chkP_sound c_223_452172 q (by omega) hc452172 hqo h16
  replace hlo : 478524 ≤ q := by omega
  by_cases hc478524 : q ≤ 502883
  · exact chkP_sound c_223_478524 q (by omega) hc478524 hqo h16
  replace hlo : 502884 ≤ q := by omega
  by_cases hc502884 : q ≤ 530033
  · exact chkP_sound c_223_502884 q (by omega) hc502884 hqo h16
  replace hlo : 530034 ≤ q := by omega
  by_cases hc530034 : q ≤ 552611
  · exact chkP_sound c_223_530034 q (by omega) hc530034 hqo h16
  replace hlo : 552612 ≤ q := by omega
  by_cases hc552612 : q ≤ 577739
  · exact chkP_sound c_223_552612 q (by omega) hc552612 hqo h16
  replace hlo : 577740 ≤ q := by omega
  by_cases hc577740 : q ≤ 599243
  · exact chkP_sound c_223_577740 q (by omega) hc577740 hqo h16
  replace hlo : 599244 ≤ q := by omega
  by_cases hc599244 : q ≤ 624163
  · exact chkP_sound c_223_599244 q (by omega) hc599244 hqo h16
  replace hlo : 624164 ≤ q := by omega
  by_cases hc624164 : q ≤ 645683
  · exact chkP_sound c_223_624164 q (by omega) hc624164 hqo h16
  replace hlo : 645684 ≤ q := by omega
  by_cases hc645684 : q ≤ 667243
  · exact chkP_sound c_223_645684 q (by omega) hc645684 hqo h16
  replace hlo : 667244 ≤ q := by omega
  by_cases hc667244 : q ≤ 689859
  · exact chkP_sound c_223_667244 q (by omega) hc667244 hqo h16
  replace hlo : 689860 ≤ q := by omega
  by_cases hc689860 : q ≤ 712499
  · exact chkP_sound c_223_689860 q (by omega) hc689860 hqo h16
  replace hlo : 712500 ≤ q := by omega
  by_cases hc712500 : q ≤ 734131
  · exact chkP_sound c_223_712500 q (by omega) hc712500 hqo h16
  replace hlo : 734132 ≤ q := by omega
  by_cases hc734132 : q ≤ 756683
  · exact chkP_sound c_223_734132 q (by omega) hc734132 hqo h16
  replace hlo : 756684 ≤ q := by omega
  by_cases hc756684 : q ≤ 779771
  · exact chkP_sound c_223_756684 q (by omega) hc756684 hqo h16
  replace hlo : 779772 ≤ q := by omega
  by_cases hc779772 : q ≤ 800483
  · exact chkP_sound c_223_779772 q (by omega) hc779772 hqo h16
  replace hlo : 800484 ≤ q := by omega
  by_cases hc800484 : q ≤ 820891
  · exact chkP_sound c_223_800484 q (by omega) hc800484 hqo h16
  replace hlo : 820892 ≤ q := by omega
  by_cases hc820892 : q ≤ 840859
  · exact chkP_sound c_223_820892 q (by omega) hc820892 hqo h16
  replace hlo : 840860 ≤ q := by omega
  by_cases hc840860 : q ≤ 863251
  · exact chkP_sound c_223_840860 q (by omega) hc840860 hqo h16
  replace hlo : 863252 ≤ q := by omega
  by_cases hc863252 : q ≤ 885243
  · exact chkP_sound c_223_863252 q (by omega) hc863252 hqo h16
  replace hlo : 885244 ≤ q := by omega
  by_cases hc885244 : q ≤ 906931
  · exact chkP_sound c_223_885244 q (by omega) hc885244 hqo h16
  replace hlo : 906932 ≤ q := by omega
  by_cases hc906932 : q ≤ 927403
  · exact chkP_sound c_223_906932 q (by omega) hc906932 hqo h16
  replace hlo : 927404 ≤ q := by omega
  by_cases hc927404 : q ≤ 947603
  · exact chkP_sound c_223_927404 q (by omega) hc927404 hqo h16
  replace hlo : 947604 ≤ q := by omega
  by_cases hc947604 : q ≤ 967699
  · exact chkP_sound c_223_947604 q (by omega) hc947604 hqo h16
  replace hlo : 967700 ≤ q := by omega
  by_cases hc967700 : q ≤ 988963
  · exact chkP_sound c_223_967700 q (by omega) hc967700 hqo h16
  replace hlo : 988964 ≤ q := by omega
  exact chkP_sound c_223_988964 q hlo hhi hqo h16

theorem okp_227 (q : ℕ) (hlo : 154587 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (227 * (227 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 227 (fct 227) (fct 1000) q = true := by
  by_cases hc154587 : q ≤ 192695
  · exact chkP_sound c_227_154587 q (by omega) hc154587 hqo h16
  replace hlo : 192696 ≤ q := by omega
  by_cases hc192696 : q ≤ 228359
  · exact chkP_sound c_227_192696 q (by omega) hc192696 hqo h16
  replace hlo : 228360 ≤ q := by omega
  by_cases hc228360 : q ≤ 260071
  · exact chkP_sound c_227_228360 q (by omega) hc228360 hqo h16
  replace hlo : 260072 ≤ q := by omega
  by_cases hc260072 : q ≤ 292711
  · exact chkP_sound c_227_260072 q (by omega) hc260072 hqo h16
  replace hlo : 292712 ≤ q := by omega
  by_cases hc292712 : q ≤ 320239
  · exact chkP_sound c_227_292712 q (by omega) hc292712 hqo h16
  replace hlo : 320240 ≤ q := by omega
  by_cases hc320240 : q ≤ 349079
  · exact chkP_sound c_227_320240 q (by omega) hc320240 hqo h16
  replace hlo : 349080 ≤ q := by omega
  by_cases hc349080 : q ≤ 377183
  · exact chkP_sound c_227_349080 q (by omega) hc349080 hqo h16
  replace hlo : 377184 ≤ q := by omega
  by_cases hc377184 : q ≤ 404983
  · exact chkP_sound c_227_377184 q (by omega) hc377184 hqo h16
  replace hlo : 404984 ≤ q := by omega
  by_cases hc404984 : q ≤ 431759
  · exact chkP_sound c_227_404984 q (by omega) hc404984 hqo h16
  replace hlo : 431760 ≤ q := by omega
  by_cases hc431760 : q ≤ 458639
  · exact chkP_sound c_227_431760 q (by omega) hc431760 hqo h16
  replace hlo : 458640 ≤ q := by omega
  by_cases hc458640 : q ≤ 485727
  · exact chkP_sound c_227_458640 q (by omega) hc458640 hqo h16
  replace hlo : 485728 ≤ q := by omega
  by_cases hc485728 : q ≤ 510831
  · exact chkP_sound c_227_485728 q (by omega) hc485728 hqo h16
  replace hlo : 510832 ≤ q := by omega
  by_cases hc510832 : q ≤ 537079
  · exact chkP_sound c_227_510832 q (by omega) hc510832 hqo h16
  replace hlo : 537080 ≤ q := by omega
  by_cases hc537080 : q ≤ 560503
  · exact chkP_sound c_227_537080 q (by omega) hc537080 hqo h16
  replace hlo : 560504 ≤ q := by omega
  by_cases hc560504 : q ≤ 584791
  · exact chkP_sound c_227_560504 q (by omega) hc560504 hqo h16
  replace hlo : 584792 ≤ q := by omega
  by_cases hc584792 : q ≤ 608759
  · exact chkP_sound c_227_584792 q (by omega) hc584792 hqo h16
  replace hlo : 608760 ≤ q := by omega
  by_cases hc608760 : q ≤ 631559
  · exact chkP_sound c_227_608760 q (by omega) hc608760 hqo h16
  replace hlo : 631560 ≤ q := by omega
  by_cases hc631560 : q ≤ 654527
  · exact chkP_sound c_227_631560 q (by omega) hc631560 hqo h16
  replace hlo : 654528 ≤ q := by omega
  by_cases hc654528 : q ≤ 676031
  · exact chkP_sound c_227_654528 q (by omega) hc654528 hqo h16
  replace hlo : 676032 ≤ q := by omega
  by_cases hc676032 : q ≤ 699823
  · exact chkP_sound c_227_676032 q (by omega) hc676032 hqo h16
  replace hlo : 699824 ≤ q := by omega
  by_cases hc699824 : q ≤ 721079
  · exact chkP_sound c_227_699824 q (by omega) hc699824 hqo h16
  replace hlo : 721080 ≤ q := by omega
  by_cases hc721080 : q ≤ 742783
  · exact chkP_sound c_227_721080 q (by omega) hc721080 hqo h16
  replace hlo : 742784 ≤ q := by omega
  by_cases hc742784 : q ≤ 763111
  · exact chkP_sound c_227_742784 q (by omega) hc742784 hqo h16
  replace hlo : 763112 ≤ q := by omega
  by_cases hc763112 : q ≤ 784039
  · exact chkP_sound c_227_763112 q (by omega) hc763112 hqo h16
  replace hlo : 784040 ≤ q := by omega
  by_cases hc784040 : q ≤ 807151
  · exact chkP_sound c_227_784040 q (by omega) hc784040 hqo h16
  replace hlo : 807152 ≤ q := by omega
  by_cases hc807152 : q ≤ 831431
  · exact chkP_sound c_227_807152 q (by omega) hc807152 hqo h16
  replace hlo : 831432 ≤ q := by omega
  by_cases hc831432 : q ≤ 852031
  · exact chkP_sound c_227_831432 q (by omega) hc831432 hqo h16
  replace hlo : 852032 ≤ q := by omega
  by_cases hc852032 : q ≤ 872471
  · exact chkP_sound c_227_852032 q (by omega) hc852032 hqo h16
  replace hlo : 872472 ≤ q := by omega
  by_cases hc872472 : q ≤ 892439
  · exact chkP_sound c_227_872472 q (by omega) hc872472 hqo h16
  replace hlo : 892440 ≤ q := by omega
  by_cases hc892440 : q ≤ 912959
  · exact chkP_sound c_227_892440 q (by omega) hc892440 hqo h16
  replace hlo : 912960 ≤ q := by omega
  by_cases hc912960 : q ≤ 931943
  · exact chkP_sound c_227_912960 q (by omega) hc912960 hqo h16
  replace hlo : 931944 ≤ q := by omega
  by_cases hc931944 : q ≤ 951479
  · exact chkP_sound c_227_931944 q (by omega) hc931944 hqo h16
  replace hlo : 951480 ≤ q := by omega
  by_cases hc951480 : q ≤ 969911
  · exact chkP_sound c_227_951480 q (by omega) hc951480 hqo h16
  replace hlo : 969912 ≤ q := by omega
  by_cases hc969912 : q ≤ 989951
  · exact chkP_sound c_227_969912 q (by omega) hc969912 hqo h16
  replace hlo : 989952 ≤ q := by omega
  exact chkP_sound c_227_989952 q hlo hhi hqo h16

theorem okp_229 (q : ℕ) (hlo : 157323 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (229 * (229 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 229 (fct 229) (fct 1000) q = true := by
  by_cases hc157323 : q ≤ 907322
  · exact chkP_sound c_229_157323 q (by omega) hc157323 hqo h16
  replace hlo : 907323 ≤ q := by omega
  exact chkP_sound c_229_907323 q hlo hhi hqo h16

theorem okp_233 (q : ℕ) (hlo : 162867 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (233 * (233 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 233 (fct 233) (fct 1000) q = true := by
  by_cases hc162867 : q ≤ 912866
  · exact chkP_sound c_233_162867 q (by omega) hc162867 hqo h16
  replace hlo : 912867 ≤ q := by omega
  exact chkP_sound c_233_912867 q hlo hhi hqo h16

theorem okp_239 (q : ℕ) (hlo : 171363 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (239 * (239 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 239 (fct 239) (fct 1000) q = true := by
  by_cases hc171363 : q ≤ 209459
  · exact chkP_sound c_239_171363 q (by omega) hc171363 hqo h16
  replace hlo : 209460 ≤ q := by omega
  by_cases hc209460 : q ≤ 243109
  · exact chkP_sound c_239_209460 q (by omega) hc209460 hqo h16
  replace hlo : 243110 ≤ q := by omega
  by_cases hc243110 : q ≤ 277363
  · exact chkP_sound c_239_243110 q (by omega) hc243110 hqo h16
  replace hlo : 277364 ≤ q := by omega
  by_cases hc277364 : q ≤ 309675
  · exact chkP_sound c_239_277364 q (by omega) hc277364 hqo h16
  replace hlo : 309676 ≤ q := by omega
  by_cases hc309676 : q ≤ 336827
  · exact chkP_sound c_239_309676 q (by omega) hc309676 hqo h16
  replace hlo : 336828 ≤ q := by omega
  by_cases hc336828 : q ≤ 363619
  · exact chkP_sound c_239_336828 q (by omega) hc336828 hqo h16
  replace hlo : 363620 ≤ q := by omega
  by_cases hc363620 : q ≤ 390619
  · exact chkP_sound c_239_363620 q (by omega) hc363620 hqo h16
  replace hlo : 390620 ≤ q := by omega
  by_cases hc390620 : q ≤ 418939
  · exact chkP_sound c_239_390620 q (by omega) hc390620 hqo h16
  replace hlo : 418940 ≤ q := by omega
  by_cases hc418940 : q ≤ 447259
  · exact chkP_sound c_239_418940 q (by omega) hc418940 hqo h16
  replace hlo : 447260 ≤ q := by omega
  by_cases hc447260 : q ≤ 472067
  · exact chkP_sound c_239_447260 q (by omega) hc447260 hqo h16
  replace hlo : 472068 ≤ q := by omega
  by_cases hc472068 : q ≤ 499691
  · exact chkP_sound c_239_472068 q (by omega) hc472068 hqo h16
  replace hlo : 499692 ≤ q := by omega
  by_cases hc499692 : q ≤ 526387
  · exact chkP_sound c_239_499692 q (by omega) hc499692 hqo h16
  replace hlo : 526388 ≤ q := by omega
  by_cases hc526388 : q ≤ 550859
  · exact chkP_sound c_239_526388 q (by omega) hc526388 hqo h16
  replace hlo : 550860 ≤ q := by omega
  by_cases hc550860 : q ≤ 574507
  · exact chkP_sound c_239_550860 q (by omega) hc550860 hqo h16
  replace hlo : 574508 ≤ q := by omega
  by_cases hc574508 : q ≤ 598867
  · exact chkP_sound c_239_574508 q (by omega) hc574508 hqo h16
  replace hlo : 598868 ≤ q := by omega
  by_cases hc598868 : q ≤ 624251
  · exact chkP_sound c_239_598868 q (by omega) hc598868 hqo h16
  replace hlo : 624252 ≤ q := by omega
  by_cases hc624252 : q ≤ 647011
  · exact chkP_sound c_239_624252 q (by omega) hc624252 hqo h16
  replace hlo : 647012 ≤ q := by omega
  by_cases hc647012 : q ≤ 669587
  · exact chkP_sound c_239_647012 q (by omega) hc647012 hqo h16
  replace hlo : 669588 ≤ q := by omega
  by_cases hc669588 : q ≤ 690259
  · exact chkP_sound c_239_669588 q (by omega) hc669588 hqo h16
  replace hlo : 690260 ≤ q := by omega
  by_cases hc690260 : q ≤ 711899
  · exact chkP_sound c_239_690260 q (by omega) hc690260 hqo h16
  replace hlo : 711900 ≤ q := by omega
  by_cases hc711900 : q ≤ 732827
  · exact chkP_sound c_239_711900 q (by omega) hc711900 hqo h16
  replace hlo : 732828 ≤ q := by omega
  by_cases hc732828 : q ≤ 754099
  · exact chkP_sound c_239_732828 q (by omega) hc732828 hqo h16
  replace hlo : 754100 ≤ q := by omega
  by_cases hc754100 : q ≤ 774811
  · exact chkP_sound c_239_754100 q (by omega) hc754100 hqo h16
  replace hlo : 774812 ≤ q := by omega
  by_cases hc774812 : q ≤ 798059
  · exact chkP_sound c_239_774812 q (by omega) hc774812 hqo h16
  replace hlo : 798060 ≤ q := by omega
  by_cases hc798060 : q ≤ 818755
  · exact chkP_sound c_239_798060 q (by omega) hc798060 hqo h16
  replace hlo : 818756 ≤ q := by omega
  by_cases hc818756 : q ≤ 841219
  · exact chkP_sound c_239_818756 q (by omega) hc818756 hqo h16
  replace hlo : 841220 ≤ q := by omega
  by_cases hc841220 : q ≤ 862651
  · exact chkP_sound c_239_841220 q (by omega) hc841220 hqo h16
  replace hlo : 862652 ≤ q := by omega
  by_cases hc862652 : q ≤ 884107
  · exact chkP_sound c_239_862652 q (by omega) hc862652 hqo h16
  replace hlo : 884108 ≤ q := by omega
  by_cases hc884108 : q ≤ 904883
  · exact chkP_sound c_239_884108 q (by omega) hc884108 hqo h16
  replace hlo : 904884 ≤ q := by omega
  by_cases hc904884 : q ≤ 925387
  · exact chkP_sound c_239_904884 q (by omega) hc904884 hqo h16
  replace hlo : 925388 ≤ q := by omega
  by_cases hc925388 : q ≤ 945859
  · exact chkP_sound c_239_925388 q (by omega) hc925388 hqo h16
  replace hlo : 945860 ≤ q := by omega
  by_cases hc945860 : q ≤ 965611
  · exact chkP_sound c_239_945860 q (by omega) hc945860 hqo h16
  replace hlo : 965612 ≤ q := by omega
  by_cases hc965612 : q ≤ 986819
  · exact chkP_sound c_239_965612 q (by omega) hc965612 hqo h16
  replace hlo : 986820 ≤ q := by omega
  exact chkP_sound c_239_986820 q hlo hhi hqo h16

theorem okp_241 (q : ℕ) (hlo : 174243 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (241 * (241 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 241 (fct 241) (fct 1000) q = true := by
  by_cases hc174243 : q ≤ 924242
  · exact chkP_sound c_241_174243 q (by omega) hc174243 hqo h16
  replace hlo : 924243 ≤ q := by omega
  exact chkP_sound c_241_924243 q hlo hhi hqo h16

theorem okp_251 (q : ℕ) (hlo : 189003 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (251 * (251 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 251 (fct 251) (fct 1000) q = true := by
  by_cases hc189003 : q ≤ 224775
  · exact chkP_sound c_251_189003 q (by omega) hc189003 hqo h16
  replace hlo : 224776 ≤ q := by omega
  by_cases hc224776 : q ≤ 259783
  · exact chkP_sound c_251_224776 q (by omega) hc224776 hqo h16
  replace hlo : 259784 ≤ q := by omega
  by_cases hc259784 : q ≤ 291727
  · exact chkP_sound c_251_259784 q (by omega) hc259784 hqo h16
  replace hlo : 291728 ≤ q := by omega
  by_cases hc291728 : q ≤ 321847
  · exact chkP_sound c_251_291728 q (by omega) hc291728 hqo h16
  replace hlo : 321848 ≤ q := by omega
  by_cases hc321848 : q ≤ 352607
  · exact chkP_sound c_251_321848 q (by omega) hc321848 hqo h16
  replace hlo : 352608 ≤ q := by omega
  by_cases hc352608 : q ≤ 382351
  · exact chkP_sound c_251_352608 q (by omega) hc352608 hqo h16
  replace hlo : 382352 ≤ q := by omega
  by_cases hc382352 : q ≤ 409391
  · exact chkP_sound c_251_382352 q (by omega) hc382352 hqo h16
  replace hlo : 409392 ≤ q := by omega
  by_cases hc409392 : q ≤ 436439
  · exact chkP_sound c_251_409392 q (by omega) hc409392 hqo h16
  replace hlo : 436440 ≤ q := by omega
  by_cases hc436440 : q ≤ 462311
  · exact chkP_sound c_251_436440 q (by omega) hc436440 hqo h16
  replace hlo : 462312 ≤ q := by omega
  by_cases hc462312 : q ≤ 489791
  · exact chkP_sound c_251_462312 q (by omega) hc462312 hqo h16
  replace hlo : 489792 ≤ q := by omega
  by_cases hc489792 : q ≤ 513839
  · exact chkP_sound c_251_489792 q (by omega) hc489792 hqo h16
  replace hlo : 513840 ≤ q := by omega
  by_cases hc513840 : q ≤ 539047
  · exact chkP_sound c_251_513840 q (by omega) hc513840 hqo h16
  replace hlo : 539048 ≤ q := by omega
  by_cases hc539048 : q ≤ 562871
  · exact chkP_sound c_251_539048 q (by omega) hc539048 hqo h16
  replace hlo : 562872 ≤ q := by omega
  by_cases hc562872 : q ≤ 587455
  · exact chkP_sound c_251_562872 q (by omega) hc562872 hqo h16
  replace hlo : 587456 ≤ q := by omega
  by_cases hc587456 : q ≤ 610447
  · exact chkP_sound c_251_587456 q (by omega) hc587456 hqo h16
  replace hlo : 610448 ≤ q := by omega
  by_cases hc610448 : q ≤ 633767
  · exact chkP_sound c_251_610448 q (by omega) hc610448 hqo h16
  replace hlo : 633768 ≤ q := by omega
  by_cases hc633768 : q ≤ 657311
  · exact chkP_sound c_251_633768 q (by omega) hc633768 hqo h16
  replace hlo : 657312 ≤ q := by omega
  by_cases hc657312 : q ≤ 680959
  · exact chkP_sound c_251_657312 q (by omega) hc657312 hqo h16
  replace hlo : 680960 ≤ q := by omega
  by_cases hc680960 : q ≤ 703039
  · exact chkP_sound c_251_680960 q (by omega) hc680960 hqo h16
  replace hlo : 703040 ≤ q := by omega
  by_cases hc703040 : q ≤ 724879
  · exact chkP_sound c_251_703040 q (by omega) hc703040 hqo h16
  replace hlo : 724880 ≤ q := by omega
  by_cases hc724880 : q ≤ 744911
  · exact chkP_sound c_251_724880 q (by omega) hc724880 hqo h16
  replace hlo : 744912 ≤ q := by omega
  by_cases hc744912 : q ≤ 768199
  · exact chkP_sound c_251_744912 q (by omega) hc744912 hqo h16
  replace hlo : 768200 ≤ q := by omega
  by_cases hc768200 : q ≤ 791047
  · exact chkP_sound c_251_768200 q (by omega) hc768200 hqo h16
  replace hlo : 791048 ≤ q := by omega
  by_cases hc791048 : q ≤ 811607
  · exact chkP_sound c_251_791048 q (by omega) hc791048 hqo h16
  replace hlo : 811608 ≤ q := by omega
  by_cases hc811608 : q ≤ 833047
  · exact chkP_sound c_251_811608 q (by omega) hc811608 hqo h16
  replace hlo : 833048 ≤ q := by omega
  by_cases hc833048 : q ≤ 852799
  · exact chkP_sound c_251_833048 q (by omega) hc833048 hqo h16
  replace hlo : 852800 ≤ q := by omega
  by_cases hc852800 : q ≤ 875711
  · exact chkP_sound c_251_852800 q (by omega) hc852800 hqo h16
  replace hlo : 875712 ≤ q := by omega
  by_cases hc875712 : q ≤ 899879
  · exact chkP_sound c_251_875712 q (by omega) hc875712 hqo h16
  replace hlo : 899880 ≤ q := by omega
  by_cases hc899880 : q ≤ 919631
  · exact chkP_sound c_251_899880 q (by omega) hc899880 hqo h16
  replace hlo : 919632 ≤ q := by omega
  by_cases hc919632 : q ≤ 940087
  · exact chkP_sound c_251_919632 q (by omega) hc919632 hqo h16
  replace hlo : 940088 ≤ q := by omega
  by_cases hc940088 : q ≤ 963359
  · exact chkP_sound c_251_940088 q (by omega) hc940088 hqo h16
  replace hlo : 963360 ≤ q := by omega
  by_cases hc963360 : q ≤ 983063
  · exact chkP_sound c_251_963360 q (by omega) hc963360 hqo h16
  replace hlo : 983064 ≤ q := by omega
  exact chkP_sound c_251_983064 q hlo hhi hqo h16

theorem okp_257 (q : ℕ) (hlo : 198147 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (257 * (257 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 257 (fct 257) (fct 1000) q = true := by
  by_cases hc198147 : q ≤ 948146
  · exact chkP_sound c_257_198147 q (by omega) hc198147 hqo h16
  replace hlo : 948147 ≤ q := by omega
  exact chkP_sound c_257_948147 q hlo hhi hqo h16

theorem okp_263 (q : ℕ) (hlo : 207507 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (263 * (263 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 263 (fct 263) (fct 1000) q = true := by
  by_cases hc207507 : q ≤ 244611
  · exact chkP_sound c_263_207507 q (by omega) hc207507 hqo h16
  replace hlo : 244612 ≤ q := by omega
  by_cases hc244612 : q ≤ 276859
  · exact chkP_sound c_263_244612 q (by omega) hc244612 hqo h16
  replace hlo : 276860 ≤ q := by omega
  by_cases hc276860 : q ≤ 310459
  · exact chkP_sound c_263_276860 q (by omega) hc276860 hqo h16
  replace hlo : 310460 ≤ q := by omega
  by_cases hc310460 : q ≤ 339139
  · exact chkP_sound c_263_310460 q (by omega) hc310460 hqo h16
  replace hlo : 339140 ≤ q := by omega
  by_cases hc339140 : q ≤ 368531
  · exact chkP_sound c_263_339140 q (by omega) hc339140 hqo h16
  replace hlo : 368532 ≤ q := by omega
  by_cases hc368532 : q ≤ 396987
  · exact chkP_sound c_263_368532 q (by omega) hc368532 hqo h16
  replace hlo : 396988 ≤ q := by omega
  by_cases hc396988 : q ≤ 423931
  · exact chkP_sound c_263_396988 q (by omega) hc396988 hqo h16
  replace hlo : 423932 ≤ q := by omega
  by_cases hc423932 : q ≤ 453371
  · exact chkP_sound c_263_423932 q (by omega) hc423932 hqo h16
  replace hlo : 453372 ≤ q := by omega
  by_cases hc453372 : q ≤ 478651
  · exact chkP_sound c_263_453372 q (by omega) hc453372 hqo h16
  replace hlo : 478652 ≤ q := by omega
  by_cases hc478652 : q ≤ 504523
  · exact chkP_sound c_263_478652 q (by omega) hc478652 hqo h16
  replace hlo : 504524 ≤ q := by omega
  by_cases hc504524 : q ≤ 530539
  · exact chkP_sound c_263_504524 q (by omega) hc504524 hqo h16
  replace hlo : 530540 ≤ q := by omega
  by_cases hc530540 : q ≤ 555491
  · exact chkP_sound c_263_530540 q (by omega) hc530540 hqo h16
  replace hlo : 555492 ≤ q := by omega
  by_cases hc555492 : q ≤ 579539
  · exact chkP_sound c_263_555492 q (by omega) hc555492 hqo h16
  replace hlo : 579540 ≤ q := by omega
  by_cases hc579540 : q ≤ 603011
  · exact chkP_sound c_263_579540 q (by omega) hc579540 hqo h16
  replace hlo : 603012 ≤ q := by omega
  by_cases hc603012 : q ≤ 626771
  · exact chkP_sound c_263_603012 q (by omega) hc603012 hqo h16
  replace hlo : 626772 ≤ q := by omega
  by_cases hc626772 : q ≤ 648931
  · exact chkP_sound c_263_626772 q (by omega) hc626772 hqo h16
  replace hlo : 648932 ≤ q := by omega
  by_cases hc648932 : q ≤ 671971
  · exact chkP_sound c_263_648932 q (by omega) hc648932 hqo h16
  replace hlo : 671972 ≤ q := by omega
  by_cases hc671972 : q ≤ 693859
  · exact chkP_sound c_263_671972 q (by omega) hc671972 hqo h16
  replace hlo : 693860 ≤ q := by omega
  by_cases hc693860 : q ≤ 716531
  · exact chkP_sound c_263_693860 q (by omega) hc693860 hqo h16
  replace hlo : 716532 ≤ q := by omega
  by_cases hc716532 : q ≤ 738043
  · exact chkP_sound c_263_716532 q (by omega) hc716532 hqo h16
  replace hlo : 738044 ≤ q := by omega
  by_cases hc738044 : q ≤ 759523
  · exact chkP_sound c_263_738044 q (by omega) hc738044 hqo h16
  replace hlo : 759524 ≤ q := by omega
  by_cases hc759524 : q ≤ 782659
  · exact chkP_sound c_263_759524 q (by omega) hc759524 hqo h16
  replace hlo : 782660 ≤ q := by omega
  by_cases hc782660 : q ≤ 804179
  · exact chkP_sound c_263_782660 q (by omega) hc782660 hqo h16
  replace hlo : 804180 ≤ q := by omega
  by_cases hc804180 : q ≤ 825827
  · exact chkP_sound c_263_804180 q (by omega) hc804180 hqo h16
  replace hlo : 825828 ≤ q := by omega
  by_cases hc825828 : q ≤ 846947
  · exact chkP_sound c_263_825828 q (by omega) hc825828 hqo h16
  replace hlo : 846948 ≤ q := by omega
  by_cases hc846948 : q ≤ 868291
  · exact chkP_sound c_263_846948 q (by omega) hc846948 hqo h16
  replace hlo : 868292 ≤ q := by omega
  by_cases hc868292 : q ≤ 889123
  · exact chkP_sound c_263_868292 q (by omega) hc868292 hqo h16
  replace hlo : 889124 ≤ q := by omega
  by_cases hc889124 : q ≤ 911179
  · exact chkP_sound c_263_889124 q (by omega) hc889124 hqo h16
  replace hlo : 911180 ≤ q := by omega
  by_cases hc911180 : q ≤ 931259
  · exact chkP_sound c_263_911180 q (by omega) hc911180 hqo h16
  replace hlo : 931260 ≤ q := by omega
  by_cases hc931260 : q ≤ 952691
  · exact chkP_sound c_263_931260 q (by omega) hc931260 hqo h16
  replace hlo : 952692 ≤ q := by omega
  by_cases hc952692 : q ≤ 973459
  · exact chkP_sound c_263_952692 q (by omega) hc952692 hqo h16
  replace hlo : 973460 ≤ q := by omega
  by_cases hc973460 : q ≤ 994811
  · exact chkP_sound c_263_973460 q (by omega) hc973460 hqo h16
  replace hlo : 994812 ≤ q := by omega
  exact chkP_sound c_263_994812 q hlo hhi hqo h16

theorem okp_269 (q : ℕ) (hlo : 217083 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (269 * (269 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 269 (fct 269) (fct 1000) q = true := by
  by_cases hc217083 : q ≤ 967082
  · exact chkP_sound c_269_217083 q (by omega) hc217083 hqo h16
  replace hlo : 967083 ≤ q := by omega
  exact chkP_sound c_269_967083 q hlo hhi hqo h16

theorem okp_271 (q : ℕ) (hlo : 220323 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (271 * (271 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 271 (fct 271) (fct 1000) q = true := by
  by_cases hc220323 : q ≤ 256219
  · exact chkP_sound c_271_220323 q (by omega) hc220323 hqo h16
  replace hlo : 256220 ≤ q := by omega
  by_cases hc256220 : q ≤ 291539
  · exact chkP_sound c_271_256220 q (by omega) hc256220 hqo h16
  replace hlo : 291540 ≤ q := by omega
  by_cases hc291540 : q ≤ 323987
  · exact chkP_sound c_271_291540 q (by omega) hc291540 hqo h16
  replace hlo : 323988 ≤ q := by omega
  by_cases hc323988 : q ≤ 352907
  · exact chkP_sound c_271_323988 q (by omega) hc323988 hqo h16
  replace hlo : 352908 ≤ q := by omega
  by_cases hc352908 : q ≤ 383011
  · exact chkP_sound c_271_352908 q (by omega) hc352908 hqo h16
  replace hlo : 383012 ≤ q := by omega
  by_cases hc383012 : q ≤ 410339
  · exact chkP_sound c_271_383012 q (by omega) hc383012 hqo h16
  replace hlo : 410340 ≤ q := by omega
  by_cases hc410340 : q ≤ 440811
  · exact chkP_sound c_271_410340 q (by omega) hc410340 hqo h16
  replace hlo : 440812 ≤ q := by omega
  by_cases hc440812 : q ≤ 468867
  · exact chkP_sound c_271_440812 q (by omega) hc440812 hqo h16
  replace hlo : 468868 ≤ q := by omega
  by_cases hc468868 : q ≤ 492067
  · exact chkP_sound c_271_468868 q (by omega) hc468868 hqo h16
  replace hlo : 492068 ≤ q := by omega
  by_cases hc492068 : q ≤ 518611
  · exact chkP_sound c_271_492068 q (by omega) hc492068 hqo h16
  replace hlo : 518612 ≤ q := by omega
  by_cases hc518612 : q ≤ 544171
  · exact chkP_sound c_271_518612 q (by omega) hc518612 hqo h16
  replace hlo : 544172 ≤ q := by omega
  by_cases hc544172 : q ≤ 570547
  · exact chkP_sound c_271_544172 q (by omega) hc544172 hqo h16
  replace hlo : 570548 ≤ q := by omega
  by_cases hc570548 : q ≤ 596419
  · exact chkP_sound c_271_570548 q (by omega) hc570548 hqo h16
  replace hlo : 596420 ≤ q := by omega
  by_cases hc596420 : q ≤ 620467
  · exact chkP_sound c_271_596420 q (by omega) hc596420 hqo h16
  replace hlo : 620468 ≤ q := by omega
  by_cases hc620468 : q ≤ 642755
  · exact chkP_sound c_271_620468 q (by omega) hc620468 hqo h16
  replace hlo : 642756 ≤ q := by omega
  by_cases hc642756 : q ≤ 665747
  · exact chkP_sound c_271_642756 q (by omega) hc642756 hqo h16
  replace hlo : 665748 ≤ q := by omega
  by_cases hc665748 : q ≤ 689587
  · exact chkP_sound c_271_665748 q (by omega) hc665748 hqo h16
  replace hlo : 689588 ≤ q := by omega
  by_cases hc689588 : q ≤ 713107
  · exact chkP_sound c_271_689588 q (by omega) hc689588 hqo h16
  replace hlo : 713108 ≤ q := by omega
  by_cases hc713108 : q ≤ 736787
  · exact chkP_sound c_271_713108 q (by omega) hc713108 hqo h16
  replace hlo : 736788 ≤ q := by omega
  by_cases hc736788 : q ≤ 759467
  · exact chkP_sound c_271_736788 q (by omega) hc736788 hqo h16
  replace hlo : 759468 ≤ q := by omega
  by_cases hc759468 : q ≤ 783019
  · exact chkP_sound c_271_759468 q (by omega) hc759468 hqo h16
  replace hlo : 783020 ≤ q := by omega
  by_cases hc783020 : q ≤ 804323
  · exact chkP_sound c_271_783020 q (by omega) hc783020 hqo h16
  replace hlo : 804324 ≤ q := by omega
  by_cases hc804324 : q ≤ 825779
  · exact chkP_sound c_271_804324 q (by omega) hc804324 hqo h16
  replace hlo : 825780 ≤ q := by omega
  by_cases hc825780 : q ≤ 849931
  · exact chkP_sound c_271_825780 q (by omega) hc825780 hqo h16
  replace hlo : 849932 ≤ q := by omega
  by_cases hc849932 : q ≤ 871771
  · exact chkP_sound c_271_849932 q (by omega) hc849932 hqo h16
  replace hlo : 871772 ≤ q := by omega
  by_cases hc871772 : q ≤ 891899
  · exact chkP_sound c_271_871772 q (by omega) hc871772 hqo h16
  replace hlo : 891900 ≤ q := by omega
  by_cases hc891900 : q ≤ 913027
  · exact chkP_sound c_271_891900 q (by omega) hc891900 hqo h16
  replace hlo : 913028 ≤ q := by omega
  by_cases hc913028 : q ≤ 935339
  · exact chkP_sound c_271_913028 q (by omega) hc913028 hqo h16
  replace hlo : 935340 ≤ q := by omega
  by_cases hc935340 : q ≤ 954619
  · exact chkP_sound c_271_935340 q (by omega) hc935340 hqo h16
  replace hlo : 954620 ≤ q := by omega
  by_cases hc954620 : q ≤ 974539
  · exact chkP_sound c_271_954620 q (by omega) hc954620 hqo h16
  replace hlo : 974540 ≤ q := by omega
  by_cases hc974540 : q ≤ 996211
  · exact chkP_sound c_271_974540 q (by omega) hc974540 hqo h16
  replace hlo : 996212 ≤ q := by omega
  exact chkP_sound c_271_996212 q hlo hhi hqo h16

theorem okp_277 (q : ℕ) (hlo : 230187 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (277 * (277 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 277 (fct 277) (fct 1000) q = true := by
  by_cases hc230187 : q ≤ 980186
  · exact chkP_sound c_277_230187 q (by omega) hc230187 hqo h16
  replace hlo : 980187 ≤ q := by omega
  exact chkP_sound c_277_980187 q hlo hhi hqo h16

theorem okp_281 (q : ℕ) (hlo : 236883 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (281 * (281 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 281 (fct 281) (fct 1000) q = true := by
  by_cases hc236883 : q ≤ 986882
  · exact chkP_sound c_281_236883 q (by omega) hc236883 hqo h16
  replace hlo : 986883 ≤ q := by omega
  exact chkP_sound c_281_986883 q hlo hhi hqo h16

theorem okp_283 (q : ℕ) (hlo : 240267 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (283 * (283 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 283 (fct 283) (fct 1000) q = true := by
  by_cases hc240267 : q ≤ 275183
  · exact chkP_sound c_283_240267 q (by omega) hc240267 hqo h16
  replace hlo : 275184 ≤ q := by omega
  by_cases hc275184 : q ≤ 307463
  · exact chkP_sound c_283_275184 q (by omega) hc275184 hqo h16
  replace hlo : 307464 ≤ q := by omega
  by_cases hc307464 : q ≤ 337391
  · exact chkP_sound c_283_307464 q (by omega) hc307464 hqo h16
  replace hlo : 337392 ≤ q := by omega
  by_cases hc337392 : q ≤ 369831
  · exact chkP_sound c_283_337392 q (by omega) hc337392 hqo h16
  replace hlo : 369832 ≤ q := by omega
  by_cases hc369832 : q ≤ 401311
  · exact chkP_sound c_283_369832 q (by omega) hc369832 hqo h16
  replace hlo : 401312 ≤ q := by omega
  by_cases hc401312 : q ≤ 431311
  · exact chkP_sound c_283_401312 q (by omega) hc401312 hqo h16
  replace hlo : 431312 ≤ q := by omega
  by_cases hc431312 : q ≤ 457711
  · exact chkP_sound c_283_431312 q (by omega) hc431312 hqo h16
  replace hlo : 457712 ≤ q := by omega
  by_cases hc457712 : q ≤ 485831
  · exact chkP_sound c_283_457712 q (by omega) hc457712 hqo h16
  replace hlo : 485832 ≤ q := by omega
  by_cases hc485832 : q ≤ 509927
  · exact chkP_sound c_283_485832 q (by omega) hc485832 hqo h16
  replace hlo : 509928 ≤ q := by omega
  by_cases hc509928 : q ≤ 535663
  · exact chkP_sound c_283_509928 q (by omega) hc509928 hqo h16
  replace hlo : 535664 ≤ q := by omega
  by_cases hc535664 : q ≤ 562391
  · exact chkP_sound c_283_535664 q (by omega) hc535664 hqo h16
  replace hlo : 562392 ≤ q := by omega
  by_cases hc562392 : q ≤ 586711
  · exact chkP_sound c_283_562392 q (by omega) hc562392 hqo h16
  replace hlo : 586712 ≤ q := by omega
  by_cases hc586712 : q ≤ 610783
  · exact chkP_sound c_283_586712 q (by omega) hc586712 hqo h16
  replace hlo : 610784 ≤ q := by omega
  by_cases hc610784 : q ≤ 636023
  · exact chkP_sound c_283_610784 q (by omega) hc610784 hqo h16
  replace hlo : 636024 ≤ q := by omega
  by_cases hc636024 : q ≤ 659671
  · exact chkP_sound c_283_636024 q (by omega) hc636024 hqo h16
  replace hlo : 659672 ≤ q := by omega
  by_cases hc659672 : q ≤ 683863
  · exact chkP_sound c_283_659672 q (by omega) hc659672 hqo h16
  replace hlo : 683864 ≤ q := by omega
  by_cases hc683864 : q ≤ 706919
  · exact chkP_sound c_283_683864 q (by omega) hc683864 hqo h16
  replace hlo : 706920 ≤ q := by omega
  by_cases hc706920 : q ≤ 727879
  · exact chkP_sound c_283_706920 q (by omega) hc706920 hqo h16
  replace hlo : 727880 ≤ q := by omega
  by_cases hc727880 : q ≤ 749863
  · exact chkP_sound c_283_727880 q (by omega) hc727880 hqo h16
  replace hlo : 749864 ≤ q := by omega
  by_cases hc749864 : q ≤ 771111
  · exact chkP_sound c_283_749864 q (by omega) hc749864 hqo h16
  replace hlo : 771112 ≤ q := by omega
  by_cases hc771112 : q ≤ 793487
  · exact chkP_sound c_283_771112 q (by omega) hc771112 hqo h16
  replace hlo : 793488 ≤ q := by omega
  by_cases hc793488 : q ≤ 817679
  · exact chkP_sound c_283_793488 q (by omega) hc793488 hqo h16
  replace hlo : 817680 ≤ q := by omega
  by_cases hc817680 : q ≤ 842183
  · exact chkP_sound c_283_817680 q (by omega) hc817680 hqo h16
  replace hlo : 842184 ≤ q := by omega
  by_cases hc842184 : q ≤ 863495
  · exact chkP_sound c_283_842184 q (by omega) hc842184 hqo h16
  replace hlo : 863496 ≤ q := by omega
  by_cases hc863496 : q ≤ 884959
  · exact chkP_sound c_283_863496 q (by omega) hc863496 hqo h16
  replace hlo : 884960 ≤ q := by omega
  by_cases hc884960 : q ≤ 906319
  · exact chkP_sound c_283_884960 q (by omega) hc884960 hqo h16
  replace hlo : 906320 ≤ q := by omega
  by_cases hc906320 : q ≤ 924487
  · exact chkP_sound c_283_906320 q (by omega) hc906320 hqo h16
  replace hlo : 924488 ≤ q := by omega
  by_cases hc924488 : q ≤ 945983
  · exact chkP_sound c_283_924488 q (by omega) hc924488 hqo h16
  replace hlo : 945984 ≤ q := by omega
  by_cases hc945984 : q ≤ 966119
  · exact chkP_sound c_283_945984 q (by omega) hc945984 hqo h16
  replace hlo : 966120 ≤ q := by omega
  by_cases hc966120 : q ≤ 987383
  · exact chkP_sound c_283_966120 q (by omega) hc966120 hqo h16
  replace hlo : 987384 ≤ q := by omega
  exact chkP_sound c_283_987384 q hlo hhi hqo h16

theorem okp_293 (q : ℕ) (hlo : 257547 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (293 * (293 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 293 (fct 293) (fct 1000) q = true := by
  exact chkP_sound c_293_257547 q hlo hhi hqo h16

theorem okp_307 (q : ℕ) (hlo : 282747 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (307 * (307 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 307 (fct 307) (fct 1000) q = true := by
  by_cases hc282747 : q ≤ 318559
  · exact chkP_sound c_307_282747 q (by omega) hc282747 hqo h16
  replace hlo : 318560 ≤ q := by omega
  by_cases hc318560 : q ≤ 351223
  · exact chkP_sound c_307_318560 q (by omega) hc318560 hqo h16
  replace hlo : 351224 ≤ q := by omega
  by_cases hc351224 : q ≤ 383983
  · exact chkP_sound c_307_351224 q (by omega) hc351224 hqo h16
  replace hlo : 383984 ≤ q := by omega
  by_cases hc383984 : q ≤ 413879
  · exact chkP_sound c_307_383984 q (by omega) hc383984 hqo h16
  replace hlo : 413880 ≤ q := by omega
  by_cases hc413880 : q ≤ 443791
  · exact chkP_sound c_307_413880 q (by omega) hc413880 hqo h16
  replace hlo : 443792 ≤ q := by omega
  by_cases hc443792 : q ≤ 473343
  · exact chkP_sound c_307_443792 q (by omega) hc443792 hqo h16
  replace hlo : 473344 ≤ q := by omega
  by_cases hc473344 : q ≤ 500839
  · exact chkP_sound c_307_473344 q (by omega) hc473344 hqo h16
  replace hlo : 500840 ≤ q := by omega
  by_cases hc500840 : q ≤ 529407
  · exact chkP_sound c_307_500840 q (by omega) hc500840 hqo h16
  replace hlo : 529408 ≤ q := by omega
  by_cases hc529408 : q ≤ 555439
  · exact chkP_sound c_307_529408 q (by omega) hc529408 hqo h16
  replace hlo : 555440 ≤ q := by omega
  by_cases hc555440 : q ≤ 580663
  · exact chkP_sound c_307_555440 q (by omega) hc555440 hqo h16
  replace hlo : 580664 ≤ q := by omega
  by_cases hc580664 : q ≤ 606159
  · exact chkP_sound c_307_580664 q (by omega) hc580664 hqo h16
  replace hlo : 606160 ≤ q := by omega
  by_cases hc606160 : q ≤ 631583
  · exact chkP_sound c_307_606160 q (by omega) hc606160 hqo h16
  replace hlo : 631584 ≤ q := by omega
  by_cases hc631584 : q ≤ 656671
  · exact chkP_sound c_307_631584 q (by omega) hc631584 hqo h16
  replace hlo : 656672 ≤ q := by omega
  by_cases hc656672 : q ≤ 683287
  · exact chkP_sound c_307_656672 q (by omega) hc656672 hqo h16
  replace hlo : 683288 ≤ q := by omega
  by_cases hc683288 : q ≤ 708119
  · exact chkP_sound c_307_683288 q (by omega) hc683288 hqo h16
  replace hlo : 708120 ≤ q := by omega
  by_cases hc708120 : q ≤ 733263
  · exact chkP_sound c_307_708120 q (by omega) hc708120 hqo h16
  replace hlo : 733264 ≤ q := by omega
  by_cases hc733264 : q ≤ 755719
  · exact chkP_sound c_307_733264 q (by omega) hc733264 hqo h16
  replace hlo : 755720 ≤ q := by omega
  by_cases hc755720 : q ≤ 777839
  · exact chkP_sound c_307_755720 q (by omega) hc755720 hqo h16
  replace hlo : 777840 ≤ q := by omega
  by_cases hc777840 : q ≤ 800623
  · exact chkP_sound c_307_777840 q (by omega) hc777840 hqo h16
  replace hlo : 800624 ≤ q := by omega
  by_cases hc800624 : q ≤ 822599
  · exact chkP_sound c_307_800624 q (by omega) hc800624 hqo h16
  replace hlo : 822600 ≤ q := by omega
  by_cases hc822600 : q ≤ 845879
  · exact chkP_sound c_307_822600 q (by omega) hc822600 hqo h16
  replace hlo : 845880 ≤ q := by omega
  by_cases hc845880 : q ≤ 866431
  · exact chkP_sound c_307_845880 q (by omega) hc845880 hqo h16
  replace hlo : 866432 ≤ q := by omega
  by_cases hc866432 : q ≤ 887311
  · exact chkP_sound c_307_866432 q (by omega) hc866432 hqo h16
  replace hlo : 887312 ≤ q := by omega
  by_cases hc887312 : q ≤ 911159
  · exact chkP_sound c_307_887312 q (by omega) hc887312 hqo h16
  replace hlo : 911160 ≤ q := by omega
  by_cases hc911160 : q ≤ 932231
  · exact chkP_sound c_307_911160 q (by omega) hc911160 hqo h16
  replace hlo : 932232 ≤ q := by omega
  by_cases hc932232 : q ≤ 955039
  · exact chkP_sound c_307_932232 q (by omega) hc932232 hqo h16
  replace hlo : 955040 ≤ q := by omega
  by_cases hc955040 : q ≤ 973151
  · exact chkP_sound c_307_955040 q (by omega) hc955040 hqo h16
  replace hlo : 973152 ≤ q := by omega
  by_cases hc973152 : q ≤ 994927
  · exact chkP_sound c_307_973152 q (by omega) hc973152 hqo h16
  replace hlo : 994928 ≤ q := by omega
  exact chkP_sound c_307_994928 q hlo hhi hqo h16

theorem okp_311 (q : ℕ) (hlo : 290163 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (311 * (311 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 311 (fct 311) (fct 1000) q = true := by
  by_cases hc290163 : q ≤ 323083
  · exact chkP_sound c_311_290163 q (by omega) hc290163 hqo h16
  replace hlo : 323084 ≤ q := by omega
  by_cases hc323084 : q ≤ 354939
  · exact chkP_sound c_311_323084 q (by omega) hc323084 hqo h16
  replace hlo : 354940 ≤ q := by omega
  by_cases hc354940 : q ≤ 387139
  · exact chkP_sound c_311_354940 q (by omega) hc354940 hqo h16
  replace hlo : 387140 ≤ q := by omega
  by_cases hc387140 : q ≤ 417211
  · exact chkP_sound c_311_387140 q (by omega) hc387140 hqo h16
  replace hlo : 417212 ≤ q := by omega
  by_cases hc417212 : q ≤ 446387
  · exact chkP_sound c_311_417212 q (by omega) hc417212 hqo h16
  replace hlo : 446388 ≤ q := by omega
  by_cases hc446388 : q ≤ 475691
  · exact chkP_sound c_311_446388 q (by omega) hc446388 hqo h16
  replace hlo : 475692 ≤ q := by omega
  by_cases hc475692 : q ≤ 503291
  · exact chkP_sound c_311_475692 q (by omega) hc475692 hqo h16
  replace hlo : 503292 ≤ q := by omega
  by_cases hc503292 : q ≤ 531331
  · exact chkP_sound c_311_503292 q (by omega) hc503292 hqo h16
  replace hlo : 531332 ≤ q := by omega
  by_cases hc531332 : q ≤ 559459
  · exact chkP_sound c_311_531332 q (by omega) hc531332 hqo h16
  replace hlo : 559460 ≤ q := by omega
  by_cases hc559460 : q ≤ 582683
  · exact chkP_sound c_311_559460 q (by omega) hc559460 hqo h16
  replace hlo : 582684 ≤ q := by omega
  by_cases hc582684 : q ≤ 608659
  · exact chkP_sound c_311_582684 q (by omega) hc582684 hqo h16
  replace hlo : 608660 ≤ q := by omega
  by_cases hc608660 : q ≤ 632987
  · exact chkP_sound c_311_608660 q (by omega) hc608660 hqo h16
  replace hlo : 632988 ≤ q := by omega
  by_cases hc632988 : q ≤ 658019
  · exact chkP_sound c_311_632988 q (by omega) hc632988 hqo h16
  replace hlo : 658020 ≤ q := by omega
  by_cases hc658020 : q ≤ 683769
  · exact chkP_sound c_311_658020 q (by omega) hc658020 hqo h16
  replace hlo : 683770 ≤ q := by omega
  by_cases hc683770 : q ≤ 708899
  · exact chkP_sound c_311_683770 q (by omega) hc683770 hqo h16
  replace hlo : 708900 ≤ q := by omega
  by_cases hc708900 : q ≤ 733339
  · exact chkP_sound c_311_708900 q (by omega) hc708900 hqo h16
  replace hlo : 733340 ≤ q := by omega
  by_cases hc733340 : q ≤ 756571
  · exact chkP_sound c_311_733340 q (by omega) hc733340 hqo h16
  replace hlo : 756572 ≤ q := by omega
  by_cases hc756572 : q ≤ 779659
  · exact chkP_sound c_311_756572 q (by omega) hc756572 hqo h16
  replace hlo : 779660 ≤ q := by omega
  by_cases hc779660 : q ≤ 801419
  · exact chkP_sound c_311_779660 q (by omega) hc779660 hqo h16
  replace hlo : 801420 ≤ q := by omega
  by_cases hc801420 : q ≤ 824651
  · exact chkP_sound c_311_801420 q (by omega) hc801420 hqo h16
  replace hlo : 824652 ≤ q := by omega
  by_cases hc824652 : q ≤ 849131
  · exact chkP_sound c_311_824652 q (by omega) hc824652 hqo h16
  replace hlo : 849132 ≤ q := by omega
  by_cases hc849132 : q ≤ 873619
  · exact chkP_sound c_311_849132 q (by omega) hc849132 hqo h16
  replace hlo : 873620 ≤ q := by omega
  by_cases hc873620 : q ≤ 893867
  · exact chkP_sound c_311_873620 q (by omega) hc873620 hqo h16
  replace hlo : 893868 ≤ q := by omega
  by_cases hc893868 : q ≤ 916859
  · exact chkP_sound c_311_893868 q (by omega) hc893868 hqo h16
  replace hlo : 916860 ≤ q := by omega
  by_cases hc916860 : q ≤ 937331
  · exact chkP_sound c_311_916860 q (by omega) hc916860 hqo h16
  replace hlo : 937332 ≤ q := by omega
  by_cases hc937332 : q ≤ 956107
  · exact chkP_sound c_311_937332 q (by omega) hc937332 hqo h16
  replace hlo : 956108 ≤ q := by omega
  by_cases hc956108 : q ≤ 979057
  · exact chkP_sound c_311_956108 q (by omega) hc956108 hqo h16
  replace hlo : 979058 ≤ q := by omega
  exact chkP_sound c_311_979058 q hlo hhi hqo h16

theorem okp_313 (q : ℕ) (hlo : 293907 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (313 * (313 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 313 (fct 313) (fct 1000) q = true := by
  exact chkP_sound c_313_293907 q hlo hhi hqo h16

theorem okp_317 (q : ℕ) (hlo : 301467 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (317 * (317 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 317 (fct 317) (fct 1000) q = true := by
  exact chkP_sound c_317_301467 q hlo hhi hqo h16

theorem okp_331 (q : ℕ) (hlo : 328683 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (331 * (331 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 331 (fct 331) (fct 1000) q = true := by
  by_cases hc328683 : q ≤ 363751
  · exact chkP_sound c_331_328683 q (by omega) hc328683 hqo h16
  replace hlo : 363752 ≤ q := by omega
  by_cases hc363752 : q ≤ 395951
  · exact chkP_sound c_331_363752 q (by omega) hc363752 hqo h16
  replace hlo : 395952 ≤ q := by omega
  by_cases hc395952 : q ≤ 428567
  · exact chkP_sound c_331_395952 q (by omega) hc395952 hqo h16
  replace hlo : 428568 ≤ q := by omega
  by_cases hc428568 : q ≤ 458639
  · exact chkP_sound c_331_428568 q (by omega) hc428568 hqo h16
  replace hlo : 458640 ≤ q := by omega
  by_cases hc458640 : q ≤ 486479
  · exact chkP_sound c_331_458640 q (by omega) hc458640 hqo h16
  replace hlo : 486480 ≤ q := by omega
  by_cases hc486480 : q ≤ 513311
  · exact chkP_sound c_331_486480 q (by omega) hc486480 hqo h16
  replace hlo : 513312 ≤ q := by omega
  by_cases hc513312 : q ≤ 541999
  · exact chkP_sound c_331_513312 q (by omega) hc513312 hqo h16
  replace hlo : 542000 ≤ q := by omega
  by_cases hc542000 : q ≤ 568903
  · exact chkP_sound c_331_542000 q (by omega) hc542000 hqo h16
  replace hlo : 568904 ≤ q := by omega
  by_cases hc568904 : q ≤ 595159
  · exact chkP_sound c_331_568904 q (by omega) hc568904 hqo h16
  replace hlo : 595160 ≤ q := by omega
  by_cases hc595160 : q ≤ 620887
  · exact chkP_sound c_331_595160 q (by omega) hc595160 hqo h16
  replace hlo : 620888 ≤ q := by omega
  by_cases hc620888 : q ≤ 647737
  · exact chkP_sound c_331_620888 q (by omega) hc620888 hqo h16
  replace hlo : 647738 ≤ q := by omega
  by_cases hc647738 : q ≤ 673151
  · exact chkP_sound c_331_647738 q (by omega) hc647738 hqo h16
  replace hlo : 673152 ≤ q := by omega
  by_cases hc673152 : q ≤ 696251
  · exact chkP_sound c_331_673152 q (by omega) hc673152 hqo h16
  replace hlo : 696252 ≤ q := by omega
  by_cases hc696252 : q ≤ 720151
  · exact chkP_sound c_331_696252 q (by omega) hc696252 hqo h16
  replace hlo : 720152 ≤ q := by omega
  by_cases hc720152 : q ≤ 743711
  · exact chkP_sound c_331_720152 q (by omega) hc720152 hqo h16
  replace hlo : 743712 ≤ q := by omega
  by_cases hc743712 : q ≤ 769295
  · exact chkP_sound c_331_743712 q (by omega) hc743712 hqo h16
  replace hlo : 769296 ≤ q := by omega
  by_cases hc769296 : q ≤ 791159
  · exact chkP_sound c_331_769296 q (by omega) hc769296 hqo h16
  replace hlo : 791160 ≤ q := by omega
  by_cases hc791160 : q ≤ 812855
  · exact chkP_sound c_331_791160 q (by omega) hc791160 hqo h16
  replace hlo : 812856 ≤ q := by omega
  by_cases hc812856 : q ≤ 837079
  · exact chkP_sound c_331_812856 q (by omega) hc812856 hqo h16
  replace hlo : 837080 ≤ q := by omega
  by_cases hc837080 : q ≤ 860791
  · exact chkP_sound c_331_837080 q (by omega) hc837080 hqo h16
  replace hlo : 860792 ≤ q := by omega
  by_cases hc860792 : q ≤ 881471
  · exact chkP_sound c_331_860792 q (by omega) hc860792 hqo h16
  replace hlo : 881472 ≤ q := by omega
  by_cases hc881472 : q ≤ 903055
  · exact chkP_sound c_331_881472 q (by omega) hc881472 hqo h16
  replace hlo : 903056 ≤ q := by omega
  by_cases hc903056 : q ≤ 922511
  · exact chkP_sound c_331_903056 q (by omega) hc903056 hqo h16
  replace hlo : 922512 ≤ q := by omega
  by_cases hc922512 : q ≤ 945887
  · exact chkP_sound c_331_922512 q (by omega) hc922512 hqo h16
  replace hlo : 945888 ≤ q := by omega
  by_cases hc945888 : q ≤ 969719
  · exact chkP_sound c_331_945888 q (by omega) hc945888 hqo h16
  replace hlo : 969720 ≤ q := by omega
  by_cases hc969720 : q ≤ 990719
  · exact chkP_sound c_331_969720 q (by omega) hc969720 hqo h16
  replace hlo : 990720 ≤ q := by omega
  exact chkP_sound c_331_990720 q hlo hhi hqo h16

theorem okp_337 (q : ℕ) (hlo : 340707 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (337 * (337 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 337 (fct 337) (fct 1000) q = true := by
  exact chkP_sound c_337_340707 q hlo hhi hqo h16

theorem okp_347 (q : ℕ) (hlo : 361227 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (347 * (347 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 347 (fct 347) (fct 1000) q = true := by
  by_cases hc361227 : q ≤ 394871
  · exact chkP_sound c_347_361227 q (by omega) hc361227 hqo h16
  replace hlo : 394872 ≤ q := by omega
  by_cases hc394872 : q ≤ 426371
  · exact chkP_sound c_347_394872 q (by omega) hc394872 hqo h16
  replace hlo : 426372 ≤ q := by omega
  by_cases hc426372 : q ≤ 456223
  · exact chkP_sound c_347_426372 q (by omega) hc426372 hqo h16
  replace hlo : 456224 ≤ q := by omega
  by_cases hc456224 : q ≤ 488503
  · exact chkP_sound c_347_456224 q (by omega) hc456224 hqo h16
  replace hlo : 488504 ≤ q := by omega
  by_cases hc488504 : q ≤ 516911
  · exact chkP_sound c_347_488504 q (by omega) hc488504 hqo h16
  replace hlo : 516912 ≤ q := by omega
  by_cases hc516912 : q ≤ 545911
  · exact chkP_sound c_347_516912 q (by omega) hc516912 hqo h16
  replace hlo : 545912 ≤ q := by omega
  by_cases hc545912 : q ≤ 573487
  · exact chkP_sound c_347_545912 q (by omega) hc545912 hqo h16
  replace hlo : 573488 ≤ q := by omega
  by_cases hc573488 : q ≤ 601439
  · exact chkP_sound c_347_573488 q (by omega) hc573488 hqo h16
  replace hlo : 601440 ≤ q := by omega
  by_cases hc601440 : q ≤ 629263
  · exact chkP_sound c_347_601440 q (by omega) hc601440 hqo h16
  replace hlo : 629264 ≤ q := by omega
  by_cases hc629264 : q ≤ 654967
  · exact chkP_sound c_347_629264 q (by omega) hc629264 hqo h16
  replace hlo : 654968 ≤ q := by omega
  by_cases hc654968 : q ≤ 679879
  · exact chkP_sound c_347_654968 q (by omega) hc654968 hqo h16
  replace hlo : 679880 ≤ q := by omega
  by_cases hc679880 : q ≤ 702391
  · exact chkP_sound c_347_679880 q (by omega) hc679880 hqo h16
  replace hlo : 702392 ≤ q := by omega
  by_cases hc702392 : q ≤ 724303
  · exact chkP_sound c_347_702392 q (by omega) hc702392 hqo h16
  replace hlo : 724304 ≤ q := by omega
  by_cases hc724304 : q ≤ 747583
  · exact chkP_sound c_347_724304 q (by omega) hc724304 hqo h16
  replace hlo : 747584 ≤ q := by omega
  by_cases hc747584 : q ≤ 769663
  · exact chkP_sound c_347_747584 q (by omega) hc747584 hqo h16
  replace hlo : 769664 ≤ q := by omega
  by_cases hc769664 : q ≤ 793279
  · exact chkP_sound c_347_769664 q (by omega) hc769664 hqo h16
  replace hlo : 793280 ≤ q := by omega
  by_cases hc793280 : q ≤ 815623
  · exact chkP_sound c_347_793280 q (by omega) hc793280 hqo h16
  replace hlo : 815624 ≤ q := by omega
  by_cases hc815624 : q ≤ 840439
  · exact chkP_sound c_347_815624 q (by omega) hc815624 hqo h16
  replace hlo : 840440 ≤ q := by omega
  by_cases hc840440 : q ≤ 862343
  · exact chkP_sound c_347_840440 q (by omega) hc840440 hqo h16
  replace hlo : 862344 ≤ q := by omega
  by_cases hc862344 : q ≤ 883423
  · exact chkP_sound c_347_862344 q (by omega) hc862344 hqo h16
  replace hlo : 883424 ≤ q := by omega
  by_cases hc883424 : q ≤ 906839
  · exact chkP_sound c_347_883424 q (by omega) hc883424 hqo h16
  replace hlo : 906840 ≤ q := by omega
  by_cases hc906840 : q ≤ 929063
  · exact chkP_sound c_347_906840 q (by omega) hc906840 hqo h16
  replace hlo : 929064 ≤ q := by omega
  by_cases hc929064 : q ≤ 950639
  · exact chkP_sound c_347_929064 q (by omega) hc929064 hqo h16
  replace hlo : 950640 ≤ q := by omega
  by_cases hc950640 : q ≤ 972139
  · exact chkP_sound c_347_950640 q (by omega) hc950640 hqo h16
  replace hlo : 972140 ≤ q := by omega
  by_cases hc972140 : q ≤ 993943
  · exact chkP_sound c_347_972140 q (by omega) hc972140 hqo h16
  replace hlo : 993944 ≤ q := by omega
  exact chkP_sound c_347_993944 q hlo hhi hqo h16

theorem okp_349 (q : ℕ) (hlo : 365403 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (349 * (349 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 349 (fct 349) (fct 1000) q = true := by
  exact chkP_sound c_349_365403 q hlo hhi hqo h16

theorem okp_353 (q : ℕ) (hlo : 373827 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (353 * (353 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 353 (fct 353) (fct 1000) q = true := by
  exact chkP_sound c_353_373827 q hlo hhi hqo h16

theorem okp_359 (q : ℕ) (hlo : 386643 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (359 * (359 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 359 (fct 359) (fct 1000) q = true := by
  by_cases hc386643 : q ≤ 419459
  · exact chkP_sound c_359_386643 q (by omega) hc386643 hqo h16
  replace hlo : 419460 ≤ q := by omega
  by_cases hc419460 : q ≤ 454859
  · exact chkP_sound c_359_419460 q (by omega) hc419460 hqo h16
  replace hlo : 454860 ≤ q := by omega
  by_cases hc454860 : q ≤ 484955
  · exact chkP_sound c_359_454860 q (by omega) hc454860 hqo h16
  replace hlo : 484956 ≤ q := by omega
  by_cases hc484956 : q ≤ 514499
  · exact chkP_sound c_359_484956 q (by omega) hc484956 hqo h16
  replace hlo : 514500 ≤ q := by omega
  by_cases hc514500 : q ≤ 542251
  · exact chkP_sound c_359_514500 q (by omega) hc514500 hqo h16
  replace hlo : 542252 ≤ q := by omega
  by_cases hc542252 : q ≤ 570595
  · exact chkP_sound c_359_542252 q (by omega) hc542252 hqo h16
  replace hlo : 570596 ≤ q := by omega
  by_cases hc570596 : q ≤ 599899
  · exact chkP_sound c_359_570596 q (by omega) hc570596 hqo h16
  replace hlo : 599900 ≤ q := by omega
  by_cases hc599900 : q ≤ 628171
  · exact chkP_sound c_359_599900 q (by omega) hc599900 hqo h16
  replace hlo : 628172 ≤ q := by omega
  by_cases hc628172 : q ≤ 653539
  · exact chkP_sound c_359_628172 q (by omega) hc628172 hqo h16
  replace hlo : 653540 ≤ q := by omega
  by_cases hc653540 : q ≤ 678299
  · exact chkP_sound c_359_653540 q (by omega) hc653540 hqo h16
  replace hlo : 678300 ≤ q := by omega
  by_cases hc678300 : q ≤ 706019
  · exact chkP_sound c_359_678300 q (by omega) hc678300 hqo h16
  replace hlo : 706020 ≤ q := by omega
  by_cases hc706020 : q ≤ 729219
  · exact chkP_sound c_359_706020 q (by omega) hc706020 hqo h16
  replace hlo : 729220 ≤ q := by omega
  by_cases hc729220 : q ≤ 754387
  · exact chkP_sound c_359_729220 q (by omega) hc729220 hqo h16
  replace hlo : 754388 ≤ q := by omega
  by_cases hc754388 : q ≤ 776819
  · exact chkP_sound c_359_754388 q (by omega) hc754388 hqo h16
  replace hlo : 776820 ≤ q := by omega
  by_cases hc776820 : q ≤ 800171
  · exact chkP_sound c_359_776820 q (by omega) hc776820 hqo h16
  replace hlo : 800172 ≤ q := by omega
  by_cases hc800172 : q ≤ 823787
  · exact chkP_sound c_359_800172 q (by omega) hc800172 hqo h16
  replace hlo : 823788 ≤ q := by omega
  by_cases hc823788 : q ≤ 847219
  · exact chkP_sound c_359_823788 q (by omega) hc823788 hqo h16
  replace hlo : 847220 ≤ q := by omega
  by_cases hc847220 : q ≤ 869371
  · exact chkP_sound c_359_847220 q (by omega) hc847220 hqo h16
  replace hlo : 869372 ≤ q := by omega
  by_cases hc869372 : q ≤ 894811
  · exact chkP_sound c_359_869372 q (by omega) hc869372 hqo h16
  replace hlo : 894812 ≤ q := by omega
  by_cases hc894812 : q ≤ 915731
  · exact chkP_sound c_359_894812 q (by omega) hc894812 hqo h16
  replace hlo : 915732 ≤ q := by omega
  by_cases hc915732 : q ≤ 939707
  · exact chkP_sound c_359_915732 q (by omega) hc915732 hqo h16
  replace hlo : 939708 ≤ q := by omega
  by_cases hc939708 : q ≤ 961099
  · exact chkP_sound c_359_939708 q (by omega) hc939708 hqo h16
  replace hlo : 961100 ≤ q := by omega
  by_cases hc961100 : q ≤ 981451
  · exact chkP_sound c_359_961100 q (by omega) hc961100 hqo h16
  replace hlo : 981452 ≤ q := by omega
  exact chkP_sound c_359_981452 q hlo hhi hqo h16

theorem okp_367 (q : ℕ) (hlo : 404067 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (367 * (367 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 367 (fct 367) (fct 1000) q = true := by
  by_cases hc404067 : q ≤ 436819
  · exact chkP_sound c_367_404067 q (by omega) hc404067 hqo h16
  replace hlo : 436820 ≤ q := by omega
  by_cases hc436820 : q ≤ 468059
  · exact chkP_sound c_367_436820 q (by omega) hc436820 hqo h16
  replace hlo : 468060 ≤ q := by omega
  by_cases hc468060 : q ≤ 497051
  · exact chkP_sound c_367_468060 q (by omega) hc468060 hqo h16
  replace hlo : 497052 ≤ q := by omega
  by_cases hc497052 : q ≤ 528779
  · exact chkP_sound c_367_497052 q (by omega) hc497052 hqo h16
  replace hlo : 528780 ≤ q := by omega
  by_cases hc528780 : q ≤ 558683
  · exact chkP_sound c_367_528780 q (by omega) hc528780 hqo h16
  replace hlo : 558684 ≤ q := by omega
  by_cases hc558684 : q ≤ 586123
  · exact chkP_sound c_367_558684 q (by omega) hc558684 hqo h16
  replace hlo : 586124 ≤ q := by omega
  by_cases hc586124 : q ≤ 614099
  · exact chkP_sound c_367_586124 q (by omega) hc586124 hqo h16
  replace hlo : 614100 ≤ q := by omega
  by_cases hc614100 : q ≤ 638107
  · exact chkP_sound c_367_614100 q (by omega) hc614100 hqo h16
  replace hlo : 638108 ≤ q := by omega
  by_cases hc638108 : q ≤ 663763
  · exact chkP_sound c_367_638108 q (by omega) hc638108 hqo h16
  replace hlo : 663764 ≤ q := by omega
  by_cases hc663764 : q ≤ 688939
  · exact chkP_sound c_367_663764 q (by omega) hc663764 hqo h16
  replace hlo : 688940 ≤ q := by omega
  by_cases hc688940 : q ≤ 714139
  · exact chkP_sound c_367_688940 q (by omega) hc688940 hqo h16
  replace hlo : 714140 ≤ q := by omega
  by_cases hc714140 : q ≤ 739307
  · exact chkP_sound c_367_714140 q (by omega) hc714140 hqo h16
  replace hlo : 739308 ≤ q := by omega
  by_cases hc739308 : q ≤ 764851
  · exact chkP_sound c_367_739308 q (by omega) hc739308 hqo h16
  replace hlo : 764852 ≤ q := by omega
  by_cases hc764852 : q ≤ 787483
  · exact chkP_sound c_367_764852 q (by omega) hc764852 hqo h16
  replace hlo : 787484 ≤ q := by omega
  by_cases hc787484 : q ≤ 812051
  · exact chkP_sound c_367_787484 q (by omega) hc787484 hqo h16
  replace hlo : 812052 ≤ q := by omega
  by_cases hc812052 : q ≤ 834299
  · exact chkP_sound c_367_812052 q (by omega) hc812052 hqo h16
  replace hlo : 834300 ≤ q := by omega
  by_cases hc834300 : q ≤ 856019
  · exact chkP_sound c_367_834300 q (by omega) hc834300 hqo h16
  replace hlo : 856020 ≤ q := by omega
  by_cases hc856020 : q ≤ 879979
  · exact chkP_sound c_367_856020 q (by omega) hc856020 hqo h16
  replace hlo : 879980 ≤ q := by omega
  by_cases hc879980 : q ≤ 903803
  · exact chkP_sound c_367_879980 q (by omega) hc879980 hqo h16
  replace hlo : 903804 ≤ q := by omega
  by_cases hc903804 : q ≤ 925691
  · exact chkP_sound c_367_903804 q (by omega) hc903804 hqo h16
  replace hlo : 925692 ≤ q := by omega
  by_cases hc925692 : q ≤ 947203
  · exact chkP_sound c_367_925692 q (by omega) hc925692 hqo h16
  replace hlo : 947204 ≤ q := by omega
  by_cases hc947204 : q ≤ 967667
  · exact chkP_sound c_367_947204 q (by omega) hc947204 hqo h16
  replace hlo : 967668 ≤ q := by omega
  by_cases hc967668 : q ≤ 990043
  · exact chkP_sound c_367_967668 q (by omega) hc967668 hqo h16
  replace hlo : 990044 ≤ q := by omega
  exact chkP_sound c_367_990044 q hlo hhi hqo h16

theorem okp_373 (q : ℕ) (hlo : 417387 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (373 * (373 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 373 (fct 373) (fct 1000) q = true := by
  exact chkP_sound c_373_417387 q hlo hhi hqo h16

theorem okp_379 (q : ℕ) (hlo : 430923 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (379 * (379 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 379 (fct 379) (fct 1000) q = true := by
  by_cases hc430923 : q ≤ 463399
  · exact chkP_sound c_379_430923 q (by omega) hc430923 hqo h16
  replace hlo : 463400 ≤ q := by omega
  by_cases hc463400 : q ≤ 493231
  · exact chkP_sound c_379_463400 q (by omega) hc463400 hqo h16
  replace hlo : 493232 ≤ q := by omega
  by_cases hc493232 : q ≤ 521735
  · exact chkP_sound c_379_493232 q (by omega) hc493232 hqo h16
  replace hlo : 521736 ≤ q := by omega
  by_cases hc521736 : q ≤ 552047
  · exact chkP_sound c_379_521736 q (by omega) hc521736 hqo h16
  replace hlo : 552048 ≤ q := by omega
  by_cases hc552048 : q ≤ 582119
  · exact chkP_sound c_379_552048 q (by omega) hc552048 hqo h16
  replace hlo : 582120 ≤ q := by omega
  by_cases hc582120 : q ≤ 607319
  · exact chkP_sound c_379_582120 q (by omega) hc582120 hqo h16
  replace hlo : 607320 ≤ q := by omega
  by_cases hc607320 : q ≤ 635527
  · exact chkP_sound c_379_607320 q (by omega) hc607320 hqo h16
  replace hlo : 635528 ≤ q := by omega
  by_cases hc635528 : q ≤ 662767
  · exact chkP_sound c_379_635528 q (by omega) hc635528 hqo h16
  replace hlo : 662768 ≤ q := by omega
  by_cases hc662768 : q ≤ 687679
  · exact chkP_sound c_379_662768 q (by omega) hc662768 hqo h16
  replace hlo : 687680 ≤ q := by omega
  by_cases hc687680 : q ≤ 714991
  · exact chkP_sound c_379_687680 q (by omega) hc687680 hqo h16
  replace hlo : 714992 ≤ q := by omega
  by_cases hc714992 : q ≤ 738247
  · exact chkP_sound c_379_714992 q (by omega) hc714992 hqo h16
  replace hlo : 738248 ≤ q := by omega
  by_cases hc738248 : q ≤ 763797
  · exact chkP_sound c_379_738248 q (by omega) hc738248 hqo h16
  replace hlo : 763798 ≤ q := by omega
  by_cases hc763798 : q ≤ 786167
  · exact chkP_sound c_379_763798 q (by omega) hc763798 hqo h16
  replace hlo : 786168 ≤ q := by omega
  by_cases hc786168 : q ≤ 810239
  · exact chkP_sound c_379_786168 q (by omega) hc786168 hqo h16
  replace hlo : 810240 ≤ q := by omega
  by_cases hc810240 : q ≤ 835487
  · exact chkP_sound c_379_810240 q (by omega) hc810240 hqo h16
  replace hlo : 835488 ≤ q := by omega
  by_cases hc835488 : q ≤ 859031
  · exact chkP_sound c_379_835488 q (by omega) hc835488 hqo h16
  replace hlo : 859032 ≤ q := by omega
  by_cases hc859032 : q ≤ 883111
  · exact chkP_sound c_379_859032 q (by omega) hc859032 hqo h16
  replace hlo : 883112 ≤ q := by omega
  by_cases hc883112 : q ≤ 905111
  · exact chkP_sound c_379_883112 q (by omega) hc883112 hqo h16
  replace hlo : 905112 ≤ q := by omega
  by_cases hc905112 : q ≤ 928487
  · exact chkP_sound c_379_905112 q (by omega) hc905112 hqo h16
  replace hlo : 928488 ≤ q := by omega
  by_cases hc928488 : q ≤ 950927
  · exact chkP_sound c_379_928488 q (by omega) hc928488 hqo h16
  replace hlo : 950928 ≤ q := by omega
  by_cases hc950928 : q ≤ 974999
  · exact chkP_sound c_379_950928 q (by omega) hc950928 hqo h16
  replace hlo : 975000 ≤ q := by omega
  by_cases hc975000 : q ≤ 996631
  · exact chkP_sound c_379_975000 q (by omega) hc975000 hqo h16
  replace hlo : 996632 ≤ q := by omega
  exact chkP_sound c_379_996632 q hlo hhi hqo h16

theorem okp_383 (q : ℕ) (hlo : 440067 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (383 * (383 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 383 (fct 383) (fct 1000) q = true := by
  by_cases hc440067 : q ≤ 471571
  · exact chkP_sound c_383_440067 q (by omega) hc440067 hqo h16
  replace hlo : 471572 ≤ q := by omega
  by_cases hc471572 : q ≤ 500923
  · exact chkP_sound c_383_471572 q (by omega) hc471572 hqo h16
  replace hlo : 500924 ≤ q := by omega
  by_cases hc500924 : q ≤ 531573
  · exact chkP_sound c_383_500924 q (by omega) hc500924 hqo h16
  replace hlo : 531574 ≤ q := by omega
  by_cases hc531574 : q ≤ 560243
  · exact chkP_sound c_383_531574 q (by omega) hc531574 hqo h16
  replace hlo : 560244 ≤ q := by omega
  by_cases hc560244 : q ≤ 587579
  · exact chkP_sound c_383_560244 q (by omega) hc560244 hqo h16
  replace hlo : 587580 ≤ q := by omega
  by_cases hc587580 : q ≤ 616003
  · exact chkP_sound c_383_587580 q (by omega) hc587580 hqo h16
  replace hlo : 616004 ≤ q := by omega
  by_cases hc616004 : q ≤ 643883
  · exact chkP_sound c_383_616004 q (by omega) hc616004 hqo h16
  replace hlo : 643884 ≤ q := by omega
  by_cases hc643884 : q ≤ 672691
  · exact chkP_sound c_383_643884 q (by omega) hc643884 hqo h16
  replace hlo : 672692 ≤ q := by omega
  by_cases hc672692 : q ≤ 698171
  · exact chkP_sound c_383_672692 q (by omega) hc672692 hqo h16
  replace hlo : 698172 ≤ q := by omega
  by_cases hc698172 : q ≤ 723739
  · exact chkP_sound c_383_698172 q (by omega) hc698172 hqo h16
  replace hlo : 723740 ≤ q := by omega
  by_cases hc723740 : q ≤ 747619
  · exact chkP_sound c_383_723740 q (by omega) hc723740 hqo h16
  replace hlo : 747620 ≤ q := by omega
  by_cases hc747620 : q ≤ 773659
  · exact chkP_sound c_383_747620 q (by omega) hc747620 hqo h16
  replace hlo : 773660 ≤ q := by omega
  by_cases hc773660 : q ≤ 799683
  · exact chkP_sound c_383_773660 q (by omega) hc773660 hqo h16
  replace hlo : 799684 ≤ q := by omega
  by_cases hc799684 : q ≤ 822939
  · exact chkP_sound c_383_799684 q (by omega) hc799684 hqo h16
  replace hlo : 822940 ≤ q := by omega
  by_cases hc822940 : q ≤ 844651
  · exact chkP_sound c_383_822940 q (by omega) hc822940 hqo h16
  replace hlo : 844652 ≤ q := by omega
  by_cases hc844652 : q ≤ 870283
  · exact chkP_sound c_383_844652 q (by omega) hc844652 hqo h16
  replace hlo : 870284 ≤ q := by omega
  by_cases hc870284 : q ≤ 891563
  · exact chkP_sound c_383_870284 q (by omega) hc870284 hqo h16
  replace hlo : 891564 ≤ q := by omega
  by_cases hc891564 : q ≤ 915851
  · exact chkP_sound c_383_891564 q (by omega) hc891564 hqo h16
  replace hlo : 915852 ≤ q := by omega
  by_cases hc915852 : q ≤ 938243
  · exact chkP_sound c_383_915852 q (by omega) hc915852 hqo h16
  replace hlo : 938244 ≤ q := by omega
  by_cases hc938244 : q ≤ 958499
  · exact chkP_sound c_383_938244 q (by omega) hc938244 hqo h16
  replace hlo : 958500 ≤ q := by omega
  by_cases hc958500 : q ≤ 981419
  · exact chkP_sound c_383_958500 q (by omega) hc958500 hqo h16
  replace hlo : 981420 ≤ q := by omega
  exact chkP_sound c_383_981420 q hlo hhi hqo h16

theorem okp_389 (q : ℕ) (hlo : 453963 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (389 * (389 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 389 (fct 389) (fct 1000) q = true := by
  exact chkP_sound c_389_453963 q hlo hhi hqo h16

theorem okp_397 (q : ℕ) (hlo : 472827 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (397 * (397 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 397 (fct 397) (fct 1000) q = true := by
  exact chkP_sound c_397_472827 q hlo hhi hqo h16

theorem okp_401 (q : ℕ) (hlo : 482403 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (401 * (401 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 401 (fct 401) (fct 1000) q = true := by
  exact chkP_sound c_401_482403 q hlo hhi hqo h16

theorem okp_409 (q : ℕ) (hlo : 501843 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (409 * (409 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 409 (fct 409) (fct 1000) q = true := by
  exact chkP_sound c_409_501843 q hlo hhi hqo h16

theorem okp_419 (q : ℕ) (hlo : 526683 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (419 * (419 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 419 (fct 419) (fct 1000) q = true := by
  by_cases hc526683 : q ≤ 557639
  · exact chkP_sound c_419_526683 q (by omega) hc526683 hqo h16
  replace hlo : 557640 ≤ q := by omega
  by_cases hc557640 : q ≤ 587999
  · exact chkP_sound c_419_557640 q (by omega) hc557640 hqo h16
  replace hlo : 588000 ≤ q := by omega
  by_cases hc588000 : q ≤ 617199
  · exact chkP_sound c_419_588000 q (by omega) hc588000 hqo h16
  replace hlo : 617200 ≤ q := by omega
  by_cases hc617200 : q ≤ 647199
  · exact chkP_sound c_419_617200 q (by omega) hc617200 hqo h16
  replace hlo : 647200 ≤ q := by omega
  by_cases hc647200 : q ≤ 678367
  · exact chkP_sound c_419_647200 q (by omega) hc647200 hqo h16
  replace hlo : 678368 ≤ q := by omega
  by_cases hc678368 : q ≤ 706207
  · exact chkP_sound c_419_678368 q (by omega) hc678368 hqo h16
  replace hlo : 706208 ≤ q := by omega
  by_cases hc706208 : q ≤ 731111
  · exact chkP_sound c_419_706208 q (by omega) hc706208 hqo h16
  replace hlo : 731112 ≤ q := by omega
  by_cases hc731112 : q ≤ 755767
  · exact chkP_sound c_419_731112 q (by omega) hc731112 hqo h16
  replace hlo : 755768 ≤ q := by omega
  by_cases hc755768 : q ≤ 781607
  · exact chkP_sound c_419_755768 q (by omega) hc755768 hqo h16
  replace hlo : 781608 ≤ q := by omega
  by_cases hc781608 : q ≤ 806751
  · exact chkP_sound c_419_781608 q (by omega) hc781608 hqo h16
  replace hlo : 806752 ≤ q := by omega
  by_cases hc806752 : q ≤ 829447
  · exact chkP_sound c_419_806752 q (by omega) hc806752 hqo h16
  replace hlo : 829448 ≤ q := by omega
  by_cases hc829448 : q ≤ 854647
  · exact chkP_sound c_419_829448 q (by omega) hc829448 hqo h16
  replace hlo : 854648 ≤ q := by omega
  by_cases hc854648 : q ≤ 879199
  · exact chkP_sound c_419_854648 q (by omega) hc854648 hqo h16
  replace hlo : 879200 ≤ q := by omega
  by_cases hc879200 : q ≤ 906007
  · exact chkP_sound c_419_879200 q (by omega) hc879200 hqo h16
  replace hlo : 906008 ≤ q := by omega
  by_cases hc906008 : q ≤ 928871
  · exact chkP_sound c_419_906008 q (by omega) hc906008 hqo h16
  replace hlo : 928872 ≤ q := by omega
  by_cases hc928872 : q ≤ 952151
  · exact chkP_sound c_419_928872 q (by omega) hc928872 hqo h16
  replace hlo : 952152 ≤ q := by omega
  by_cases hc952152 : q ≤ 976471
  · exact chkP_sound c_419_952152 q (by omega) hc952152 hqo h16
  replace hlo : 976472 ≤ q := by omega
  by_cases hc976472 : q ≤ 996631
  · exact chkP_sound c_419_976472 q (by omega) hc976472 hqo h16
  replace hlo : 996632 ≤ q := by omega
  exact chkP_sound c_419_996632 q hlo hhi hqo h16

theorem okp_421 (q : ℕ) (hlo : 531723 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (421 * (421 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 421 (fct 421) (fct 1000) q = true := by
  exact chkP_sound c_421_531723 q hlo hhi hqo h16

theorem okp_431 (q : ℕ) (hlo : 557283 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (431 * (431 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 431 (fct 431) (fct 1000) q = true := by
  by_cases hc557283 : q ≤ 587747
  · exact chkP_sound c_431_557283 q (by omega) hc557283 hqo h16
  replace hlo : 587748 ≤ q := by omega
  by_cases hc587748 : q ≤ 617731
  · exact chkP_sound c_431_587748 q (by omega) hc587748 hqo h16
  replace hlo : 617732 ≤ q := by omega
  by_cases hc617732 : q ≤ 646771
  · exact chkP_sound c_431_617732 q (by omega) hc617732 hqo h16
  replace hlo : 646772 ≤ q := by omega
  by_cases hc646772 : q ≤ 673427
  · exact chkP_sound c_431_646772 q (by omega) hc646772 hqo h16
  replace hlo : 673428 ≤ q := by omega
  by_cases hc673428 : q ≤ 703499
  · exact chkP_sound c_431_673428 q (by omega) hc673428 hqo h16
  replace hlo : 703500 ≤ q := by omega
  by_cases hc703500 : q ≤ 729931
  · exact chkP_sound c_431_703500 q (by omega) hc703500 hqo h16
  replace hlo : 729932 ≤ q := by omega
  by_cases hc729932 : q ≤ 757595
  · exact chkP_sound c_431_729932 q (by omega) hc729932 hqo h16
  replace hlo : 757596 ≤ q := by omega
  by_cases hc757596 : q ≤ 785443
  · exact chkP_sound c_431_757596 q (by omega) hc757596 hqo h16
  replace hlo : 785444 ≤ q := by omega
  by_cases hc785444 : q ≤ 810571
  · exact chkP_sound c_431_785444 q (by omega) hc785444 hqo h16
  replace hlo : 810572 ≤ q := by omega
  by_cases hc810572 : q ≤ 836611
  · exact chkP_sound c_431_810572 q (by omega) hc810572 hqo h16
  replace hlo : 836612 ≤ q := by omega
  by_cases hc836612 : q ≤ 862883
  · exact chkP_sound c_431_836612 q (by omega) hc836612 hqo h16
  replace hlo : 862884 ≤ q := by omega
  by_cases hc862884 : q ≤ 887947
  · exact chkP_sound c_431_862884 q (by omega) hc862884 hqo h16
  replace hlo : 887948 ≤ q := by omega
  by_cases hc887948 : q ≤ 911147
  · exact chkP_sound c_431_887948 q (by omega) hc887948 hqo h16
  replace hlo : 911148 ≤ q := by omega
  by_cases hc911148 : q ≤ 935459
  · exact chkP_sound c_431_911148 q (by omega) hc911148 hqo h16
  replace hlo : 935460 ≤ q := by omega
  by_cases hc935460 : q ≤ 960139
  · exact chkP_sound c_431_935460 q (by omega) hc935460 hqo h16
  replace hlo : 960140 ≤ q := by omega
  by_cases hc960140 : q ≤ 984091
  · exact chkP_sound c_431_960140 q (by omega) hc960140 hqo h16
  replace hlo : 984092 ≤ q := by omega
  exact chkP_sound c_431_984092 q hlo hhi hqo h16

theorem okp_433 (q : ℕ) (hlo : 562467 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (433 * (433 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 433 (fct 433) (fct 1000) q = true := by
  exact chkP_sound c_433_562467 q hlo hhi hqo h16

theorem okp_439 (q : ℕ) (hlo : 578163 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (439 * (439 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 439 (fct 439) (fct 1000) q = true := by
  by_cases hc578163 : q ≤ 610331
  · exact chkP_sound c_439_578163 q (by omega) hc578163 hqo h16
  replace hlo : 610332 ≤ q := by omega
  by_cases hc610332 : q ≤ 640499
  · exact chkP_sound c_439_610332 q (by omega) hc610332 hqo h16
  replace hlo : 640500 ≤ q := by omega
  by_cases hc640500 : q ≤ 669587
  · exact chkP_sound c_439_640500 q (by omega) hc640500 hqo h16
  replace hlo : 669588 ≤ q := by omega
  by_cases hc669588 : q ≤ 697691
  · exact chkP_sound c_439_669588 q (by omega) hc669588 hqo h16
  replace hlo : 697692 ≤ q := by omega
  by_cases hc697692 : q ≤ 724747
  · exact chkP_sound c_439_697692 q (by omega) hc697692 hqo h16
  replace hlo : 724748 ≤ q := by omega
  by_cases hc724748 : q ≤ 753811
  · exact chkP_sound c_439_724748 q (by omega) hc724748 hqo h16
  replace hlo : 753812 ≤ q := by omega
  by_cases hc753812 : q ≤ 780859
  · exact chkP_sound c_439_753812 q (by omega) hc753812 hqo h16
  replace hlo : 780860 ≤ q := by omega
  by_cases hc780860 : q ≤ 805811
  · exact chkP_sound c_439_780860 q (by omega) hc780860 hqo h16
  replace hlo : 805812 ≤ q := by omega
  by_cases hc805812 : q ≤ 827539
  · exact chkP_sound c_439_805812 q (by omega) hc805812 hqo h16
  replace hlo : 827540 ≤ q := by omega
  by_cases hc827540 : q ≤ 853387
  · exact chkP_sound c_439_827540 q (by omega) hc827540 hqo h16
  replace hlo : 853388 ≤ q := by omega
  by_cases hc853388 : q ≤ 878939
  · exact chkP_sound c_439_853388 q (by omega) hc853388 hqo h16
  replace hlo : 878940 ≤ q := by omega
  by_cases hc878940 : q ≤ 904027
  · exact chkP_sound c_439_878940 q (by omega) hc878940 hqo h16
  replace hlo : 904028 ≤ q := by omega
  by_cases hc904028 : q ≤ 928651
  · exact chkP_sound c_439_904028 q (by omega) hc904028 hqo h16
  replace hlo : 928652 ≤ q := by omega
  by_cases hc928652 : q ≤ 951751
  · exact chkP_sound c_439_928652 q (by omega) hc928652 hqo h16
  replace hlo : 951752 ≤ q := by omega
  by_cases hc951752 : q ≤ 977299
  · exact chkP_sound c_439_951752 q (by omega) hc951752 hqo h16
  replace hlo : 977300 ≤ q := by omega
  exact chkP_sound c_439_977300 q hlo hhi hqo h16

theorem okp_443 (q : ℕ) (hlo : 588747 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (443 * (443 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 443 (fct 443) (fct 1000) q = true := by
  by_cases hc588747 : q ≤ 618271
  · exact chkP_sound c_443_588747 q (by omega) hc588747 hqo h16
  replace hlo : 618272 ≤ q := by omega
  by_cases hc618272 : q ≤ 649063
  · exact chkP_sound c_443_618272 q (by omega) hc618272 hqo h16
  replace hlo : 649064 ≤ q := by omega
  by_cases hc649064 : q ≤ 676103
  · exact chkP_sound c_443_649064 q (by omega) hc649064 hqo h16
  replace hlo : 676104 ≤ q := by omega
  by_cases hc676104 : q ≤ 702623
  · exact chkP_sound c_443_676104 q (by omega) hc676104 hqo h16
  replace hlo : 702624 ≤ q := by omega
  by_cases hc702624 : q ≤ 727343
  · exact chkP_sound c_443_702624 q (by omega) hc702624 hqo h16
  replace hlo : 727344 ≤ q := by omega
  by_cases hc727344 : q ≤ 755663
  · exact chkP_sound c_443_727344 q (by omega) hc727344 hqo h16
  replace hlo : 755664 ≤ q := by omega
  by_cases hc755664 : q ≤ 782519
  · exact chkP_sound c_443_755664 q (by omega) hc755664 hqo h16
  replace hlo : 782520 ≤ q := by omega
  by_cases hc782520 : q ≤ 808391
  · exact chkP_sound c_443_782520 q (by omega) hc782520 hqo h16
  replace hlo : 808392 ≤ q := by omega
  by_cases hc808392 : q ≤ 835591
  · exact chkP_sound c_443_808392 q (by omega) hc808392 hqo h16
  replace hlo : 835592 ≤ q := by omega
  by_cases hc835592 : q ≤ 862319
  · exact chkP_sound c_443_835592 q (by omega) hc835592 hqo h16
  replace hlo : 862320 ≤ q := by omega
  by_cases hc862320 : q ≤ 884831
  · exact chkP_sound c_443_862320 q (by omega) hc862320 hqo h16
  replace hlo : 884832 ≤ q := by omega
  by_cases hc884832 : q ≤ 909679
  · exact chkP_sound c_443_884832 q (by omega) hc884832 hqo h16
  replace hlo : 909680 ≤ q := by omega
  by_cases hc909680 : q ≤ 934543
  · exact chkP_sound c_443_909680 q (by omega) hc909680 hqo h16
  replace hlo : 934544 ≤ q := by omega
  by_cases hc934544 : q ≤ 957599
  · exact chkP_sound c_443_934544 q (by omega) hc934544 hqo h16
  replace hlo : 957600 ≤ q := by omega
  by_cases hc957600 : q ≤ 981103
  · exact chkP_sound c_443_957600 q (by omega) hc957600 hqo h16
  replace hlo : 981104 ≤ q := by omega
  exact chkP_sound c_443_981104 q hlo hhi hqo h16

theorem okp_449 (q : ℕ) (hlo : 604803 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (449 * (449 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 449 (fct 449) (fct 1000) q = true := by
  exact chkP_sound c_449_604803 q hlo hhi hqo h16

theorem okp_457 (q : ℕ) (hlo : 626547 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (457 * (457 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 457 (fct 457) (fct 1000) q = true := by
  exact chkP_sound c_457_626547 q hlo hhi hqo h16

theorem okp_461 (q : ℕ) (hlo : 637563 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (461 * (461 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 461 (fct 461) (fct 1000) q = true := by
  exact chkP_sound c_461_637563 q hlo hhi hqo h16

theorem okp_463 (q : ℕ) (hlo : 643107 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (463 * (463 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 463 (fct 463) (fct 1000) q = true := by
  by_cases hc643107 : q ≤ 671003
  · exact chkP_sound c_463_643107 q (by omega) hc643107 hqo h16
  replace hlo : 671004 ≤ q := by omega
  by_cases hc671004 : q ≤ 701819
  · exact chkP_sound c_463_671004 q (by omega) hc671004 hqo h16
  replace hlo : 701820 ≤ q := by omega
  by_cases hc701820 : q ≤ 729979
  · exact chkP_sound c_463_701820 q (by omega) hc701820 hqo h16
  replace hlo : 729980 ≤ q := by omega
  by_cases hc729980 : q ≤ 758299
  · exact chkP_sound c_463_729980 q (by omega) hc729980 hqo h16
  replace hlo : 758300 ≤ q := by omega
  by_cases hc758300 : q ≤ 785963
  · exact chkP_sound c_463_758300 q (by omega) hc758300 hqo h16
  replace hlo : 785964 ≤ q := by omega
  by_cases hc785964 : q ≤ 813083
  · exact chkP_sound c_463_785964 q (by omega) hc785964 hqo h16
  replace hlo : 813084 ≤ q := by omega
  by_cases hc813084 : q ≤ 837731
  · exact chkP_sound c_463_813084 q (by omega) hc813084 hqo h16
  replace hlo : 837732 ≤ q := by omega
  by_cases hc837732 : q ≤ 863299
  · exact chkP_sound c_463_837732 q (by omega) hc837732 hqo h16
  replace hlo : 863300 ≤ q := by omega
  by_cases hc863300 : q ≤ 888163
  · exact chkP_sound c_463_863300 q (by omega) hc863300 hqo h16
  replace hlo : 888164 ≤ q := by omega
  by_cases hc888164 : q ≤ 913331
  · exact chkP_sound c_463_888164 q (by omega) hc888164 hqo h16
  replace hlo : 913332 ≤ q := by omega
  by_cases hc913332 : q ≤ 939611
  · exact chkP_sound c_463_913332 q (by omega) hc913332 hqo h16
  replace hlo : 939612 ≤ q := by omega
  by_cases hc939612 : q ≤ 963261
  · exact chkP_sound c_463_939612 q (by omega) hc939612 hqo h16
  replace hlo : 963262 ≤ q := by omega
  by_cases hc963262 : q ≤ 989171
  · exact chkP_sound c_463_963262 q (by omega) hc963262 hqo h16
  replace hlo : 989172 ≤ q := by omega
  exact chkP_sound c_463_989172 q hlo hhi hqo h16

theorem okp_467 (q : ℕ) (hlo : 654267 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (467 * (467 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 467 (fct 467) (fct 1000) q = true := by
  by_cases hc654267 : q ≤ 684799
  · exact chkP_sound c_467_654267 q (by omega) hc654267 hqo h16
  replace hlo : 684800 ≤ q := by omega
  by_cases hc684800 : q ≤ 713351
  · exact chkP_sound c_467_684800 q (by omega) hc684800 hqo h16
  replace hlo : 713352 ≤ q := by omega
  by_cases hc713352 : q ≤ 738863
  · exact chkP_sound c_467_713352 q (by omega) hc713352 hqo h16
  replace hlo : 738864 ≤ q := by omega
  by_cases hc738864 : q ≤ 768671
  · exact chkP_sound c_467_738864 q (by omega) hc738864 hqo h16
  replace hlo : 768672 ≤ q := by omega
  by_cases hc768672 : q ≤ 795647
  · exact chkP_sound c_467_768672 q (by omega) hc768672 hqo h16
  replace hlo : 795648 ≤ q := by omega
  by_cases hc795648 : q ≤ 822743
  · exact chkP_sound c_467_795648 q (by omega) hc795648 hqo h16
  replace hlo : 822744 ≤ q := by omega
  by_cases hc822744 : q ≤ 848511
  · exact chkP_sound c_467_822744 q (by omega) hc822744 hqo h16
  replace hlo : 848512 ≤ q := by omega
  by_cases hc848512 : q ≤ 872959
  · exact chkP_sound c_467_848512 q (by omega) hc848512 hqo h16
  replace hlo : 872960 ≤ q := by omega
  by_cases hc872960 : q ≤ 898519
  · exact chkP_sound c_467_872960 q (by omega) hc872960 hqo h16
  replace hlo : 898520 ≤ q := by omega
  by_cases hc898520 : q ≤ 923399
  · exact chkP_sound c_467_898520 q (by omega) hc898520 hqo h16
  replace hlo : 923400 ≤ q := by omega
  by_cases hc923400 : q ≤ 946783
  · exact chkP_sound c_467_923400 q (by omega) hc923400 hqo h16
  replace hlo : 946784 ≤ q := by omega
  by_cases hc946784 : q ≤ 971143
  · exact chkP_sound c_467_946784 q (by omega) hc946784 hqo h16
  replace hlo : 971144 ≤ q := by omega
  by_cases hc971144 : q ≤ 995119
  · exact chkP_sound c_467_971144 q (by omega) hc971144 hqo h16
  replace hlo : 995120 ≤ q := by omega
  exact chkP_sound c_467_995120 q hlo hhi hqo h16

theorem okp_479 (q : ℕ) (hlo : 688323 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (479 * (479 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 479 (fct 479) (fct 1000) q = true := by
  by_cases hc688323 : q ≤ 715531
  · exact chkP_sound c_479_688323 q (by omega) hc688323 hqo h16
  replace hlo : 715532 ≤ q := by omega
  by_cases hc715532 : q ≤ 748635
  · exact chkP_sound c_479_715532 q (by omega) hc715532 hqo h16
  replace hlo : 748636 ≤ q := by omega
  by_cases hc748636 : q ≤ 776947
  · exact chkP_sound c_479_748636 q (by omega) hc748636 hqo h16
  replace hlo : 776948 ≤ q := by omega
  by_cases hc776948 : q ≤ 805859
  · exact chkP_sound c_479_776948 q (by omega) hc776948 hqo h16
  replace hlo : 805860 ≤ q := by omega
  by_cases hc805860 : q ≤ 832787
  · exact chkP_sound c_479_805860 q (by omega) hc805860 hqo h16
  replace hlo : 832788 ≤ q := by omega
  by_cases hc832788 : q ≤ 860235
  · exact chkP_sound c_479_832788 q (by omega) hc832788 hqo h16
  replace hlo : 860236 ≤ q := by omega
  by_cases hc860236 : q ≤ 886985
  · exact chkP_sound c_479_860236 q (by omega) hc860236 hqo h16
  replace hlo : 886986 ≤ q := by omega
  by_cases hc886986 : q ≤ 911707
  · exact chkP_sound c_479_886986 q (by omega) hc886986 hqo h16
  replace hlo : 911708 ≤ q := by omega
  by_cases hc911708 : q ≤ 936547
  · exact chkP_sound c_479_911708 q (by omega) hc911708 hqo h16
  replace hlo : 936548 ≤ q := by omega
  by_cases hc936548 : q ≤ 962697
  · exact chkP_sound c_479_936548 q (by omega) hc936548 hqo h16
  replace hlo : 962698 ≤ q := by omega
  by_cases hc962698 : q ≤ 989411
  · exact chkP_sound c_479_962698 q (by omega) hc962698 hqo h16
  replace hlo : 989412 ≤ q := by omega
  exact chkP_sound c_479_989412 q hlo hhi hqo h16

theorem okp_487 (q : ℕ) (hlo : 711507 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (487 * (487 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 487 (fct 487) (fct 1000) q = true := by
  by_cases hc711507 : q ≤ 741043
  · exact chkP_sound c_487_711507 q (by omega) hc711507 hqo h16
  replace hlo : 741044 ≤ q := by omega
  by_cases hc741044 : q ≤ 770123
  · exact chkP_sound c_487_741044 q (by omega) hc741044 hqo h16
  replace hlo : 770124 ≤ q := by omega
  by_cases hc770124 : q ≤ 799979
  · exact chkP_sound c_487_770124 q (by omega) hc770124 hqo h16
  replace hlo : 799980 ≤ q := by omega
  by_cases hc799980 : q ≤ 826499
  · exact chkP_sound c_487_799980 q (by omega) hc799980 hqo h16
  replace hlo : 826500 ≤ q := by omega
  by_cases hc826500 : q ≤ 852235
  · exact chkP_sound c_487_826500 q (by omega) hc826500 hqo h16
  replace hlo : 852236 ≤ q := by omega
  by_cases hc852236 : q ≤ 882179
  · exact chkP_sound c_487_852236 q (by omega) hc852236 hqo h16
  replace hlo : 882180 ≤ q := by omega
  by_cases hc882180 : q ≤ 910451
  · exact chkP_sound c_487_882180 q (by omega) hc882180 hqo h16
  replace hlo : 910452 ≤ q := by omega
  by_cases hc910452 : q ≤ 935651
  · exact chkP_sound c_487_910452 q (by omega) hc910452 hqo h16
  replace hlo : 935652 ≤ q := by omega
  by_cases hc935652 : q ≤ 959451
  · exact chkP_sound c_487_935652 q (by omega) hc935652 hqo h16
  replace hlo : 959452 ≤ q := by omega
  by_cases hc959452 : q ≤ 985451
  · exact chkP_sound c_487_959452 q (by omega) hc959452 hqo h16
  replace hlo : 985452 ≤ q := by omega
  exact chkP_sound c_487_985452 q hlo hhi hqo h16

theorem okp_491 (q : ℕ) (hlo : 723243 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (491 * (491 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 491 (fct 491) (fct 1000) q = true := by
  by_cases hc723243 : q ≤ 751447
  · exact chkP_sound c_491_723243 q (by omega) hc723243 hqo h16
  replace hlo : 751448 ≤ q := by omega
  by_cases hc751448 : q ≤ 778023
  · exact chkP_sound c_491_751448 q (by omega) hc751448 hqo h16
  replace hlo : 778024 ≤ q := by omega
  by_cases hc778024 : q ≤ 805991
  · exact chkP_sound c_491_778024 q (by omega) hc778024 hqo h16
  replace hlo : 805992 ≤ q := by omega
  by_cases hc805992 : q ≤ 835831
  · exact chkP_sound c_491_805992 q (by omega) hc805992 hqo h16
  replace hlo : 835832 ≤ q := by omega
  by_cases hc835832 : q ≤ 863279
  · exact chkP_sound c_491_835832 q (by omega) hc835832 hqo h16
  replace hlo : 863280 ≤ q := by omega
  by_cases hc863280 : q ≤ 888759
  · exact chkP_sound c_491_863280 q (by omega) hc863280 hqo h16
  replace hlo : 888760 ≤ q := by omega
  by_cases hc888760 : q ≤ 913687
  · exact chkP_sound c_491_888760 q (by omega) hc888760 hqo h16
  replace hlo : 913688 ≤ q := by omega
  by_cases hc913688 : q ≤ 939237
  · exact chkP_sound c_491_913688 q (by omega) hc913688 hqo h16
  replace hlo : 939238 ≤ q := by omega
  by_cases hc939238 : q ≤ 964927
  · exact chkP_sound c_491_939238 q (by omega) hc939238 hqo h16
  replace hlo : 964928 ≤ q := by omega
  by_cases hc964928 : q ≤ 989567
  · exact chkP_sound c_491_964928 q (by omega) hc964928 hqo h16
  replace hlo : 989568 ≤ q := by omega
  exact chkP_sound c_491_989568 q hlo hhi hqo h16

theorem okp_499 (q : ℕ) (hlo : 747003 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (499 * (499 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 499 (fct 499) (fct 1000) q = true := by
  by_cases hc747003 : q ≤ 776599
  · exact chkP_sound c_499_747003 q (by omega) hc747003 hqo h16
  replace hlo : 776600 ≤ q := by omega
  by_cases hc776600 : q ≤ 806167
  · exact chkP_sound c_499_776600 q (by omega) hc776600 hqo h16
  replace hlo : 806168 ≤ q := by omega
  by_cases hc806168 : q ≤ 834151
  · exact chkP_sound c_499_806168 q (by omega) hc806168 hqo h16
  replace hlo : 834152 ≤ q := by omega
  by_cases hc834152 : q ≤ 862487
  · exact chkP_sound c_499_834152 q (by omega) hc834152 hqo h16
  replace hlo : 862488 ≤ q := by omega
  by_cases hc862488 : q ≤ 890711
  · exact chkP_sound c_499_862488 q (by omega) hc862488 hqo h16
  replace hlo : 890712 ≤ q := by omega
  by_cases hc890712 : q ≤ 915759
  · exact chkP_sound c_499_890712 q (by omega) hc890712 hqo h16
  replace hlo : 915760 ≤ q := by omega
  by_cases hc915760 : q ≤ 942103
  · exact chkP_sound c_499_915760 q (by omega) hc915760 hqo h16
  replace hlo : 942104 ≤ q := by omega
  by_cases hc942104 : q ≤ 968359
  · exact chkP_sound c_499_942104 q (by omega) hc942104 hqo h16
  replace hlo : 968360 ≤ q := by omega
  by_cases hc968360 : q ≤ 990967
  · exact chkP_sound c_499_968360 q (by omega) hc968360 hqo h16
  replace hlo : 990968 ≤ q := by omega
  exact chkP_sound c_499_990968 q hlo hhi hqo h16

theorem okp_503 (q : ℕ) (hlo : 759027 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (503 * (503 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 503 (fct 503) (fct 1000) q = true := by
  by_cases hc759027 : q ≤ 786971
  · exact chkP_sound c_503_759027 q (by omega) hc759027 hqo h16
  replace hlo : 786972 ≤ q := by omega
  by_cases hc786972 : q ≤ 816547
  · exact chkP_sound c_503_786972 q (by omega) hc786972 hqo h16
  replace hlo : 816548 ≤ q := by omega
  by_cases hc816548 : q ≤ 844499
  · exact chkP_sound c_503_816548 q (by omega) hc816548 hqo h16
  replace hlo : 844500 ≤ q := by omega
  by_cases hc844500 : q ≤ 872731
  · exact chkP_sound c_503_844500 q (by omega) hc844500 hqo h16
  replace hlo : 872732 ≤ q := by omega
  by_cases hc872732 : q ≤ 898691
  · exact chkP_sound c_503_872732 q (by omega) hc872732 hqo h16
  replace hlo : 898692 ≤ q := by omega
  by_cases hc898692 : q ≤ 922283
  · exact chkP_sound c_503_898692 q (by omega) hc898692 hqo h16
  replace hlo : 922284 ≤ q := by omega
  by_cases hc922284 : q ≤ 947259
  · exact chkP_sound c_503_922284 q (by omega) hc922284 hqo h16
  replace hlo : 947260 ≤ q := by omega
  by_cases hc947260 : q ≤ 971171
  · exact chkP_sound c_503_947260 q (by omega) hc947260 hqo h16
  replace hlo : 971172 ≤ q := by omega
  by_cases hc971172 : q ≤ 998243
  · exact chkP_sound c_503_971172 q (by omega) hc971172 hqo h16
  replace hlo : 998244 ≤ q := by omega
  exact chkP_sound c_503_998244 q hlo hhi hqo h16

theorem okp_509 (q : ℕ) (hlo : 777243 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (509 * (509 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 509 (fct 509) (fct 1000) q = true := by
  exact chkP_sound c_509_777243 q hlo hhi hqo h16

theorem okp_521 (q : ℕ) (hlo : 814323 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (521 * (521 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 521 (fct 521) (fct 1000) q = true := by
  exact chkP_sound c_521_814323 q hlo hhi hqo h16

theorem okp_523 (q : ℕ) (hlo : 820587 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (523 * (523 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 523 (fct 523) (fct 1000) q = true := by
  by_cases hc820587 : q ≤ 852263
  · exact chkP_sound c_523_820587 q (by omega) hc820587 hqo h16
  replace hlo : 852264 ≤ q := by omega
  by_cases hc852264 : q ≤ 879983
  · exact chkP_sound c_523_852264 q (by omega) hc852264 hqo h16
  replace hlo : 879984 ≤ q := by omega
  by_cases hc879984 : q ≤ 908391
  · exact chkP_sound c_523_879984 q (by omega) hc879984 hqo h16
  replace hlo : 908392 ≤ q := by omega
  by_cases hc908392 : q ≤ 933575
  · exact chkP_sound c_523_908392 q (by omega) hc908392 hqo h16
  replace hlo : 933576 ≤ q := by omega
  by_cases hc933576 : q ≤ 959479
  · exact chkP_sound c_523_933576 q (by omega) hc933576 hqo h16
  replace hlo : 959480 ≤ q := by omega
  by_cases hc959480 : q ≤ 981263
  · exact chkP_sound c_523_959480 q (by omega) hc959480 hqo h16
  replace hlo : 981264 ≤ q := by omega
  exact chkP_sound c_523_981264 q hlo hhi hqo h16

theorem okp_541 (q : ℕ) (hlo : 878043 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (541 * (541 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 541 (fct 541) (fct 1000) q = true := by
  exact chkP_sound c_541_878043 q hlo hhi hqo h16

theorem okp_547 (q : ℕ) (hlo : 897627 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (547 * (547 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 547 (fct 547) (fct 1000) q = true := by
  by_cases hc897627 : q ≤ 924551
  · exact chkP_sound c_547_897627 q (by omega) hc897627 hqo h16
  replace hlo : 924552 ≤ q := by omega
  by_cases hc924552 : q ≤ 952279
  · exact chkP_sound c_547_924552 q (by omega) hc924552 hqo h16
  replace hlo : 952280 ≤ q := by omega
  by_cases hc952280 : q ≤ 976479
  · exact chkP_sound c_547_952280 q (by omega) hc952280 hqo h16
  replace hlo : 976480 ≤ q := by omega
  exact chkP_sound c_547_976480 q hlo hhi hqo h16

theorem okp_557 (q : ℕ) (hlo : 930747 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (557 * (557 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 557 (fct 557) (fct 1000) q = true := by
  exact chkP_sound c_557_930747 q hlo hhi hqo h16

theorem okp_563 (q : ℕ) (hlo : 950907 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (563 * (563 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 563 (fct 563) (fct 1000) q = true := by
  by_cases hc950907 : q ≤ 978079
  · exact chkP_sound c_563_950907 q (by omega) hc950907 hqo h16
  replace hlo : 978080 ≤ q := by omega
  exact chkP_sound c_563_978080 q hlo hhi hqo h16

theorem okp_569 (q : ℕ) (hlo : 971283 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (569 * (569 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 569 (fct 569) (fct 1000) q = true := by
  exact chkP_sound c_569_971283 q hlo hhi hqo h16

theorem okp_571 (q : ℕ) (hlo : 978123 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (571 * (571 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 571 (fct 571) (fct 1000) q = true := by
  exact chkP_sound c_571_978123 q hlo hhi hqo h16

theorem okp_577 (q : ℕ) (hlo : 998787 ≤ q) (hhi : q ≤ 1000000) (hqo : q % 2 = 1)
    (h16 : (577 * (577 - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ 577 (fct 577) (fct 1000) q = true := by
  exact chkP_sound c_577_998787 q hlo hhi hqo h16

/-- A Boolean primality test by trial division. -/
def isPr (n : ℕ) : Bool := (List.range n).all fun m => m < 2 || n % m != 0

lemma isPr_of_prime {n : ℕ} (hn : n.Prime) : isPr n = true := by
  unfold isPr
  rw [List.all_eq_true]
  intro m hm
  rw [List.mem_range] at hm
  simp only [Bool.or_eq_true, decide_eq_true_eq, bne_iff_ne, ne_eq]
  by_contra hcon
  push_neg at hcon
  have hdvd : m ∣ n := Nat.dvd_of_mod_eq_zero hcon.2
  rcases hn.eq_one_or_self_of_dvd m hdvd with h | h <;> omega

/-- The primes in `[5, 577]`. -/
theorem primes_cover : ∀ p, p < 578 → 5 ≤ p → isPr p = true →
    p ∈ ([5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563, 569, 571, 577] : List ℕ) := by
  decide +kernel

/-- **Kernel coverage.** -/
theorem chkQ_all {p q : ℕ} (hp : p.Prime) (hp5 : 5 ≤ p) (hp577 : p ≤ 577) (hlo : 3 * p * p ≤ q)
    (hhi : q ≤ 1000000) (hqo : q % 2 = 1) (h16 : (p * (p - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ p (fct p) (fct 1000) q = true := by
  have hmem := primes_cover p (by omega) hp5 (isPr_of_prime hp)
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hmem
  obtain rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl := hmem
  · exact okp_5 q (by omega) hhi hqo h16
  · exact okp_7 q (by omega) hhi hqo h16
  · exact okp_11 q (by omega) hhi hqo h16
  · exact okp_13 q (by omega) hhi hqo h16
  · exact okp_17 q (by omega) hhi hqo h16
  · exact okp_19 q (by omega) hhi hqo h16
  · exact okp_23 q (by omega) hhi hqo h16
  · exact okp_29 q (by omega) hhi hqo h16
  · exact okp_31 q (by omega) hhi hqo h16
  · exact okp_37 q (by omega) hhi hqo h16
  · exact okp_41 q (by omega) hhi hqo h16
  · exact okp_43 q (by omega) hhi hqo h16
  · exact okp_47 q (by omega) hhi hqo h16
  · exact okp_53 q (by omega) hhi hqo h16
  · exact okp_59 q (by omega) hhi hqo h16
  · exact okp_61 q (by omega) hhi hqo h16
  · exact okp_67 q (by omega) hhi hqo h16
  · exact okp_71 q (by omega) hhi hqo h16
  · exact okp_73 q (by omega) hhi hqo h16
  · exact okp_79 q (by omega) hhi hqo h16
  · exact okp_83 q (by omega) hhi hqo h16
  · exact okp_89 q (by omega) hhi hqo h16
  · exact okp_97 q (by omega) hhi hqo h16
  · exact okp_101 q (by omega) hhi hqo h16
  · exact okp_103 q (by omega) hhi hqo h16
  · exact okp_107 q (by omega) hhi hqo h16
  · exact okp_109 q (by omega) hhi hqo h16
  · exact okp_113 q (by omega) hhi hqo h16
  · exact okp_127 q (by omega) hhi hqo h16
  · exact okp_131 q (by omega) hhi hqo h16
  · exact okp_137 q (by omega) hhi hqo h16
  · exact okp_139 q (by omega) hhi hqo h16
  · exact okp_149 q (by omega) hhi hqo h16
  · exact okp_151 q (by omega) hhi hqo h16
  · exact okp_157 q (by omega) hhi hqo h16
  · exact okp_163 q (by omega) hhi hqo h16
  · exact okp_167 q (by omega) hhi hqo h16
  · exact okp_173 q (by omega) hhi hqo h16
  · exact okp_179 q (by omega) hhi hqo h16
  · exact okp_181 q (by omega) hhi hqo h16
  · exact okp_191 q (by omega) hhi hqo h16
  · exact okp_193 q (by omega) hhi hqo h16
  · exact okp_197 q (by omega) hhi hqo h16
  · exact okp_199 q (by omega) hhi hqo h16
  · exact okp_211 q (by omega) hhi hqo h16
  · exact okp_223 q (by omega) hhi hqo h16
  · exact okp_227 q (by omega) hhi hqo h16
  · exact okp_229 q (by omega) hhi hqo h16
  · exact okp_233 q (by omega) hhi hqo h16
  · exact okp_239 q (by omega) hhi hqo h16
  · exact okp_241 q (by omega) hhi hqo h16
  · exact okp_251 q (by omega) hhi hqo h16
  · exact okp_257 q (by omega) hhi hqo h16
  · exact okp_263 q (by omega) hhi hqo h16
  · exact okp_269 q (by omega) hhi hqo h16
  · exact okp_271 q (by omega) hhi hqo h16
  · exact okp_277 q (by omega) hhi hqo h16
  · exact okp_281 q (by omega) hhi hqo h16
  · exact okp_283 q (by omega) hhi hqo h16
  · exact okp_293 q (by omega) hhi hqo h16
  · exact okp_307 q (by omega) hhi hqo h16
  · exact okp_311 q (by omega) hhi hqo h16
  · exact okp_313 q (by omega) hhi hqo h16
  · exact okp_317 q (by omega) hhi hqo h16
  · exact okp_331 q (by omega) hhi hqo h16
  · exact okp_337 q (by omega) hhi hqo h16
  · exact okp_347 q (by omega) hhi hqo h16
  · exact okp_349 q (by omega) hhi hqo h16
  · exact okp_353 q (by omega) hhi hqo h16
  · exact okp_359 q (by omega) hhi hqo h16
  · exact okp_367 q (by omega) hhi hqo h16
  · exact okp_373 q (by omega) hhi hqo h16
  · exact okp_379 q (by omega) hhi hqo h16
  · exact okp_383 q (by omega) hhi hqo h16
  · exact okp_389 q (by omega) hhi hqo h16
  · exact okp_397 q (by omega) hhi hqo h16
  · exact okp_401 q (by omega) hhi hqo h16
  · exact okp_409 q (by omega) hhi hqo h16
  · exact okp_419 q (by omega) hhi hqo h16
  · exact okp_421 q (by omega) hhi hqo h16
  · exact okp_431 q (by omega) hhi hqo h16
  · exact okp_433 q (by omega) hhi hqo h16
  · exact okp_439 q (by omega) hhi hqo h16
  · exact okp_443 q (by omega) hhi hqo h16
  · exact okp_449 q (by omega) hhi hqo h16
  · exact okp_457 q (by omega) hhi hqo h16
  · exact okp_461 q (by omega) hhi hqo h16
  · exact okp_463 q (by omega) hhi hqo h16
  · exact okp_467 q (by omega) hhi hqo h16
  · exact okp_479 q (by omega) hhi hqo h16
  · exact okp_487 q (by omega) hhi hqo h16
  · exact okp_491 q (by omega) hhi hqo h16
  · exact okp_499 q (by omega) hhi hqo h16
  · exact okp_503 q (by omega) hhi hqo h16
  · exact okp_509 q (by omega) hhi hqo h16
  · exact okp_521 q (by omega) hhi hqo h16
  · exact okp_523 q (by omega) hhi hqo h16
  · exact okp_541 q (by omega) hhi hqo h16
  · exact okp_547 q (by omega) hhi hqo h16
  · exact okp_557 q (by omega) hhi hqo h16
  · exact okp_563 q (by omega) hhi hqo h16
  · exact okp_569 q (by omega) hhi hqo h16
  · exact okp_571 q (by omega) hhi hqo h16
  · exact okp_577 q (by omega) hhi hqo h16

end Omega4Q

end P2qJumps
