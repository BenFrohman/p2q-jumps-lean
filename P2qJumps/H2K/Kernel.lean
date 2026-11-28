/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.H2K.Sound
import P2qJumps.H2K.Kernel.C000
import P2qJumps.H2K.Kernel.C001
import P2qJumps.H2K.Kernel.C002
import P2qJumps.H2K.Kernel.C003
import P2qJumps.H2K.Kernel.C004
import P2qJumps.H2K.Kernel.C005
import P2qJumps.H2K.Kernel.C006
import P2qJumps.H2K.Kernel.C007
import P2qJumps.H2K.Kernel.C008
import P2qJumps.H2K.Kernel.C009
import P2qJumps.H2K.Kernel.C010
import P2qJumps.H2K.Kernel.C011
import P2qJumps.H2K.Kernel.C012
import P2qJumps.H2K.Kernel.C013
import P2qJumps.H2K.Kernel.C014
import P2qJumps.H2K.Kernel.C015
import P2qJumps.H2K.Kernel.C016
import P2qJumps.H2K.Kernel.C017
import P2qJumps.H2K.Kernel.C018
import P2qJumps.H2K.Kernel.C019
import P2qJumps.H2K.Kernel.C020
import P2qJumps.H2K.Kernel.C021
import P2qJumps.H2K.Kernel.C022
import P2qJumps.H2K.Kernel.C023
import P2qJumps.H2K.Kernel.C024
import P2qJumps.H2K.Kernel.C025
import P2qJumps.H2K.Kernel.C026
import P2qJumps.H2K.Kernel.C027
import P2qJumps.H2K.Kernel.C028
import P2qJumps.H2K.Kernel.C029
import P2qJumps.H2K.Kernel.C030
import P2qJumps.H2K.Kernel.C031
import P2qJumps.H2K.Kernel.C032
import P2qJumps.H2K.Kernel.C033
import P2qJumps.H2K.Kernel.C034
import P2qJumps.H2K.Kernel.C035
import P2qJumps.H2K.Kernel.C036
import P2qJumps.H2K.Kernel.C037
import P2qJumps.H2K.Kernel.C038
import P2qJumps.H2K.Kernel.C039
import P2qJumps.H2K.Kernel.C040
import P2qJumps.H2K.Kernel.C041
import P2qJumps.H2K.Kernel.C042
import P2qJumps.H2K.Kernel.C043
import P2qJumps.H2K.Kernel.C044
import P2qJumps.H2K.Kernel.C045
import P2qJumps.H2K.Kernel.C046
import P2qJumps.H2K.Kernel.C047
import P2qJumps.H2K.Kernel.C048
import P2qJumps.H2K.Kernel.C049
import P2qJumps.H2K.Kernel.C050
import P2qJumps.H2K.Kernel.C051
import P2qJumps.H2K.Kernel.C052
import P2qJumps.H2K.Kernel.C053
import P2qJumps.H2K.Kernel.C054
import P2qJumps.H2K.Kernel.C055
import P2qJumps.H2K.Kernel.C056
import P2qJumps.H2K.Kernel.C057
import P2qJumps.H2K.Kernel.C058
import P2qJumps.H2K.Kernel.C059
import P2qJumps.H2K.Kernel.C060
import P2qJumps.H2K.Kernel.C061
import P2qJumps.H2K.Kernel.C062
import P2qJumps.H2K.Kernel.C063
import P2qJumps.H2K.Kernel.C064
import P2qJumps.H2K.Kernel.C065
import P2qJumps.H2K.Kernel.C066
import P2qJumps.H2K.Kernel.C067
import P2qJumps.H2K.Kernel.C068
import P2qJumps.H2K.Kernel.C069
import P2qJumps.H2K.Kernel.C070
import P2qJumps.H2K.Kernel.C071
import P2qJumps.H2K.Kernel.C072
import P2qJumps.H2K.Kernel.C073
import P2qJumps.H2K.Kernel.C074
import P2qJumps.H2K.Kernel.C075
import P2qJumps.H2K.Kernel.C076
import P2qJumps.H2K.Kernel.C077
import P2qJumps.H2K.Kernel.C078
import P2qJumps.H2K.Kernel.C079
import P2qJumps.H2K.Kernel.C080
import P2qJumps.H2K.Kernel.C081
import P2qJumps.H2K.Kernel.C082
import P2qJumps.H2K.Kernel.C083
import P2qJumps.H2K.Kernel.C084
import P2qJumps.H2K.Kernel.C085
import P2qJumps.H2K.Kernel.C086
import P2qJumps.H2K.Kernel.C087
import P2qJumps.H2K.Kernel.C088
import P2qJumps.H2K.Kernel.C089
import P2qJumps.H2K.Kernel.C090
import P2qJumps.H2K.Kernel.C091
import P2qJumps.H2K.Kernel.C092
import P2qJumps.H2K.Kernel.C093
import P2qJumps.H2K.Kernel.C094
import P2qJumps.H2K.Kernel.C095
import P2qJumps.H2K.Kernel.C096
import P2qJumps.H2K.Kernel.C097
import P2qJumps.H2K.Kernel.C098
import P2qJumps.H2K.Kernel.C099
import P2qJumps.H2K.Kernel.C100
import P2qJumps.H2K.Kernel.C101
import P2qJumps.H2K.Kernel.C102
import P2qJumps.H2K.Kernel.C103
import P2qJumps.H2K.Kernel.C104
import P2qJumps.H2K.Kernel.C105
import P2qJumps.H2K.Kernel.C106
import P2qJumps.H2K.Kernel.C107
import P2qJumps.H2K.Kernel.C108
import P2qJumps.H2K.Kernel.C109
import P2qJumps.H2K.Kernel.C110
import P2qJumps.H2K.Kernel.C111
import P2qJumps.H2K.Kernel.C112
import P2qJumps.H2K.Kernel.C113
import P2qJumps.H2K.Kernel.C114
import P2qJumps.H2K.Kernel.C115
import P2qJumps.H2K.Kernel.C116
import P2qJumps.H2K.Kernel.C117
import P2qJumps.H2K.Kernel.C118
import P2qJumps.H2K.Kernel.C119
import P2qJumps.H2K.Kernel.C120
import P2qJumps.H2K.Kernel.C121
import P2qJumps.H2K.Kernel.C122
import P2qJumps.H2K.Kernel.C123
import P2qJumps.H2K.Kernel.C124
import P2qJumps.H2K.Kernel.C125
import P2qJumps.H2K.Kernel.C126
import P2qJumps.H2K.Kernel.C127
import P2qJumps.H2K.Kernel.C128
import P2qJumps.H2K.Kernel.C129
import P2qJumps.H2K.Kernel.C130
import P2qJumps.H2K.Kernel.C131
import P2qJumps.H2K.Kernel.C132
import P2qJumps.H2K.Kernel.C133
import P2qJumps.H2K.Kernel.C134
import P2qJumps.H2K.Kernel.C135
import P2qJumps.H2K.Kernel.C136
import P2qJumps.H2K.Kernel.C137
import P2qJumps.H2K.Kernel.C138
import P2qJumps.H2K.Kernel.C139
import P2qJumps.H2K.Kernel.C140
import P2qJumps.H2K.Kernel.C141
import P2qJumps.H2K.Kernel.C142
import P2qJumps.H2K.Kernel.C143
import P2qJumps.H2K.Kernel.C144
import P2qJumps.H2K.Kernel.C145
import P2qJumps.H2K.Kernel.C146
import P2qJumps.H2K.Kernel.C147
import P2qJumps.H2K.Kernel.C148
import P2qJumps.H2K.Kernel.C149
import P2qJumps.H2K.Kernel.C150
import P2qJumps.H2K.Kernel.C151
import P2qJumps.H2K.Kernel.C152
import P2qJumps.H2K.Kernel.C153
import P2qJumps.H2K.Kernel.C154
import P2qJumps.H2K.Kernel.C155
import P2qJumps.H2K.Kernel.C156
import P2qJumps.H2K.Kernel.C157
import P2qJumps.H2K.Kernel.C158
import P2qJumps.H2K.Kernel.C159
import P2qJumps.H2K.Kernel.C160
import P2qJumps.H2K.Kernel.C161
import P2qJumps.H2K.Kernel.C162
import P2qJumps.H2K.Kernel.C163
import P2qJumps.H2K.Kernel.C164
import P2qJumps.H2K.Kernel.C165
import P2qJumps.H2K.Kernel.C166
import P2qJumps.H2K.Kernel.C167
import P2qJumps.H2K.Kernel.C168
import P2qJumps.H2K.Kernel.C169
import P2qJumps.H2K.Kernel.C170
import P2qJumps.H2K.Kernel.C171
import P2qJumps.H2K.Kernel.C172
import P2qJumps.H2K.Kernel.C173
import P2qJumps.H2K.Kernel.C174
import P2qJumps.H2K.Kernel.C175
import P2qJumps.H2K.Kernel.C176
import P2qJumps.H2K.Kernel.C177
import P2qJumps.H2K.Kernel.C178
import P2qJumps.H2K.Kernel.C179
import P2qJumps.H2K.Kernel.C180
import P2qJumps.H2K.Kernel.C181
import P2qJumps.H2K.Kernel.C182
import P2qJumps.H2K.Kernel.C183
import P2qJumps.H2K.Kernel.C184
import P2qJumps.H2K.Kernel.C185
import P2qJumps.H2K.Kernel.C186
import P2qJumps.H2K.Kernel.C187
import P2qJumps.H2K.Kernel.C188
import P2qJumps.H2K.Kernel.C189
import P2qJumps.H2K.Kernel.C190
import P2qJumps.H2K.Kernel.C191
import P2qJumps.H2K.Kernel.C192
import P2qJumps.H2K.Kernel.C193
import P2qJumps.H2K.Kernel.C194
import P2qJumps.H2K.Kernel.C195
import P2qJumps.H2K.Kernel.C196
import P2qJumps.H2K.Kernel.C197
import P2qJumps.H2K.Kernel.C198
import P2qJumps.H2K.Kernel.C199
import P2qJumps.H2K.Kernel.C200
import P2qJumps.H2K.Kernel.C201
import P2qJumps.H2K.Kernel.C202
import P2qJumps.H2K.Kernel.C203
import P2qJumps.H2K.Kernel.C204
import P2qJumps.H2K.Kernel.C205
import P2qJumps.H2K.Kernel.C206
import P2qJumps.H2K.Kernel.C207
import P2qJumps.H2K.Kernel.C208
import P2qJumps.H2K.Kernel.C209
import P2qJumps.H2K.Kernel.C210
import P2qJumps.H2K.Kernel.C211
import P2qJumps.H2K.Kernel.C212
import P2qJumps.H2K.Kernel.C213
import P2qJumps.H2K.Kernel.C214
import P2qJumps.H2K.Kernel.C215
import P2qJumps.H2K.Kernel.C216
import P2qJumps.H2K.Kernel.C217
import P2qJumps.H2K.Kernel.C218
import P2qJumps.H2K.Kernel.C219
import P2qJumps.H2K.Kernel.C220
import P2qJumps.H2K.Kernel.C221
import P2qJumps.H2K.Kernel.C222
import P2qJumps.H2K.Kernel.C223
import P2qJumps.H2K.Kernel.C224
import P2qJumps.H2K.Kernel.C225
import P2qJumps.H2K.Kernel.C226
import P2qJumps.H2K.Kernel.C227
import P2qJumps.H2K.Kernel.C228
import P2qJumps.H2K.Kernel.C229
import P2qJumps.H2K.Kernel.C230
import P2qJumps.H2K.Kernel.C231
import P2qJumps.H2K.Kernel.C232
import P2qJumps.H2K.Kernel.C233
import P2qJumps.H2K.Kernel.C234
import P2qJumps.H2K.Kernel.C235
import P2qJumps.H2K.Kernel.C236
import P2qJumps.H2K.Kernel.C237
import P2qJumps.H2K.Kernel.C238
import P2qJumps.H2K.Kernel.C239
import P2qJumps.H2K.Kernel.C240
import P2qJumps.H2K.Kernel.C241
import P2qJumps.H2K.Kernel.C242
import P2qJumps.H2K.Kernel.C243
import P2qJumps.H2K.Kernel.C244
import P2qJumps.H2K.Kernel.C245
import P2qJumps.H2K.Kernel.C246
import P2qJumps.H2K.Kernel.C247
import P2qJumps.H2K.Kernel.C248
import P2qJumps.H2K.Kernel.C249
import P2qJumps.H2K.Kernel.C250
import P2qJumps.H2K.Kernel.C251
import P2qJumps.H2K.Kernel.C252
import P2qJumps.H2K.Kernel.C253
import P2qJumps.H2K.Kernel.C254
import P2qJumps.H2K.Kernel.C255
import P2qJumps.H2K.Kernel.C256
import P2qJumps.H2K.Kernel.C257
import P2qJumps.H2K.Kernel.C258
import P2qJumps.H2K.Kernel.C259
import P2qJumps.H2K.Kernel.C260
import P2qJumps.H2K.Kernel.C261
import P2qJumps.H2K.Kernel.C262
import P2qJumps.H2K.Kernel.C263
import P2qJumps.H2K.Kernel.C264
import P2qJumps.H2K.Kernel.C265
import P2qJumps.H2K.Kernel.C266
import P2qJumps.H2K.Kernel.C267
import P2qJumps.H2K.Kernel.C268
import P2qJumps.H2K.Kernel.C269
import P2qJumps.H2K.Kernel.C270
import P2qJumps.H2K.Kernel.C271
import P2qJumps.H2K.Kernel.C272
import P2qJumps.H2K.Kernel.C273
import P2qJumps.H2K.Kernel.C274
import P2qJumps.H2K.Kernel.C275
import P2qJumps.H2K.Kernel.C276
import P2qJumps.H2K.Kernel.C277
import P2qJumps.H2K.Kernel.C278
import P2qJumps.H2K.Kernel.C279
import P2qJumps.H2K.Kernel.C280
import P2qJumps.H2K.Kernel.C281
import P2qJumps.H2K.Kernel.C282
import P2qJumps.H2K.Kernel.C283
import P2qJumps.H2K.Kernel.C284
import P2qJumps.H2K.Kernel.C285
import P2qJumps.H2K.Kernel.C286
import P2qJumps.H2K.Kernel.C287
import P2qJumps.H2K.Kernel.C288
import P2qJumps.H2K.Kernel.C289
import P2qJumps.H2K.Kernel.C290
import P2qJumps.H2K.Kernel.C291
import P2qJumps.H2K.Kernel.C292
import P2qJumps.H2K.Kernel.C293
import P2qJumps.H2K.Kernel.C294
import P2qJumps.H2K.Kernel.C295
import P2qJumps.H2K.Kernel.C296
import P2qJumps.H2K.Kernel.C297
import P2qJumps.H2K.Kernel.C298
import P2qJumps.H2K.Kernel.C299
import P2qJumps.H2K.Kernel.C300
import P2qJumps.H2K.Kernel.C301
import P2qJumps.H2K.Kernel.C302
import P2qJumps.H2K.Kernel.C303
import P2qJumps.H2K.Kernel.C304
import P2qJumps.H2K.Kernel.C305
import P2qJumps.H2K.Kernel.C306
import P2qJumps.H2K.Kernel.C307
import P2qJumps.H2K.Kernel.C308
import P2qJumps.H2K.Kernel.C309
import P2qJumps.H2K.Kernel.C310
import P2qJumps.H2K.Kernel.C311
import P2qJumps.H2K.Kernel.C312
import P2qJumps.H2K.Kernel.C313
import P2qJumps.H2K.Kernel.C314
import P2qJumps.H2K.Kernel.C315
import P2qJumps.H2K.Kernel.C316
import P2qJumps.H2K.Kernel.C317
import P2qJumps.H2K.Kernel.C318
import P2qJumps.H2K.Kernel.C319
import P2qJumps.H2K.Kernel.C320
import P2qJumps.H2K.Kernel.C321
import P2qJumps.H2K.Kernel.C322
import P2qJumps.H2K.Kernel.C323
import P2qJumps.H2K.Kernel.C324
import P2qJumps.H2K.Kernel.C325
import P2qJumps.H2K.Kernel.C326
import P2qJumps.H2K.Kernel.C327
import P2qJumps.H2K.Kernel.C328
import P2qJumps.H2K.Kernel.C329
import P2qJumps.H2K.Kernel.C330
import P2qJumps.H2K.Kernel.C331
import P2qJumps.H2K.Kernel.C332
import P2qJumps.H2K.Kernel.C333
import P2qJumps.H2K.Kernel.C334
import P2qJumps.H2K.Kernel.C335
import P2qJumps.H2K.Kernel.C336
import P2qJumps.H2K.Kernel.C337
import P2qJumps.H2K.Kernel.C338
import P2qJumps.H2K.Kernel.C339
import P2qJumps.H2K.Kernel.C340
import P2qJumps.H2K.Kernel.C341
import P2qJumps.H2K.Kernel.C342
import P2qJumps.H2K.Kernel.C343
import P2qJumps.H2K.Kernel.C344
import P2qJumps.H2K.Kernel.C345
import P2qJumps.H2K.Kernel.C346
import P2qJumps.H2K.Kernel.C347
import P2qJumps.H2K.Kernel.C348
import P2qJumps.H2K.Kernel.C349
import P2qJumps.H2K.Kernel.C350
import P2qJumps.H2K.Kernel.C351
import P2qJumps.H2K.Kernel.C352
import P2qJumps.H2K.Kernel.C353
import P2qJumps.H2K.Kernel.C354
import P2qJumps.H2K.Kernel.C355
import P2qJumps.H2K.Kernel.C356
import P2qJumps.H2K.Kernel.C357
import P2qJumps.H2K.Kernel.C358
import P2qJumps.H2K.Kernel.C359
import P2qJumps.H2K.Kernel.C360
import P2qJumps.H2K.Kernel.C361
import P2qJumps.H2K.Kernel.C362
import P2qJumps.H2K.Kernel.C363
import P2qJumps.H2K.Kernel.C364
import P2qJumps.H2K.Kernel.C365
import P2qJumps.H2K.Kernel.C366
import P2qJumps.H2K.Kernel.C367
import P2qJumps.H2K.Kernel.C368
import P2qJumps.H2K.Kernel.C369
import P2qJumps.H2K.Kernel.C370
import P2qJumps.H2K.Kernel.C371
import P2qJumps.H2K.Kernel.C372
import P2qJumps.H2K.Kernel.C373
import P2qJumps.H2K.Kernel.C374
import P2qJumps.H2K.Kernel.C375
import P2qJumps.H2K.Kernel.C376
import P2qJumps.H2K.Kernel.C377
import P2qJumps.H2K.Kernel.C378
import P2qJumps.H2K.Kernel.C379
import P2qJumps.H2K.Kernel.C380
import P2qJumps.H2K.Kernel.C381
import P2qJumps.H2K.Kernel.C382
import P2qJumps.H2K.Kernel.C383
import P2qJumps.H2K.Kernel.C384
import P2qJumps.H2K.Kernel.C385
import P2qJumps.H2K.Kernel.C386
import P2qJumps.H2K.Kernel.C387
import P2qJumps.H2K.Kernel.C388
import P2qJumps.H2K.Kernel.C389
import P2qJumps.H2K.Kernel.C390
import P2qJumps.H2K.Kernel.C391
import P2qJumps.H2K.Kernel.C392
import P2qJumps.H2K.Kernel.C393
import P2qJumps.H2K.Kernel.C394
import P2qJumps.H2K.Kernel.C395
import P2qJumps.H2K.Kernel.C396
import P2qJumps.H2K.Kernel.C397
import P2qJumps.H2K.Kernel.C398
import P2qJumps.H2K.Kernel.C399
import P2qJumps.H2K.Kernel.C400
import P2qJumps.H2K.Kernel.C401
import P2qJumps.H2K.Kernel.C402
import P2qJumps.H2K.Kernel.C403
import P2qJumps.H2K.Kernel.C404
import P2qJumps.H2K.Kernel.C405
import P2qJumps.H2K.Kernel.C406
import P2qJumps.H2K.Kernel.C407
import P2qJumps.H2K.Kernel.C408
import P2qJumps.H2K.Kernel.C409
import P2qJumps.H2K.Kernel.C410
import P2qJumps.H2K.Kernel.C411
import P2qJumps.H2K.Kernel.C412
import P2qJumps.H2K.Kernel.C413
import P2qJumps.H2K.Kernel.C414
import P2qJumps.H2K.Kernel.C415
import P2qJumps.H2K.Kernel.C416
import P2qJumps.H2K.Kernel.C417
import P2qJumps.H2K.Kernel.C418
import P2qJumps.H2K.Kernel.C419
import P2qJumps.H2K.Kernel.C420
import P2qJumps.H2K.Kernel.C421
import P2qJumps.H2K.Kernel.C422
import P2qJumps.H2K.Kernel.C423
import P2qJumps.H2K.Kernel.C424
import P2qJumps.H2K.Kernel.C425
import P2qJumps.H2K.Kernel.C426
import P2qJumps.H2K.Kernel.C427
import P2qJumps.H2K.Kernel.C428
import P2qJumps.H2K.Kernel.C429
import P2qJumps.H2K.Kernel.C430
import P2qJumps.H2K.Kernel.C431
import P2qJumps.H2K.Kernel.C432
import P2qJumps.H2K.Kernel.C433
import P2qJumps.H2K.Kernel.C434
import P2qJumps.H2K.Kernel.C435
import P2qJumps.H2K.Kernel.C436
import P2qJumps.H2K.Kernel.C437
import P2qJumps.H2K.Kernel.C438
import P2qJumps.H2K.Kernel.C439
import P2qJumps.H2K.Kernel.C440
import P2qJumps.H2K.Kernel.C441
import P2qJumps.H2K.Kernel.C442
import P2qJumps.H2K.Kernel.C443
import P2qJumps.H2K.Kernel.C444
import P2qJumps.H2K.Kernel.C445
import P2qJumps.H2K.Kernel.C446
import P2qJumps.H2K.Kernel.C447
import P2qJumps.H2K.Kernel.C448
import P2qJumps.H2K.Kernel.C449
import P2qJumps.H2K.Kernel.C450
import P2qJumps.H2K.Kernel.C451
import P2qJumps.H2K.Kernel.C452
import P2qJumps.H2K.Kernel.C453
import P2qJumps.H2K.Kernel.C454
import P2qJumps.H2K.Kernel.C455
import P2qJumps.H2K.Kernel.C456
import P2qJumps.H2K.Kernel.C457
import P2qJumps.H2K.Kernel.C458
import P2qJumps.H2K.Kernel.C459
import P2qJumps.H2K.Kernel.C460
import P2qJumps.H2K.Kernel.C461
import P2qJumps.H2K.Kernel.C462
import P2qJumps.H2K.Kernel.C463
import P2qJumps.H2K.Kernel.C464
import P2qJumps.H2K.Kernel.C465
import P2qJumps.H2K.Kernel.C466
import P2qJumps.H2K.Kernel.C467
import P2qJumps.H2K.Kernel.C468
import P2qJumps.H2K.Kernel.C469
import P2qJumps.H2K.Kernel.C470
import P2qJumps.H2K.Kernel.C471
import P2qJumps.H2K.Kernel.C472
import P2qJumps.H2K.Kernel.C473
import P2qJumps.H2K.Kernel.C474
import P2qJumps.H2K.Kernel.C475
import P2qJumps.H2K.Kernel.C476
import P2qJumps.H2K.Kernel.C477
import P2qJumps.H2K.Kernel.C478
import P2qJumps.H2K.Kernel.C479
import P2qJumps.H2K.Kernel.C480
import P2qJumps.H2K.Kernel.C481
import P2qJumps.H2K.Kernel.C482
import P2qJumps.H2K.Kernel.C483
import P2qJumps.H2K.Kernel.C484
import P2qJumps.H2K.Kernel.C485
import P2qJumps.H2K.Kernel.C486
import P2qJumps.H2K.Kernel.C487
import P2qJumps.H2K.Kernel.C488
import P2qJumps.H2K.Kernel.C489
import P2qJumps.H2K.Kernel.C490
import P2qJumps.H2K.Kernel.C491
import P2qJumps.H2K.Kernel.C492
import P2qJumps.H2K.Kernel.C493
import P2qJumps.H2K.Kernel.C494
import P2qJumps.H2K.Kernel.C495
import P2qJumps.H2K.Kernel.C496
import P2qJumps.H2K.Kernel.C497
import P2qJumps.H2K.Kernel.C498
import P2qJumps.H2K.Kernel.C499

/-!
# P2qJumps.H2K.Kernel

Assembles the kernel certificates `cert_<lo>` (ranges tiling `[5, 999999]`) with `scan_sound`.
Generated by `scripts/h2/gen_kernel.py`.
-/

namespace P2qJumps

namespace H2K

/-- Every prime `p` with `5 ≤ p ≤ 2004` is `GoodP`. -/
theorem good_C000 (p : ℕ) (hlo : 5 ≤ p) (hhi : p ≤ 2004) (hp : p.Prime) : GoodP p := by
  by_cases hc5 : p ≤ 1004
  · exact scan_sound 1004 _ _ _ cert_5 p hlo hc5 hp
  exact scan_sound 2004 _ _ _ cert_1005 p (Nat.lt_of_not_le hc5) hhi hp

/-- Every prime `p` with `2005 ≤ p ≤ 4004` is `GoodP`. -/
theorem good_C001 (p : ℕ) (hlo : 2005 ≤ p) (hhi : p ≤ 4004) (hp : p.Prime) : GoodP p := by
  by_cases hc2005 : p ≤ 3004
  · exact scan_sound 3004 _ _ _ cert_2005 p hlo hc2005 hp
  exact scan_sound 4004 _ _ _ cert_3005 p (Nat.lt_of_not_le hc2005) hhi hp

/-- Every prime `p` with `4005 ≤ p ≤ 6004` is `GoodP`. -/
theorem good_C002 (p : ℕ) (hlo : 4005 ≤ p) (hhi : p ≤ 6004) (hp : p.Prime) : GoodP p := by
  by_cases hc4005 : p ≤ 5004
  · exact scan_sound 5004 _ _ _ cert_4005 p hlo hc4005 hp
  exact scan_sound 6004 _ _ _ cert_5005 p (Nat.lt_of_not_le hc4005) hhi hp

/-- Every prime `p` with `6005 ≤ p ≤ 8004` is `GoodP`. -/
theorem good_C003 (p : ℕ) (hlo : 6005 ≤ p) (hhi : p ≤ 8004) (hp : p.Prime) : GoodP p := by
  by_cases hc6005 : p ≤ 7004
  · exact scan_sound 7004 _ _ _ cert_6005 p hlo hc6005 hp
  exact scan_sound 8004 _ _ _ cert_7005 p (Nat.lt_of_not_le hc6005) hhi hp

/-- Every prime `p` with `8005 ≤ p ≤ 10004` is `GoodP`. -/
theorem good_C004 (p : ℕ) (hlo : 8005 ≤ p) (hhi : p ≤ 10004) (hp : p.Prime) : GoodP p := by
  by_cases hc8005 : p ≤ 9004
  · exact scan_sound 9004 _ _ _ cert_8005 p hlo hc8005 hp
  exact scan_sound 10004 _ _ _ cert_9005 p (Nat.lt_of_not_le hc8005) hhi hp

/-- Every prime `p` with `10005 ≤ p ≤ 12004` is `GoodP`. -/
theorem good_C005 (p : ℕ) (hlo : 10005 ≤ p) (hhi : p ≤ 12004) (hp : p.Prime) : GoodP p := by
  by_cases hc10005 : p ≤ 11004
  · exact scan_sound 11004 _ _ _ cert_10005 p hlo hc10005 hp
  exact scan_sound 12004 _ _ _ cert_11005 p (Nat.lt_of_not_le hc10005) hhi hp

/-- Every prime `p` with `12005 ≤ p ≤ 14004` is `GoodP`. -/
theorem good_C006 (p : ℕ) (hlo : 12005 ≤ p) (hhi : p ≤ 14004) (hp : p.Prime) : GoodP p := by
  by_cases hc12005 : p ≤ 13004
  · exact scan_sound 13004 _ _ _ cert_12005 p hlo hc12005 hp
  exact scan_sound 14004 _ _ _ cert_13005 p (Nat.lt_of_not_le hc12005) hhi hp

/-- Every prime `p` with `14005 ≤ p ≤ 16004` is `GoodP`. -/
theorem good_C007 (p : ℕ) (hlo : 14005 ≤ p) (hhi : p ≤ 16004) (hp : p.Prime) : GoodP p := by
  by_cases hc14005 : p ≤ 15004
  · exact scan_sound 15004 _ _ _ cert_14005 p hlo hc14005 hp
  exact scan_sound 16004 _ _ _ cert_15005 p (Nat.lt_of_not_le hc14005) hhi hp

/-- Every prime `p` with `16005 ≤ p ≤ 18004` is `GoodP`. -/
theorem good_C008 (p : ℕ) (hlo : 16005 ≤ p) (hhi : p ≤ 18004) (hp : p.Prime) : GoodP p := by
  by_cases hc16005 : p ≤ 17004
  · exact scan_sound 17004 _ _ _ cert_16005 p hlo hc16005 hp
  exact scan_sound 18004 _ _ _ cert_17005 p (Nat.lt_of_not_le hc16005) hhi hp

/-- Every prime `p` with `18005 ≤ p ≤ 20004` is `GoodP`. -/
theorem good_C009 (p : ℕ) (hlo : 18005 ≤ p) (hhi : p ≤ 20004) (hp : p.Prime) : GoodP p := by
  by_cases hc18005 : p ≤ 19004
  · exact scan_sound 19004 _ _ _ cert_18005 p hlo hc18005 hp
  exact scan_sound 20004 _ _ _ cert_19005 p (Nat.lt_of_not_le hc18005) hhi hp

/-- Every prime `p` with `20005 ≤ p ≤ 22004` is `GoodP`. -/
theorem good_C010 (p : ℕ) (hlo : 20005 ≤ p) (hhi : p ≤ 22004) (hp : p.Prime) : GoodP p := by
  by_cases hc20005 : p ≤ 21004
  · exact scan_sound 21004 _ _ _ cert_20005 p hlo hc20005 hp
  exact scan_sound 22004 _ _ _ cert_21005 p (Nat.lt_of_not_le hc20005) hhi hp

/-- Every prime `p` with `22005 ≤ p ≤ 24004` is `GoodP`. -/
theorem good_C011 (p : ℕ) (hlo : 22005 ≤ p) (hhi : p ≤ 24004) (hp : p.Prime) : GoodP p := by
  by_cases hc22005 : p ≤ 23004
  · exact scan_sound 23004 _ _ _ cert_22005 p hlo hc22005 hp
  exact scan_sound 24004 _ _ _ cert_23005 p (Nat.lt_of_not_le hc22005) hhi hp

/-- Every prime `p` with `24005 ≤ p ≤ 26004` is `GoodP`. -/
theorem good_C012 (p : ℕ) (hlo : 24005 ≤ p) (hhi : p ≤ 26004) (hp : p.Prime) : GoodP p := by
  by_cases hc24005 : p ≤ 25004
  · exact scan_sound 25004 _ _ _ cert_24005 p hlo hc24005 hp
  exact scan_sound 26004 _ _ _ cert_25005 p (Nat.lt_of_not_le hc24005) hhi hp

/-- Every prime `p` with `26005 ≤ p ≤ 28004` is `GoodP`. -/
theorem good_C013 (p : ℕ) (hlo : 26005 ≤ p) (hhi : p ≤ 28004) (hp : p.Prime) : GoodP p := by
  by_cases hc26005 : p ≤ 27004
  · exact scan_sound 27004 _ _ _ cert_26005 p hlo hc26005 hp
  exact scan_sound 28004 _ _ _ cert_27005 p (Nat.lt_of_not_le hc26005) hhi hp

/-- Every prime `p` with `28005 ≤ p ≤ 30004` is `GoodP`. -/
theorem good_C014 (p : ℕ) (hlo : 28005 ≤ p) (hhi : p ≤ 30004) (hp : p.Prime) : GoodP p := by
  by_cases hc28005 : p ≤ 29004
  · exact scan_sound 29004 _ _ _ cert_28005 p hlo hc28005 hp
  exact scan_sound 30004 _ _ _ cert_29005 p (Nat.lt_of_not_le hc28005) hhi hp

/-- Every prime `p` with `30005 ≤ p ≤ 32004` is `GoodP`. -/
theorem good_C015 (p : ℕ) (hlo : 30005 ≤ p) (hhi : p ≤ 32004) (hp : p.Prime) : GoodP p := by
  by_cases hc30005 : p ≤ 31004
  · exact scan_sound 31004 _ _ _ cert_30005 p hlo hc30005 hp
  exact scan_sound 32004 _ _ _ cert_31005 p (Nat.lt_of_not_le hc30005) hhi hp

/-- Every prime `p` with `32005 ≤ p ≤ 34004` is `GoodP`. -/
theorem good_C016 (p : ℕ) (hlo : 32005 ≤ p) (hhi : p ≤ 34004) (hp : p.Prime) : GoodP p := by
  by_cases hc32005 : p ≤ 33004
  · exact scan_sound 33004 _ _ _ cert_32005 p hlo hc32005 hp
  exact scan_sound 34004 _ _ _ cert_33005 p (Nat.lt_of_not_le hc32005) hhi hp

/-- Every prime `p` with `34005 ≤ p ≤ 36004` is `GoodP`. -/
theorem good_C017 (p : ℕ) (hlo : 34005 ≤ p) (hhi : p ≤ 36004) (hp : p.Prime) : GoodP p := by
  by_cases hc34005 : p ≤ 35004
  · exact scan_sound 35004 _ _ _ cert_34005 p hlo hc34005 hp
  exact scan_sound 36004 _ _ _ cert_35005 p (Nat.lt_of_not_le hc34005) hhi hp

/-- Every prime `p` with `36005 ≤ p ≤ 38004` is `GoodP`. -/
theorem good_C018 (p : ℕ) (hlo : 36005 ≤ p) (hhi : p ≤ 38004) (hp : p.Prime) : GoodP p := by
  by_cases hc36005 : p ≤ 37004
  · exact scan_sound 37004 _ _ _ cert_36005 p hlo hc36005 hp
  exact scan_sound 38004 _ _ _ cert_37005 p (Nat.lt_of_not_le hc36005) hhi hp

/-- Every prime `p` with `38005 ≤ p ≤ 40004` is `GoodP`. -/
theorem good_C019 (p : ℕ) (hlo : 38005 ≤ p) (hhi : p ≤ 40004) (hp : p.Prime) : GoodP p := by
  by_cases hc38005 : p ≤ 39004
  · exact scan_sound 39004 _ _ _ cert_38005 p hlo hc38005 hp
  exact scan_sound 40004 _ _ _ cert_39005 p (Nat.lt_of_not_le hc38005) hhi hp

/-- Every prime `p` with `40005 ≤ p ≤ 42004` is `GoodP`. -/
theorem good_C020 (p : ℕ) (hlo : 40005 ≤ p) (hhi : p ≤ 42004) (hp : p.Prime) : GoodP p := by
  by_cases hc40005 : p ≤ 41004
  · exact scan_sound 41004 _ _ _ cert_40005 p hlo hc40005 hp
  exact scan_sound 42004 _ _ _ cert_41005 p (Nat.lt_of_not_le hc40005) hhi hp

/-- Every prime `p` with `42005 ≤ p ≤ 44004` is `GoodP`. -/
theorem good_C021 (p : ℕ) (hlo : 42005 ≤ p) (hhi : p ≤ 44004) (hp : p.Prime) : GoodP p := by
  by_cases hc42005 : p ≤ 43004
  · exact scan_sound 43004 _ _ _ cert_42005 p hlo hc42005 hp
  exact scan_sound 44004 _ _ _ cert_43005 p (Nat.lt_of_not_le hc42005) hhi hp

/-- Every prime `p` with `44005 ≤ p ≤ 46004` is `GoodP`. -/
theorem good_C022 (p : ℕ) (hlo : 44005 ≤ p) (hhi : p ≤ 46004) (hp : p.Prime) : GoodP p := by
  by_cases hc44005 : p ≤ 45004
  · exact scan_sound 45004 _ _ _ cert_44005 p hlo hc44005 hp
  exact scan_sound 46004 _ _ _ cert_45005 p (Nat.lt_of_not_le hc44005) hhi hp

/-- Every prime `p` with `46005 ≤ p ≤ 48004` is `GoodP`. -/
theorem good_C023 (p : ℕ) (hlo : 46005 ≤ p) (hhi : p ≤ 48004) (hp : p.Prime) : GoodP p := by
  by_cases hc46005 : p ≤ 47004
  · exact scan_sound 47004 _ _ _ cert_46005 p hlo hc46005 hp
  exact scan_sound 48004 _ _ _ cert_47005 p (Nat.lt_of_not_le hc46005) hhi hp

/-- Every prime `p` with `48005 ≤ p ≤ 50004` is `GoodP`. -/
theorem good_C024 (p : ℕ) (hlo : 48005 ≤ p) (hhi : p ≤ 50004) (hp : p.Prime) : GoodP p := by
  by_cases hc48005 : p ≤ 49004
  · exact scan_sound 49004 _ _ _ cert_48005 p hlo hc48005 hp
  exact scan_sound 50004 _ _ _ cert_49005 p (Nat.lt_of_not_le hc48005) hhi hp

/-- Every prime `p` with `50005 ≤ p ≤ 52004` is `GoodP`. -/
theorem good_C025 (p : ℕ) (hlo : 50005 ≤ p) (hhi : p ≤ 52004) (hp : p.Prime) : GoodP p := by
  by_cases hc50005 : p ≤ 51004
  · exact scan_sound 51004 _ _ _ cert_50005 p hlo hc50005 hp
  exact scan_sound 52004 _ _ _ cert_51005 p (Nat.lt_of_not_le hc50005) hhi hp

/-- Every prime `p` with `52005 ≤ p ≤ 54004` is `GoodP`. -/
theorem good_C026 (p : ℕ) (hlo : 52005 ≤ p) (hhi : p ≤ 54004) (hp : p.Prime) : GoodP p := by
  by_cases hc52005 : p ≤ 53004
  · exact scan_sound 53004 _ _ _ cert_52005 p hlo hc52005 hp
  exact scan_sound 54004 _ _ _ cert_53005 p (Nat.lt_of_not_le hc52005) hhi hp

/-- Every prime `p` with `54005 ≤ p ≤ 56004` is `GoodP`. -/
theorem good_C027 (p : ℕ) (hlo : 54005 ≤ p) (hhi : p ≤ 56004) (hp : p.Prime) : GoodP p := by
  by_cases hc54005 : p ≤ 55004
  · exact scan_sound 55004 _ _ _ cert_54005 p hlo hc54005 hp
  exact scan_sound 56004 _ _ _ cert_55005 p (Nat.lt_of_not_le hc54005) hhi hp

/-- Every prime `p` with `56005 ≤ p ≤ 58004` is `GoodP`. -/
theorem good_C028 (p : ℕ) (hlo : 56005 ≤ p) (hhi : p ≤ 58004) (hp : p.Prime) : GoodP p := by
  by_cases hc56005 : p ≤ 57004
  · exact scan_sound 57004 _ _ _ cert_56005 p hlo hc56005 hp
  exact scan_sound 58004 _ _ _ cert_57005 p (Nat.lt_of_not_le hc56005) hhi hp

/-- Every prime `p` with `58005 ≤ p ≤ 60004` is `GoodP`. -/
theorem good_C029 (p : ℕ) (hlo : 58005 ≤ p) (hhi : p ≤ 60004) (hp : p.Prime) : GoodP p := by
  by_cases hc58005 : p ≤ 59004
  · exact scan_sound 59004 _ _ _ cert_58005 p hlo hc58005 hp
  exact scan_sound 60004 _ _ _ cert_59005 p (Nat.lt_of_not_le hc58005) hhi hp

/-- Every prime `p` with `60005 ≤ p ≤ 62004` is `GoodP`. -/
theorem good_C030 (p : ℕ) (hlo : 60005 ≤ p) (hhi : p ≤ 62004) (hp : p.Prime) : GoodP p := by
  by_cases hc60005 : p ≤ 61004
  · exact scan_sound 61004 _ _ _ cert_60005 p hlo hc60005 hp
  exact scan_sound 62004 _ _ _ cert_61005 p (Nat.lt_of_not_le hc60005) hhi hp

/-- Every prime `p` with `62005 ≤ p ≤ 64004` is `GoodP`. -/
theorem good_C031 (p : ℕ) (hlo : 62005 ≤ p) (hhi : p ≤ 64004) (hp : p.Prime) : GoodP p := by
  by_cases hc62005 : p ≤ 63004
  · exact scan_sound 63004 _ _ _ cert_62005 p hlo hc62005 hp
  exact scan_sound 64004 _ _ _ cert_63005 p (Nat.lt_of_not_le hc62005) hhi hp

/-- Every prime `p` with `64005 ≤ p ≤ 66004` is `GoodP`. -/
theorem good_C032 (p : ℕ) (hlo : 64005 ≤ p) (hhi : p ≤ 66004) (hp : p.Prime) : GoodP p := by
  by_cases hc64005 : p ≤ 65004
  · exact scan_sound 65004 _ _ _ cert_64005 p hlo hc64005 hp
  exact scan_sound 66004 _ _ _ cert_65005 p (Nat.lt_of_not_le hc64005) hhi hp

/-- Every prime `p` with `66005 ≤ p ≤ 68004` is `GoodP`. -/
theorem good_C033 (p : ℕ) (hlo : 66005 ≤ p) (hhi : p ≤ 68004) (hp : p.Prime) : GoodP p := by
  by_cases hc66005 : p ≤ 67004
  · exact scan_sound 67004 _ _ _ cert_66005 p hlo hc66005 hp
  exact scan_sound 68004 _ _ _ cert_67005 p (Nat.lt_of_not_le hc66005) hhi hp

/-- Every prime `p` with `68005 ≤ p ≤ 70004` is `GoodP`. -/
theorem good_C034 (p : ℕ) (hlo : 68005 ≤ p) (hhi : p ≤ 70004) (hp : p.Prime) : GoodP p := by
  by_cases hc68005 : p ≤ 69004
  · exact scan_sound 69004 _ _ _ cert_68005 p hlo hc68005 hp
  exact scan_sound 70004 _ _ _ cert_69005 p (Nat.lt_of_not_le hc68005) hhi hp

/-- Every prime `p` with `70005 ≤ p ≤ 72004` is `GoodP`. -/
theorem good_C035 (p : ℕ) (hlo : 70005 ≤ p) (hhi : p ≤ 72004) (hp : p.Prime) : GoodP p := by
  by_cases hc70005 : p ≤ 71004
  · exact scan_sound 71004 _ _ _ cert_70005 p hlo hc70005 hp
  exact scan_sound 72004 _ _ _ cert_71005 p (Nat.lt_of_not_le hc70005) hhi hp

/-- Every prime `p` with `72005 ≤ p ≤ 74004` is `GoodP`. -/
theorem good_C036 (p : ℕ) (hlo : 72005 ≤ p) (hhi : p ≤ 74004) (hp : p.Prime) : GoodP p := by
  by_cases hc72005 : p ≤ 73004
  · exact scan_sound 73004 _ _ _ cert_72005 p hlo hc72005 hp
  exact scan_sound 74004 _ _ _ cert_73005 p (Nat.lt_of_not_le hc72005) hhi hp

/-- Every prime `p` with `74005 ≤ p ≤ 76004` is `GoodP`. -/
theorem good_C037 (p : ℕ) (hlo : 74005 ≤ p) (hhi : p ≤ 76004) (hp : p.Prime) : GoodP p := by
  by_cases hc74005 : p ≤ 75004
  · exact scan_sound 75004 _ _ _ cert_74005 p hlo hc74005 hp
  exact scan_sound 76004 _ _ _ cert_75005 p (Nat.lt_of_not_le hc74005) hhi hp

/-- Every prime `p` with `76005 ≤ p ≤ 78004` is `GoodP`. -/
theorem good_C038 (p : ℕ) (hlo : 76005 ≤ p) (hhi : p ≤ 78004) (hp : p.Prime) : GoodP p := by
  by_cases hc76005 : p ≤ 77004
  · exact scan_sound 77004 _ _ _ cert_76005 p hlo hc76005 hp
  exact scan_sound 78004 _ _ _ cert_77005 p (Nat.lt_of_not_le hc76005) hhi hp

/-- Every prime `p` with `78005 ≤ p ≤ 80004` is `GoodP`. -/
theorem good_C039 (p : ℕ) (hlo : 78005 ≤ p) (hhi : p ≤ 80004) (hp : p.Prime) : GoodP p := by
  by_cases hc78005 : p ≤ 79004
  · exact scan_sound 79004 _ _ _ cert_78005 p hlo hc78005 hp
  exact scan_sound 80004 _ _ _ cert_79005 p (Nat.lt_of_not_le hc78005) hhi hp

/-- Every prime `p` with `80005 ≤ p ≤ 82004` is `GoodP`. -/
theorem good_C040 (p : ℕ) (hlo : 80005 ≤ p) (hhi : p ≤ 82004) (hp : p.Prime) : GoodP p := by
  by_cases hc80005 : p ≤ 81004
  · exact scan_sound 81004 _ _ _ cert_80005 p hlo hc80005 hp
  exact scan_sound 82004 _ _ _ cert_81005 p (Nat.lt_of_not_le hc80005) hhi hp

/-- Every prime `p` with `82005 ≤ p ≤ 84004` is `GoodP`. -/
theorem good_C041 (p : ℕ) (hlo : 82005 ≤ p) (hhi : p ≤ 84004) (hp : p.Prime) : GoodP p := by
  by_cases hc82005 : p ≤ 83004
  · exact scan_sound 83004 _ _ _ cert_82005 p hlo hc82005 hp
  exact scan_sound 84004 _ _ _ cert_83005 p (Nat.lt_of_not_le hc82005) hhi hp

/-- Every prime `p` with `84005 ≤ p ≤ 86004` is `GoodP`. -/
theorem good_C042 (p : ℕ) (hlo : 84005 ≤ p) (hhi : p ≤ 86004) (hp : p.Prime) : GoodP p := by
  by_cases hc84005 : p ≤ 85004
  · exact scan_sound 85004 _ _ _ cert_84005 p hlo hc84005 hp
  exact scan_sound 86004 _ _ _ cert_85005 p (Nat.lt_of_not_le hc84005) hhi hp

/-- Every prime `p` with `86005 ≤ p ≤ 88004` is `GoodP`. -/
theorem good_C043 (p : ℕ) (hlo : 86005 ≤ p) (hhi : p ≤ 88004) (hp : p.Prime) : GoodP p := by
  by_cases hc86005 : p ≤ 87004
  · exact scan_sound 87004 _ _ _ cert_86005 p hlo hc86005 hp
  exact scan_sound 88004 _ _ _ cert_87005 p (Nat.lt_of_not_le hc86005) hhi hp

/-- Every prime `p` with `88005 ≤ p ≤ 90004` is `GoodP`. -/
theorem good_C044 (p : ℕ) (hlo : 88005 ≤ p) (hhi : p ≤ 90004) (hp : p.Prime) : GoodP p := by
  by_cases hc88005 : p ≤ 89004
  · exact scan_sound 89004 _ _ _ cert_88005 p hlo hc88005 hp
  exact scan_sound 90004 _ _ _ cert_89005 p (Nat.lt_of_not_le hc88005) hhi hp

/-- Every prime `p` with `90005 ≤ p ≤ 92004` is `GoodP`. -/
theorem good_C045 (p : ℕ) (hlo : 90005 ≤ p) (hhi : p ≤ 92004) (hp : p.Prime) : GoodP p := by
  by_cases hc90005 : p ≤ 91004
  · exact scan_sound 91004 _ _ _ cert_90005 p hlo hc90005 hp
  exact scan_sound 92004 _ _ _ cert_91005 p (Nat.lt_of_not_le hc90005) hhi hp

/-- Every prime `p` with `92005 ≤ p ≤ 94004` is `GoodP`. -/
theorem good_C046 (p : ℕ) (hlo : 92005 ≤ p) (hhi : p ≤ 94004) (hp : p.Prime) : GoodP p := by
  by_cases hc92005 : p ≤ 93004
  · exact scan_sound 93004 _ _ _ cert_92005 p hlo hc92005 hp
  exact scan_sound 94004 _ _ _ cert_93005 p (Nat.lt_of_not_le hc92005) hhi hp

/-- Every prime `p` with `94005 ≤ p ≤ 96004` is `GoodP`. -/
theorem good_C047 (p : ℕ) (hlo : 94005 ≤ p) (hhi : p ≤ 96004) (hp : p.Prime) : GoodP p := by
  by_cases hc94005 : p ≤ 95004
  · exact scan_sound 95004 _ _ _ cert_94005 p hlo hc94005 hp
  exact scan_sound 96004 _ _ _ cert_95005 p (Nat.lt_of_not_le hc94005) hhi hp

/-- Every prime `p` with `96005 ≤ p ≤ 98004` is `GoodP`. -/
theorem good_C048 (p : ℕ) (hlo : 96005 ≤ p) (hhi : p ≤ 98004) (hp : p.Prime) : GoodP p := by
  by_cases hc96005 : p ≤ 97004
  · exact scan_sound 97004 _ _ _ cert_96005 p hlo hc96005 hp
  exact scan_sound 98004 _ _ _ cert_97005 p (Nat.lt_of_not_le hc96005) hhi hp

/-- Every prime `p` with `98005 ≤ p ≤ 100004` is `GoodP`. -/
theorem good_C049 (p : ℕ) (hlo : 98005 ≤ p) (hhi : p ≤ 100004) (hp : p.Prime) : GoodP p := by
  by_cases hc98005 : p ≤ 99004
  · exact scan_sound 99004 _ _ _ cert_98005 p hlo hc98005 hp
  exact scan_sound 100004 _ _ _ cert_99005 p (Nat.lt_of_not_le hc98005) hhi hp

/-- Every prime `p` with `100005 ≤ p ≤ 102004` is `GoodP`. -/
theorem good_C050 (p : ℕ) (hlo : 100005 ≤ p) (hhi : p ≤ 102004) (hp : p.Prime) : GoodP p := by
  by_cases hc100005 : p ≤ 101004
  · exact scan_sound 101004 _ _ _ cert_100005 p hlo hc100005 hp
  exact scan_sound 102004 _ _ _ cert_101005 p (Nat.lt_of_not_le hc100005) hhi hp

/-- Every prime `p` with `102005 ≤ p ≤ 104004` is `GoodP`. -/
theorem good_C051 (p : ℕ) (hlo : 102005 ≤ p) (hhi : p ≤ 104004) (hp : p.Prime) : GoodP p := by
  by_cases hc102005 : p ≤ 103004
  · exact scan_sound 103004 _ _ _ cert_102005 p hlo hc102005 hp
  exact scan_sound 104004 _ _ _ cert_103005 p (Nat.lt_of_not_le hc102005) hhi hp

/-- Every prime `p` with `104005 ≤ p ≤ 106004` is `GoodP`. -/
theorem good_C052 (p : ℕ) (hlo : 104005 ≤ p) (hhi : p ≤ 106004) (hp : p.Prime) : GoodP p := by
  by_cases hc104005 : p ≤ 105004
  · exact scan_sound 105004 _ _ _ cert_104005 p hlo hc104005 hp
  exact scan_sound 106004 _ _ _ cert_105005 p (Nat.lt_of_not_le hc104005) hhi hp

/-- Every prime `p` with `106005 ≤ p ≤ 108004` is `GoodP`. -/
theorem good_C053 (p : ℕ) (hlo : 106005 ≤ p) (hhi : p ≤ 108004) (hp : p.Prime) : GoodP p := by
  by_cases hc106005 : p ≤ 107004
  · exact scan_sound 107004 _ _ _ cert_106005 p hlo hc106005 hp
  exact scan_sound 108004 _ _ _ cert_107005 p (Nat.lt_of_not_le hc106005) hhi hp

/-- Every prime `p` with `108005 ≤ p ≤ 110004` is `GoodP`. -/
theorem good_C054 (p : ℕ) (hlo : 108005 ≤ p) (hhi : p ≤ 110004) (hp : p.Prime) : GoodP p := by
  by_cases hc108005 : p ≤ 109004
  · exact scan_sound 109004 _ _ _ cert_108005 p hlo hc108005 hp
  exact scan_sound 110004 _ _ _ cert_109005 p (Nat.lt_of_not_le hc108005) hhi hp

/-- Every prime `p` with `110005 ≤ p ≤ 112004` is `GoodP`. -/
theorem good_C055 (p : ℕ) (hlo : 110005 ≤ p) (hhi : p ≤ 112004) (hp : p.Prime) : GoodP p := by
  by_cases hc110005 : p ≤ 111004
  · exact scan_sound 111004 _ _ _ cert_110005 p hlo hc110005 hp
  exact scan_sound 112004 _ _ _ cert_111005 p (Nat.lt_of_not_le hc110005) hhi hp

/-- Every prime `p` with `112005 ≤ p ≤ 114004` is `GoodP`. -/
theorem good_C056 (p : ℕ) (hlo : 112005 ≤ p) (hhi : p ≤ 114004) (hp : p.Prime) : GoodP p := by
  by_cases hc112005 : p ≤ 113004
  · exact scan_sound 113004 _ _ _ cert_112005 p hlo hc112005 hp
  exact scan_sound 114004 _ _ _ cert_113005 p (Nat.lt_of_not_le hc112005) hhi hp

/-- Every prime `p` with `114005 ≤ p ≤ 116004` is `GoodP`. -/
theorem good_C057 (p : ℕ) (hlo : 114005 ≤ p) (hhi : p ≤ 116004) (hp : p.Prime) : GoodP p := by
  by_cases hc114005 : p ≤ 115004
  · exact scan_sound 115004 _ _ _ cert_114005 p hlo hc114005 hp
  exact scan_sound 116004 _ _ _ cert_115005 p (Nat.lt_of_not_le hc114005) hhi hp

/-- Every prime `p` with `116005 ≤ p ≤ 118004` is `GoodP`. -/
theorem good_C058 (p : ℕ) (hlo : 116005 ≤ p) (hhi : p ≤ 118004) (hp : p.Prime) : GoodP p := by
  by_cases hc116005 : p ≤ 117004
  · exact scan_sound 117004 _ _ _ cert_116005 p hlo hc116005 hp
  exact scan_sound 118004 _ _ _ cert_117005 p (Nat.lt_of_not_le hc116005) hhi hp

/-- Every prime `p` with `118005 ≤ p ≤ 120004` is `GoodP`. -/
theorem good_C059 (p : ℕ) (hlo : 118005 ≤ p) (hhi : p ≤ 120004) (hp : p.Prime) : GoodP p := by
  by_cases hc118005 : p ≤ 119004
  · exact scan_sound 119004 _ _ _ cert_118005 p hlo hc118005 hp
  exact scan_sound 120004 _ _ _ cert_119005 p (Nat.lt_of_not_le hc118005) hhi hp

/-- Every prime `p` with `120005 ≤ p ≤ 122004` is `GoodP`. -/
theorem good_C060 (p : ℕ) (hlo : 120005 ≤ p) (hhi : p ≤ 122004) (hp : p.Prime) : GoodP p := by
  by_cases hc120005 : p ≤ 121004
  · exact scan_sound 121004 _ _ _ cert_120005 p hlo hc120005 hp
  exact scan_sound 122004 _ _ _ cert_121005 p (Nat.lt_of_not_le hc120005) hhi hp

/-- Every prime `p` with `122005 ≤ p ≤ 124004` is `GoodP`. -/
theorem good_C061 (p : ℕ) (hlo : 122005 ≤ p) (hhi : p ≤ 124004) (hp : p.Prime) : GoodP p := by
  by_cases hc122005 : p ≤ 123004
  · exact scan_sound 123004 _ _ _ cert_122005 p hlo hc122005 hp
  exact scan_sound 124004 _ _ _ cert_123005 p (Nat.lt_of_not_le hc122005) hhi hp

/-- Every prime `p` with `124005 ≤ p ≤ 126004` is `GoodP`. -/
theorem good_C062 (p : ℕ) (hlo : 124005 ≤ p) (hhi : p ≤ 126004) (hp : p.Prime) : GoodP p := by
  by_cases hc124005 : p ≤ 125004
  · exact scan_sound 125004 _ _ _ cert_124005 p hlo hc124005 hp
  exact scan_sound 126004 _ _ _ cert_125005 p (Nat.lt_of_not_le hc124005) hhi hp

/-- Every prime `p` with `126005 ≤ p ≤ 128004` is `GoodP`. -/
theorem good_C063 (p : ℕ) (hlo : 126005 ≤ p) (hhi : p ≤ 128004) (hp : p.Prime) : GoodP p := by
  by_cases hc126005 : p ≤ 127004
  · exact scan_sound 127004 _ _ _ cert_126005 p hlo hc126005 hp
  exact scan_sound 128004 _ _ _ cert_127005 p (Nat.lt_of_not_le hc126005) hhi hp

/-- Every prime `p` with `128005 ≤ p ≤ 130004` is `GoodP`. -/
theorem good_C064 (p : ℕ) (hlo : 128005 ≤ p) (hhi : p ≤ 130004) (hp : p.Prime) : GoodP p := by
  by_cases hc128005 : p ≤ 129004
  · exact scan_sound 129004 _ _ _ cert_128005 p hlo hc128005 hp
  exact scan_sound 130004 _ _ _ cert_129005 p (Nat.lt_of_not_le hc128005) hhi hp

/-- Every prime `p` with `130005 ≤ p ≤ 132004` is `GoodP`. -/
theorem good_C065 (p : ℕ) (hlo : 130005 ≤ p) (hhi : p ≤ 132004) (hp : p.Prime) : GoodP p := by
  by_cases hc130005 : p ≤ 131004
  · exact scan_sound 131004 _ _ _ cert_130005 p hlo hc130005 hp
  exact scan_sound 132004 _ _ _ cert_131005 p (Nat.lt_of_not_le hc130005) hhi hp

/-- Every prime `p` with `132005 ≤ p ≤ 134004` is `GoodP`. -/
theorem good_C066 (p : ℕ) (hlo : 132005 ≤ p) (hhi : p ≤ 134004) (hp : p.Prime) : GoodP p := by
  by_cases hc132005 : p ≤ 133004
  · exact scan_sound 133004 _ _ _ cert_132005 p hlo hc132005 hp
  exact scan_sound 134004 _ _ _ cert_133005 p (Nat.lt_of_not_le hc132005) hhi hp

/-- Every prime `p` with `134005 ≤ p ≤ 136004` is `GoodP`. -/
theorem good_C067 (p : ℕ) (hlo : 134005 ≤ p) (hhi : p ≤ 136004) (hp : p.Prime) : GoodP p := by
  by_cases hc134005 : p ≤ 135004
  · exact scan_sound 135004 _ _ _ cert_134005 p hlo hc134005 hp
  exact scan_sound 136004 _ _ _ cert_135005 p (Nat.lt_of_not_le hc134005) hhi hp

/-- Every prime `p` with `136005 ≤ p ≤ 138004` is `GoodP`. -/
theorem good_C068 (p : ℕ) (hlo : 136005 ≤ p) (hhi : p ≤ 138004) (hp : p.Prime) : GoodP p := by
  by_cases hc136005 : p ≤ 137004
  · exact scan_sound 137004 _ _ _ cert_136005 p hlo hc136005 hp
  exact scan_sound 138004 _ _ _ cert_137005 p (Nat.lt_of_not_le hc136005) hhi hp

/-- Every prime `p` with `138005 ≤ p ≤ 140004` is `GoodP`. -/
theorem good_C069 (p : ℕ) (hlo : 138005 ≤ p) (hhi : p ≤ 140004) (hp : p.Prime) : GoodP p := by
  by_cases hc138005 : p ≤ 139004
  · exact scan_sound 139004 _ _ _ cert_138005 p hlo hc138005 hp
  exact scan_sound 140004 _ _ _ cert_139005 p (Nat.lt_of_not_le hc138005) hhi hp

/-- Every prime `p` with `140005 ≤ p ≤ 142004` is `GoodP`. -/
theorem good_C070 (p : ℕ) (hlo : 140005 ≤ p) (hhi : p ≤ 142004) (hp : p.Prime) : GoodP p := by
  by_cases hc140005 : p ≤ 141004
  · exact scan_sound 141004 _ _ _ cert_140005 p hlo hc140005 hp
  exact scan_sound 142004 _ _ _ cert_141005 p (Nat.lt_of_not_le hc140005) hhi hp

/-- Every prime `p` with `142005 ≤ p ≤ 144004` is `GoodP`. -/
theorem good_C071 (p : ℕ) (hlo : 142005 ≤ p) (hhi : p ≤ 144004) (hp : p.Prime) : GoodP p := by
  by_cases hc142005 : p ≤ 143004
  · exact scan_sound 143004 _ _ _ cert_142005 p hlo hc142005 hp
  exact scan_sound 144004 _ _ _ cert_143005 p (Nat.lt_of_not_le hc142005) hhi hp

/-- Every prime `p` with `144005 ≤ p ≤ 146004` is `GoodP`. -/
theorem good_C072 (p : ℕ) (hlo : 144005 ≤ p) (hhi : p ≤ 146004) (hp : p.Prime) : GoodP p := by
  by_cases hc144005 : p ≤ 145004
  · exact scan_sound 145004 _ _ _ cert_144005 p hlo hc144005 hp
  exact scan_sound 146004 _ _ _ cert_145005 p (Nat.lt_of_not_le hc144005) hhi hp

/-- Every prime `p` with `146005 ≤ p ≤ 148004` is `GoodP`. -/
theorem good_C073 (p : ℕ) (hlo : 146005 ≤ p) (hhi : p ≤ 148004) (hp : p.Prime) : GoodP p := by
  by_cases hc146005 : p ≤ 147004
  · exact scan_sound 147004 _ _ _ cert_146005 p hlo hc146005 hp
  exact scan_sound 148004 _ _ _ cert_147005 p (Nat.lt_of_not_le hc146005) hhi hp

/-- Every prime `p` with `148005 ≤ p ≤ 150004` is `GoodP`. -/
theorem good_C074 (p : ℕ) (hlo : 148005 ≤ p) (hhi : p ≤ 150004) (hp : p.Prime) : GoodP p := by
  by_cases hc148005 : p ≤ 149004
  · exact scan_sound 149004 _ _ _ cert_148005 p hlo hc148005 hp
  exact scan_sound 150004 _ _ _ cert_149005 p (Nat.lt_of_not_le hc148005) hhi hp

/-- Every prime `p` with `150005 ≤ p ≤ 152004` is `GoodP`. -/
theorem good_C075 (p : ℕ) (hlo : 150005 ≤ p) (hhi : p ≤ 152004) (hp : p.Prime) : GoodP p := by
  by_cases hc150005 : p ≤ 151004
  · exact scan_sound 151004 _ _ _ cert_150005 p hlo hc150005 hp
  exact scan_sound 152004 _ _ _ cert_151005 p (Nat.lt_of_not_le hc150005) hhi hp

/-- Every prime `p` with `152005 ≤ p ≤ 154004` is `GoodP`. -/
theorem good_C076 (p : ℕ) (hlo : 152005 ≤ p) (hhi : p ≤ 154004) (hp : p.Prime) : GoodP p := by
  by_cases hc152005 : p ≤ 153004
  · exact scan_sound 153004 _ _ _ cert_152005 p hlo hc152005 hp
  exact scan_sound 154004 _ _ _ cert_153005 p (Nat.lt_of_not_le hc152005) hhi hp

/-- Every prime `p` with `154005 ≤ p ≤ 156004` is `GoodP`. -/
theorem good_C077 (p : ℕ) (hlo : 154005 ≤ p) (hhi : p ≤ 156004) (hp : p.Prime) : GoodP p := by
  by_cases hc154005 : p ≤ 155004
  · exact scan_sound 155004 _ _ _ cert_154005 p hlo hc154005 hp
  exact scan_sound 156004 _ _ _ cert_155005 p (Nat.lt_of_not_le hc154005) hhi hp

/-- Every prime `p` with `156005 ≤ p ≤ 158004` is `GoodP`. -/
theorem good_C078 (p : ℕ) (hlo : 156005 ≤ p) (hhi : p ≤ 158004) (hp : p.Prime) : GoodP p := by
  by_cases hc156005 : p ≤ 157004
  · exact scan_sound 157004 _ _ _ cert_156005 p hlo hc156005 hp
  exact scan_sound 158004 _ _ _ cert_157005 p (Nat.lt_of_not_le hc156005) hhi hp

/-- Every prime `p` with `158005 ≤ p ≤ 160004` is `GoodP`. -/
theorem good_C079 (p : ℕ) (hlo : 158005 ≤ p) (hhi : p ≤ 160004) (hp : p.Prime) : GoodP p := by
  by_cases hc158005 : p ≤ 159004
  · exact scan_sound 159004 _ _ _ cert_158005 p hlo hc158005 hp
  exact scan_sound 160004 _ _ _ cert_159005 p (Nat.lt_of_not_le hc158005) hhi hp

/-- Every prime `p` with `160005 ≤ p ≤ 162004` is `GoodP`. -/
theorem good_C080 (p : ℕ) (hlo : 160005 ≤ p) (hhi : p ≤ 162004) (hp : p.Prime) : GoodP p := by
  by_cases hc160005 : p ≤ 161004
  · exact scan_sound 161004 _ _ _ cert_160005 p hlo hc160005 hp
  exact scan_sound 162004 _ _ _ cert_161005 p (Nat.lt_of_not_le hc160005) hhi hp

/-- Every prime `p` with `162005 ≤ p ≤ 164004` is `GoodP`. -/
theorem good_C081 (p : ℕ) (hlo : 162005 ≤ p) (hhi : p ≤ 164004) (hp : p.Prime) : GoodP p := by
  by_cases hc162005 : p ≤ 163004
  · exact scan_sound 163004 _ _ _ cert_162005 p hlo hc162005 hp
  exact scan_sound 164004 _ _ _ cert_163005 p (Nat.lt_of_not_le hc162005) hhi hp

/-- Every prime `p` with `164005 ≤ p ≤ 166004` is `GoodP`. -/
theorem good_C082 (p : ℕ) (hlo : 164005 ≤ p) (hhi : p ≤ 166004) (hp : p.Prime) : GoodP p := by
  by_cases hc164005 : p ≤ 165004
  · exact scan_sound 165004 _ _ _ cert_164005 p hlo hc164005 hp
  exact scan_sound 166004 _ _ _ cert_165005 p (Nat.lt_of_not_le hc164005) hhi hp

/-- Every prime `p` with `166005 ≤ p ≤ 168004` is `GoodP`. -/
theorem good_C083 (p : ℕ) (hlo : 166005 ≤ p) (hhi : p ≤ 168004) (hp : p.Prime) : GoodP p := by
  by_cases hc166005 : p ≤ 167004
  · exact scan_sound 167004 _ _ _ cert_166005 p hlo hc166005 hp
  exact scan_sound 168004 _ _ _ cert_167005 p (Nat.lt_of_not_le hc166005) hhi hp

/-- Every prime `p` with `168005 ≤ p ≤ 170004` is `GoodP`. -/
theorem good_C084 (p : ℕ) (hlo : 168005 ≤ p) (hhi : p ≤ 170004) (hp : p.Prime) : GoodP p := by
  by_cases hc168005 : p ≤ 169004
  · exact scan_sound 169004 _ _ _ cert_168005 p hlo hc168005 hp
  exact scan_sound 170004 _ _ _ cert_169005 p (Nat.lt_of_not_le hc168005) hhi hp

/-- Every prime `p` with `170005 ≤ p ≤ 172004` is `GoodP`. -/
theorem good_C085 (p : ℕ) (hlo : 170005 ≤ p) (hhi : p ≤ 172004) (hp : p.Prime) : GoodP p := by
  by_cases hc170005 : p ≤ 171004
  · exact scan_sound 171004 _ _ _ cert_170005 p hlo hc170005 hp
  exact scan_sound 172004 _ _ _ cert_171005 p (Nat.lt_of_not_le hc170005) hhi hp

/-- Every prime `p` with `172005 ≤ p ≤ 174004` is `GoodP`. -/
theorem good_C086 (p : ℕ) (hlo : 172005 ≤ p) (hhi : p ≤ 174004) (hp : p.Prime) : GoodP p := by
  by_cases hc172005 : p ≤ 173004
  · exact scan_sound 173004 _ _ _ cert_172005 p hlo hc172005 hp
  exact scan_sound 174004 _ _ _ cert_173005 p (Nat.lt_of_not_le hc172005) hhi hp

/-- Every prime `p` with `174005 ≤ p ≤ 176004` is `GoodP`. -/
theorem good_C087 (p : ℕ) (hlo : 174005 ≤ p) (hhi : p ≤ 176004) (hp : p.Prime) : GoodP p := by
  by_cases hc174005 : p ≤ 175004
  · exact scan_sound 175004 _ _ _ cert_174005 p hlo hc174005 hp
  exact scan_sound 176004 _ _ _ cert_175005 p (Nat.lt_of_not_le hc174005) hhi hp

/-- Every prime `p` with `176005 ≤ p ≤ 178004` is `GoodP`. -/
theorem good_C088 (p : ℕ) (hlo : 176005 ≤ p) (hhi : p ≤ 178004) (hp : p.Prime) : GoodP p := by
  by_cases hc176005 : p ≤ 177004
  · exact scan_sound 177004 _ _ _ cert_176005 p hlo hc176005 hp
  exact scan_sound 178004 _ _ _ cert_177005 p (Nat.lt_of_not_le hc176005) hhi hp

/-- Every prime `p` with `178005 ≤ p ≤ 180004` is `GoodP`. -/
theorem good_C089 (p : ℕ) (hlo : 178005 ≤ p) (hhi : p ≤ 180004) (hp : p.Prime) : GoodP p := by
  by_cases hc178005 : p ≤ 179004
  · exact scan_sound 179004 _ _ _ cert_178005 p hlo hc178005 hp
  exact scan_sound 180004 _ _ _ cert_179005 p (Nat.lt_of_not_le hc178005) hhi hp

/-- Every prime `p` with `180005 ≤ p ≤ 182004` is `GoodP`. -/
theorem good_C090 (p : ℕ) (hlo : 180005 ≤ p) (hhi : p ≤ 182004) (hp : p.Prime) : GoodP p := by
  by_cases hc180005 : p ≤ 181004
  · exact scan_sound 181004 _ _ _ cert_180005 p hlo hc180005 hp
  exact scan_sound 182004 _ _ _ cert_181005 p (Nat.lt_of_not_le hc180005) hhi hp

/-- Every prime `p` with `182005 ≤ p ≤ 184004` is `GoodP`. -/
theorem good_C091 (p : ℕ) (hlo : 182005 ≤ p) (hhi : p ≤ 184004) (hp : p.Prime) : GoodP p := by
  by_cases hc182005 : p ≤ 183004
  · exact scan_sound 183004 _ _ _ cert_182005 p hlo hc182005 hp
  exact scan_sound 184004 _ _ _ cert_183005 p (Nat.lt_of_not_le hc182005) hhi hp

/-- Every prime `p` with `184005 ≤ p ≤ 186004` is `GoodP`. -/
theorem good_C092 (p : ℕ) (hlo : 184005 ≤ p) (hhi : p ≤ 186004) (hp : p.Prime) : GoodP p := by
  by_cases hc184005 : p ≤ 185004
  · exact scan_sound 185004 _ _ _ cert_184005 p hlo hc184005 hp
  exact scan_sound 186004 _ _ _ cert_185005 p (Nat.lt_of_not_le hc184005) hhi hp

/-- Every prime `p` with `186005 ≤ p ≤ 188004` is `GoodP`. -/
theorem good_C093 (p : ℕ) (hlo : 186005 ≤ p) (hhi : p ≤ 188004) (hp : p.Prime) : GoodP p := by
  by_cases hc186005 : p ≤ 187004
  · exact scan_sound 187004 _ _ _ cert_186005 p hlo hc186005 hp
  exact scan_sound 188004 _ _ _ cert_187005 p (Nat.lt_of_not_le hc186005) hhi hp

/-- Every prime `p` with `188005 ≤ p ≤ 190004` is `GoodP`. -/
theorem good_C094 (p : ℕ) (hlo : 188005 ≤ p) (hhi : p ≤ 190004) (hp : p.Prime) : GoodP p := by
  by_cases hc188005 : p ≤ 189004
  · exact scan_sound 189004 _ _ _ cert_188005 p hlo hc188005 hp
  exact scan_sound 190004 _ _ _ cert_189005 p (Nat.lt_of_not_le hc188005) hhi hp

/-- Every prime `p` with `190005 ≤ p ≤ 192004` is `GoodP`. -/
theorem good_C095 (p : ℕ) (hlo : 190005 ≤ p) (hhi : p ≤ 192004) (hp : p.Prime) : GoodP p := by
  by_cases hc190005 : p ≤ 191004
  · exact scan_sound 191004 _ _ _ cert_190005 p hlo hc190005 hp
  exact scan_sound 192004 _ _ _ cert_191005 p (Nat.lt_of_not_le hc190005) hhi hp

/-- Every prime `p` with `192005 ≤ p ≤ 194004` is `GoodP`. -/
theorem good_C096 (p : ℕ) (hlo : 192005 ≤ p) (hhi : p ≤ 194004) (hp : p.Prime) : GoodP p := by
  by_cases hc192005 : p ≤ 193004
  · exact scan_sound 193004 _ _ _ cert_192005 p hlo hc192005 hp
  exact scan_sound 194004 _ _ _ cert_193005 p (Nat.lt_of_not_le hc192005) hhi hp

/-- Every prime `p` with `194005 ≤ p ≤ 196004` is `GoodP`. -/
theorem good_C097 (p : ℕ) (hlo : 194005 ≤ p) (hhi : p ≤ 196004) (hp : p.Prime) : GoodP p := by
  by_cases hc194005 : p ≤ 195004
  · exact scan_sound 195004 _ _ _ cert_194005 p hlo hc194005 hp
  exact scan_sound 196004 _ _ _ cert_195005 p (Nat.lt_of_not_le hc194005) hhi hp

/-- Every prime `p` with `196005 ≤ p ≤ 198004` is `GoodP`. -/
theorem good_C098 (p : ℕ) (hlo : 196005 ≤ p) (hhi : p ≤ 198004) (hp : p.Prime) : GoodP p := by
  by_cases hc196005 : p ≤ 197004
  · exact scan_sound 197004 _ _ _ cert_196005 p hlo hc196005 hp
  exact scan_sound 198004 _ _ _ cert_197005 p (Nat.lt_of_not_le hc196005) hhi hp

/-- Every prime `p` with `198005 ≤ p ≤ 200004` is `GoodP`. -/
theorem good_C099 (p : ℕ) (hlo : 198005 ≤ p) (hhi : p ≤ 200004) (hp : p.Prime) : GoodP p := by
  by_cases hc198005 : p ≤ 199004
  · exact scan_sound 199004 _ _ _ cert_198005 p hlo hc198005 hp
  exact scan_sound 200004 _ _ _ cert_199005 p (Nat.lt_of_not_le hc198005) hhi hp

/-- Every prime `p` with `200005 ≤ p ≤ 202004` is `GoodP`. -/
theorem good_C100 (p : ℕ) (hlo : 200005 ≤ p) (hhi : p ≤ 202004) (hp : p.Prime) : GoodP p := by
  by_cases hc200005 : p ≤ 201004
  · exact scan_sound 201004 _ _ _ cert_200005 p hlo hc200005 hp
  exact scan_sound 202004 _ _ _ cert_201005 p (Nat.lt_of_not_le hc200005) hhi hp

/-- Every prime `p` with `202005 ≤ p ≤ 204004` is `GoodP`. -/
theorem good_C101 (p : ℕ) (hlo : 202005 ≤ p) (hhi : p ≤ 204004) (hp : p.Prime) : GoodP p := by
  by_cases hc202005 : p ≤ 203004
  · exact scan_sound 203004 _ _ _ cert_202005 p hlo hc202005 hp
  exact scan_sound 204004 _ _ _ cert_203005 p (Nat.lt_of_not_le hc202005) hhi hp

/-- Every prime `p` with `204005 ≤ p ≤ 206004` is `GoodP`. -/
theorem good_C102 (p : ℕ) (hlo : 204005 ≤ p) (hhi : p ≤ 206004) (hp : p.Prime) : GoodP p := by
  by_cases hc204005 : p ≤ 205004
  · exact scan_sound 205004 _ _ _ cert_204005 p hlo hc204005 hp
  exact scan_sound 206004 _ _ _ cert_205005 p (Nat.lt_of_not_le hc204005) hhi hp

/-- Every prime `p` with `206005 ≤ p ≤ 208004` is `GoodP`. -/
theorem good_C103 (p : ℕ) (hlo : 206005 ≤ p) (hhi : p ≤ 208004) (hp : p.Prime) : GoodP p := by
  by_cases hc206005 : p ≤ 207004
  · exact scan_sound 207004 _ _ _ cert_206005 p hlo hc206005 hp
  exact scan_sound 208004 _ _ _ cert_207005 p (Nat.lt_of_not_le hc206005) hhi hp

/-- Every prime `p` with `208005 ≤ p ≤ 210004` is `GoodP`. -/
theorem good_C104 (p : ℕ) (hlo : 208005 ≤ p) (hhi : p ≤ 210004) (hp : p.Prime) : GoodP p := by
  by_cases hc208005 : p ≤ 209004
  · exact scan_sound 209004 _ _ _ cert_208005 p hlo hc208005 hp
  exact scan_sound 210004 _ _ _ cert_209005 p (Nat.lt_of_not_le hc208005) hhi hp

/-- Every prime `p` with `210005 ≤ p ≤ 212004` is `GoodP`. -/
theorem good_C105 (p : ℕ) (hlo : 210005 ≤ p) (hhi : p ≤ 212004) (hp : p.Prime) : GoodP p := by
  by_cases hc210005 : p ≤ 211004
  · exact scan_sound 211004 _ _ _ cert_210005 p hlo hc210005 hp
  exact scan_sound 212004 _ _ _ cert_211005 p (Nat.lt_of_not_le hc210005) hhi hp

/-- Every prime `p` with `212005 ≤ p ≤ 214004` is `GoodP`. -/
theorem good_C106 (p : ℕ) (hlo : 212005 ≤ p) (hhi : p ≤ 214004) (hp : p.Prime) : GoodP p := by
  by_cases hc212005 : p ≤ 213004
  · exact scan_sound 213004 _ _ _ cert_212005 p hlo hc212005 hp
  exact scan_sound 214004 _ _ _ cert_213005 p (Nat.lt_of_not_le hc212005) hhi hp

/-- Every prime `p` with `214005 ≤ p ≤ 216004` is `GoodP`. -/
theorem good_C107 (p : ℕ) (hlo : 214005 ≤ p) (hhi : p ≤ 216004) (hp : p.Prime) : GoodP p := by
  by_cases hc214005 : p ≤ 215004
  · exact scan_sound 215004 _ _ _ cert_214005 p hlo hc214005 hp
  exact scan_sound 216004 _ _ _ cert_215005 p (Nat.lt_of_not_le hc214005) hhi hp

/-- Every prime `p` with `216005 ≤ p ≤ 218004` is `GoodP`. -/
theorem good_C108 (p : ℕ) (hlo : 216005 ≤ p) (hhi : p ≤ 218004) (hp : p.Prime) : GoodP p := by
  by_cases hc216005 : p ≤ 217004
  · exact scan_sound 217004 _ _ _ cert_216005 p hlo hc216005 hp
  exact scan_sound 218004 _ _ _ cert_217005 p (Nat.lt_of_not_le hc216005) hhi hp

/-- Every prime `p` with `218005 ≤ p ≤ 220004` is `GoodP`. -/
theorem good_C109 (p : ℕ) (hlo : 218005 ≤ p) (hhi : p ≤ 220004) (hp : p.Prime) : GoodP p := by
  by_cases hc218005 : p ≤ 219004
  · exact scan_sound 219004 _ _ _ cert_218005 p hlo hc218005 hp
  exact scan_sound 220004 _ _ _ cert_219005 p (Nat.lt_of_not_le hc218005) hhi hp

/-- Every prime `p` with `220005 ≤ p ≤ 222004` is `GoodP`. -/
theorem good_C110 (p : ℕ) (hlo : 220005 ≤ p) (hhi : p ≤ 222004) (hp : p.Prime) : GoodP p := by
  by_cases hc220005 : p ≤ 221004
  · exact scan_sound 221004 _ _ _ cert_220005 p hlo hc220005 hp
  exact scan_sound 222004 _ _ _ cert_221005 p (Nat.lt_of_not_le hc220005) hhi hp

/-- Every prime `p` with `222005 ≤ p ≤ 224004` is `GoodP`. -/
theorem good_C111 (p : ℕ) (hlo : 222005 ≤ p) (hhi : p ≤ 224004) (hp : p.Prime) : GoodP p := by
  by_cases hc222005 : p ≤ 223004
  · exact scan_sound 223004 _ _ _ cert_222005 p hlo hc222005 hp
  exact scan_sound 224004 _ _ _ cert_223005 p (Nat.lt_of_not_le hc222005) hhi hp

/-- Every prime `p` with `224005 ≤ p ≤ 226004` is `GoodP`. -/
theorem good_C112 (p : ℕ) (hlo : 224005 ≤ p) (hhi : p ≤ 226004) (hp : p.Prime) : GoodP p := by
  by_cases hc224005 : p ≤ 225004
  · exact scan_sound 225004 _ _ _ cert_224005 p hlo hc224005 hp
  exact scan_sound 226004 _ _ _ cert_225005 p (Nat.lt_of_not_le hc224005) hhi hp

/-- Every prime `p` with `226005 ≤ p ≤ 228004` is `GoodP`. -/
theorem good_C113 (p : ℕ) (hlo : 226005 ≤ p) (hhi : p ≤ 228004) (hp : p.Prime) : GoodP p := by
  by_cases hc226005 : p ≤ 227004
  · exact scan_sound 227004 _ _ _ cert_226005 p hlo hc226005 hp
  exact scan_sound 228004 _ _ _ cert_227005 p (Nat.lt_of_not_le hc226005) hhi hp

/-- Every prime `p` with `228005 ≤ p ≤ 230004` is `GoodP`. -/
theorem good_C114 (p : ℕ) (hlo : 228005 ≤ p) (hhi : p ≤ 230004) (hp : p.Prime) : GoodP p := by
  by_cases hc228005 : p ≤ 229004
  · exact scan_sound 229004 _ _ _ cert_228005 p hlo hc228005 hp
  exact scan_sound 230004 _ _ _ cert_229005 p (Nat.lt_of_not_le hc228005) hhi hp

/-- Every prime `p` with `230005 ≤ p ≤ 232004` is `GoodP`. -/
theorem good_C115 (p : ℕ) (hlo : 230005 ≤ p) (hhi : p ≤ 232004) (hp : p.Prime) : GoodP p := by
  by_cases hc230005 : p ≤ 231004
  · exact scan_sound 231004 _ _ _ cert_230005 p hlo hc230005 hp
  exact scan_sound 232004 _ _ _ cert_231005 p (Nat.lt_of_not_le hc230005) hhi hp

/-- Every prime `p` with `232005 ≤ p ≤ 234004` is `GoodP`. -/
theorem good_C116 (p : ℕ) (hlo : 232005 ≤ p) (hhi : p ≤ 234004) (hp : p.Prime) : GoodP p := by
  by_cases hc232005 : p ≤ 233004
  · exact scan_sound 233004 _ _ _ cert_232005 p hlo hc232005 hp
  exact scan_sound 234004 _ _ _ cert_233005 p (Nat.lt_of_not_le hc232005) hhi hp

/-- Every prime `p` with `234005 ≤ p ≤ 236004` is `GoodP`. -/
theorem good_C117 (p : ℕ) (hlo : 234005 ≤ p) (hhi : p ≤ 236004) (hp : p.Prime) : GoodP p := by
  by_cases hc234005 : p ≤ 235004
  · exact scan_sound 235004 _ _ _ cert_234005 p hlo hc234005 hp
  exact scan_sound 236004 _ _ _ cert_235005 p (Nat.lt_of_not_le hc234005) hhi hp

/-- Every prime `p` with `236005 ≤ p ≤ 238004` is `GoodP`. -/
theorem good_C118 (p : ℕ) (hlo : 236005 ≤ p) (hhi : p ≤ 238004) (hp : p.Prime) : GoodP p := by
  by_cases hc236005 : p ≤ 237004
  · exact scan_sound 237004 _ _ _ cert_236005 p hlo hc236005 hp
  exact scan_sound 238004 _ _ _ cert_237005 p (Nat.lt_of_not_le hc236005) hhi hp

/-- Every prime `p` with `238005 ≤ p ≤ 240004` is `GoodP`. -/
theorem good_C119 (p : ℕ) (hlo : 238005 ≤ p) (hhi : p ≤ 240004) (hp : p.Prime) : GoodP p := by
  by_cases hc238005 : p ≤ 239004
  · exact scan_sound 239004 _ _ _ cert_238005 p hlo hc238005 hp
  exact scan_sound 240004 _ _ _ cert_239005 p (Nat.lt_of_not_le hc238005) hhi hp

/-- Every prime `p` with `240005 ≤ p ≤ 242004` is `GoodP`. -/
theorem good_C120 (p : ℕ) (hlo : 240005 ≤ p) (hhi : p ≤ 242004) (hp : p.Prime) : GoodP p := by
  by_cases hc240005 : p ≤ 241004
  · exact scan_sound 241004 _ _ _ cert_240005 p hlo hc240005 hp
  exact scan_sound 242004 _ _ _ cert_241005 p (Nat.lt_of_not_le hc240005) hhi hp

/-- Every prime `p` with `242005 ≤ p ≤ 244004` is `GoodP`. -/
theorem good_C121 (p : ℕ) (hlo : 242005 ≤ p) (hhi : p ≤ 244004) (hp : p.Prime) : GoodP p := by
  by_cases hc242005 : p ≤ 243004
  · exact scan_sound 243004 _ _ _ cert_242005 p hlo hc242005 hp
  exact scan_sound 244004 _ _ _ cert_243005 p (Nat.lt_of_not_le hc242005) hhi hp

/-- Every prime `p` with `244005 ≤ p ≤ 246004` is `GoodP`. -/
theorem good_C122 (p : ℕ) (hlo : 244005 ≤ p) (hhi : p ≤ 246004) (hp : p.Prime) : GoodP p := by
  by_cases hc244005 : p ≤ 245004
  · exact scan_sound 245004 _ _ _ cert_244005 p hlo hc244005 hp
  exact scan_sound 246004 _ _ _ cert_245005 p (Nat.lt_of_not_le hc244005) hhi hp

/-- Every prime `p` with `246005 ≤ p ≤ 248004` is `GoodP`. -/
theorem good_C123 (p : ℕ) (hlo : 246005 ≤ p) (hhi : p ≤ 248004) (hp : p.Prime) : GoodP p := by
  by_cases hc246005 : p ≤ 247004
  · exact scan_sound 247004 _ _ _ cert_246005 p hlo hc246005 hp
  exact scan_sound 248004 _ _ _ cert_247005 p (Nat.lt_of_not_le hc246005) hhi hp

/-- Every prime `p` with `248005 ≤ p ≤ 250004` is `GoodP`. -/
theorem good_C124 (p : ℕ) (hlo : 248005 ≤ p) (hhi : p ≤ 250004) (hp : p.Prime) : GoodP p := by
  by_cases hc248005 : p ≤ 249004
  · exact scan_sound 249004 _ _ _ cert_248005 p hlo hc248005 hp
  exact scan_sound 250004 _ _ _ cert_249005 p (Nat.lt_of_not_le hc248005) hhi hp

/-- Every prime `p` with `250005 ≤ p ≤ 252004` is `GoodP`. -/
theorem good_C125 (p : ℕ) (hlo : 250005 ≤ p) (hhi : p ≤ 252004) (hp : p.Prime) : GoodP p := by
  by_cases hc250005 : p ≤ 251004
  · exact scan_sound 251004 _ _ _ cert_250005 p hlo hc250005 hp
  exact scan_sound 252004 _ _ _ cert_251005 p (Nat.lt_of_not_le hc250005) hhi hp

/-- Every prime `p` with `252005 ≤ p ≤ 254004` is `GoodP`. -/
theorem good_C126 (p : ℕ) (hlo : 252005 ≤ p) (hhi : p ≤ 254004) (hp : p.Prime) : GoodP p := by
  by_cases hc252005 : p ≤ 253004
  · exact scan_sound 253004 _ _ _ cert_252005 p hlo hc252005 hp
  exact scan_sound 254004 _ _ _ cert_253005 p (Nat.lt_of_not_le hc252005) hhi hp

/-- Every prime `p` with `254005 ≤ p ≤ 256004` is `GoodP`. -/
theorem good_C127 (p : ℕ) (hlo : 254005 ≤ p) (hhi : p ≤ 256004) (hp : p.Prime) : GoodP p := by
  by_cases hc254005 : p ≤ 255004
  · exact scan_sound 255004 _ _ _ cert_254005 p hlo hc254005 hp
  exact scan_sound 256004 _ _ _ cert_255005 p (Nat.lt_of_not_le hc254005) hhi hp

/-- Every prime `p` with `256005 ≤ p ≤ 258004` is `GoodP`. -/
theorem good_C128 (p : ℕ) (hlo : 256005 ≤ p) (hhi : p ≤ 258004) (hp : p.Prime) : GoodP p := by
  by_cases hc256005 : p ≤ 257004
  · exact scan_sound 257004 _ _ _ cert_256005 p hlo hc256005 hp
  exact scan_sound 258004 _ _ _ cert_257005 p (Nat.lt_of_not_le hc256005) hhi hp

/-- Every prime `p` with `258005 ≤ p ≤ 260004` is `GoodP`. -/
theorem good_C129 (p : ℕ) (hlo : 258005 ≤ p) (hhi : p ≤ 260004) (hp : p.Prime) : GoodP p := by
  by_cases hc258005 : p ≤ 259004
  · exact scan_sound 259004 _ _ _ cert_258005 p hlo hc258005 hp
  exact scan_sound 260004 _ _ _ cert_259005 p (Nat.lt_of_not_le hc258005) hhi hp

/-- Every prime `p` with `260005 ≤ p ≤ 262004` is `GoodP`. -/
theorem good_C130 (p : ℕ) (hlo : 260005 ≤ p) (hhi : p ≤ 262004) (hp : p.Prime) : GoodP p := by
  by_cases hc260005 : p ≤ 261004
  · exact scan_sound 261004 _ _ _ cert_260005 p hlo hc260005 hp
  exact scan_sound 262004 _ _ _ cert_261005 p (Nat.lt_of_not_le hc260005) hhi hp

/-- Every prime `p` with `262005 ≤ p ≤ 264004` is `GoodP`. -/
theorem good_C131 (p : ℕ) (hlo : 262005 ≤ p) (hhi : p ≤ 264004) (hp : p.Prime) : GoodP p := by
  by_cases hc262005 : p ≤ 263004
  · exact scan_sound 263004 _ _ _ cert_262005 p hlo hc262005 hp
  exact scan_sound 264004 _ _ _ cert_263005 p (Nat.lt_of_not_le hc262005) hhi hp

/-- Every prime `p` with `264005 ≤ p ≤ 266004` is `GoodP`. -/
theorem good_C132 (p : ℕ) (hlo : 264005 ≤ p) (hhi : p ≤ 266004) (hp : p.Prime) : GoodP p := by
  by_cases hc264005 : p ≤ 265004
  · exact scan_sound 265004 _ _ _ cert_264005 p hlo hc264005 hp
  exact scan_sound 266004 _ _ _ cert_265005 p (Nat.lt_of_not_le hc264005) hhi hp

/-- Every prime `p` with `266005 ≤ p ≤ 268004` is `GoodP`. -/
theorem good_C133 (p : ℕ) (hlo : 266005 ≤ p) (hhi : p ≤ 268004) (hp : p.Prime) : GoodP p := by
  by_cases hc266005 : p ≤ 267004
  · exact scan_sound 267004 _ _ _ cert_266005 p hlo hc266005 hp
  exact scan_sound 268004 _ _ _ cert_267005 p (Nat.lt_of_not_le hc266005) hhi hp

/-- Every prime `p` with `268005 ≤ p ≤ 270004` is `GoodP`. -/
theorem good_C134 (p : ℕ) (hlo : 268005 ≤ p) (hhi : p ≤ 270004) (hp : p.Prime) : GoodP p := by
  by_cases hc268005 : p ≤ 269004
  · exact scan_sound 269004 _ _ _ cert_268005 p hlo hc268005 hp
  exact scan_sound 270004 _ _ _ cert_269005 p (Nat.lt_of_not_le hc268005) hhi hp

/-- Every prime `p` with `270005 ≤ p ≤ 272004` is `GoodP`. -/
theorem good_C135 (p : ℕ) (hlo : 270005 ≤ p) (hhi : p ≤ 272004) (hp : p.Prime) : GoodP p := by
  by_cases hc270005 : p ≤ 271004
  · exact scan_sound 271004 _ _ _ cert_270005 p hlo hc270005 hp
  exact scan_sound 272004 _ _ _ cert_271005 p (Nat.lt_of_not_le hc270005) hhi hp

/-- Every prime `p` with `272005 ≤ p ≤ 274004` is `GoodP`. -/
theorem good_C136 (p : ℕ) (hlo : 272005 ≤ p) (hhi : p ≤ 274004) (hp : p.Prime) : GoodP p := by
  by_cases hc272005 : p ≤ 273004
  · exact scan_sound 273004 _ _ _ cert_272005 p hlo hc272005 hp
  exact scan_sound 274004 _ _ _ cert_273005 p (Nat.lt_of_not_le hc272005) hhi hp

/-- Every prime `p` with `274005 ≤ p ≤ 276004` is `GoodP`. -/
theorem good_C137 (p : ℕ) (hlo : 274005 ≤ p) (hhi : p ≤ 276004) (hp : p.Prime) : GoodP p := by
  by_cases hc274005 : p ≤ 275004
  · exact scan_sound 275004 _ _ _ cert_274005 p hlo hc274005 hp
  exact scan_sound 276004 _ _ _ cert_275005 p (Nat.lt_of_not_le hc274005) hhi hp

/-- Every prime `p` with `276005 ≤ p ≤ 278004` is `GoodP`. -/
theorem good_C138 (p : ℕ) (hlo : 276005 ≤ p) (hhi : p ≤ 278004) (hp : p.Prime) : GoodP p := by
  by_cases hc276005 : p ≤ 277004
  · exact scan_sound 277004 _ _ _ cert_276005 p hlo hc276005 hp
  exact scan_sound 278004 _ _ _ cert_277005 p (Nat.lt_of_not_le hc276005) hhi hp

/-- Every prime `p` with `278005 ≤ p ≤ 280004` is `GoodP`. -/
theorem good_C139 (p : ℕ) (hlo : 278005 ≤ p) (hhi : p ≤ 280004) (hp : p.Prime) : GoodP p := by
  by_cases hc278005 : p ≤ 279004
  · exact scan_sound 279004 _ _ _ cert_278005 p hlo hc278005 hp
  exact scan_sound 280004 _ _ _ cert_279005 p (Nat.lt_of_not_le hc278005) hhi hp

/-- Every prime `p` with `280005 ≤ p ≤ 282004` is `GoodP`. -/
theorem good_C140 (p : ℕ) (hlo : 280005 ≤ p) (hhi : p ≤ 282004) (hp : p.Prime) : GoodP p := by
  by_cases hc280005 : p ≤ 281004
  · exact scan_sound 281004 _ _ _ cert_280005 p hlo hc280005 hp
  exact scan_sound 282004 _ _ _ cert_281005 p (Nat.lt_of_not_le hc280005) hhi hp

/-- Every prime `p` with `282005 ≤ p ≤ 284004` is `GoodP`. -/
theorem good_C141 (p : ℕ) (hlo : 282005 ≤ p) (hhi : p ≤ 284004) (hp : p.Prime) : GoodP p := by
  by_cases hc282005 : p ≤ 283004
  · exact scan_sound 283004 _ _ _ cert_282005 p hlo hc282005 hp
  exact scan_sound 284004 _ _ _ cert_283005 p (Nat.lt_of_not_le hc282005) hhi hp

/-- Every prime `p` with `284005 ≤ p ≤ 286004` is `GoodP`. -/
theorem good_C142 (p : ℕ) (hlo : 284005 ≤ p) (hhi : p ≤ 286004) (hp : p.Prime) : GoodP p := by
  by_cases hc284005 : p ≤ 285004
  · exact scan_sound 285004 _ _ _ cert_284005 p hlo hc284005 hp
  exact scan_sound 286004 _ _ _ cert_285005 p (Nat.lt_of_not_le hc284005) hhi hp

/-- Every prime `p` with `286005 ≤ p ≤ 288004` is `GoodP`. -/
theorem good_C143 (p : ℕ) (hlo : 286005 ≤ p) (hhi : p ≤ 288004) (hp : p.Prime) : GoodP p := by
  by_cases hc286005 : p ≤ 287004
  · exact scan_sound 287004 _ _ _ cert_286005 p hlo hc286005 hp
  exact scan_sound 288004 _ _ _ cert_287005 p (Nat.lt_of_not_le hc286005) hhi hp

/-- Every prime `p` with `288005 ≤ p ≤ 290004` is `GoodP`. -/
theorem good_C144 (p : ℕ) (hlo : 288005 ≤ p) (hhi : p ≤ 290004) (hp : p.Prime) : GoodP p := by
  by_cases hc288005 : p ≤ 289004
  · exact scan_sound 289004 _ _ _ cert_288005 p hlo hc288005 hp
  exact scan_sound 290004 _ _ _ cert_289005 p (Nat.lt_of_not_le hc288005) hhi hp

/-- Every prime `p` with `290005 ≤ p ≤ 292004` is `GoodP`. -/
theorem good_C145 (p : ℕ) (hlo : 290005 ≤ p) (hhi : p ≤ 292004) (hp : p.Prime) : GoodP p := by
  by_cases hc290005 : p ≤ 291004
  · exact scan_sound 291004 _ _ _ cert_290005 p hlo hc290005 hp
  exact scan_sound 292004 _ _ _ cert_291005 p (Nat.lt_of_not_le hc290005) hhi hp

/-- Every prime `p` with `292005 ≤ p ≤ 294004` is `GoodP`. -/
theorem good_C146 (p : ℕ) (hlo : 292005 ≤ p) (hhi : p ≤ 294004) (hp : p.Prime) : GoodP p := by
  by_cases hc292005 : p ≤ 293004
  · exact scan_sound 293004 _ _ _ cert_292005 p hlo hc292005 hp
  exact scan_sound 294004 _ _ _ cert_293005 p (Nat.lt_of_not_le hc292005) hhi hp

/-- Every prime `p` with `294005 ≤ p ≤ 296004` is `GoodP`. -/
theorem good_C147 (p : ℕ) (hlo : 294005 ≤ p) (hhi : p ≤ 296004) (hp : p.Prime) : GoodP p := by
  by_cases hc294005 : p ≤ 295004
  · exact scan_sound 295004 _ _ _ cert_294005 p hlo hc294005 hp
  exact scan_sound 296004 _ _ _ cert_295005 p (Nat.lt_of_not_le hc294005) hhi hp

/-- Every prime `p` with `296005 ≤ p ≤ 298004` is `GoodP`. -/
theorem good_C148 (p : ℕ) (hlo : 296005 ≤ p) (hhi : p ≤ 298004) (hp : p.Prime) : GoodP p := by
  by_cases hc296005 : p ≤ 297004
  · exact scan_sound 297004 _ _ _ cert_296005 p hlo hc296005 hp
  exact scan_sound 298004 _ _ _ cert_297005 p (Nat.lt_of_not_le hc296005) hhi hp

/-- Every prime `p` with `298005 ≤ p ≤ 300004` is `GoodP`. -/
theorem good_C149 (p : ℕ) (hlo : 298005 ≤ p) (hhi : p ≤ 300004) (hp : p.Prime) : GoodP p := by
  by_cases hc298005 : p ≤ 299004
  · exact scan_sound 299004 _ _ _ cert_298005 p hlo hc298005 hp
  exact scan_sound 300004 _ _ _ cert_299005 p (Nat.lt_of_not_le hc298005) hhi hp

/-- Every prime `p` with `300005 ≤ p ≤ 302004` is `GoodP`. -/
theorem good_C150 (p : ℕ) (hlo : 300005 ≤ p) (hhi : p ≤ 302004) (hp : p.Prime) : GoodP p := by
  by_cases hc300005 : p ≤ 301004
  · exact scan_sound 301004 _ _ _ cert_300005 p hlo hc300005 hp
  exact scan_sound 302004 _ _ _ cert_301005 p (Nat.lt_of_not_le hc300005) hhi hp

/-- Every prime `p` with `302005 ≤ p ≤ 304004` is `GoodP`. -/
theorem good_C151 (p : ℕ) (hlo : 302005 ≤ p) (hhi : p ≤ 304004) (hp : p.Prime) : GoodP p := by
  by_cases hc302005 : p ≤ 303004
  · exact scan_sound 303004 _ _ _ cert_302005 p hlo hc302005 hp
  exact scan_sound 304004 _ _ _ cert_303005 p (Nat.lt_of_not_le hc302005) hhi hp

/-- Every prime `p` with `304005 ≤ p ≤ 306004` is `GoodP`. -/
theorem good_C152 (p : ℕ) (hlo : 304005 ≤ p) (hhi : p ≤ 306004) (hp : p.Prime) : GoodP p := by
  by_cases hc304005 : p ≤ 305004
  · exact scan_sound 305004 _ _ _ cert_304005 p hlo hc304005 hp
  exact scan_sound 306004 _ _ _ cert_305005 p (Nat.lt_of_not_le hc304005) hhi hp

/-- Every prime `p` with `306005 ≤ p ≤ 308004` is `GoodP`. -/
theorem good_C153 (p : ℕ) (hlo : 306005 ≤ p) (hhi : p ≤ 308004) (hp : p.Prime) : GoodP p := by
  by_cases hc306005 : p ≤ 307004
  · exact scan_sound 307004 _ _ _ cert_306005 p hlo hc306005 hp
  exact scan_sound 308004 _ _ _ cert_307005 p (Nat.lt_of_not_le hc306005) hhi hp

/-- Every prime `p` with `308005 ≤ p ≤ 310004` is `GoodP`. -/
theorem good_C154 (p : ℕ) (hlo : 308005 ≤ p) (hhi : p ≤ 310004) (hp : p.Prime) : GoodP p := by
  by_cases hc308005 : p ≤ 309004
  · exact scan_sound 309004 _ _ _ cert_308005 p hlo hc308005 hp
  exact scan_sound 310004 _ _ _ cert_309005 p (Nat.lt_of_not_le hc308005) hhi hp

/-- Every prime `p` with `310005 ≤ p ≤ 312004` is `GoodP`. -/
theorem good_C155 (p : ℕ) (hlo : 310005 ≤ p) (hhi : p ≤ 312004) (hp : p.Prime) : GoodP p := by
  by_cases hc310005 : p ≤ 311004
  · exact scan_sound 311004 _ _ _ cert_310005 p hlo hc310005 hp
  exact scan_sound 312004 _ _ _ cert_311005 p (Nat.lt_of_not_le hc310005) hhi hp

/-- Every prime `p` with `312005 ≤ p ≤ 314004` is `GoodP`. -/
theorem good_C156 (p : ℕ) (hlo : 312005 ≤ p) (hhi : p ≤ 314004) (hp : p.Prime) : GoodP p := by
  by_cases hc312005 : p ≤ 313004
  · exact scan_sound 313004 _ _ _ cert_312005 p hlo hc312005 hp
  exact scan_sound 314004 _ _ _ cert_313005 p (Nat.lt_of_not_le hc312005) hhi hp

/-- Every prime `p` with `314005 ≤ p ≤ 316004` is `GoodP`. -/
theorem good_C157 (p : ℕ) (hlo : 314005 ≤ p) (hhi : p ≤ 316004) (hp : p.Prime) : GoodP p := by
  by_cases hc314005 : p ≤ 315004
  · exact scan_sound 315004 _ _ _ cert_314005 p hlo hc314005 hp
  exact scan_sound 316004 _ _ _ cert_315005 p (Nat.lt_of_not_le hc314005) hhi hp

/-- Every prime `p` with `316005 ≤ p ≤ 318004` is `GoodP`. -/
theorem good_C158 (p : ℕ) (hlo : 316005 ≤ p) (hhi : p ≤ 318004) (hp : p.Prime) : GoodP p := by
  by_cases hc316005 : p ≤ 317004
  · exact scan_sound 317004 _ _ _ cert_316005 p hlo hc316005 hp
  exact scan_sound 318004 _ _ _ cert_317005 p (Nat.lt_of_not_le hc316005) hhi hp

/-- Every prime `p` with `318005 ≤ p ≤ 320004` is `GoodP`. -/
theorem good_C159 (p : ℕ) (hlo : 318005 ≤ p) (hhi : p ≤ 320004) (hp : p.Prime) : GoodP p := by
  by_cases hc318005 : p ≤ 319004
  · exact scan_sound 319004 _ _ _ cert_318005 p hlo hc318005 hp
  exact scan_sound 320004 _ _ _ cert_319005 p (Nat.lt_of_not_le hc318005) hhi hp

/-- Every prime `p` with `320005 ≤ p ≤ 322004` is `GoodP`. -/
theorem good_C160 (p : ℕ) (hlo : 320005 ≤ p) (hhi : p ≤ 322004) (hp : p.Prime) : GoodP p := by
  by_cases hc320005 : p ≤ 321004
  · exact scan_sound 321004 _ _ _ cert_320005 p hlo hc320005 hp
  exact scan_sound 322004 _ _ _ cert_321005 p (Nat.lt_of_not_le hc320005) hhi hp

/-- Every prime `p` with `322005 ≤ p ≤ 324004` is `GoodP`. -/
theorem good_C161 (p : ℕ) (hlo : 322005 ≤ p) (hhi : p ≤ 324004) (hp : p.Prime) : GoodP p := by
  by_cases hc322005 : p ≤ 323004
  · exact scan_sound 323004 _ _ _ cert_322005 p hlo hc322005 hp
  exact scan_sound 324004 _ _ _ cert_323005 p (Nat.lt_of_not_le hc322005) hhi hp

/-- Every prime `p` with `324005 ≤ p ≤ 326004` is `GoodP`. -/
theorem good_C162 (p : ℕ) (hlo : 324005 ≤ p) (hhi : p ≤ 326004) (hp : p.Prime) : GoodP p := by
  by_cases hc324005 : p ≤ 325004
  · exact scan_sound 325004 _ _ _ cert_324005 p hlo hc324005 hp
  exact scan_sound 326004 _ _ _ cert_325005 p (Nat.lt_of_not_le hc324005) hhi hp

/-- Every prime `p` with `326005 ≤ p ≤ 328004` is `GoodP`. -/
theorem good_C163 (p : ℕ) (hlo : 326005 ≤ p) (hhi : p ≤ 328004) (hp : p.Prime) : GoodP p := by
  by_cases hc326005 : p ≤ 327004
  · exact scan_sound 327004 _ _ _ cert_326005 p hlo hc326005 hp
  exact scan_sound 328004 _ _ _ cert_327005 p (Nat.lt_of_not_le hc326005) hhi hp

/-- Every prime `p` with `328005 ≤ p ≤ 330004` is `GoodP`. -/
theorem good_C164 (p : ℕ) (hlo : 328005 ≤ p) (hhi : p ≤ 330004) (hp : p.Prime) : GoodP p := by
  by_cases hc328005 : p ≤ 329004
  · exact scan_sound 329004 _ _ _ cert_328005 p hlo hc328005 hp
  exact scan_sound 330004 _ _ _ cert_329005 p (Nat.lt_of_not_le hc328005) hhi hp

/-- Every prime `p` with `330005 ≤ p ≤ 332004` is `GoodP`. -/
theorem good_C165 (p : ℕ) (hlo : 330005 ≤ p) (hhi : p ≤ 332004) (hp : p.Prime) : GoodP p := by
  by_cases hc330005 : p ≤ 331004
  · exact scan_sound 331004 _ _ _ cert_330005 p hlo hc330005 hp
  exact scan_sound 332004 _ _ _ cert_331005 p (Nat.lt_of_not_le hc330005) hhi hp

/-- Every prime `p` with `332005 ≤ p ≤ 334004` is `GoodP`. -/
theorem good_C166 (p : ℕ) (hlo : 332005 ≤ p) (hhi : p ≤ 334004) (hp : p.Prime) : GoodP p := by
  by_cases hc332005 : p ≤ 333004
  · exact scan_sound 333004 _ _ _ cert_332005 p hlo hc332005 hp
  exact scan_sound 334004 _ _ _ cert_333005 p (Nat.lt_of_not_le hc332005) hhi hp

/-- Every prime `p` with `334005 ≤ p ≤ 336004` is `GoodP`. -/
theorem good_C167 (p : ℕ) (hlo : 334005 ≤ p) (hhi : p ≤ 336004) (hp : p.Prime) : GoodP p := by
  by_cases hc334005 : p ≤ 335004
  · exact scan_sound 335004 _ _ _ cert_334005 p hlo hc334005 hp
  exact scan_sound 336004 _ _ _ cert_335005 p (Nat.lt_of_not_le hc334005) hhi hp

/-- Every prime `p` with `336005 ≤ p ≤ 338004` is `GoodP`. -/
theorem good_C168 (p : ℕ) (hlo : 336005 ≤ p) (hhi : p ≤ 338004) (hp : p.Prime) : GoodP p := by
  by_cases hc336005 : p ≤ 337004
  · exact scan_sound 337004 _ _ _ cert_336005 p hlo hc336005 hp
  exact scan_sound 338004 _ _ _ cert_337005 p (Nat.lt_of_not_le hc336005) hhi hp

/-- Every prime `p` with `338005 ≤ p ≤ 340004` is `GoodP`. -/
theorem good_C169 (p : ℕ) (hlo : 338005 ≤ p) (hhi : p ≤ 340004) (hp : p.Prime) : GoodP p := by
  by_cases hc338005 : p ≤ 339004
  · exact scan_sound 339004 _ _ _ cert_338005 p hlo hc338005 hp
  exact scan_sound 340004 _ _ _ cert_339005 p (Nat.lt_of_not_le hc338005) hhi hp

/-- Every prime `p` with `340005 ≤ p ≤ 342004` is `GoodP`. -/
theorem good_C170 (p : ℕ) (hlo : 340005 ≤ p) (hhi : p ≤ 342004) (hp : p.Prime) : GoodP p := by
  by_cases hc340005 : p ≤ 341004
  · exact scan_sound 341004 _ _ _ cert_340005 p hlo hc340005 hp
  exact scan_sound 342004 _ _ _ cert_341005 p (Nat.lt_of_not_le hc340005) hhi hp

/-- Every prime `p` with `342005 ≤ p ≤ 344004` is `GoodP`. -/
theorem good_C171 (p : ℕ) (hlo : 342005 ≤ p) (hhi : p ≤ 344004) (hp : p.Prime) : GoodP p := by
  by_cases hc342005 : p ≤ 343004
  · exact scan_sound 343004 _ _ _ cert_342005 p hlo hc342005 hp
  exact scan_sound 344004 _ _ _ cert_343005 p (Nat.lt_of_not_le hc342005) hhi hp

/-- Every prime `p` with `344005 ≤ p ≤ 346004` is `GoodP`. -/
theorem good_C172 (p : ℕ) (hlo : 344005 ≤ p) (hhi : p ≤ 346004) (hp : p.Prime) : GoodP p := by
  by_cases hc344005 : p ≤ 345004
  · exact scan_sound 345004 _ _ _ cert_344005 p hlo hc344005 hp
  exact scan_sound 346004 _ _ _ cert_345005 p (Nat.lt_of_not_le hc344005) hhi hp

/-- Every prime `p` with `346005 ≤ p ≤ 348004` is `GoodP`. -/
theorem good_C173 (p : ℕ) (hlo : 346005 ≤ p) (hhi : p ≤ 348004) (hp : p.Prime) : GoodP p := by
  by_cases hc346005 : p ≤ 347004
  · exact scan_sound 347004 _ _ _ cert_346005 p hlo hc346005 hp
  exact scan_sound 348004 _ _ _ cert_347005 p (Nat.lt_of_not_le hc346005) hhi hp

/-- Every prime `p` with `348005 ≤ p ≤ 350004` is `GoodP`. -/
theorem good_C174 (p : ℕ) (hlo : 348005 ≤ p) (hhi : p ≤ 350004) (hp : p.Prime) : GoodP p := by
  by_cases hc348005 : p ≤ 349004
  · exact scan_sound 349004 _ _ _ cert_348005 p hlo hc348005 hp
  exact scan_sound 350004 _ _ _ cert_349005 p (Nat.lt_of_not_le hc348005) hhi hp

/-- Every prime `p` with `350005 ≤ p ≤ 352004` is `GoodP`. -/
theorem good_C175 (p : ℕ) (hlo : 350005 ≤ p) (hhi : p ≤ 352004) (hp : p.Prime) : GoodP p := by
  by_cases hc350005 : p ≤ 351004
  · exact scan_sound 351004 _ _ _ cert_350005 p hlo hc350005 hp
  exact scan_sound 352004 _ _ _ cert_351005 p (Nat.lt_of_not_le hc350005) hhi hp

/-- Every prime `p` with `352005 ≤ p ≤ 354004` is `GoodP`. -/
theorem good_C176 (p : ℕ) (hlo : 352005 ≤ p) (hhi : p ≤ 354004) (hp : p.Prime) : GoodP p := by
  by_cases hc352005 : p ≤ 353004
  · exact scan_sound 353004 _ _ _ cert_352005 p hlo hc352005 hp
  exact scan_sound 354004 _ _ _ cert_353005 p (Nat.lt_of_not_le hc352005) hhi hp

/-- Every prime `p` with `354005 ≤ p ≤ 356004` is `GoodP`. -/
theorem good_C177 (p : ℕ) (hlo : 354005 ≤ p) (hhi : p ≤ 356004) (hp : p.Prime) : GoodP p := by
  by_cases hc354005 : p ≤ 355004
  · exact scan_sound 355004 _ _ _ cert_354005 p hlo hc354005 hp
  exact scan_sound 356004 _ _ _ cert_355005 p (Nat.lt_of_not_le hc354005) hhi hp

/-- Every prime `p` with `356005 ≤ p ≤ 358004` is `GoodP`. -/
theorem good_C178 (p : ℕ) (hlo : 356005 ≤ p) (hhi : p ≤ 358004) (hp : p.Prime) : GoodP p := by
  by_cases hc356005 : p ≤ 357004
  · exact scan_sound 357004 _ _ _ cert_356005 p hlo hc356005 hp
  exact scan_sound 358004 _ _ _ cert_357005 p (Nat.lt_of_not_le hc356005) hhi hp

/-- Every prime `p` with `358005 ≤ p ≤ 360004` is `GoodP`. -/
theorem good_C179 (p : ℕ) (hlo : 358005 ≤ p) (hhi : p ≤ 360004) (hp : p.Prime) : GoodP p := by
  by_cases hc358005 : p ≤ 359004
  · exact scan_sound 359004 _ _ _ cert_358005 p hlo hc358005 hp
  exact scan_sound 360004 _ _ _ cert_359005 p (Nat.lt_of_not_le hc358005) hhi hp

/-- Every prime `p` with `360005 ≤ p ≤ 362004` is `GoodP`. -/
theorem good_C180 (p : ℕ) (hlo : 360005 ≤ p) (hhi : p ≤ 362004) (hp : p.Prime) : GoodP p := by
  by_cases hc360005 : p ≤ 361004
  · exact scan_sound 361004 _ _ _ cert_360005 p hlo hc360005 hp
  exact scan_sound 362004 _ _ _ cert_361005 p (Nat.lt_of_not_le hc360005) hhi hp

/-- Every prime `p` with `362005 ≤ p ≤ 364004` is `GoodP`. -/
theorem good_C181 (p : ℕ) (hlo : 362005 ≤ p) (hhi : p ≤ 364004) (hp : p.Prime) : GoodP p := by
  by_cases hc362005 : p ≤ 363004
  · exact scan_sound 363004 _ _ _ cert_362005 p hlo hc362005 hp
  exact scan_sound 364004 _ _ _ cert_363005 p (Nat.lt_of_not_le hc362005) hhi hp

/-- Every prime `p` with `364005 ≤ p ≤ 366004` is `GoodP`. -/
theorem good_C182 (p : ℕ) (hlo : 364005 ≤ p) (hhi : p ≤ 366004) (hp : p.Prime) : GoodP p := by
  by_cases hc364005 : p ≤ 365004
  · exact scan_sound 365004 _ _ _ cert_364005 p hlo hc364005 hp
  exact scan_sound 366004 _ _ _ cert_365005 p (Nat.lt_of_not_le hc364005) hhi hp

/-- Every prime `p` with `366005 ≤ p ≤ 368004` is `GoodP`. -/
theorem good_C183 (p : ℕ) (hlo : 366005 ≤ p) (hhi : p ≤ 368004) (hp : p.Prime) : GoodP p := by
  by_cases hc366005 : p ≤ 367004
  · exact scan_sound 367004 _ _ _ cert_366005 p hlo hc366005 hp
  exact scan_sound 368004 _ _ _ cert_367005 p (Nat.lt_of_not_le hc366005) hhi hp

/-- Every prime `p` with `368005 ≤ p ≤ 370004` is `GoodP`. -/
theorem good_C184 (p : ℕ) (hlo : 368005 ≤ p) (hhi : p ≤ 370004) (hp : p.Prime) : GoodP p := by
  by_cases hc368005 : p ≤ 369004
  · exact scan_sound 369004 _ _ _ cert_368005 p hlo hc368005 hp
  exact scan_sound 370004 _ _ _ cert_369005 p (Nat.lt_of_not_le hc368005) hhi hp

/-- Every prime `p` with `370005 ≤ p ≤ 372004` is `GoodP`. -/
theorem good_C185 (p : ℕ) (hlo : 370005 ≤ p) (hhi : p ≤ 372004) (hp : p.Prime) : GoodP p := by
  by_cases hc370005 : p ≤ 371004
  · exact scan_sound 371004 _ _ _ cert_370005 p hlo hc370005 hp
  exact scan_sound 372004 _ _ _ cert_371005 p (Nat.lt_of_not_le hc370005) hhi hp

/-- Every prime `p` with `372005 ≤ p ≤ 374004` is `GoodP`. -/
theorem good_C186 (p : ℕ) (hlo : 372005 ≤ p) (hhi : p ≤ 374004) (hp : p.Prime) : GoodP p := by
  by_cases hc372005 : p ≤ 373004
  · exact scan_sound 373004 _ _ _ cert_372005 p hlo hc372005 hp
  exact scan_sound 374004 _ _ _ cert_373005 p (Nat.lt_of_not_le hc372005) hhi hp

/-- Every prime `p` with `374005 ≤ p ≤ 376004` is `GoodP`. -/
theorem good_C187 (p : ℕ) (hlo : 374005 ≤ p) (hhi : p ≤ 376004) (hp : p.Prime) : GoodP p := by
  by_cases hc374005 : p ≤ 375004
  · exact scan_sound 375004 _ _ _ cert_374005 p hlo hc374005 hp
  exact scan_sound 376004 _ _ _ cert_375005 p (Nat.lt_of_not_le hc374005) hhi hp

/-- Every prime `p` with `376005 ≤ p ≤ 378004` is `GoodP`. -/
theorem good_C188 (p : ℕ) (hlo : 376005 ≤ p) (hhi : p ≤ 378004) (hp : p.Prime) : GoodP p := by
  by_cases hc376005 : p ≤ 377004
  · exact scan_sound 377004 _ _ _ cert_376005 p hlo hc376005 hp
  exact scan_sound 378004 _ _ _ cert_377005 p (Nat.lt_of_not_le hc376005) hhi hp

/-- Every prime `p` with `378005 ≤ p ≤ 380004` is `GoodP`. -/
theorem good_C189 (p : ℕ) (hlo : 378005 ≤ p) (hhi : p ≤ 380004) (hp : p.Prime) : GoodP p := by
  by_cases hc378005 : p ≤ 379004
  · exact scan_sound 379004 _ _ _ cert_378005 p hlo hc378005 hp
  exact scan_sound 380004 _ _ _ cert_379005 p (Nat.lt_of_not_le hc378005) hhi hp

/-- Every prime `p` with `380005 ≤ p ≤ 382004` is `GoodP`. -/
theorem good_C190 (p : ℕ) (hlo : 380005 ≤ p) (hhi : p ≤ 382004) (hp : p.Prime) : GoodP p := by
  by_cases hc380005 : p ≤ 381004
  · exact scan_sound 381004 _ _ _ cert_380005 p hlo hc380005 hp
  exact scan_sound 382004 _ _ _ cert_381005 p (Nat.lt_of_not_le hc380005) hhi hp

/-- Every prime `p` with `382005 ≤ p ≤ 384004` is `GoodP`. -/
theorem good_C191 (p : ℕ) (hlo : 382005 ≤ p) (hhi : p ≤ 384004) (hp : p.Prime) : GoodP p := by
  by_cases hc382005 : p ≤ 383004
  · exact scan_sound 383004 _ _ _ cert_382005 p hlo hc382005 hp
  exact scan_sound 384004 _ _ _ cert_383005 p (Nat.lt_of_not_le hc382005) hhi hp

/-- Every prime `p` with `384005 ≤ p ≤ 386004` is `GoodP`. -/
theorem good_C192 (p : ℕ) (hlo : 384005 ≤ p) (hhi : p ≤ 386004) (hp : p.Prime) : GoodP p := by
  by_cases hc384005 : p ≤ 385004
  · exact scan_sound 385004 _ _ _ cert_384005 p hlo hc384005 hp
  exact scan_sound 386004 _ _ _ cert_385005 p (Nat.lt_of_not_le hc384005) hhi hp

/-- Every prime `p` with `386005 ≤ p ≤ 388004` is `GoodP`. -/
theorem good_C193 (p : ℕ) (hlo : 386005 ≤ p) (hhi : p ≤ 388004) (hp : p.Prime) : GoodP p := by
  by_cases hc386005 : p ≤ 387004
  · exact scan_sound 387004 _ _ _ cert_386005 p hlo hc386005 hp
  exact scan_sound 388004 _ _ _ cert_387005 p (Nat.lt_of_not_le hc386005) hhi hp

/-- Every prime `p` with `388005 ≤ p ≤ 390004` is `GoodP`. -/
theorem good_C194 (p : ℕ) (hlo : 388005 ≤ p) (hhi : p ≤ 390004) (hp : p.Prime) : GoodP p := by
  by_cases hc388005 : p ≤ 389004
  · exact scan_sound 389004 _ _ _ cert_388005 p hlo hc388005 hp
  exact scan_sound 390004 _ _ _ cert_389005 p (Nat.lt_of_not_le hc388005) hhi hp

/-- Every prime `p` with `390005 ≤ p ≤ 392004` is `GoodP`. -/
theorem good_C195 (p : ℕ) (hlo : 390005 ≤ p) (hhi : p ≤ 392004) (hp : p.Prime) : GoodP p := by
  by_cases hc390005 : p ≤ 391004
  · exact scan_sound 391004 _ _ _ cert_390005 p hlo hc390005 hp
  exact scan_sound 392004 _ _ _ cert_391005 p (Nat.lt_of_not_le hc390005) hhi hp

/-- Every prime `p` with `392005 ≤ p ≤ 394004` is `GoodP`. -/
theorem good_C196 (p : ℕ) (hlo : 392005 ≤ p) (hhi : p ≤ 394004) (hp : p.Prime) : GoodP p := by
  by_cases hc392005 : p ≤ 393004
  · exact scan_sound 393004 _ _ _ cert_392005 p hlo hc392005 hp
  exact scan_sound 394004 _ _ _ cert_393005 p (Nat.lt_of_not_le hc392005) hhi hp

/-- Every prime `p` with `394005 ≤ p ≤ 396004` is `GoodP`. -/
theorem good_C197 (p : ℕ) (hlo : 394005 ≤ p) (hhi : p ≤ 396004) (hp : p.Prime) : GoodP p := by
  by_cases hc394005 : p ≤ 395004
  · exact scan_sound 395004 _ _ _ cert_394005 p hlo hc394005 hp
  exact scan_sound 396004 _ _ _ cert_395005 p (Nat.lt_of_not_le hc394005) hhi hp

/-- Every prime `p` with `396005 ≤ p ≤ 398004` is `GoodP`. -/
theorem good_C198 (p : ℕ) (hlo : 396005 ≤ p) (hhi : p ≤ 398004) (hp : p.Prime) : GoodP p := by
  by_cases hc396005 : p ≤ 397004
  · exact scan_sound 397004 _ _ _ cert_396005 p hlo hc396005 hp
  exact scan_sound 398004 _ _ _ cert_397005 p (Nat.lt_of_not_le hc396005) hhi hp

/-- Every prime `p` with `398005 ≤ p ≤ 400004` is `GoodP`. -/
theorem good_C199 (p : ℕ) (hlo : 398005 ≤ p) (hhi : p ≤ 400004) (hp : p.Prime) : GoodP p := by
  by_cases hc398005 : p ≤ 399004
  · exact scan_sound 399004 _ _ _ cert_398005 p hlo hc398005 hp
  exact scan_sound 400004 _ _ _ cert_399005 p (Nat.lt_of_not_le hc398005) hhi hp

/-- Every prime `p` with `400005 ≤ p ≤ 402004` is `GoodP`. -/
theorem good_C200 (p : ℕ) (hlo : 400005 ≤ p) (hhi : p ≤ 402004) (hp : p.Prime) : GoodP p := by
  by_cases hc400005 : p ≤ 401004
  · exact scan_sound 401004 _ _ _ cert_400005 p hlo hc400005 hp
  exact scan_sound 402004 _ _ _ cert_401005 p (Nat.lt_of_not_le hc400005) hhi hp

/-- Every prime `p` with `402005 ≤ p ≤ 404004` is `GoodP`. -/
theorem good_C201 (p : ℕ) (hlo : 402005 ≤ p) (hhi : p ≤ 404004) (hp : p.Prime) : GoodP p := by
  by_cases hc402005 : p ≤ 403004
  · exact scan_sound 403004 _ _ _ cert_402005 p hlo hc402005 hp
  exact scan_sound 404004 _ _ _ cert_403005 p (Nat.lt_of_not_le hc402005) hhi hp

/-- Every prime `p` with `404005 ≤ p ≤ 406004` is `GoodP`. -/
theorem good_C202 (p : ℕ) (hlo : 404005 ≤ p) (hhi : p ≤ 406004) (hp : p.Prime) : GoodP p := by
  by_cases hc404005 : p ≤ 405004
  · exact scan_sound 405004 _ _ _ cert_404005 p hlo hc404005 hp
  exact scan_sound 406004 _ _ _ cert_405005 p (Nat.lt_of_not_le hc404005) hhi hp

/-- Every prime `p` with `406005 ≤ p ≤ 408004` is `GoodP`. -/
theorem good_C203 (p : ℕ) (hlo : 406005 ≤ p) (hhi : p ≤ 408004) (hp : p.Prime) : GoodP p := by
  by_cases hc406005 : p ≤ 407004
  · exact scan_sound 407004 _ _ _ cert_406005 p hlo hc406005 hp
  exact scan_sound 408004 _ _ _ cert_407005 p (Nat.lt_of_not_le hc406005) hhi hp

/-- Every prime `p` with `408005 ≤ p ≤ 410004` is `GoodP`. -/
theorem good_C204 (p : ℕ) (hlo : 408005 ≤ p) (hhi : p ≤ 410004) (hp : p.Prime) : GoodP p := by
  by_cases hc408005 : p ≤ 409004
  · exact scan_sound 409004 _ _ _ cert_408005 p hlo hc408005 hp
  exact scan_sound 410004 _ _ _ cert_409005 p (Nat.lt_of_not_le hc408005) hhi hp

/-- Every prime `p` with `410005 ≤ p ≤ 412004` is `GoodP`. -/
theorem good_C205 (p : ℕ) (hlo : 410005 ≤ p) (hhi : p ≤ 412004) (hp : p.Prime) : GoodP p := by
  by_cases hc410005 : p ≤ 411004
  · exact scan_sound 411004 _ _ _ cert_410005 p hlo hc410005 hp
  exact scan_sound 412004 _ _ _ cert_411005 p (Nat.lt_of_not_le hc410005) hhi hp

/-- Every prime `p` with `412005 ≤ p ≤ 414004` is `GoodP`. -/
theorem good_C206 (p : ℕ) (hlo : 412005 ≤ p) (hhi : p ≤ 414004) (hp : p.Prime) : GoodP p := by
  by_cases hc412005 : p ≤ 413004
  · exact scan_sound 413004 _ _ _ cert_412005 p hlo hc412005 hp
  exact scan_sound 414004 _ _ _ cert_413005 p (Nat.lt_of_not_le hc412005) hhi hp

/-- Every prime `p` with `414005 ≤ p ≤ 416004` is `GoodP`. -/
theorem good_C207 (p : ℕ) (hlo : 414005 ≤ p) (hhi : p ≤ 416004) (hp : p.Prime) : GoodP p := by
  by_cases hc414005 : p ≤ 415004
  · exact scan_sound 415004 _ _ _ cert_414005 p hlo hc414005 hp
  exact scan_sound 416004 _ _ _ cert_415005 p (Nat.lt_of_not_le hc414005) hhi hp

/-- Every prime `p` with `416005 ≤ p ≤ 418004` is `GoodP`. -/
theorem good_C208 (p : ℕ) (hlo : 416005 ≤ p) (hhi : p ≤ 418004) (hp : p.Prime) : GoodP p := by
  by_cases hc416005 : p ≤ 417004
  · exact scan_sound 417004 _ _ _ cert_416005 p hlo hc416005 hp
  exact scan_sound 418004 _ _ _ cert_417005 p (Nat.lt_of_not_le hc416005) hhi hp

/-- Every prime `p` with `418005 ≤ p ≤ 420004` is `GoodP`. -/
theorem good_C209 (p : ℕ) (hlo : 418005 ≤ p) (hhi : p ≤ 420004) (hp : p.Prime) : GoodP p := by
  by_cases hc418005 : p ≤ 419004
  · exact scan_sound 419004 _ _ _ cert_418005 p hlo hc418005 hp
  exact scan_sound 420004 _ _ _ cert_419005 p (Nat.lt_of_not_le hc418005) hhi hp

/-- Every prime `p` with `420005 ≤ p ≤ 422004` is `GoodP`. -/
theorem good_C210 (p : ℕ) (hlo : 420005 ≤ p) (hhi : p ≤ 422004) (hp : p.Prime) : GoodP p := by
  by_cases hc420005 : p ≤ 421004
  · exact scan_sound 421004 _ _ _ cert_420005 p hlo hc420005 hp
  exact scan_sound 422004 _ _ _ cert_421005 p (Nat.lt_of_not_le hc420005) hhi hp

/-- Every prime `p` with `422005 ≤ p ≤ 424004` is `GoodP`. -/
theorem good_C211 (p : ℕ) (hlo : 422005 ≤ p) (hhi : p ≤ 424004) (hp : p.Prime) : GoodP p := by
  by_cases hc422005 : p ≤ 423004
  · exact scan_sound 423004 _ _ _ cert_422005 p hlo hc422005 hp
  exact scan_sound 424004 _ _ _ cert_423005 p (Nat.lt_of_not_le hc422005) hhi hp

/-- Every prime `p` with `424005 ≤ p ≤ 426004` is `GoodP`. -/
theorem good_C212 (p : ℕ) (hlo : 424005 ≤ p) (hhi : p ≤ 426004) (hp : p.Prime) : GoodP p := by
  by_cases hc424005 : p ≤ 425004
  · exact scan_sound 425004 _ _ _ cert_424005 p hlo hc424005 hp
  exact scan_sound 426004 _ _ _ cert_425005 p (Nat.lt_of_not_le hc424005) hhi hp

/-- Every prime `p` with `426005 ≤ p ≤ 428004` is `GoodP`. -/
theorem good_C213 (p : ℕ) (hlo : 426005 ≤ p) (hhi : p ≤ 428004) (hp : p.Prime) : GoodP p := by
  by_cases hc426005 : p ≤ 427004
  · exact scan_sound 427004 _ _ _ cert_426005 p hlo hc426005 hp
  exact scan_sound 428004 _ _ _ cert_427005 p (Nat.lt_of_not_le hc426005) hhi hp

/-- Every prime `p` with `428005 ≤ p ≤ 430004` is `GoodP`. -/
theorem good_C214 (p : ℕ) (hlo : 428005 ≤ p) (hhi : p ≤ 430004) (hp : p.Prime) : GoodP p := by
  by_cases hc428005 : p ≤ 429004
  · exact scan_sound 429004 _ _ _ cert_428005 p hlo hc428005 hp
  exact scan_sound 430004 _ _ _ cert_429005 p (Nat.lt_of_not_le hc428005) hhi hp

/-- Every prime `p` with `430005 ≤ p ≤ 432004` is `GoodP`. -/
theorem good_C215 (p : ℕ) (hlo : 430005 ≤ p) (hhi : p ≤ 432004) (hp : p.Prime) : GoodP p := by
  by_cases hc430005 : p ≤ 431004
  · exact scan_sound 431004 _ _ _ cert_430005 p hlo hc430005 hp
  exact scan_sound 432004 _ _ _ cert_431005 p (Nat.lt_of_not_le hc430005) hhi hp

/-- Every prime `p` with `432005 ≤ p ≤ 434004` is `GoodP`. -/
theorem good_C216 (p : ℕ) (hlo : 432005 ≤ p) (hhi : p ≤ 434004) (hp : p.Prime) : GoodP p := by
  by_cases hc432005 : p ≤ 433004
  · exact scan_sound 433004 _ _ _ cert_432005 p hlo hc432005 hp
  exact scan_sound 434004 _ _ _ cert_433005 p (Nat.lt_of_not_le hc432005) hhi hp

/-- Every prime `p` with `434005 ≤ p ≤ 436004` is `GoodP`. -/
theorem good_C217 (p : ℕ) (hlo : 434005 ≤ p) (hhi : p ≤ 436004) (hp : p.Prime) : GoodP p := by
  by_cases hc434005 : p ≤ 435004
  · exact scan_sound 435004 _ _ _ cert_434005 p hlo hc434005 hp
  exact scan_sound 436004 _ _ _ cert_435005 p (Nat.lt_of_not_le hc434005) hhi hp

/-- Every prime `p` with `436005 ≤ p ≤ 438004` is `GoodP`. -/
theorem good_C218 (p : ℕ) (hlo : 436005 ≤ p) (hhi : p ≤ 438004) (hp : p.Prime) : GoodP p := by
  by_cases hc436005 : p ≤ 437004
  · exact scan_sound 437004 _ _ _ cert_436005 p hlo hc436005 hp
  exact scan_sound 438004 _ _ _ cert_437005 p (Nat.lt_of_not_le hc436005) hhi hp

/-- Every prime `p` with `438005 ≤ p ≤ 440004` is `GoodP`. -/
theorem good_C219 (p : ℕ) (hlo : 438005 ≤ p) (hhi : p ≤ 440004) (hp : p.Prime) : GoodP p := by
  by_cases hc438005 : p ≤ 439004
  · exact scan_sound 439004 _ _ _ cert_438005 p hlo hc438005 hp
  exact scan_sound 440004 _ _ _ cert_439005 p (Nat.lt_of_not_le hc438005) hhi hp

/-- Every prime `p` with `440005 ≤ p ≤ 442004` is `GoodP`. -/
theorem good_C220 (p : ℕ) (hlo : 440005 ≤ p) (hhi : p ≤ 442004) (hp : p.Prime) : GoodP p := by
  by_cases hc440005 : p ≤ 441004
  · exact scan_sound 441004 _ _ _ cert_440005 p hlo hc440005 hp
  exact scan_sound 442004 _ _ _ cert_441005 p (Nat.lt_of_not_le hc440005) hhi hp

/-- Every prime `p` with `442005 ≤ p ≤ 444004` is `GoodP`. -/
theorem good_C221 (p : ℕ) (hlo : 442005 ≤ p) (hhi : p ≤ 444004) (hp : p.Prime) : GoodP p := by
  by_cases hc442005 : p ≤ 443004
  · exact scan_sound 443004 _ _ _ cert_442005 p hlo hc442005 hp
  exact scan_sound 444004 _ _ _ cert_443005 p (Nat.lt_of_not_le hc442005) hhi hp

/-- Every prime `p` with `444005 ≤ p ≤ 446004` is `GoodP`. -/
theorem good_C222 (p : ℕ) (hlo : 444005 ≤ p) (hhi : p ≤ 446004) (hp : p.Prime) : GoodP p := by
  by_cases hc444005 : p ≤ 445004
  · exact scan_sound 445004 _ _ _ cert_444005 p hlo hc444005 hp
  exact scan_sound 446004 _ _ _ cert_445005 p (Nat.lt_of_not_le hc444005) hhi hp

/-- Every prime `p` with `446005 ≤ p ≤ 448004` is `GoodP`. -/
theorem good_C223 (p : ℕ) (hlo : 446005 ≤ p) (hhi : p ≤ 448004) (hp : p.Prime) : GoodP p := by
  by_cases hc446005 : p ≤ 447004
  · exact scan_sound 447004 _ _ _ cert_446005 p hlo hc446005 hp
  exact scan_sound 448004 _ _ _ cert_447005 p (Nat.lt_of_not_le hc446005) hhi hp

/-- Every prime `p` with `448005 ≤ p ≤ 450004` is `GoodP`. -/
theorem good_C224 (p : ℕ) (hlo : 448005 ≤ p) (hhi : p ≤ 450004) (hp : p.Prime) : GoodP p := by
  by_cases hc448005 : p ≤ 449004
  · exact scan_sound 449004 _ _ _ cert_448005 p hlo hc448005 hp
  exact scan_sound 450004 _ _ _ cert_449005 p (Nat.lt_of_not_le hc448005) hhi hp

/-- Every prime `p` with `450005 ≤ p ≤ 452004` is `GoodP`. -/
theorem good_C225 (p : ℕ) (hlo : 450005 ≤ p) (hhi : p ≤ 452004) (hp : p.Prime) : GoodP p := by
  by_cases hc450005 : p ≤ 451004
  · exact scan_sound 451004 _ _ _ cert_450005 p hlo hc450005 hp
  exact scan_sound 452004 _ _ _ cert_451005 p (Nat.lt_of_not_le hc450005) hhi hp

/-- Every prime `p` with `452005 ≤ p ≤ 454004` is `GoodP`. -/
theorem good_C226 (p : ℕ) (hlo : 452005 ≤ p) (hhi : p ≤ 454004) (hp : p.Prime) : GoodP p := by
  by_cases hc452005 : p ≤ 453004
  · exact scan_sound 453004 _ _ _ cert_452005 p hlo hc452005 hp
  exact scan_sound 454004 _ _ _ cert_453005 p (Nat.lt_of_not_le hc452005) hhi hp

/-- Every prime `p` with `454005 ≤ p ≤ 456004` is `GoodP`. -/
theorem good_C227 (p : ℕ) (hlo : 454005 ≤ p) (hhi : p ≤ 456004) (hp : p.Prime) : GoodP p := by
  by_cases hc454005 : p ≤ 455004
  · exact scan_sound 455004 _ _ _ cert_454005 p hlo hc454005 hp
  exact scan_sound 456004 _ _ _ cert_455005 p (Nat.lt_of_not_le hc454005) hhi hp

/-- Every prime `p` with `456005 ≤ p ≤ 458004` is `GoodP`. -/
theorem good_C228 (p : ℕ) (hlo : 456005 ≤ p) (hhi : p ≤ 458004) (hp : p.Prime) : GoodP p := by
  by_cases hc456005 : p ≤ 457004
  · exact scan_sound 457004 _ _ _ cert_456005 p hlo hc456005 hp
  exact scan_sound 458004 _ _ _ cert_457005 p (Nat.lt_of_not_le hc456005) hhi hp

/-- Every prime `p` with `458005 ≤ p ≤ 460004` is `GoodP`. -/
theorem good_C229 (p : ℕ) (hlo : 458005 ≤ p) (hhi : p ≤ 460004) (hp : p.Prime) : GoodP p := by
  by_cases hc458005 : p ≤ 459004
  · exact scan_sound 459004 _ _ _ cert_458005 p hlo hc458005 hp
  exact scan_sound 460004 _ _ _ cert_459005 p (Nat.lt_of_not_le hc458005) hhi hp

/-- Every prime `p` with `460005 ≤ p ≤ 462004` is `GoodP`. -/
theorem good_C230 (p : ℕ) (hlo : 460005 ≤ p) (hhi : p ≤ 462004) (hp : p.Prime) : GoodP p := by
  by_cases hc460005 : p ≤ 461004
  · exact scan_sound 461004 _ _ _ cert_460005 p hlo hc460005 hp
  exact scan_sound 462004 _ _ _ cert_461005 p (Nat.lt_of_not_le hc460005) hhi hp

/-- Every prime `p` with `462005 ≤ p ≤ 464004` is `GoodP`. -/
theorem good_C231 (p : ℕ) (hlo : 462005 ≤ p) (hhi : p ≤ 464004) (hp : p.Prime) : GoodP p := by
  by_cases hc462005 : p ≤ 463004
  · exact scan_sound 463004 _ _ _ cert_462005 p hlo hc462005 hp
  exact scan_sound 464004 _ _ _ cert_463005 p (Nat.lt_of_not_le hc462005) hhi hp

/-- Every prime `p` with `464005 ≤ p ≤ 466004` is `GoodP`. -/
theorem good_C232 (p : ℕ) (hlo : 464005 ≤ p) (hhi : p ≤ 466004) (hp : p.Prime) : GoodP p := by
  by_cases hc464005 : p ≤ 465004
  · exact scan_sound 465004 _ _ _ cert_464005 p hlo hc464005 hp
  exact scan_sound 466004 _ _ _ cert_465005 p (Nat.lt_of_not_le hc464005) hhi hp

/-- Every prime `p` with `466005 ≤ p ≤ 468004` is `GoodP`. -/
theorem good_C233 (p : ℕ) (hlo : 466005 ≤ p) (hhi : p ≤ 468004) (hp : p.Prime) : GoodP p := by
  by_cases hc466005 : p ≤ 467004
  · exact scan_sound 467004 _ _ _ cert_466005 p hlo hc466005 hp
  exact scan_sound 468004 _ _ _ cert_467005 p (Nat.lt_of_not_le hc466005) hhi hp

/-- Every prime `p` with `468005 ≤ p ≤ 470004` is `GoodP`. -/
theorem good_C234 (p : ℕ) (hlo : 468005 ≤ p) (hhi : p ≤ 470004) (hp : p.Prime) : GoodP p := by
  by_cases hc468005 : p ≤ 469004
  · exact scan_sound 469004 _ _ _ cert_468005 p hlo hc468005 hp
  exact scan_sound 470004 _ _ _ cert_469005 p (Nat.lt_of_not_le hc468005) hhi hp

/-- Every prime `p` with `470005 ≤ p ≤ 472004` is `GoodP`. -/
theorem good_C235 (p : ℕ) (hlo : 470005 ≤ p) (hhi : p ≤ 472004) (hp : p.Prime) : GoodP p := by
  by_cases hc470005 : p ≤ 471004
  · exact scan_sound 471004 _ _ _ cert_470005 p hlo hc470005 hp
  exact scan_sound 472004 _ _ _ cert_471005 p (Nat.lt_of_not_le hc470005) hhi hp

/-- Every prime `p` with `472005 ≤ p ≤ 474004` is `GoodP`. -/
theorem good_C236 (p : ℕ) (hlo : 472005 ≤ p) (hhi : p ≤ 474004) (hp : p.Prime) : GoodP p := by
  by_cases hc472005 : p ≤ 473004
  · exact scan_sound 473004 _ _ _ cert_472005 p hlo hc472005 hp
  exact scan_sound 474004 _ _ _ cert_473005 p (Nat.lt_of_not_le hc472005) hhi hp

/-- Every prime `p` with `474005 ≤ p ≤ 476004` is `GoodP`. -/
theorem good_C237 (p : ℕ) (hlo : 474005 ≤ p) (hhi : p ≤ 476004) (hp : p.Prime) : GoodP p := by
  by_cases hc474005 : p ≤ 475004
  · exact scan_sound 475004 _ _ _ cert_474005 p hlo hc474005 hp
  exact scan_sound 476004 _ _ _ cert_475005 p (Nat.lt_of_not_le hc474005) hhi hp

/-- Every prime `p` with `476005 ≤ p ≤ 478004` is `GoodP`. -/
theorem good_C238 (p : ℕ) (hlo : 476005 ≤ p) (hhi : p ≤ 478004) (hp : p.Prime) : GoodP p := by
  by_cases hc476005 : p ≤ 477004
  · exact scan_sound 477004 _ _ _ cert_476005 p hlo hc476005 hp
  exact scan_sound 478004 _ _ _ cert_477005 p (Nat.lt_of_not_le hc476005) hhi hp

/-- Every prime `p` with `478005 ≤ p ≤ 480004` is `GoodP`. -/
theorem good_C239 (p : ℕ) (hlo : 478005 ≤ p) (hhi : p ≤ 480004) (hp : p.Prime) : GoodP p := by
  by_cases hc478005 : p ≤ 479004
  · exact scan_sound 479004 _ _ _ cert_478005 p hlo hc478005 hp
  exact scan_sound 480004 _ _ _ cert_479005 p (Nat.lt_of_not_le hc478005) hhi hp

/-- Every prime `p` with `480005 ≤ p ≤ 482004` is `GoodP`. -/
theorem good_C240 (p : ℕ) (hlo : 480005 ≤ p) (hhi : p ≤ 482004) (hp : p.Prime) : GoodP p := by
  by_cases hc480005 : p ≤ 481004
  · exact scan_sound 481004 _ _ _ cert_480005 p hlo hc480005 hp
  exact scan_sound 482004 _ _ _ cert_481005 p (Nat.lt_of_not_le hc480005) hhi hp

/-- Every prime `p` with `482005 ≤ p ≤ 484004` is `GoodP`. -/
theorem good_C241 (p : ℕ) (hlo : 482005 ≤ p) (hhi : p ≤ 484004) (hp : p.Prime) : GoodP p := by
  by_cases hc482005 : p ≤ 483004
  · exact scan_sound 483004 _ _ _ cert_482005 p hlo hc482005 hp
  exact scan_sound 484004 _ _ _ cert_483005 p (Nat.lt_of_not_le hc482005) hhi hp

/-- Every prime `p` with `484005 ≤ p ≤ 486004` is `GoodP`. -/
theorem good_C242 (p : ℕ) (hlo : 484005 ≤ p) (hhi : p ≤ 486004) (hp : p.Prime) : GoodP p := by
  by_cases hc484005 : p ≤ 485004
  · exact scan_sound 485004 _ _ _ cert_484005 p hlo hc484005 hp
  exact scan_sound 486004 _ _ _ cert_485005 p (Nat.lt_of_not_le hc484005) hhi hp

/-- Every prime `p` with `486005 ≤ p ≤ 488004` is `GoodP`. -/
theorem good_C243 (p : ℕ) (hlo : 486005 ≤ p) (hhi : p ≤ 488004) (hp : p.Prime) : GoodP p := by
  by_cases hc486005 : p ≤ 487004
  · exact scan_sound 487004 _ _ _ cert_486005 p hlo hc486005 hp
  exact scan_sound 488004 _ _ _ cert_487005 p (Nat.lt_of_not_le hc486005) hhi hp

/-- Every prime `p` with `488005 ≤ p ≤ 490004` is `GoodP`. -/
theorem good_C244 (p : ℕ) (hlo : 488005 ≤ p) (hhi : p ≤ 490004) (hp : p.Prime) : GoodP p := by
  by_cases hc488005 : p ≤ 489004
  · exact scan_sound 489004 _ _ _ cert_488005 p hlo hc488005 hp
  exact scan_sound 490004 _ _ _ cert_489005 p (Nat.lt_of_not_le hc488005) hhi hp

/-- Every prime `p` with `490005 ≤ p ≤ 492004` is `GoodP`. -/
theorem good_C245 (p : ℕ) (hlo : 490005 ≤ p) (hhi : p ≤ 492004) (hp : p.Prime) : GoodP p := by
  by_cases hc490005 : p ≤ 491004
  · exact scan_sound 491004 _ _ _ cert_490005 p hlo hc490005 hp
  exact scan_sound 492004 _ _ _ cert_491005 p (Nat.lt_of_not_le hc490005) hhi hp

/-- Every prime `p` with `492005 ≤ p ≤ 494004` is `GoodP`. -/
theorem good_C246 (p : ℕ) (hlo : 492005 ≤ p) (hhi : p ≤ 494004) (hp : p.Prime) : GoodP p := by
  by_cases hc492005 : p ≤ 493004
  · exact scan_sound 493004 _ _ _ cert_492005 p hlo hc492005 hp
  exact scan_sound 494004 _ _ _ cert_493005 p (Nat.lt_of_not_le hc492005) hhi hp

/-- Every prime `p` with `494005 ≤ p ≤ 496004` is `GoodP`. -/
theorem good_C247 (p : ℕ) (hlo : 494005 ≤ p) (hhi : p ≤ 496004) (hp : p.Prime) : GoodP p := by
  by_cases hc494005 : p ≤ 495004
  · exact scan_sound 495004 _ _ _ cert_494005 p hlo hc494005 hp
  exact scan_sound 496004 _ _ _ cert_495005 p (Nat.lt_of_not_le hc494005) hhi hp

/-- Every prime `p` with `496005 ≤ p ≤ 498004` is `GoodP`. -/
theorem good_C248 (p : ℕ) (hlo : 496005 ≤ p) (hhi : p ≤ 498004) (hp : p.Prime) : GoodP p := by
  by_cases hc496005 : p ≤ 497004
  · exact scan_sound 497004 _ _ _ cert_496005 p hlo hc496005 hp
  exact scan_sound 498004 _ _ _ cert_497005 p (Nat.lt_of_not_le hc496005) hhi hp

/-- Every prime `p` with `498005 ≤ p ≤ 500004` is `GoodP`. -/
theorem good_C249 (p : ℕ) (hlo : 498005 ≤ p) (hhi : p ≤ 500004) (hp : p.Prime) : GoodP p := by
  by_cases hc498005 : p ≤ 499004
  · exact scan_sound 499004 _ _ _ cert_498005 p hlo hc498005 hp
  exact scan_sound 500004 _ _ _ cert_499005 p (Nat.lt_of_not_le hc498005) hhi hp

/-- Every prime `p` with `500005 ≤ p ≤ 502004` is `GoodP`. -/
theorem good_C250 (p : ℕ) (hlo : 500005 ≤ p) (hhi : p ≤ 502004) (hp : p.Prime) : GoodP p := by
  by_cases hc500005 : p ≤ 501004
  · exact scan_sound 501004 _ _ _ cert_500005 p hlo hc500005 hp
  exact scan_sound 502004 _ _ _ cert_501005 p (Nat.lt_of_not_le hc500005) hhi hp

/-- Every prime `p` with `502005 ≤ p ≤ 504004` is `GoodP`. -/
theorem good_C251 (p : ℕ) (hlo : 502005 ≤ p) (hhi : p ≤ 504004) (hp : p.Prime) : GoodP p := by
  by_cases hc502005 : p ≤ 503004
  · exact scan_sound 503004 _ _ _ cert_502005 p hlo hc502005 hp
  exact scan_sound 504004 _ _ _ cert_503005 p (Nat.lt_of_not_le hc502005) hhi hp

/-- Every prime `p` with `504005 ≤ p ≤ 506004` is `GoodP`. -/
theorem good_C252 (p : ℕ) (hlo : 504005 ≤ p) (hhi : p ≤ 506004) (hp : p.Prime) : GoodP p := by
  by_cases hc504005 : p ≤ 505004
  · exact scan_sound 505004 _ _ _ cert_504005 p hlo hc504005 hp
  exact scan_sound 506004 _ _ _ cert_505005 p (Nat.lt_of_not_le hc504005) hhi hp

/-- Every prime `p` with `506005 ≤ p ≤ 508004` is `GoodP`. -/
theorem good_C253 (p : ℕ) (hlo : 506005 ≤ p) (hhi : p ≤ 508004) (hp : p.Prime) : GoodP p := by
  by_cases hc506005 : p ≤ 507004
  · exact scan_sound 507004 _ _ _ cert_506005 p hlo hc506005 hp
  exact scan_sound 508004 _ _ _ cert_507005 p (Nat.lt_of_not_le hc506005) hhi hp

/-- Every prime `p` with `508005 ≤ p ≤ 510004` is `GoodP`. -/
theorem good_C254 (p : ℕ) (hlo : 508005 ≤ p) (hhi : p ≤ 510004) (hp : p.Prime) : GoodP p := by
  by_cases hc508005 : p ≤ 509004
  · exact scan_sound 509004 _ _ _ cert_508005 p hlo hc508005 hp
  exact scan_sound 510004 _ _ _ cert_509005 p (Nat.lt_of_not_le hc508005) hhi hp

/-- Every prime `p` with `510005 ≤ p ≤ 512004` is `GoodP`. -/
theorem good_C255 (p : ℕ) (hlo : 510005 ≤ p) (hhi : p ≤ 512004) (hp : p.Prime) : GoodP p := by
  by_cases hc510005 : p ≤ 511004
  · exact scan_sound 511004 _ _ _ cert_510005 p hlo hc510005 hp
  exact scan_sound 512004 _ _ _ cert_511005 p (Nat.lt_of_not_le hc510005) hhi hp

/-- Every prime `p` with `512005 ≤ p ≤ 514004` is `GoodP`. -/
theorem good_C256 (p : ℕ) (hlo : 512005 ≤ p) (hhi : p ≤ 514004) (hp : p.Prime) : GoodP p := by
  by_cases hc512005 : p ≤ 513004
  · exact scan_sound 513004 _ _ _ cert_512005 p hlo hc512005 hp
  exact scan_sound 514004 _ _ _ cert_513005 p (Nat.lt_of_not_le hc512005) hhi hp

/-- Every prime `p` with `514005 ≤ p ≤ 516004` is `GoodP`. -/
theorem good_C257 (p : ℕ) (hlo : 514005 ≤ p) (hhi : p ≤ 516004) (hp : p.Prime) : GoodP p := by
  by_cases hc514005 : p ≤ 515004
  · exact scan_sound 515004 _ _ _ cert_514005 p hlo hc514005 hp
  exact scan_sound 516004 _ _ _ cert_515005 p (Nat.lt_of_not_le hc514005) hhi hp

/-- Every prime `p` with `516005 ≤ p ≤ 518004` is `GoodP`. -/
theorem good_C258 (p : ℕ) (hlo : 516005 ≤ p) (hhi : p ≤ 518004) (hp : p.Prime) : GoodP p := by
  by_cases hc516005 : p ≤ 517004
  · exact scan_sound 517004 _ _ _ cert_516005 p hlo hc516005 hp
  exact scan_sound 518004 _ _ _ cert_517005 p (Nat.lt_of_not_le hc516005) hhi hp

/-- Every prime `p` with `518005 ≤ p ≤ 520004` is `GoodP`. -/
theorem good_C259 (p : ℕ) (hlo : 518005 ≤ p) (hhi : p ≤ 520004) (hp : p.Prime) : GoodP p := by
  by_cases hc518005 : p ≤ 519004
  · exact scan_sound 519004 _ _ _ cert_518005 p hlo hc518005 hp
  exact scan_sound 520004 _ _ _ cert_519005 p (Nat.lt_of_not_le hc518005) hhi hp

/-- Every prime `p` with `520005 ≤ p ≤ 522004` is `GoodP`. -/
theorem good_C260 (p : ℕ) (hlo : 520005 ≤ p) (hhi : p ≤ 522004) (hp : p.Prime) : GoodP p := by
  by_cases hc520005 : p ≤ 521004
  · exact scan_sound 521004 _ _ _ cert_520005 p hlo hc520005 hp
  exact scan_sound 522004 _ _ _ cert_521005 p (Nat.lt_of_not_le hc520005) hhi hp

/-- Every prime `p` with `522005 ≤ p ≤ 524004` is `GoodP`. -/
theorem good_C261 (p : ℕ) (hlo : 522005 ≤ p) (hhi : p ≤ 524004) (hp : p.Prime) : GoodP p := by
  by_cases hc522005 : p ≤ 523004
  · exact scan_sound 523004 _ _ _ cert_522005 p hlo hc522005 hp
  exact scan_sound 524004 _ _ _ cert_523005 p (Nat.lt_of_not_le hc522005) hhi hp

/-- Every prime `p` with `524005 ≤ p ≤ 526004` is `GoodP`. -/
theorem good_C262 (p : ℕ) (hlo : 524005 ≤ p) (hhi : p ≤ 526004) (hp : p.Prime) : GoodP p := by
  by_cases hc524005 : p ≤ 525004
  · exact scan_sound 525004 _ _ _ cert_524005 p hlo hc524005 hp
  exact scan_sound 526004 _ _ _ cert_525005 p (Nat.lt_of_not_le hc524005) hhi hp

/-- Every prime `p` with `526005 ≤ p ≤ 528004` is `GoodP`. -/
theorem good_C263 (p : ℕ) (hlo : 526005 ≤ p) (hhi : p ≤ 528004) (hp : p.Prime) : GoodP p := by
  by_cases hc526005 : p ≤ 527004
  · exact scan_sound 527004 _ _ _ cert_526005 p hlo hc526005 hp
  exact scan_sound 528004 _ _ _ cert_527005 p (Nat.lt_of_not_le hc526005) hhi hp

/-- Every prime `p` with `528005 ≤ p ≤ 530004` is `GoodP`. -/
theorem good_C264 (p : ℕ) (hlo : 528005 ≤ p) (hhi : p ≤ 530004) (hp : p.Prime) : GoodP p := by
  by_cases hc528005 : p ≤ 529004
  · exact scan_sound 529004 _ _ _ cert_528005 p hlo hc528005 hp
  exact scan_sound 530004 _ _ _ cert_529005 p (Nat.lt_of_not_le hc528005) hhi hp

/-- Every prime `p` with `530005 ≤ p ≤ 532004` is `GoodP`. -/
theorem good_C265 (p : ℕ) (hlo : 530005 ≤ p) (hhi : p ≤ 532004) (hp : p.Prime) : GoodP p := by
  by_cases hc530005 : p ≤ 531004
  · exact scan_sound 531004 _ _ _ cert_530005 p hlo hc530005 hp
  exact scan_sound 532004 _ _ _ cert_531005 p (Nat.lt_of_not_le hc530005) hhi hp

/-- Every prime `p` with `532005 ≤ p ≤ 534004` is `GoodP`. -/
theorem good_C266 (p : ℕ) (hlo : 532005 ≤ p) (hhi : p ≤ 534004) (hp : p.Prime) : GoodP p := by
  by_cases hc532005 : p ≤ 533004
  · exact scan_sound 533004 _ _ _ cert_532005 p hlo hc532005 hp
  exact scan_sound 534004 _ _ _ cert_533005 p (Nat.lt_of_not_le hc532005) hhi hp

/-- Every prime `p` with `534005 ≤ p ≤ 536004` is `GoodP`. -/
theorem good_C267 (p : ℕ) (hlo : 534005 ≤ p) (hhi : p ≤ 536004) (hp : p.Prime) : GoodP p := by
  by_cases hc534005 : p ≤ 535004
  · exact scan_sound 535004 _ _ _ cert_534005 p hlo hc534005 hp
  exact scan_sound 536004 _ _ _ cert_535005 p (Nat.lt_of_not_le hc534005) hhi hp

/-- Every prime `p` with `536005 ≤ p ≤ 538004` is `GoodP`. -/
theorem good_C268 (p : ℕ) (hlo : 536005 ≤ p) (hhi : p ≤ 538004) (hp : p.Prime) : GoodP p := by
  by_cases hc536005 : p ≤ 537004
  · exact scan_sound 537004 _ _ _ cert_536005 p hlo hc536005 hp
  exact scan_sound 538004 _ _ _ cert_537005 p (Nat.lt_of_not_le hc536005) hhi hp

/-- Every prime `p` with `538005 ≤ p ≤ 540004` is `GoodP`. -/
theorem good_C269 (p : ℕ) (hlo : 538005 ≤ p) (hhi : p ≤ 540004) (hp : p.Prime) : GoodP p := by
  by_cases hc538005 : p ≤ 539004
  · exact scan_sound 539004 _ _ _ cert_538005 p hlo hc538005 hp
  exact scan_sound 540004 _ _ _ cert_539005 p (Nat.lt_of_not_le hc538005) hhi hp

/-- Every prime `p` with `540005 ≤ p ≤ 542004` is `GoodP`. -/
theorem good_C270 (p : ℕ) (hlo : 540005 ≤ p) (hhi : p ≤ 542004) (hp : p.Prime) : GoodP p := by
  by_cases hc540005 : p ≤ 541004
  · exact scan_sound 541004 _ _ _ cert_540005 p hlo hc540005 hp
  exact scan_sound 542004 _ _ _ cert_541005 p (Nat.lt_of_not_le hc540005) hhi hp

/-- Every prime `p` with `542005 ≤ p ≤ 544004` is `GoodP`. -/
theorem good_C271 (p : ℕ) (hlo : 542005 ≤ p) (hhi : p ≤ 544004) (hp : p.Prime) : GoodP p := by
  by_cases hc542005 : p ≤ 543004
  · exact scan_sound 543004 _ _ _ cert_542005 p hlo hc542005 hp
  exact scan_sound 544004 _ _ _ cert_543005 p (Nat.lt_of_not_le hc542005) hhi hp

/-- Every prime `p` with `544005 ≤ p ≤ 546004` is `GoodP`. -/
theorem good_C272 (p : ℕ) (hlo : 544005 ≤ p) (hhi : p ≤ 546004) (hp : p.Prime) : GoodP p := by
  by_cases hc544005 : p ≤ 545004
  · exact scan_sound 545004 _ _ _ cert_544005 p hlo hc544005 hp
  exact scan_sound 546004 _ _ _ cert_545005 p (Nat.lt_of_not_le hc544005) hhi hp

/-- Every prime `p` with `546005 ≤ p ≤ 548004` is `GoodP`. -/
theorem good_C273 (p : ℕ) (hlo : 546005 ≤ p) (hhi : p ≤ 548004) (hp : p.Prime) : GoodP p := by
  by_cases hc546005 : p ≤ 547004
  · exact scan_sound 547004 _ _ _ cert_546005 p hlo hc546005 hp
  exact scan_sound 548004 _ _ _ cert_547005 p (Nat.lt_of_not_le hc546005) hhi hp

/-- Every prime `p` with `548005 ≤ p ≤ 550004` is `GoodP`. -/
theorem good_C274 (p : ℕ) (hlo : 548005 ≤ p) (hhi : p ≤ 550004) (hp : p.Prime) : GoodP p := by
  by_cases hc548005 : p ≤ 549004
  · exact scan_sound 549004 _ _ _ cert_548005 p hlo hc548005 hp
  exact scan_sound 550004 _ _ _ cert_549005 p (Nat.lt_of_not_le hc548005) hhi hp

/-- Every prime `p` with `550005 ≤ p ≤ 552004` is `GoodP`. -/
theorem good_C275 (p : ℕ) (hlo : 550005 ≤ p) (hhi : p ≤ 552004) (hp : p.Prime) : GoodP p := by
  by_cases hc550005 : p ≤ 551004
  · exact scan_sound 551004 _ _ _ cert_550005 p hlo hc550005 hp
  exact scan_sound 552004 _ _ _ cert_551005 p (Nat.lt_of_not_le hc550005) hhi hp

/-- Every prime `p` with `552005 ≤ p ≤ 554004` is `GoodP`. -/
theorem good_C276 (p : ℕ) (hlo : 552005 ≤ p) (hhi : p ≤ 554004) (hp : p.Prime) : GoodP p := by
  by_cases hc552005 : p ≤ 553004
  · exact scan_sound 553004 _ _ _ cert_552005 p hlo hc552005 hp
  exact scan_sound 554004 _ _ _ cert_553005 p (Nat.lt_of_not_le hc552005) hhi hp

/-- Every prime `p` with `554005 ≤ p ≤ 556004` is `GoodP`. -/
theorem good_C277 (p : ℕ) (hlo : 554005 ≤ p) (hhi : p ≤ 556004) (hp : p.Prime) : GoodP p := by
  by_cases hc554005 : p ≤ 555004
  · exact scan_sound 555004 _ _ _ cert_554005 p hlo hc554005 hp
  exact scan_sound 556004 _ _ _ cert_555005 p (Nat.lt_of_not_le hc554005) hhi hp

/-- Every prime `p` with `556005 ≤ p ≤ 558004` is `GoodP`. -/
theorem good_C278 (p : ℕ) (hlo : 556005 ≤ p) (hhi : p ≤ 558004) (hp : p.Prime) : GoodP p := by
  by_cases hc556005 : p ≤ 557004
  · exact scan_sound 557004 _ _ _ cert_556005 p hlo hc556005 hp
  exact scan_sound 558004 _ _ _ cert_557005 p (Nat.lt_of_not_le hc556005) hhi hp

/-- Every prime `p` with `558005 ≤ p ≤ 560004` is `GoodP`. -/
theorem good_C279 (p : ℕ) (hlo : 558005 ≤ p) (hhi : p ≤ 560004) (hp : p.Prime) : GoodP p := by
  by_cases hc558005 : p ≤ 559004
  · exact scan_sound 559004 _ _ _ cert_558005 p hlo hc558005 hp
  exact scan_sound 560004 _ _ _ cert_559005 p (Nat.lt_of_not_le hc558005) hhi hp

/-- Every prime `p` with `560005 ≤ p ≤ 562004` is `GoodP`. -/
theorem good_C280 (p : ℕ) (hlo : 560005 ≤ p) (hhi : p ≤ 562004) (hp : p.Prime) : GoodP p := by
  by_cases hc560005 : p ≤ 561004
  · exact scan_sound 561004 _ _ _ cert_560005 p hlo hc560005 hp
  exact scan_sound 562004 _ _ _ cert_561005 p (Nat.lt_of_not_le hc560005) hhi hp

/-- Every prime `p` with `562005 ≤ p ≤ 564004` is `GoodP`. -/
theorem good_C281 (p : ℕ) (hlo : 562005 ≤ p) (hhi : p ≤ 564004) (hp : p.Prime) : GoodP p := by
  by_cases hc562005 : p ≤ 563004
  · exact scan_sound 563004 _ _ _ cert_562005 p hlo hc562005 hp
  exact scan_sound 564004 _ _ _ cert_563005 p (Nat.lt_of_not_le hc562005) hhi hp

/-- Every prime `p` with `564005 ≤ p ≤ 566004` is `GoodP`. -/
theorem good_C282 (p : ℕ) (hlo : 564005 ≤ p) (hhi : p ≤ 566004) (hp : p.Prime) : GoodP p := by
  by_cases hc564005 : p ≤ 565004
  · exact scan_sound 565004 _ _ _ cert_564005 p hlo hc564005 hp
  exact scan_sound 566004 _ _ _ cert_565005 p (Nat.lt_of_not_le hc564005) hhi hp

/-- Every prime `p` with `566005 ≤ p ≤ 568004` is `GoodP`. -/
theorem good_C283 (p : ℕ) (hlo : 566005 ≤ p) (hhi : p ≤ 568004) (hp : p.Prime) : GoodP p := by
  by_cases hc566005 : p ≤ 567004
  · exact scan_sound 567004 _ _ _ cert_566005 p hlo hc566005 hp
  exact scan_sound 568004 _ _ _ cert_567005 p (Nat.lt_of_not_le hc566005) hhi hp

/-- Every prime `p` with `568005 ≤ p ≤ 570004` is `GoodP`. -/
theorem good_C284 (p : ℕ) (hlo : 568005 ≤ p) (hhi : p ≤ 570004) (hp : p.Prime) : GoodP p := by
  by_cases hc568005 : p ≤ 569004
  · exact scan_sound 569004 _ _ _ cert_568005 p hlo hc568005 hp
  exact scan_sound 570004 _ _ _ cert_569005 p (Nat.lt_of_not_le hc568005) hhi hp

/-- Every prime `p` with `570005 ≤ p ≤ 572004` is `GoodP`. -/
theorem good_C285 (p : ℕ) (hlo : 570005 ≤ p) (hhi : p ≤ 572004) (hp : p.Prime) : GoodP p := by
  by_cases hc570005 : p ≤ 571004
  · exact scan_sound 571004 _ _ _ cert_570005 p hlo hc570005 hp
  exact scan_sound 572004 _ _ _ cert_571005 p (Nat.lt_of_not_le hc570005) hhi hp

/-- Every prime `p` with `572005 ≤ p ≤ 574004` is `GoodP`. -/
theorem good_C286 (p : ℕ) (hlo : 572005 ≤ p) (hhi : p ≤ 574004) (hp : p.Prime) : GoodP p := by
  by_cases hc572005 : p ≤ 573004
  · exact scan_sound 573004 _ _ _ cert_572005 p hlo hc572005 hp
  exact scan_sound 574004 _ _ _ cert_573005 p (Nat.lt_of_not_le hc572005) hhi hp

/-- Every prime `p` with `574005 ≤ p ≤ 576004` is `GoodP`. -/
theorem good_C287 (p : ℕ) (hlo : 574005 ≤ p) (hhi : p ≤ 576004) (hp : p.Prime) : GoodP p := by
  by_cases hc574005 : p ≤ 575004
  · exact scan_sound 575004 _ _ _ cert_574005 p hlo hc574005 hp
  exact scan_sound 576004 _ _ _ cert_575005 p (Nat.lt_of_not_le hc574005) hhi hp

/-- Every prime `p` with `576005 ≤ p ≤ 578004` is `GoodP`. -/
theorem good_C288 (p : ℕ) (hlo : 576005 ≤ p) (hhi : p ≤ 578004) (hp : p.Prime) : GoodP p := by
  by_cases hc576005 : p ≤ 577004
  · exact scan_sound 577004 _ _ _ cert_576005 p hlo hc576005 hp
  exact scan_sound 578004 _ _ _ cert_577005 p (Nat.lt_of_not_le hc576005) hhi hp

/-- Every prime `p` with `578005 ≤ p ≤ 580004` is `GoodP`. -/
theorem good_C289 (p : ℕ) (hlo : 578005 ≤ p) (hhi : p ≤ 580004) (hp : p.Prime) : GoodP p := by
  by_cases hc578005 : p ≤ 579004
  · exact scan_sound 579004 _ _ _ cert_578005 p hlo hc578005 hp
  exact scan_sound 580004 _ _ _ cert_579005 p (Nat.lt_of_not_le hc578005) hhi hp

/-- Every prime `p` with `580005 ≤ p ≤ 582004` is `GoodP`. -/
theorem good_C290 (p : ℕ) (hlo : 580005 ≤ p) (hhi : p ≤ 582004) (hp : p.Prime) : GoodP p := by
  by_cases hc580005 : p ≤ 581004
  · exact scan_sound 581004 _ _ _ cert_580005 p hlo hc580005 hp
  exact scan_sound 582004 _ _ _ cert_581005 p (Nat.lt_of_not_le hc580005) hhi hp

/-- Every prime `p` with `582005 ≤ p ≤ 584004` is `GoodP`. -/
theorem good_C291 (p : ℕ) (hlo : 582005 ≤ p) (hhi : p ≤ 584004) (hp : p.Prime) : GoodP p := by
  by_cases hc582005 : p ≤ 583004
  · exact scan_sound 583004 _ _ _ cert_582005 p hlo hc582005 hp
  exact scan_sound 584004 _ _ _ cert_583005 p (Nat.lt_of_not_le hc582005) hhi hp

/-- Every prime `p` with `584005 ≤ p ≤ 586004` is `GoodP`. -/
theorem good_C292 (p : ℕ) (hlo : 584005 ≤ p) (hhi : p ≤ 586004) (hp : p.Prime) : GoodP p := by
  by_cases hc584005 : p ≤ 585004
  · exact scan_sound 585004 _ _ _ cert_584005 p hlo hc584005 hp
  exact scan_sound 586004 _ _ _ cert_585005 p (Nat.lt_of_not_le hc584005) hhi hp

/-- Every prime `p` with `586005 ≤ p ≤ 588004` is `GoodP`. -/
theorem good_C293 (p : ℕ) (hlo : 586005 ≤ p) (hhi : p ≤ 588004) (hp : p.Prime) : GoodP p := by
  by_cases hc586005 : p ≤ 587004
  · exact scan_sound 587004 _ _ _ cert_586005 p hlo hc586005 hp
  exact scan_sound 588004 _ _ _ cert_587005 p (Nat.lt_of_not_le hc586005) hhi hp

/-- Every prime `p` with `588005 ≤ p ≤ 590004` is `GoodP`. -/
theorem good_C294 (p : ℕ) (hlo : 588005 ≤ p) (hhi : p ≤ 590004) (hp : p.Prime) : GoodP p := by
  by_cases hc588005 : p ≤ 589004
  · exact scan_sound 589004 _ _ _ cert_588005 p hlo hc588005 hp
  exact scan_sound 590004 _ _ _ cert_589005 p (Nat.lt_of_not_le hc588005) hhi hp

/-- Every prime `p` with `590005 ≤ p ≤ 592004` is `GoodP`. -/
theorem good_C295 (p : ℕ) (hlo : 590005 ≤ p) (hhi : p ≤ 592004) (hp : p.Prime) : GoodP p := by
  by_cases hc590005 : p ≤ 591004
  · exact scan_sound 591004 _ _ _ cert_590005 p hlo hc590005 hp
  exact scan_sound 592004 _ _ _ cert_591005 p (Nat.lt_of_not_le hc590005) hhi hp

/-- Every prime `p` with `592005 ≤ p ≤ 594004` is `GoodP`. -/
theorem good_C296 (p : ℕ) (hlo : 592005 ≤ p) (hhi : p ≤ 594004) (hp : p.Prime) : GoodP p := by
  by_cases hc592005 : p ≤ 593004
  · exact scan_sound 593004 _ _ _ cert_592005 p hlo hc592005 hp
  exact scan_sound 594004 _ _ _ cert_593005 p (Nat.lt_of_not_le hc592005) hhi hp

/-- Every prime `p` with `594005 ≤ p ≤ 596004` is `GoodP`. -/
theorem good_C297 (p : ℕ) (hlo : 594005 ≤ p) (hhi : p ≤ 596004) (hp : p.Prime) : GoodP p := by
  by_cases hc594005 : p ≤ 595004
  · exact scan_sound 595004 _ _ _ cert_594005 p hlo hc594005 hp
  exact scan_sound 596004 _ _ _ cert_595005 p (Nat.lt_of_not_le hc594005) hhi hp

/-- Every prime `p` with `596005 ≤ p ≤ 598004` is `GoodP`. -/
theorem good_C298 (p : ℕ) (hlo : 596005 ≤ p) (hhi : p ≤ 598004) (hp : p.Prime) : GoodP p := by
  by_cases hc596005 : p ≤ 597004
  · exact scan_sound 597004 _ _ _ cert_596005 p hlo hc596005 hp
  exact scan_sound 598004 _ _ _ cert_597005 p (Nat.lt_of_not_le hc596005) hhi hp

/-- Every prime `p` with `598005 ≤ p ≤ 600004` is `GoodP`. -/
theorem good_C299 (p : ℕ) (hlo : 598005 ≤ p) (hhi : p ≤ 600004) (hp : p.Prime) : GoodP p := by
  by_cases hc598005 : p ≤ 599004
  · exact scan_sound 599004 _ _ _ cert_598005 p hlo hc598005 hp
  exact scan_sound 600004 _ _ _ cert_599005 p (Nat.lt_of_not_le hc598005) hhi hp

/-- Every prime `p` with `600005 ≤ p ≤ 602004` is `GoodP`. -/
theorem good_C300 (p : ℕ) (hlo : 600005 ≤ p) (hhi : p ≤ 602004) (hp : p.Prime) : GoodP p := by
  by_cases hc600005 : p ≤ 601004
  · exact scan_sound 601004 _ _ _ cert_600005 p hlo hc600005 hp
  exact scan_sound 602004 _ _ _ cert_601005 p (Nat.lt_of_not_le hc600005) hhi hp

/-- Every prime `p` with `602005 ≤ p ≤ 604004` is `GoodP`. -/
theorem good_C301 (p : ℕ) (hlo : 602005 ≤ p) (hhi : p ≤ 604004) (hp : p.Prime) : GoodP p := by
  by_cases hc602005 : p ≤ 603004
  · exact scan_sound 603004 _ _ _ cert_602005 p hlo hc602005 hp
  exact scan_sound 604004 _ _ _ cert_603005 p (Nat.lt_of_not_le hc602005) hhi hp

/-- Every prime `p` with `604005 ≤ p ≤ 606004` is `GoodP`. -/
theorem good_C302 (p : ℕ) (hlo : 604005 ≤ p) (hhi : p ≤ 606004) (hp : p.Prime) : GoodP p := by
  by_cases hc604005 : p ≤ 605004
  · exact scan_sound 605004 _ _ _ cert_604005 p hlo hc604005 hp
  exact scan_sound 606004 _ _ _ cert_605005 p (Nat.lt_of_not_le hc604005) hhi hp

/-- Every prime `p` with `606005 ≤ p ≤ 608004` is `GoodP`. -/
theorem good_C303 (p : ℕ) (hlo : 606005 ≤ p) (hhi : p ≤ 608004) (hp : p.Prime) : GoodP p := by
  by_cases hc606005 : p ≤ 607004
  · exact scan_sound 607004 _ _ _ cert_606005 p hlo hc606005 hp
  exact scan_sound 608004 _ _ _ cert_607005 p (Nat.lt_of_not_le hc606005) hhi hp

/-- Every prime `p` with `608005 ≤ p ≤ 610004` is `GoodP`. -/
theorem good_C304 (p : ℕ) (hlo : 608005 ≤ p) (hhi : p ≤ 610004) (hp : p.Prime) : GoodP p := by
  by_cases hc608005 : p ≤ 609004
  · exact scan_sound 609004 _ _ _ cert_608005 p hlo hc608005 hp
  exact scan_sound 610004 _ _ _ cert_609005 p (Nat.lt_of_not_le hc608005) hhi hp

/-- Every prime `p` with `610005 ≤ p ≤ 612004` is `GoodP`. -/
theorem good_C305 (p : ℕ) (hlo : 610005 ≤ p) (hhi : p ≤ 612004) (hp : p.Prime) : GoodP p := by
  by_cases hc610005 : p ≤ 611004
  · exact scan_sound 611004 _ _ _ cert_610005 p hlo hc610005 hp
  exact scan_sound 612004 _ _ _ cert_611005 p (Nat.lt_of_not_le hc610005) hhi hp

/-- Every prime `p` with `612005 ≤ p ≤ 614004` is `GoodP`. -/
theorem good_C306 (p : ℕ) (hlo : 612005 ≤ p) (hhi : p ≤ 614004) (hp : p.Prime) : GoodP p := by
  by_cases hc612005 : p ≤ 613004
  · exact scan_sound 613004 _ _ _ cert_612005 p hlo hc612005 hp
  exact scan_sound 614004 _ _ _ cert_613005 p (Nat.lt_of_not_le hc612005) hhi hp

/-- Every prime `p` with `614005 ≤ p ≤ 616004` is `GoodP`. -/
theorem good_C307 (p : ℕ) (hlo : 614005 ≤ p) (hhi : p ≤ 616004) (hp : p.Prime) : GoodP p := by
  by_cases hc614005 : p ≤ 615004
  · exact scan_sound 615004 _ _ _ cert_614005 p hlo hc614005 hp
  exact scan_sound 616004 _ _ _ cert_615005 p (Nat.lt_of_not_le hc614005) hhi hp

/-- Every prime `p` with `616005 ≤ p ≤ 618004` is `GoodP`. -/
theorem good_C308 (p : ℕ) (hlo : 616005 ≤ p) (hhi : p ≤ 618004) (hp : p.Prime) : GoodP p := by
  by_cases hc616005 : p ≤ 617004
  · exact scan_sound 617004 _ _ _ cert_616005 p hlo hc616005 hp
  exact scan_sound 618004 _ _ _ cert_617005 p (Nat.lt_of_not_le hc616005) hhi hp

/-- Every prime `p` with `618005 ≤ p ≤ 620004` is `GoodP`. -/
theorem good_C309 (p : ℕ) (hlo : 618005 ≤ p) (hhi : p ≤ 620004) (hp : p.Prime) : GoodP p := by
  by_cases hc618005 : p ≤ 619004
  · exact scan_sound 619004 _ _ _ cert_618005 p hlo hc618005 hp
  exact scan_sound 620004 _ _ _ cert_619005 p (Nat.lt_of_not_le hc618005) hhi hp

/-- Every prime `p` with `620005 ≤ p ≤ 622004` is `GoodP`. -/
theorem good_C310 (p : ℕ) (hlo : 620005 ≤ p) (hhi : p ≤ 622004) (hp : p.Prime) : GoodP p := by
  by_cases hc620005 : p ≤ 621004
  · exact scan_sound 621004 _ _ _ cert_620005 p hlo hc620005 hp
  exact scan_sound 622004 _ _ _ cert_621005 p (Nat.lt_of_not_le hc620005) hhi hp

/-- Every prime `p` with `622005 ≤ p ≤ 624004` is `GoodP`. -/
theorem good_C311 (p : ℕ) (hlo : 622005 ≤ p) (hhi : p ≤ 624004) (hp : p.Prime) : GoodP p := by
  by_cases hc622005 : p ≤ 623004
  · exact scan_sound 623004 _ _ _ cert_622005 p hlo hc622005 hp
  exact scan_sound 624004 _ _ _ cert_623005 p (Nat.lt_of_not_le hc622005) hhi hp

/-- Every prime `p` with `624005 ≤ p ≤ 626004` is `GoodP`. -/
theorem good_C312 (p : ℕ) (hlo : 624005 ≤ p) (hhi : p ≤ 626004) (hp : p.Prime) : GoodP p := by
  by_cases hc624005 : p ≤ 625004
  · exact scan_sound 625004 _ _ _ cert_624005 p hlo hc624005 hp
  exact scan_sound 626004 _ _ _ cert_625005 p (Nat.lt_of_not_le hc624005) hhi hp

/-- Every prime `p` with `626005 ≤ p ≤ 628004` is `GoodP`. -/
theorem good_C313 (p : ℕ) (hlo : 626005 ≤ p) (hhi : p ≤ 628004) (hp : p.Prime) : GoodP p := by
  by_cases hc626005 : p ≤ 627004
  · exact scan_sound 627004 _ _ _ cert_626005 p hlo hc626005 hp
  exact scan_sound 628004 _ _ _ cert_627005 p (Nat.lt_of_not_le hc626005) hhi hp

/-- Every prime `p` with `628005 ≤ p ≤ 630004` is `GoodP`. -/
theorem good_C314 (p : ℕ) (hlo : 628005 ≤ p) (hhi : p ≤ 630004) (hp : p.Prime) : GoodP p := by
  by_cases hc628005 : p ≤ 629004
  · exact scan_sound 629004 _ _ _ cert_628005 p hlo hc628005 hp
  exact scan_sound 630004 _ _ _ cert_629005 p (Nat.lt_of_not_le hc628005) hhi hp

/-- Every prime `p` with `630005 ≤ p ≤ 632004` is `GoodP`. -/
theorem good_C315 (p : ℕ) (hlo : 630005 ≤ p) (hhi : p ≤ 632004) (hp : p.Prime) : GoodP p := by
  by_cases hc630005 : p ≤ 631004
  · exact scan_sound 631004 _ _ _ cert_630005 p hlo hc630005 hp
  exact scan_sound 632004 _ _ _ cert_631005 p (Nat.lt_of_not_le hc630005) hhi hp

/-- Every prime `p` with `632005 ≤ p ≤ 634004` is `GoodP`. -/
theorem good_C316 (p : ℕ) (hlo : 632005 ≤ p) (hhi : p ≤ 634004) (hp : p.Prime) : GoodP p := by
  by_cases hc632005 : p ≤ 633004
  · exact scan_sound 633004 _ _ _ cert_632005 p hlo hc632005 hp
  exact scan_sound 634004 _ _ _ cert_633005 p (Nat.lt_of_not_le hc632005) hhi hp

/-- Every prime `p` with `634005 ≤ p ≤ 636004` is `GoodP`. -/
theorem good_C317 (p : ℕ) (hlo : 634005 ≤ p) (hhi : p ≤ 636004) (hp : p.Prime) : GoodP p := by
  by_cases hc634005 : p ≤ 635004
  · exact scan_sound 635004 _ _ _ cert_634005 p hlo hc634005 hp
  exact scan_sound 636004 _ _ _ cert_635005 p (Nat.lt_of_not_le hc634005) hhi hp

/-- Every prime `p` with `636005 ≤ p ≤ 638004` is `GoodP`. -/
theorem good_C318 (p : ℕ) (hlo : 636005 ≤ p) (hhi : p ≤ 638004) (hp : p.Prime) : GoodP p := by
  by_cases hc636005 : p ≤ 637004
  · exact scan_sound 637004 _ _ _ cert_636005 p hlo hc636005 hp
  exact scan_sound 638004 _ _ _ cert_637005 p (Nat.lt_of_not_le hc636005) hhi hp

/-- Every prime `p` with `638005 ≤ p ≤ 640004` is `GoodP`. -/
theorem good_C319 (p : ℕ) (hlo : 638005 ≤ p) (hhi : p ≤ 640004) (hp : p.Prime) : GoodP p := by
  by_cases hc638005 : p ≤ 639004
  · exact scan_sound 639004 _ _ _ cert_638005 p hlo hc638005 hp
  exact scan_sound 640004 _ _ _ cert_639005 p (Nat.lt_of_not_le hc638005) hhi hp

/-- Every prime `p` with `640005 ≤ p ≤ 642004` is `GoodP`. -/
theorem good_C320 (p : ℕ) (hlo : 640005 ≤ p) (hhi : p ≤ 642004) (hp : p.Prime) : GoodP p := by
  by_cases hc640005 : p ≤ 641004
  · exact scan_sound 641004 _ _ _ cert_640005 p hlo hc640005 hp
  exact scan_sound 642004 _ _ _ cert_641005 p (Nat.lt_of_not_le hc640005) hhi hp

/-- Every prime `p` with `642005 ≤ p ≤ 644004` is `GoodP`. -/
theorem good_C321 (p : ℕ) (hlo : 642005 ≤ p) (hhi : p ≤ 644004) (hp : p.Prime) : GoodP p := by
  by_cases hc642005 : p ≤ 643004
  · exact scan_sound 643004 _ _ _ cert_642005 p hlo hc642005 hp
  exact scan_sound 644004 _ _ _ cert_643005 p (Nat.lt_of_not_le hc642005) hhi hp

/-- Every prime `p` with `644005 ≤ p ≤ 646004` is `GoodP`. -/
theorem good_C322 (p : ℕ) (hlo : 644005 ≤ p) (hhi : p ≤ 646004) (hp : p.Prime) : GoodP p := by
  by_cases hc644005 : p ≤ 645004
  · exact scan_sound 645004 _ _ _ cert_644005 p hlo hc644005 hp
  exact scan_sound 646004 _ _ _ cert_645005 p (Nat.lt_of_not_le hc644005) hhi hp

/-- Every prime `p` with `646005 ≤ p ≤ 648004` is `GoodP`. -/
theorem good_C323 (p : ℕ) (hlo : 646005 ≤ p) (hhi : p ≤ 648004) (hp : p.Prime) : GoodP p := by
  by_cases hc646005 : p ≤ 647004
  · exact scan_sound 647004 _ _ _ cert_646005 p hlo hc646005 hp
  exact scan_sound 648004 _ _ _ cert_647005 p (Nat.lt_of_not_le hc646005) hhi hp

/-- Every prime `p` with `648005 ≤ p ≤ 650004` is `GoodP`. -/
theorem good_C324 (p : ℕ) (hlo : 648005 ≤ p) (hhi : p ≤ 650004) (hp : p.Prime) : GoodP p := by
  by_cases hc648005 : p ≤ 649004
  · exact scan_sound 649004 _ _ _ cert_648005 p hlo hc648005 hp
  exact scan_sound 650004 _ _ _ cert_649005 p (Nat.lt_of_not_le hc648005) hhi hp

/-- Every prime `p` with `650005 ≤ p ≤ 652004` is `GoodP`. -/
theorem good_C325 (p : ℕ) (hlo : 650005 ≤ p) (hhi : p ≤ 652004) (hp : p.Prime) : GoodP p := by
  by_cases hc650005 : p ≤ 651004
  · exact scan_sound 651004 _ _ _ cert_650005 p hlo hc650005 hp
  exact scan_sound 652004 _ _ _ cert_651005 p (Nat.lt_of_not_le hc650005) hhi hp

/-- Every prime `p` with `652005 ≤ p ≤ 654004` is `GoodP`. -/
theorem good_C326 (p : ℕ) (hlo : 652005 ≤ p) (hhi : p ≤ 654004) (hp : p.Prime) : GoodP p := by
  by_cases hc652005 : p ≤ 653004
  · exact scan_sound 653004 _ _ _ cert_652005 p hlo hc652005 hp
  exact scan_sound 654004 _ _ _ cert_653005 p (Nat.lt_of_not_le hc652005) hhi hp

/-- Every prime `p` with `654005 ≤ p ≤ 656004` is `GoodP`. -/
theorem good_C327 (p : ℕ) (hlo : 654005 ≤ p) (hhi : p ≤ 656004) (hp : p.Prime) : GoodP p := by
  by_cases hc654005 : p ≤ 655004
  · exact scan_sound 655004 _ _ _ cert_654005 p hlo hc654005 hp
  exact scan_sound 656004 _ _ _ cert_655005 p (Nat.lt_of_not_le hc654005) hhi hp

/-- Every prime `p` with `656005 ≤ p ≤ 658004` is `GoodP`. -/
theorem good_C328 (p : ℕ) (hlo : 656005 ≤ p) (hhi : p ≤ 658004) (hp : p.Prime) : GoodP p := by
  by_cases hc656005 : p ≤ 657004
  · exact scan_sound 657004 _ _ _ cert_656005 p hlo hc656005 hp
  exact scan_sound 658004 _ _ _ cert_657005 p (Nat.lt_of_not_le hc656005) hhi hp

/-- Every prime `p` with `658005 ≤ p ≤ 660004` is `GoodP`. -/
theorem good_C329 (p : ℕ) (hlo : 658005 ≤ p) (hhi : p ≤ 660004) (hp : p.Prime) : GoodP p := by
  by_cases hc658005 : p ≤ 659004
  · exact scan_sound 659004 _ _ _ cert_658005 p hlo hc658005 hp
  exact scan_sound 660004 _ _ _ cert_659005 p (Nat.lt_of_not_le hc658005) hhi hp

/-- Every prime `p` with `660005 ≤ p ≤ 662004` is `GoodP`. -/
theorem good_C330 (p : ℕ) (hlo : 660005 ≤ p) (hhi : p ≤ 662004) (hp : p.Prime) : GoodP p := by
  by_cases hc660005 : p ≤ 661004
  · exact scan_sound 661004 _ _ _ cert_660005 p hlo hc660005 hp
  exact scan_sound 662004 _ _ _ cert_661005 p (Nat.lt_of_not_le hc660005) hhi hp

/-- Every prime `p` with `662005 ≤ p ≤ 664004` is `GoodP`. -/
theorem good_C331 (p : ℕ) (hlo : 662005 ≤ p) (hhi : p ≤ 664004) (hp : p.Prime) : GoodP p := by
  by_cases hc662005 : p ≤ 663004
  · exact scan_sound 663004 _ _ _ cert_662005 p hlo hc662005 hp
  exact scan_sound 664004 _ _ _ cert_663005 p (Nat.lt_of_not_le hc662005) hhi hp

/-- Every prime `p` with `664005 ≤ p ≤ 666004` is `GoodP`. -/
theorem good_C332 (p : ℕ) (hlo : 664005 ≤ p) (hhi : p ≤ 666004) (hp : p.Prime) : GoodP p := by
  by_cases hc664005 : p ≤ 665004
  · exact scan_sound 665004 _ _ _ cert_664005 p hlo hc664005 hp
  exact scan_sound 666004 _ _ _ cert_665005 p (Nat.lt_of_not_le hc664005) hhi hp

/-- Every prime `p` with `666005 ≤ p ≤ 668004` is `GoodP`. -/
theorem good_C333 (p : ℕ) (hlo : 666005 ≤ p) (hhi : p ≤ 668004) (hp : p.Prime) : GoodP p := by
  by_cases hc666005 : p ≤ 667004
  · exact scan_sound 667004 _ _ _ cert_666005 p hlo hc666005 hp
  exact scan_sound 668004 _ _ _ cert_667005 p (Nat.lt_of_not_le hc666005) hhi hp

/-- Every prime `p` with `668005 ≤ p ≤ 670004` is `GoodP`. -/
theorem good_C334 (p : ℕ) (hlo : 668005 ≤ p) (hhi : p ≤ 670004) (hp : p.Prime) : GoodP p := by
  by_cases hc668005 : p ≤ 669004
  · exact scan_sound 669004 _ _ _ cert_668005 p hlo hc668005 hp
  exact scan_sound 670004 _ _ _ cert_669005 p (Nat.lt_of_not_le hc668005) hhi hp

/-- Every prime `p` with `670005 ≤ p ≤ 672004` is `GoodP`. -/
theorem good_C335 (p : ℕ) (hlo : 670005 ≤ p) (hhi : p ≤ 672004) (hp : p.Prime) : GoodP p := by
  by_cases hc670005 : p ≤ 671004
  · exact scan_sound 671004 _ _ _ cert_670005 p hlo hc670005 hp
  exact scan_sound 672004 _ _ _ cert_671005 p (Nat.lt_of_not_le hc670005) hhi hp

/-- Every prime `p` with `672005 ≤ p ≤ 674004` is `GoodP`. -/
theorem good_C336 (p : ℕ) (hlo : 672005 ≤ p) (hhi : p ≤ 674004) (hp : p.Prime) : GoodP p := by
  by_cases hc672005 : p ≤ 673004
  · exact scan_sound 673004 _ _ _ cert_672005 p hlo hc672005 hp
  exact scan_sound 674004 _ _ _ cert_673005 p (Nat.lt_of_not_le hc672005) hhi hp

/-- Every prime `p` with `674005 ≤ p ≤ 676004` is `GoodP`. -/
theorem good_C337 (p : ℕ) (hlo : 674005 ≤ p) (hhi : p ≤ 676004) (hp : p.Prime) : GoodP p := by
  by_cases hc674005 : p ≤ 675004
  · exact scan_sound 675004 _ _ _ cert_674005 p hlo hc674005 hp
  exact scan_sound 676004 _ _ _ cert_675005 p (Nat.lt_of_not_le hc674005) hhi hp

/-- Every prime `p` with `676005 ≤ p ≤ 678004` is `GoodP`. -/
theorem good_C338 (p : ℕ) (hlo : 676005 ≤ p) (hhi : p ≤ 678004) (hp : p.Prime) : GoodP p := by
  by_cases hc676005 : p ≤ 677004
  · exact scan_sound 677004 _ _ _ cert_676005 p hlo hc676005 hp
  exact scan_sound 678004 _ _ _ cert_677005 p (Nat.lt_of_not_le hc676005) hhi hp

/-- Every prime `p` with `678005 ≤ p ≤ 680004` is `GoodP`. -/
theorem good_C339 (p : ℕ) (hlo : 678005 ≤ p) (hhi : p ≤ 680004) (hp : p.Prime) : GoodP p := by
  by_cases hc678005 : p ≤ 679004
  · exact scan_sound 679004 _ _ _ cert_678005 p hlo hc678005 hp
  exact scan_sound 680004 _ _ _ cert_679005 p (Nat.lt_of_not_le hc678005) hhi hp

/-- Every prime `p` with `680005 ≤ p ≤ 682004` is `GoodP`. -/
theorem good_C340 (p : ℕ) (hlo : 680005 ≤ p) (hhi : p ≤ 682004) (hp : p.Prime) : GoodP p := by
  by_cases hc680005 : p ≤ 681004
  · exact scan_sound 681004 _ _ _ cert_680005 p hlo hc680005 hp
  exact scan_sound 682004 _ _ _ cert_681005 p (Nat.lt_of_not_le hc680005) hhi hp

/-- Every prime `p` with `682005 ≤ p ≤ 684004` is `GoodP`. -/
theorem good_C341 (p : ℕ) (hlo : 682005 ≤ p) (hhi : p ≤ 684004) (hp : p.Prime) : GoodP p := by
  by_cases hc682005 : p ≤ 683004
  · exact scan_sound 683004 _ _ _ cert_682005 p hlo hc682005 hp
  exact scan_sound 684004 _ _ _ cert_683005 p (Nat.lt_of_not_le hc682005) hhi hp

/-- Every prime `p` with `684005 ≤ p ≤ 686004` is `GoodP`. -/
theorem good_C342 (p : ℕ) (hlo : 684005 ≤ p) (hhi : p ≤ 686004) (hp : p.Prime) : GoodP p := by
  by_cases hc684005 : p ≤ 685004
  · exact scan_sound 685004 _ _ _ cert_684005 p hlo hc684005 hp
  exact scan_sound 686004 _ _ _ cert_685005 p (Nat.lt_of_not_le hc684005) hhi hp

/-- Every prime `p` with `686005 ≤ p ≤ 688004` is `GoodP`. -/
theorem good_C343 (p : ℕ) (hlo : 686005 ≤ p) (hhi : p ≤ 688004) (hp : p.Prime) : GoodP p := by
  by_cases hc686005 : p ≤ 687004
  · exact scan_sound 687004 _ _ _ cert_686005 p hlo hc686005 hp
  exact scan_sound 688004 _ _ _ cert_687005 p (Nat.lt_of_not_le hc686005) hhi hp

/-- Every prime `p` with `688005 ≤ p ≤ 690004` is `GoodP`. -/
theorem good_C344 (p : ℕ) (hlo : 688005 ≤ p) (hhi : p ≤ 690004) (hp : p.Prime) : GoodP p := by
  by_cases hc688005 : p ≤ 689004
  · exact scan_sound 689004 _ _ _ cert_688005 p hlo hc688005 hp
  exact scan_sound 690004 _ _ _ cert_689005 p (Nat.lt_of_not_le hc688005) hhi hp

/-- Every prime `p` with `690005 ≤ p ≤ 692004` is `GoodP`. -/
theorem good_C345 (p : ℕ) (hlo : 690005 ≤ p) (hhi : p ≤ 692004) (hp : p.Prime) : GoodP p := by
  by_cases hc690005 : p ≤ 691004
  · exact scan_sound 691004 _ _ _ cert_690005 p hlo hc690005 hp
  exact scan_sound 692004 _ _ _ cert_691005 p (Nat.lt_of_not_le hc690005) hhi hp

/-- Every prime `p` with `692005 ≤ p ≤ 694004` is `GoodP`. -/
theorem good_C346 (p : ℕ) (hlo : 692005 ≤ p) (hhi : p ≤ 694004) (hp : p.Prime) : GoodP p := by
  by_cases hc692005 : p ≤ 693004
  · exact scan_sound 693004 _ _ _ cert_692005 p hlo hc692005 hp
  exact scan_sound 694004 _ _ _ cert_693005 p (Nat.lt_of_not_le hc692005) hhi hp

/-- Every prime `p` with `694005 ≤ p ≤ 696004` is `GoodP`. -/
theorem good_C347 (p : ℕ) (hlo : 694005 ≤ p) (hhi : p ≤ 696004) (hp : p.Prime) : GoodP p := by
  by_cases hc694005 : p ≤ 695004
  · exact scan_sound 695004 _ _ _ cert_694005 p hlo hc694005 hp
  exact scan_sound 696004 _ _ _ cert_695005 p (Nat.lt_of_not_le hc694005) hhi hp

/-- Every prime `p` with `696005 ≤ p ≤ 698004` is `GoodP`. -/
theorem good_C348 (p : ℕ) (hlo : 696005 ≤ p) (hhi : p ≤ 698004) (hp : p.Prime) : GoodP p := by
  by_cases hc696005 : p ≤ 697004
  · exact scan_sound 697004 _ _ _ cert_696005 p hlo hc696005 hp
  exact scan_sound 698004 _ _ _ cert_697005 p (Nat.lt_of_not_le hc696005) hhi hp

/-- Every prime `p` with `698005 ≤ p ≤ 700004` is `GoodP`. -/
theorem good_C349 (p : ℕ) (hlo : 698005 ≤ p) (hhi : p ≤ 700004) (hp : p.Prime) : GoodP p := by
  by_cases hc698005 : p ≤ 699004
  · exact scan_sound 699004 _ _ _ cert_698005 p hlo hc698005 hp
  exact scan_sound 700004 _ _ _ cert_699005 p (Nat.lt_of_not_le hc698005) hhi hp

/-- Every prime `p` with `700005 ≤ p ≤ 702004` is `GoodP`. -/
theorem good_C350 (p : ℕ) (hlo : 700005 ≤ p) (hhi : p ≤ 702004) (hp : p.Prime) : GoodP p := by
  by_cases hc700005 : p ≤ 701004
  · exact scan_sound 701004 _ _ _ cert_700005 p hlo hc700005 hp
  exact scan_sound 702004 _ _ _ cert_701005 p (Nat.lt_of_not_le hc700005) hhi hp

/-- Every prime `p` with `702005 ≤ p ≤ 704004` is `GoodP`. -/
theorem good_C351 (p : ℕ) (hlo : 702005 ≤ p) (hhi : p ≤ 704004) (hp : p.Prime) : GoodP p := by
  by_cases hc702005 : p ≤ 703004
  · exact scan_sound 703004 _ _ _ cert_702005 p hlo hc702005 hp
  exact scan_sound 704004 _ _ _ cert_703005 p (Nat.lt_of_not_le hc702005) hhi hp

/-- Every prime `p` with `704005 ≤ p ≤ 706004` is `GoodP`. -/
theorem good_C352 (p : ℕ) (hlo : 704005 ≤ p) (hhi : p ≤ 706004) (hp : p.Prime) : GoodP p := by
  by_cases hc704005 : p ≤ 705004
  · exact scan_sound 705004 _ _ _ cert_704005 p hlo hc704005 hp
  exact scan_sound 706004 _ _ _ cert_705005 p (Nat.lt_of_not_le hc704005) hhi hp

/-- Every prime `p` with `706005 ≤ p ≤ 708004` is `GoodP`. -/
theorem good_C353 (p : ℕ) (hlo : 706005 ≤ p) (hhi : p ≤ 708004) (hp : p.Prime) : GoodP p := by
  by_cases hc706005 : p ≤ 707004
  · exact scan_sound 707004 _ _ _ cert_706005 p hlo hc706005 hp
  exact scan_sound 708004 _ _ _ cert_707005 p (Nat.lt_of_not_le hc706005) hhi hp

/-- Every prime `p` with `708005 ≤ p ≤ 710004` is `GoodP`. -/
theorem good_C354 (p : ℕ) (hlo : 708005 ≤ p) (hhi : p ≤ 710004) (hp : p.Prime) : GoodP p := by
  by_cases hc708005 : p ≤ 709004
  · exact scan_sound 709004 _ _ _ cert_708005 p hlo hc708005 hp
  exact scan_sound 710004 _ _ _ cert_709005 p (Nat.lt_of_not_le hc708005) hhi hp

/-- Every prime `p` with `710005 ≤ p ≤ 712004` is `GoodP`. -/
theorem good_C355 (p : ℕ) (hlo : 710005 ≤ p) (hhi : p ≤ 712004) (hp : p.Prime) : GoodP p := by
  by_cases hc710005 : p ≤ 711004
  · exact scan_sound 711004 _ _ _ cert_710005 p hlo hc710005 hp
  exact scan_sound 712004 _ _ _ cert_711005 p (Nat.lt_of_not_le hc710005) hhi hp

/-- Every prime `p` with `712005 ≤ p ≤ 714004` is `GoodP`. -/
theorem good_C356 (p : ℕ) (hlo : 712005 ≤ p) (hhi : p ≤ 714004) (hp : p.Prime) : GoodP p := by
  by_cases hc712005 : p ≤ 713004
  · exact scan_sound 713004 _ _ _ cert_712005 p hlo hc712005 hp
  exact scan_sound 714004 _ _ _ cert_713005 p (Nat.lt_of_not_le hc712005) hhi hp

/-- Every prime `p` with `714005 ≤ p ≤ 716004` is `GoodP`. -/
theorem good_C357 (p : ℕ) (hlo : 714005 ≤ p) (hhi : p ≤ 716004) (hp : p.Prime) : GoodP p := by
  by_cases hc714005 : p ≤ 715004
  · exact scan_sound 715004 _ _ _ cert_714005 p hlo hc714005 hp
  exact scan_sound 716004 _ _ _ cert_715005 p (Nat.lt_of_not_le hc714005) hhi hp

/-- Every prime `p` with `716005 ≤ p ≤ 718004` is `GoodP`. -/
theorem good_C358 (p : ℕ) (hlo : 716005 ≤ p) (hhi : p ≤ 718004) (hp : p.Prime) : GoodP p := by
  by_cases hc716005 : p ≤ 717004
  · exact scan_sound 717004 _ _ _ cert_716005 p hlo hc716005 hp
  exact scan_sound 718004 _ _ _ cert_717005 p (Nat.lt_of_not_le hc716005) hhi hp

/-- Every prime `p` with `718005 ≤ p ≤ 720004` is `GoodP`. -/
theorem good_C359 (p : ℕ) (hlo : 718005 ≤ p) (hhi : p ≤ 720004) (hp : p.Prime) : GoodP p := by
  by_cases hc718005 : p ≤ 719004
  · exact scan_sound 719004 _ _ _ cert_718005 p hlo hc718005 hp
  exact scan_sound 720004 _ _ _ cert_719005 p (Nat.lt_of_not_le hc718005) hhi hp

/-- Every prime `p` with `720005 ≤ p ≤ 722004` is `GoodP`. -/
theorem good_C360 (p : ℕ) (hlo : 720005 ≤ p) (hhi : p ≤ 722004) (hp : p.Prime) : GoodP p := by
  by_cases hc720005 : p ≤ 721004
  · exact scan_sound 721004 _ _ _ cert_720005 p hlo hc720005 hp
  exact scan_sound 722004 _ _ _ cert_721005 p (Nat.lt_of_not_le hc720005) hhi hp

/-- Every prime `p` with `722005 ≤ p ≤ 724004` is `GoodP`. -/
theorem good_C361 (p : ℕ) (hlo : 722005 ≤ p) (hhi : p ≤ 724004) (hp : p.Prime) : GoodP p := by
  by_cases hc722005 : p ≤ 723004
  · exact scan_sound 723004 _ _ _ cert_722005 p hlo hc722005 hp
  exact scan_sound 724004 _ _ _ cert_723005 p (Nat.lt_of_not_le hc722005) hhi hp

/-- Every prime `p` with `724005 ≤ p ≤ 726004` is `GoodP`. -/
theorem good_C362 (p : ℕ) (hlo : 724005 ≤ p) (hhi : p ≤ 726004) (hp : p.Prime) : GoodP p := by
  by_cases hc724005 : p ≤ 725004
  · exact scan_sound 725004 _ _ _ cert_724005 p hlo hc724005 hp
  exact scan_sound 726004 _ _ _ cert_725005 p (Nat.lt_of_not_le hc724005) hhi hp

/-- Every prime `p` with `726005 ≤ p ≤ 728004` is `GoodP`. -/
theorem good_C363 (p : ℕ) (hlo : 726005 ≤ p) (hhi : p ≤ 728004) (hp : p.Prime) : GoodP p := by
  by_cases hc726005 : p ≤ 727004
  · exact scan_sound 727004 _ _ _ cert_726005 p hlo hc726005 hp
  exact scan_sound 728004 _ _ _ cert_727005 p (Nat.lt_of_not_le hc726005) hhi hp

/-- Every prime `p` with `728005 ≤ p ≤ 730004` is `GoodP`. -/
theorem good_C364 (p : ℕ) (hlo : 728005 ≤ p) (hhi : p ≤ 730004) (hp : p.Prime) : GoodP p := by
  by_cases hc728005 : p ≤ 729004
  · exact scan_sound 729004 _ _ _ cert_728005 p hlo hc728005 hp
  exact scan_sound 730004 _ _ _ cert_729005 p (Nat.lt_of_not_le hc728005) hhi hp

/-- Every prime `p` with `730005 ≤ p ≤ 732004` is `GoodP`. -/
theorem good_C365 (p : ℕ) (hlo : 730005 ≤ p) (hhi : p ≤ 732004) (hp : p.Prime) : GoodP p := by
  by_cases hc730005 : p ≤ 731004
  · exact scan_sound 731004 _ _ _ cert_730005 p hlo hc730005 hp
  exact scan_sound 732004 _ _ _ cert_731005 p (Nat.lt_of_not_le hc730005) hhi hp

/-- Every prime `p` with `732005 ≤ p ≤ 734004` is `GoodP`. -/
theorem good_C366 (p : ℕ) (hlo : 732005 ≤ p) (hhi : p ≤ 734004) (hp : p.Prime) : GoodP p := by
  by_cases hc732005 : p ≤ 733004
  · exact scan_sound 733004 _ _ _ cert_732005 p hlo hc732005 hp
  exact scan_sound 734004 _ _ _ cert_733005 p (Nat.lt_of_not_le hc732005) hhi hp

/-- Every prime `p` with `734005 ≤ p ≤ 736004` is `GoodP`. -/
theorem good_C367 (p : ℕ) (hlo : 734005 ≤ p) (hhi : p ≤ 736004) (hp : p.Prime) : GoodP p := by
  by_cases hc734005 : p ≤ 735004
  · exact scan_sound 735004 _ _ _ cert_734005 p hlo hc734005 hp
  exact scan_sound 736004 _ _ _ cert_735005 p (Nat.lt_of_not_le hc734005) hhi hp

/-- Every prime `p` with `736005 ≤ p ≤ 738004` is `GoodP`. -/
theorem good_C368 (p : ℕ) (hlo : 736005 ≤ p) (hhi : p ≤ 738004) (hp : p.Prime) : GoodP p := by
  by_cases hc736005 : p ≤ 737004
  · exact scan_sound 737004 _ _ _ cert_736005 p hlo hc736005 hp
  exact scan_sound 738004 _ _ _ cert_737005 p (Nat.lt_of_not_le hc736005) hhi hp

/-- Every prime `p` with `738005 ≤ p ≤ 740004` is `GoodP`. -/
theorem good_C369 (p : ℕ) (hlo : 738005 ≤ p) (hhi : p ≤ 740004) (hp : p.Prime) : GoodP p := by
  by_cases hc738005 : p ≤ 739004
  · exact scan_sound 739004 _ _ _ cert_738005 p hlo hc738005 hp
  exact scan_sound 740004 _ _ _ cert_739005 p (Nat.lt_of_not_le hc738005) hhi hp

/-- Every prime `p` with `740005 ≤ p ≤ 742004` is `GoodP`. -/
theorem good_C370 (p : ℕ) (hlo : 740005 ≤ p) (hhi : p ≤ 742004) (hp : p.Prime) : GoodP p := by
  by_cases hc740005 : p ≤ 741004
  · exact scan_sound 741004 _ _ _ cert_740005 p hlo hc740005 hp
  exact scan_sound 742004 _ _ _ cert_741005 p (Nat.lt_of_not_le hc740005) hhi hp

/-- Every prime `p` with `742005 ≤ p ≤ 744004` is `GoodP`. -/
theorem good_C371 (p : ℕ) (hlo : 742005 ≤ p) (hhi : p ≤ 744004) (hp : p.Prime) : GoodP p := by
  by_cases hc742005 : p ≤ 743004
  · exact scan_sound 743004 _ _ _ cert_742005 p hlo hc742005 hp
  exact scan_sound 744004 _ _ _ cert_743005 p (Nat.lt_of_not_le hc742005) hhi hp

/-- Every prime `p` with `744005 ≤ p ≤ 746004` is `GoodP`. -/
theorem good_C372 (p : ℕ) (hlo : 744005 ≤ p) (hhi : p ≤ 746004) (hp : p.Prime) : GoodP p := by
  by_cases hc744005 : p ≤ 745004
  · exact scan_sound 745004 _ _ _ cert_744005 p hlo hc744005 hp
  exact scan_sound 746004 _ _ _ cert_745005 p (Nat.lt_of_not_le hc744005) hhi hp

/-- Every prime `p` with `746005 ≤ p ≤ 748004` is `GoodP`. -/
theorem good_C373 (p : ℕ) (hlo : 746005 ≤ p) (hhi : p ≤ 748004) (hp : p.Prime) : GoodP p := by
  by_cases hc746005 : p ≤ 747004
  · exact scan_sound 747004 _ _ _ cert_746005 p hlo hc746005 hp
  exact scan_sound 748004 _ _ _ cert_747005 p (Nat.lt_of_not_le hc746005) hhi hp

/-- Every prime `p` with `748005 ≤ p ≤ 750004` is `GoodP`. -/
theorem good_C374 (p : ℕ) (hlo : 748005 ≤ p) (hhi : p ≤ 750004) (hp : p.Prime) : GoodP p := by
  by_cases hc748005 : p ≤ 749004
  · exact scan_sound 749004 _ _ _ cert_748005 p hlo hc748005 hp
  exact scan_sound 750004 _ _ _ cert_749005 p (Nat.lt_of_not_le hc748005) hhi hp

/-- Every prime `p` with `750005 ≤ p ≤ 752004` is `GoodP`. -/
theorem good_C375 (p : ℕ) (hlo : 750005 ≤ p) (hhi : p ≤ 752004) (hp : p.Prime) : GoodP p := by
  by_cases hc750005 : p ≤ 751004
  · exact scan_sound 751004 _ _ _ cert_750005 p hlo hc750005 hp
  exact scan_sound 752004 _ _ _ cert_751005 p (Nat.lt_of_not_le hc750005) hhi hp

/-- Every prime `p` with `752005 ≤ p ≤ 754004` is `GoodP`. -/
theorem good_C376 (p : ℕ) (hlo : 752005 ≤ p) (hhi : p ≤ 754004) (hp : p.Prime) : GoodP p := by
  by_cases hc752005 : p ≤ 753004
  · exact scan_sound 753004 _ _ _ cert_752005 p hlo hc752005 hp
  exact scan_sound 754004 _ _ _ cert_753005 p (Nat.lt_of_not_le hc752005) hhi hp

/-- Every prime `p` with `754005 ≤ p ≤ 756004` is `GoodP`. -/
theorem good_C377 (p : ℕ) (hlo : 754005 ≤ p) (hhi : p ≤ 756004) (hp : p.Prime) : GoodP p := by
  by_cases hc754005 : p ≤ 755004
  · exact scan_sound 755004 _ _ _ cert_754005 p hlo hc754005 hp
  exact scan_sound 756004 _ _ _ cert_755005 p (Nat.lt_of_not_le hc754005) hhi hp

/-- Every prime `p` with `756005 ≤ p ≤ 758004` is `GoodP`. -/
theorem good_C378 (p : ℕ) (hlo : 756005 ≤ p) (hhi : p ≤ 758004) (hp : p.Prime) : GoodP p := by
  by_cases hc756005 : p ≤ 757004
  · exact scan_sound 757004 _ _ _ cert_756005 p hlo hc756005 hp
  exact scan_sound 758004 _ _ _ cert_757005 p (Nat.lt_of_not_le hc756005) hhi hp

/-- Every prime `p` with `758005 ≤ p ≤ 760004` is `GoodP`. -/
theorem good_C379 (p : ℕ) (hlo : 758005 ≤ p) (hhi : p ≤ 760004) (hp : p.Prime) : GoodP p := by
  by_cases hc758005 : p ≤ 759004
  · exact scan_sound 759004 _ _ _ cert_758005 p hlo hc758005 hp
  exact scan_sound 760004 _ _ _ cert_759005 p (Nat.lt_of_not_le hc758005) hhi hp

/-- Every prime `p` with `760005 ≤ p ≤ 762004` is `GoodP`. -/
theorem good_C380 (p : ℕ) (hlo : 760005 ≤ p) (hhi : p ≤ 762004) (hp : p.Prime) : GoodP p := by
  by_cases hc760005 : p ≤ 761004
  · exact scan_sound 761004 _ _ _ cert_760005 p hlo hc760005 hp
  exact scan_sound 762004 _ _ _ cert_761005 p (Nat.lt_of_not_le hc760005) hhi hp

/-- Every prime `p` with `762005 ≤ p ≤ 764004` is `GoodP`. -/
theorem good_C381 (p : ℕ) (hlo : 762005 ≤ p) (hhi : p ≤ 764004) (hp : p.Prime) : GoodP p := by
  by_cases hc762005 : p ≤ 763004
  · exact scan_sound 763004 _ _ _ cert_762005 p hlo hc762005 hp
  exact scan_sound 764004 _ _ _ cert_763005 p (Nat.lt_of_not_le hc762005) hhi hp

/-- Every prime `p` with `764005 ≤ p ≤ 766004` is `GoodP`. -/
theorem good_C382 (p : ℕ) (hlo : 764005 ≤ p) (hhi : p ≤ 766004) (hp : p.Prime) : GoodP p := by
  by_cases hc764005 : p ≤ 765004
  · exact scan_sound 765004 _ _ _ cert_764005 p hlo hc764005 hp
  exact scan_sound 766004 _ _ _ cert_765005 p (Nat.lt_of_not_le hc764005) hhi hp

/-- Every prime `p` with `766005 ≤ p ≤ 768004` is `GoodP`. -/
theorem good_C383 (p : ℕ) (hlo : 766005 ≤ p) (hhi : p ≤ 768004) (hp : p.Prime) : GoodP p := by
  by_cases hc766005 : p ≤ 767004
  · exact scan_sound 767004 _ _ _ cert_766005 p hlo hc766005 hp
  exact scan_sound 768004 _ _ _ cert_767005 p (Nat.lt_of_not_le hc766005) hhi hp

/-- Every prime `p` with `768005 ≤ p ≤ 770004` is `GoodP`. -/
theorem good_C384 (p : ℕ) (hlo : 768005 ≤ p) (hhi : p ≤ 770004) (hp : p.Prime) : GoodP p := by
  by_cases hc768005 : p ≤ 769004
  · exact scan_sound 769004 _ _ _ cert_768005 p hlo hc768005 hp
  exact scan_sound 770004 _ _ _ cert_769005 p (Nat.lt_of_not_le hc768005) hhi hp

/-- Every prime `p` with `770005 ≤ p ≤ 772004` is `GoodP`. -/
theorem good_C385 (p : ℕ) (hlo : 770005 ≤ p) (hhi : p ≤ 772004) (hp : p.Prime) : GoodP p := by
  by_cases hc770005 : p ≤ 771004
  · exact scan_sound 771004 _ _ _ cert_770005 p hlo hc770005 hp
  exact scan_sound 772004 _ _ _ cert_771005 p (Nat.lt_of_not_le hc770005) hhi hp

/-- Every prime `p` with `772005 ≤ p ≤ 774004` is `GoodP`. -/
theorem good_C386 (p : ℕ) (hlo : 772005 ≤ p) (hhi : p ≤ 774004) (hp : p.Prime) : GoodP p := by
  by_cases hc772005 : p ≤ 773004
  · exact scan_sound 773004 _ _ _ cert_772005 p hlo hc772005 hp
  exact scan_sound 774004 _ _ _ cert_773005 p (Nat.lt_of_not_le hc772005) hhi hp

/-- Every prime `p` with `774005 ≤ p ≤ 776004` is `GoodP`. -/
theorem good_C387 (p : ℕ) (hlo : 774005 ≤ p) (hhi : p ≤ 776004) (hp : p.Prime) : GoodP p := by
  by_cases hc774005 : p ≤ 775004
  · exact scan_sound 775004 _ _ _ cert_774005 p hlo hc774005 hp
  exact scan_sound 776004 _ _ _ cert_775005 p (Nat.lt_of_not_le hc774005) hhi hp

/-- Every prime `p` with `776005 ≤ p ≤ 778004` is `GoodP`. -/
theorem good_C388 (p : ℕ) (hlo : 776005 ≤ p) (hhi : p ≤ 778004) (hp : p.Prime) : GoodP p := by
  by_cases hc776005 : p ≤ 777004
  · exact scan_sound 777004 _ _ _ cert_776005 p hlo hc776005 hp
  exact scan_sound 778004 _ _ _ cert_777005 p (Nat.lt_of_not_le hc776005) hhi hp

/-- Every prime `p` with `778005 ≤ p ≤ 780004` is `GoodP`. -/
theorem good_C389 (p : ℕ) (hlo : 778005 ≤ p) (hhi : p ≤ 780004) (hp : p.Prime) : GoodP p := by
  by_cases hc778005 : p ≤ 779004
  · exact scan_sound 779004 _ _ _ cert_778005 p hlo hc778005 hp
  exact scan_sound 780004 _ _ _ cert_779005 p (Nat.lt_of_not_le hc778005) hhi hp

/-- Every prime `p` with `780005 ≤ p ≤ 782004` is `GoodP`. -/
theorem good_C390 (p : ℕ) (hlo : 780005 ≤ p) (hhi : p ≤ 782004) (hp : p.Prime) : GoodP p := by
  by_cases hc780005 : p ≤ 781004
  · exact scan_sound 781004 _ _ _ cert_780005 p hlo hc780005 hp
  exact scan_sound 782004 _ _ _ cert_781005 p (Nat.lt_of_not_le hc780005) hhi hp

/-- Every prime `p` with `782005 ≤ p ≤ 784004` is `GoodP`. -/
theorem good_C391 (p : ℕ) (hlo : 782005 ≤ p) (hhi : p ≤ 784004) (hp : p.Prime) : GoodP p := by
  by_cases hc782005 : p ≤ 783004
  · exact scan_sound 783004 _ _ _ cert_782005 p hlo hc782005 hp
  exact scan_sound 784004 _ _ _ cert_783005 p (Nat.lt_of_not_le hc782005) hhi hp

/-- Every prime `p` with `784005 ≤ p ≤ 786004` is `GoodP`. -/
theorem good_C392 (p : ℕ) (hlo : 784005 ≤ p) (hhi : p ≤ 786004) (hp : p.Prime) : GoodP p := by
  by_cases hc784005 : p ≤ 785004
  · exact scan_sound 785004 _ _ _ cert_784005 p hlo hc784005 hp
  exact scan_sound 786004 _ _ _ cert_785005 p (Nat.lt_of_not_le hc784005) hhi hp

/-- Every prime `p` with `786005 ≤ p ≤ 788004` is `GoodP`. -/
theorem good_C393 (p : ℕ) (hlo : 786005 ≤ p) (hhi : p ≤ 788004) (hp : p.Prime) : GoodP p := by
  by_cases hc786005 : p ≤ 787004
  · exact scan_sound 787004 _ _ _ cert_786005 p hlo hc786005 hp
  exact scan_sound 788004 _ _ _ cert_787005 p (Nat.lt_of_not_le hc786005) hhi hp

/-- Every prime `p` with `788005 ≤ p ≤ 790004` is `GoodP`. -/
theorem good_C394 (p : ℕ) (hlo : 788005 ≤ p) (hhi : p ≤ 790004) (hp : p.Prime) : GoodP p := by
  by_cases hc788005 : p ≤ 789004
  · exact scan_sound 789004 _ _ _ cert_788005 p hlo hc788005 hp
  exact scan_sound 790004 _ _ _ cert_789005 p (Nat.lt_of_not_le hc788005) hhi hp

/-- Every prime `p` with `790005 ≤ p ≤ 792004` is `GoodP`. -/
theorem good_C395 (p : ℕ) (hlo : 790005 ≤ p) (hhi : p ≤ 792004) (hp : p.Prime) : GoodP p := by
  by_cases hc790005 : p ≤ 791004
  · exact scan_sound 791004 _ _ _ cert_790005 p hlo hc790005 hp
  exact scan_sound 792004 _ _ _ cert_791005 p (Nat.lt_of_not_le hc790005) hhi hp

/-- Every prime `p` with `792005 ≤ p ≤ 794004` is `GoodP`. -/
theorem good_C396 (p : ℕ) (hlo : 792005 ≤ p) (hhi : p ≤ 794004) (hp : p.Prime) : GoodP p := by
  by_cases hc792005 : p ≤ 793004
  · exact scan_sound 793004 _ _ _ cert_792005 p hlo hc792005 hp
  exact scan_sound 794004 _ _ _ cert_793005 p (Nat.lt_of_not_le hc792005) hhi hp

/-- Every prime `p` with `794005 ≤ p ≤ 796004` is `GoodP`. -/
theorem good_C397 (p : ℕ) (hlo : 794005 ≤ p) (hhi : p ≤ 796004) (hp : p.Prime) : GoodP p := by
  by_cases hc794005 : p ≤ 795004
  · exact scan_sound 795004 _ _ _ cert_794005 p hlo hc794005 hp
  exact scan_sound 796004 _ _ _ cert_795005 p (Nat.lt_of_not_le hc794005) hhi hp

/-- Every prime `p` with `796005 ≤ p ≤ 798004` is `GoodP`. -/
theorem good_C398 (p : ℕ) (hlo : 796005 ≤ p) (hhi : p ≤ 798004) (hp : p.Prime) : GoodP p := by
  by_cases hc796005 : p ≤ 797004
  · exact scan_sound 797004 _ _ _ cert_796005 p hlo hc796005 hp
  exact scan_sound 798004 _ _ _ cert_797005 p (Nat.lt_of_not_le hc796005) hhi hp

/-- Every prime `p` with `798005 ≤ p ≤ 800004` is `GoodP`. -/
theorem good_C399 (p : ℕ) (hlo : 798005 ≤ p) (hhi : p ≤ 800004) (hp : p.Prime) : GoodP p := by
  by_cases hc798005 : p ≤ 799004
  · exact scan_sound 799004 _ _ _ cert_798005 p hlo hc798005 hp
  exact scan_sound 800004 _ _ _ cert_799005 p (Nat.lt_of_not_le hc798005) hhi hp

/-- Every prime `p` with `800005 ≤ p ≤ 802004` is `GoodP`. -/
theorem good_C400 (p : ℕ) (hlo : 800005 ≤ p) (hhi : p ≤ 802004) (hp : p.Prime) : GoodP p := by
  by_cases hc800005 : p ≤ 801004
  · exact scan_sound 801004 _ _ _ cert_800005 p hlo hc800005 hp
  exact scan_sound 802004 _ _ _ cert_801005 p (Nat.lt_of_not_le hc800005) hhi hp

/-- Every prime `p` with `802005 ≤ p ≤ 804004` is `GoodP`. -/
theorem good_C401 (p : ℕ) (hlo : 802005 ≤ p) (hhi : p ≤ 804004) (hp : p.Prime) : GoodP p := by
  by_cases hc802005 : p ≤ 803004
  · exact scan_sound 803004 _ _ _ cert_802005 p hlo hc802005 hp
  exact scan_sound 804004 _ _ _ cert_803005 p (Nat.lt_of_not_le hc802005) hhi hp

/-- Every prime `p` with `804005 ≤ p ≤ 806004` is `GoodP`. -/
theorem good_C402 (p : ℕ) (hlo : 804005 ≤ p) (hhi : p ≤ 806004) (hp : p.Prime) : GoodP p := by
  by_cases hc804005 : p ≤ 805004
  · exact scan_sound 805004 _ _ _ cert_804005 p hlo hc804005 hp
  exact scan_sound 806004 _ _ _ cert_805005 p (Nat.lt_of_not_le hc804005) hhi hp

/-- Every prime `p` with `806005 ≤ p ≤ 808004` is `GoodP`. -/
theorem good_C403 (p : ℕ) (hlo : 806005 ≤ p) (hhi : p ≤ 808004) (hp : p.Prime) : GoodP p := by
  by_cases hc806005 : p ≤ 807004
  · exact scan_sound 807004 _ _ _ cert_806005 p hlo hc806005 hp
  exact scan_sound 808004 _ _ _ cert_807005 p (Nat.lt_of_not_le hc806005) hhi hp

/-- Every prime `p` with `808005 ≤ p ≤ 810004` is `GoodP`. -/
theorem good_C404 (p : ℕ) (hlo : 808005 ≤ p) (hhi : p ≤ 810004) (hp : p.Prime) : GoodP p := by
  by_cases hc808005 : p ≤ 809004
  · exact scan_sound 809004 _ _ _ cert_808005 p hlo hc808005 hp
  exact scan_sound 810004 _ _ _ cert_809005 p (Nat.lt_of_not_le hc808005) hhi hp

/-- Every prime `p` with `810005 ≤ p ≤ 812004` is `GoodP`. -/
theorem good_C405 (p : ℕ) (hlo : 810005 ≤ p) (hhi : p ≤ 812004) (hp : p.Prime) : GoodP p := by
  by_cases hc810005 : p ≤ 811004
  · exact scan_sound 811004 _ _ _ cert_810005 p hlo hc810005 hp
  exact scan_sound 812004 _ _ _ cert_811005 p (Nat.lt_of_not_le hc810005) hhi hp

/-- Every prime `p` with `812005 ≤ p ≤ 814004` is `GoodP`. -/
theorem good_C406 (p : ℕ) (hlo : 812005 ≤ p) (hhi : p ≤ 814004) (hp : p.Prime) : GoodP p := by
  by_cases hc812005 : p ≤ 813004
  · exact scan_sound 813004 _ _ _ cert_812005 p hlo hc812005 hp
  exact scan_sound 814004 _ _ _ cert_813005 p (Nat.lt_of_not_le hc812005) hhi hp

/-- Every prime `p` with `814005 ≤ p ≤ 816004` is `GoodP`. -/
theorem good_C407 (p : ℕ) (hlo : 814005 ≤ p) (hhi : p ≤ 816004) (hp : p.Prime) : GoodP p := by
  by_cases hc814005 : p ≤ 815004
  · exact scan_sound 815004 _ _ _ cert_814005 p hlo hc814005 hp
  exact scan_sound 816004 _ _ _ cert_815005 p (Nat.lt_of_not_le hc814005) hhi hp

/-- Every prime `p` with `816005 ≤ p ≤ 818004` is `GoodP`. -/
theorem good_C408 (p : ℕ) (hlo : 816005 ≤ p) (hhi : p ≤ 818004) (hp : p.Prime) : GoodP p := by
  by_cases hc816005 : p ≤ 817004
  · exact scan_sound 817004 _ _ _ cert_816005 p hlo hc816005 hp
  exact scan_sound 818004 _ _ _ cert_817005 p (Nat.lt_of_not_le hc816005) hhi hp

/-- Every prime `p` with `818005 ≤ p ≤ 820004` is `GoodP`. -/
theorem good_C409 (p : ℕ) (hlo : 818005 ≤ p) (hhi : p ≤ 820004) (hp : p.Prime) : GoodP p := by
  by_cases hc818005 : p ≤ 819004
  · exact scan_sound 819004 _ _ _ cert_818005 p hlo hc818005 hp
  exact scan_sound 820004 _ _ _ cert_819005 p (Nat.lt_of_not_le hc818005) hhi hp

/-- Every prime `p` with `820005 ≤ p ≤ 822004` is `GoodP`. -/
theorem good_C410 (p : ℕ) (hlo : 820005 ≤ p) (hhi : p ≤ 822004) (hp : p.Prime) : GoodP p := by
  by_cases hc820005 : p ≤ 821004
  · exact scan_sound 821004 _ _ _ cert_820005 p hlo hc820005 hp
  exact scan_sound 822004 _ _ _ cert_821005 p (Nat.lt_of_not_le hc820005) hhi hp

/-- Every prime `p` with `822005 ≤ p ≤ 824004` is `GoodP`. -/
theorem good_C411 (p : ℕ) (hlo : 822005 ≤ p) (hhi : p ≤ 824004) (hp : p.Prime) : GoodP p := by
  by_cases hc822005 : p ≤ 823004
  · exact scan_sound 823004 _ _ _ cert_822005 p hlo hc822005 hp
  exact scan_sound 824004 _ _ _ cert_823005 p (Nat.lt_of_not_le hc822005) hhi hp

/-- Every prime `p` with `824005 ≤ p ≤ 826004` is `GoodP`. -/
theorem good_C412 (p : ℕ) (hlo : 824005 ≤ p) (hhi : p ≤ 826004) (hp : p.Prime) : GoodP p := by
  by_cases hc824005 : p ≤ 825004
  · exact scan_sound 825004 _ _ _ cert_824005 p hlo hc824005 hp
  exact scan_sound 826004 _ _ _ cert_825005 p (Nat.lt_of_not_le hc824005) hhi hp

/-- Every prime `p` with `826005 ≤ p ≤ 828004` is `GoodP`. -/
theorem good_C413 (p : ℕ) (hlo : 826005 ≤ p) (hhi : p ≤ 828004) (hp : p.Prime) : GoodP p := by
  by_cases hc826005 : p ≤ 827004
  · exact scan_sound 827004 _ _ _ cert_826005 p hlo hc826005 hp
  exact scan_sound 828004 _ _ _ cert_827005 p (Nat.lt_of_not_le hc826005) hhi hp

/-- Every prime `p` with `828005 ≤ p ≤ 830004` is `GoodP`. -/
theorem good_C414 (p : ℕ) (hlo : 828005 ≤ p) (hhi : p ≤ 830004) (hp : p.Prime) : GoodP p := by
  by_cases hc828005 : p ≤ 829004
  · exact scan_sound 829004 _ _ _ cert_828005 p hlo hc828005 hp
  exact scan_sound 830004 _ _ _ cert_829005 p (Nat.lt_of_not_le hc828005) hhi hp

/-- Every prime `p` with `830005 ≤ p ≤ 832004` is `GoodP`. -/
theorem good_C415 (p : ℕ) (hlo : 830005 ≤ p) (hhi : p ≤ 832004) (hp : p.Prime) : GoodP p := by
  by_cases hc830005 : p ≤ 831004
  · exact scan_sound 831004 _ _ _ cert_830005 p hlo hc830005 hp
  exact scan_sound 832004 _ _ _ cert_831005 p (Nat.lt_of_not_le hc830005) hhi hp

/-- Every prime `p` with `832005 ≤ p ≤ 834004` is `GoodP`. -/
theorem good_C416 (p : ℕ) (hlo : 832005 ≤ p) (hhi : p ≤ 834004) (hp : p.Prime) : GoodP p := by
  by_cases hc832005 : p ≤ 833004
  · exact scan_sound 833004 _ _ _ cert_832005 p hlo hc832005 hp
  exact scan_sound 834004 _ _ _ cert_833005 p (Nat.lt_of_not_le hc832005) hhi hp

/-- Every prime `p` with `834005 ≤ p ≤ 836004` is `GoodP`. -/
theorem good_C417 (p : ℕ) (hlo : 834005 ≤ p) (hhi : p ≤ 836004) (hp : p.Prime) : GoodP p := by
  by_cases hc834005 : p ≤ 835004
  · exact scan_sound 835004 _ _ _ cert_834005 p hlo hc834005 hp
  exact scan_sound 836004 _ _ _ cert_835005 p (Nat.lt_of_not_le hc834005) hhi hp

/-- Every prime `p` with `836005 ≤ p ≤ 838004` is `GoodP`. -/
theorem good_C418 (p : ℕ) (hlo : 836005 ≤ p) (hhi : p ≤ 838004) (hp : p.Prime) : GoodP p := by
  by_cases hc836005 : p ≤ 837004
  · exact scan_sound 837004 _ _ _ cert_836005 p hlo hc836005 hp
  exact scan_sound 838004 _ _ _ cert_837005 p (Nat.lt_of_not_le hc836005) hhi hp

/-- Every prime `p` with `838005 ≤ p ≤ 840004` is `GoodP`. -/
theorem good_C419 (p : ℕ) (hlo : 838005 ≤ p) (hhi : p ≤ 840004) (hp : p.Prime) : GoodP p := by
  by_cases hc838005 : p ≤ 839004
  · exact scan_sound 839004 _ _ _ cert_838005 p hlo hc838005 hp
  exact scan_sound 840004 _ _ _ cert_839005 p (Nat.lt_of_not_le hc838005) hhi hp

/-- Every prime `p` with `840005 ≤ p ≤ 842004` is `GoodP`. -/
theorem good_C420 (p : ℕ) (hlo : 840005 ≤ p) (hhi : p ≤ 842004) (hp : p.Prime) : GoodP p := by
  by_cases hc840005 : p ≤ 841004
  · exact scan_sound 841004 _ _ _ cert_840005 p hlo hc840005 hp
  exact scan_sound 842004 _ _ _ cert_841005 p (Nat.lt_of_not_le hc840005) hhi hp

/-- Every prime `p` with `842005 ≤ p ≤ 844004` is `GoodP`. -/
theorem good_C421 (p : ℕ) (hlo : 842005 ≤ p) (hhi : p ≤ 844004) (hp : p.Prime) : GoodP p := by
  by_cases hc842005 : p ≤ 843004
  · exact scan_sound 843004 _ _ _ cert_842005 p hlo hc842005 hp
  exact scan_sound 844004 _ _ _ cert_843005 p (Nat.lt_of_not_le hc842005) hhi hp

/-- Every prime `p` with `844005 ≤ p ≤ 846004` is `GoodP`. -/
theorem good_C422 (p : ℕ) (hlo : 844005 ≤ p) (hhi : p ≤ 846004) (hp : p.Prime) : GoodP p := by
  by_cases hc844005 : p ≤ 845004
  · exact scan_sound 845004 _ _ _ cert_844005 p hlo hc844005 hp
  exact scan_sound 846004 _ _ _ cert_845005 p (Nat.lt_of_not_le hc844005) hhi hp

/-- Every prime `p` with `846005 ≤ p ≤ 848004` is `GoodP`. -/
theorem good_C423 (p : ℕ) (hlo : 846005 ≤ p) (hhi : p ≤ 848004) (hp : p.Prime) : GoodP p := by
  by_cases hc846005 : p ≤ 847004
  · exact scan_sound 847004 _ _ _ cert_846005 p hlo hc846005 hp
  exact scan_sound 848004 _ _ _ cert_847005 p (Nat.lt_of_not_le hc846005) hhi hp

/-- Every prime `p` with `848005 ≤ p ≤ 850004` is `GoodP`. -/
theorem good_C424 (p : ℕ) (hlo : 848005 ≤ p) (hhi : p ≤ 850004) (hp : p.Prime) : GoodP p := by
  by_cases hc848005 : p ≤ 849004
  · exact scan_sound 849004 _ _ _ cert_848005 p hlo hc848005 hp
  exact scan_sound 850004 _ _ _ cert_849005 p (Nat.lt_of_not_le hc848005) hhi hp

/-- Every prime `p` with `850005 ≤ p ≤ 852004` is `GoodP`. -/
theorem good_C425 (p : ℕ) (hlo : 850005 ≤ p) (hhi : p ≤ 852004) (hp : p.Prime) : GoodP p := by
  by_cases hc850005 : p ≤ 851004
  · exact scan_sound 851004 _ _ _ cert_850005 p hlo hc850005 hp
  exact scan_sound 852004 _ _ _ cert_851005 p (Nat.lt_of_not_le hc850005) hhi hp

/-- Every prime `p` with `852005 ≤ p ≤ 854004` is `GoodP`. -/
theorem good_C426 (p : ℕ) (hlo : 852005 ≤ p) (hhi : p ≤ 854004) (hp : p.Prime) : GoodP p := by
  by_cases hc852005 : p ≤ 853004
  · exact scan_sound 853004 _ _ _ cert_852005 p hlo hc852005 hp
  exact scan_sound 854004 _ _ _ cert_853005 p (Nat.lt_of_not_le hc852005) hhi hp

/-- Every prime `p` with `854005 ≤ p ≤ 856004` is `GoodP`. -/
theorem good_C427 (p : ℕ) (hlo : 854005 ≤ p) (hhi : p ≤ 856004) (hp : p.Prime) : GoodP p := by
  by_cases hc854005 : p ≤ 855004
  · exact scan_sound 855004 _ _ _ cert_854005 p hlo hc854005 hp
  exact scan_sound 856004 _ _ _ cert_855005 p (Nat.lt_of_not_le hc854005) hhi hp

/-- Every prime `p` with `856005 ≤ p ≤ 858004` is `GoodP`. -/
theorem good_C428 (p : ℕ) (hlo : 856005 ≤ p) (hhi : p ≤ 858004) (hp : p.Prime) : GoodP p := by
  by_cases hc856005 : p ≤ 857004
  · exact scan_sound 857004 _ _ _ cert_856005 p hlo hc856005 hp
  exact scan_sound 858004 _ _ _ cert_857005 p (Nat.lt_of_not_le hc856005) hhi hp

/-- Every prime `p` with `858005 ≤ p ≤ 860004` is `GoodP`. -/
theorem good_C429 (p : ℕ) (hlo : 858005 ≤ p) (hhi : p ≤ 860004) (hp : p.Prime) : GoodP p := by
  by_cases hc858005 : p ≤ 859004
  · exact scan_sound 859004 _ _ _ cert_858005 p hlo hc858005 hp
  exact scan_sound 860004 _ _ _ cert_859005 p (Nat.lt_of_not_le hc858005) hhi hp

/-- Every prime `p` with `860005 ≤ p ≤ 862004` is `GoodP`. -/
theorem good_C430 (p : ℕ) (hlo : 860005 ≤ p) (hhi : p ≤ 862004) (hp : p.Prime) : GoodP p := by
  by_cases hc860005 : p ≤ 861004
  · exact scan_sound 861004 _ _ _ cert_860005 p hlo hc860005 hp
  exact scan_sound 862004 _ _ _ cert_861005 p (Nat.lt_of_not_le hc860005) hhi hp

/-- Every prime `p` with `862005 ≤ p ≤ 864004` is `GoodP`. -/
theorem good_C431 (p : ℕ) (hlo : 862005 ≤ p) (hhi : p ≤ 864004) (hp : p.Prime) : GoodP p := by
  by_cases hc862005 : p ≤ 863004
  · exact scan_sound 863004 _ _ _ cert_862005 p hlo hc862005 hp
  exact scan_sound 864004 _ _ _ cert_863005 p (Nat.lt_of_not_le hc862005) hhi hp

/-- Every prime `p` with `864005 ≤ p ≤ 866004` is `GoodP`. -/
theorem good_C432 (p : ℕ) (hlo : 864005 ≤ p) (hhi : p ≤ 866004) (hp : p.Prime) : GoodP p := by
  by_cases hc864005 : p ≤ 865004
  · exact scan_sound 865004 _ _ _ cert_864005 p hlo hc864005 hp
  exact scan_sound 866004 _ _ _ cert_865005 p (Nat.lt_of_not_le hc864005) hhi hp

/-- Every prime `p` with `866005 ≤ p ≤ 868004` is `GoodP`. -/
theorem good_C433 (p : ℕ) (hlo : 866005 ≤ p) (hhi : p ≤ 868004) (hp : p.Prime) : GoodP p := by
  by_cases hc866005 : p ≤ 867004
  · exact scan_sound 867004 _ _ _ cert_866005 p hlo hc866005 hp
  exact scan_sound 868004 _ _ _ cert_867005 p (Nat.lt_of_not_le hc866005) hhi hp

/-- Every prime `p` with `868005 ≤ p ≤ 870004` is `GoodP`. -/
theorem good_C434 (p : ℕ) (hlo : 868005 ≤ p) (hhi : p ≤ 870004) (hp : p.Prime) : GoodP p := by
  by_cases hc868005 : p ≤ 869004
  · exact scan_sound 869004 _ _ _ cert_868005 p hlo hc868005 hp
  exact scan_sound 870004 _ _ _ cert_869005 p (Nat.lt_of_not_le hc868005) hhi hp

/-- Every prime `p` with `870005 ≤ p ≤ 872004` is `GoodP`. -/
theorem good_C435 (p : ℕ) (hlo : 870005 ≤ p) (hhi : p ≤ 872004) (hp : p.Prime) : GoodP p := by
  by_cases hc870005 : p ≤ 871004
  · exact scan_sound 871004 _ _ _ cert_870005 p hlo hc870005 hp
  exact scan_sound 872004 _ _ _ cert_871005 p (Nat.lt_of_not_le hc870005) hhi hp

/-- Every prime `p` with `872005 ≤ p ≤ 874004` is `GoodP`. -/
theorem good_C436 (p : ℕ) (hlo : 872005 ≤ p) (hhi : p ≤ 874004) (hp : p.Prime) : GoodP p := by
  by_cases hc872005 : p ≤ 873004
  · exact scan_sound 873004 _ _ _ cert_872005 p hlo hc872005 hp
  exact scan_sound 874004 _ _ _ cert_873005 p (Nat.lt_of_not_le hc872005) hhi hp

/-- Every prime `p` with `874005 ≤ p ≤ 876004` is `GoodP`. -/
theorem good_C437 (p : ℕ) (hlo : 874005 ≤ p) (hhi : p ≤ 876004) (hp : p.Prime) : GoodP p := by
  by_cases hc874005 : p ≤ 875004
  · exact scan_sound 875004 _ _ _ cert_874005 p hlo hc874005 hp
  exact scan_sound 876004 _ _ _ cert_875005 p (Nat.lt_of_not_le hc874005) hhi hp

/-- Every prime `p` with `876005 ≤ p ≤ 878004` is `GoodP`. -/
theorem good_C438 (p : ℕ) (hlo : 876005 ≤ p) (hhi : p ≤ 878004) (hp : p.Prime) : GoodP p := by
  by_cases hc876005 : p ≤ 877004
  · exact scan_sound 877004 _ _ _ cert_876005 p hlo hc876005 hp
  exact scan_sound 878004 _ _ _ cert_877005 p (Nat.lt_of_not_le hc876005) hhi hp

/-- Every prime `p` with `878005 ≤ p ≤ 880004` is `GoodP`. -/
theorem good_C439 (p : ℕ) (hlo : 878005 ≤ p) (hhi : p ≤ 880004) (hp : p.Prime) : GoodP p := by
  by_cases hc878005 : p ≤ 879004
  · exact scan_sound 879004 _ _ _ cert_878005 p hlo hc878005 hp
  exact scan_sound 880004 _ _ _ cert_879005 p (Nat.lt_of_not_le hc878005) hhi hp

/-- Every prime `p` with `880005 ≤ p ≤ 882004` is `GoodP`. -/
theorem good_C440 (p : ℕ) (hlo : 880005 ≤ p) (hhi : p ≤ 882004) (hp : p.Prime) : GoodP p := by
  by_cases hc880005 : p ≤ 881004
  · exact scan_sound 881004 _ _ _ cert_880005 p hlo hc880005 hp
  exact scan_sound 882004 _ _ _ cert_881005 p (Nat.lt_of_not_le hc880005) hhi hp

/-- Every prime `p` with `882005 ≤ p ≤ 884004` is `GoodP`. -/
theorem good_C441 (p : ℕ) (hlo : 882005 ≤ p) (hhi : p ≤ 884004) (hp : p.Prime) : GoodP p := by
  by_cases hc882005 : p ≤ 883004
  · exact scan_sound 883004 _ _ _ cert_882005 p hlo hc882005 hp
  exact scan_sound 884004 _ _ _ cert_883005 p (Nat.lt_of_not_le hc882005) hhi hp

/-- Every prime `p` with `884005 ≤ p ≤ 886004` is `GoodP`. -/
theorem good_C442 (p : ℕ) (hlo : 884005 ≤ p) (hhi : p ≤ 886004) (hp : p.Prime) : GoodP p := by
  by_cases hc884005 : p ≤ 885004
  · exact scan_sound 885004 _ _ _ cert_884005 p hlo hc884005 hp
  exact scan_sound 886004 _ _ _ cert_885005 p (Nat.lt_of_not_le hc884005) hhi hp

/-- Every prime `p` with `886005 ≤ p ≤ 888004` is `GoodP`. -/
theorem good_C443 (p : ℕ) (hlo : 886005 ≤ p) (hhi : p ≤ 888004) (hp : p.Prime) : GoodP p := by
  by_cases hc886005 : p ≤ 887004
  · exact scan_sound 887004 _ _ _ cert_886005 p hlo hc886005 hp
  exact scan_sound 888004 _ _ _ cert_887005 p (Nat.lt_of_not_le hc886005) hhi hp

/-- Every prime `p` with `888005 ≤ p ≤ 890004` is `GoodP`. -/
theorem good_C444 (p : ℕ) (hlo : 888005 ≤ p) (hhi : p ≤ 890004) (hp : p.Prime) : GoodP p := by
  by_cases hc888005 : p ≤ 889004
  · exact scan_sound 889004 _ _ _ cert_888005 p hlo hc888005 hp
  exact scan_sound 890004 _ _ _ cert_889005 p (Nat.lt_of_not_le hc888005) hhi hp

/-- Every prime `p` with `890005 ≤ p ≤ 892004` is `GoodP`. -/
theorem good_C445 (p : ℕ) (hlo : 890005 ≤ p) (hhi : p ≤ 892004) (hp : p.Prime) : GoodP p := by
  by_cases hc890005 : p ≤ 891004
  · exact scan_sound 891004 _ _ _ cert_890005 p hlo hc890005 hp
  exact scan_sound 892004 _ _ _ cert_891005 p (Nat.lt_of_not_le hc890005) hhi hp

/-- Every prime `p` with `892005 ≤ p ≤ 894004` is `GoodP`. -/
theorem good_C446 (p : ℕ) (hlo : 892005 ≤ p) (hhi : p ≤ 894004) (hp : p.Prime) : GoodP p := by
  by_cases hc892005 : p ≤ 893004
  · exact scan_sound 893004 _ _ _ cert_892005 p hlo hc892005 hp
  exact scan_sound 894004 _ _ _ cert_893005 p (Nat.lt_of_not_le hc892005) hhi hp

/-- Every prime `p` with `894005 ≤ p ≤ 896004` is `GoodP`. -/
theorem good_C447 (p : ℕ) (hlo : 894005 ≤ p) (hhi : p ≤ 896004) (hp : p.Prime) : GoodP p := by
  by_cases hc894005 : p ≤ 895004
  · exact scan_sound 895004 _ _ _ cert_894005 p hlo hc894005 hp
  exact scan_sound 896004 _ _ _ cert_895005 p (Nat.lt_of_not_le hc894005) hhi hp

/-- Every prime `p` with `896005 ≤ p ≤ 898004` is `GoodP`. -/
theorem good_C448 (p : ℕ) (hlo : 896005 ≤ p) (hhi : p ≤ 898004) (hp : p.Prime) : GoodP p := by
  by_cases hc896005 : p ≤ 897004
  · exact scan_sound 897004 _ _ _ cert_896005 p hlo hc896005 hp
  exact scan_sound 898004 _ _ _ cert_897005 p (Nat.lt_of_not_le hc896005) hhi hp

/-- Every prime `p` with `898005 ≤ p ≤ 900004` is `GoodP`. -/
theorem good_C449 (p : ℕ) (hlo : 898005 ≤ p) (hhi : p ≤ 900004) (hp : p.Prime) : GoodP p := by
  by_cases hc898005 : p ≤ 899004
  · exact scan_sound 899004 _ _ _ cert_898005 p hlo hc898005 hp
  exact scan_sound 900004 _ _ _ cert_899005 p (Nat.lt_of_not_le hc898005) hhi hp

/-- Every prime `p` with `900005 ≤ p ≤ 902004` is `GoodP`. -/
theorem good_C450 (p : ℕ) (hlo : 900005 ≤ p) (hhi : p ≤ 902004) (hp : p.Prime) : GoodP p := by
  by_cases hc900005 : p ≤ 901004
  · exact scan_sound 901004 _ _ _ cert_900005 p hlo hc900005 hp
  exact scan_sound 902004 _ _ _ cert_901005 p (Nat.lt_of_not_le hc900005) hhi hp

/-- Every prime `p` with `902005 ≤ p ≤ 904004` is `GoodP`. -/
theorem good_C451 (p : ℕ) (hlo : 902005 ≤ p) (hhi : p ≤ 904004) (hp : p.Prime) : GoodP p := by
  by_cases hc902005 : p ≤ 903004
  · exact scan_sound 903004 _ _ _ cert_902005 p hlo hc902005 hp
  exact scan_sound 904004 _ _ _ cert_903005 p (Nat.lt_of_not_le hc902005) hhi hp

/-- Every prime `p` with `904005 ≤ p ≤ 906004` is `GoodP`. -/
theorem good_C452 (p : ℕ) (hlo : 904005 ≤ p) (hhi : p ≤ 906004) (hp : p.Prime) : GoodP p := by
  by_cases hc904005 : p ≤ 905004
  · exact scan_sound 905004 _ _ _ cert_904005 p hlo hc904005 hp
  exact scan_sound 906004 _ _ _ cert_905005 p (Nat.lt_of_not_le hc904005) hhi hp

/-- Every prime `p` with `906005 ≤ p ≤ 908004` is `GoodP`. -/
theorem good_C453 (p : ℕ) (hlo : 906005 ≤ p) (hhi : p ≤ 908004) (hp : p.Prime) : GoodP p := by
  by_cases hc906005 : p ≤ 907004
  · exact scan_sound 907004 _ _ _ cert_906005 p hlo hc906005 hp
  exact scan_sound 908004 _ _ _ cert_907005 p (Nat.lt_of_not_le hc906005) hhi hp

/-- Every prime `p` with `908005 ≤ p ≤ 910004` is `GoodP`. -/
theorem good_C454 (p : ℕ) (hlo : 908005 ≤ p) (hhi : p ≤ 910004) (hp : p.Prime) : GoodP p := by
  by_cases hc908005 : p ≤ 909004
  · exact scan_sound 909004 _ _ _ cert_908005 p hlo hc908005 hp
  exact scan_sound 910004 _ _ _ cert_909005 p (Nat.lt_of_not_le hc908005) hhi hp

/-- Every prime `p` with `910005 ≤ p ≤ 912004` is `GoodP`. -/
theorem good_C455 (p : ℕ) (hlo : 910005 ≤ p) (hhi : p ≤ 912004) (hp : p.Prime) : GoodP p := by
  by_cases hc910005 : p ≤ 911004
  · exact scan_sound 911004 _ _ _ cert_910005 p hlo hc910005 hp
  exact scan_sound 912004 _ _ _ cert_911005 p (Nat.lt_of_not_le hc910005) hhi hp

/-- Every prime `p` with `912005 ≤ p ≤ 914004` is `GoodP`. -/
theorem good_C456 (p : ℕ) (hlo : 912005 ≤ p) (hhi : p ≤ 914004) (hp : p.Prime) : GoodP p := by
  by_cases hc912005 : p ≤ 913004
  · exact scan_sound 913004 _ _ _ cert_912005 p hlo hc912005 hp
  exact scan_sound 914004 _ _ _ cert_913005 p (Nat.lt_of_not_le hc912005) hhi hp

/-- Every prime `p` with `914005 ≤ p ≤ 916004` is `GoodP`. -/
theorem good_C457 (p : ℕ) (hlo : 914005 ≤ p) (hhi : p ≤ 916004) (hp : p.Prime) : GoodP p := by
  by_cases hc914005 : p ≤ 915004
  · exact scan_sound 915004 _ _ _ cert_914005 p hlo hc914005 hp
  exact scan_sound 916004 _ _ _ cert_915005 p (Nat.lt_of_not_le hc914005) hhi hp

/-- Every prime `p` with `916005 ≤ p ≤ 918004` is `GoodP`. -/
theorem good_C458 (p : ℕ) (hlo : 916005 ≤ p) (hhi : p ≤ 918004) (hp : p.Prime) : GoodP p := by
  by_cases hc916005 : p ≤ 917004
  · exact scan_sound 917004 _ _ _ cert_916005 p hlo hc916005 hp
  exact scan_sound 918004 _ _ _ cert_917005 p (Nat.lt_of_not_le hc916005) hhi hp

/-- Every prime `p` with `918005 ≤ p ≤ 920004` is `GoodP`. -/
theorem good_C459 (p : ℕ) (hlo : 918005 ≤ p) (hhi : p ≤ 920004) (hp : p.Prime) : GoodP p := by
  by_cases hc918005 : p ≤ 919004
  · exact scan_sound 919004 _ _ _ cert_918005 p hlo hc918005 hp
  exact scan_sound 920004 _ _ _ cert_919005 p (Nat.lt_of_not_le hc918005) hhi hp

/-- Every prime `p` with `920005 ≤ p ≤ 922004` is `GoodP`. -/
theorem good_C460 (p : ℕ) (hlo : 920005 ≤ p) (hhi : p ≤ 922004) (hp : p.Prime) : GoodP p := by
  by_cases hc920005 : p ≤ 921004
  · exact scan_sound 921004 _ _ _ cert_920005 p hlo hc920005 hp
  exact scan_sound 922004 _ _ _ cert_921005 p (Nat.lt_of_not_le hc920005) hhi hp

/-- Every prime `p` with `922005 ≤ p ≤ 924004` is `GoodP`. -/
theorem good_C461 (p : ℕ) (hlo : 922005 ≤ p) (hhi : p ≤ 924004) (hp : p.Prime) : GoodP p := by
  by_cases hc922005 : p ≤ 923004
  · exact scan_sound 923004 _ _ _ cert_922005 p hlo hc922005 hp
  exact scan_sound 924004 _ _ _ cert_923005 p (Nat.lt_of_not_le hc922005) hhi hp

/-- Every prime `p` with `924005 ≤ p ≤ 926004` is `GoodP`. -/
theorem good_C462 (p : ℕ) (hlo : 924005 ≤ p) (hhi : p ≤ 926004) (hp : p.Prime) : GoodP p := by
  by_cases hc924005 : p ≤ 925004
  · exact scan_sound 925004 _ _ _ cert_924005 p hlo hc924005 hp
  exact scan_sound 926004 _ _ _ cert_925005 p (Nat.lt_of_not_le hc924005) hhi hp

/-- Every prime `p` with `926005 ≤ p ≤ 928004` is `GoodP`. -/
theorem good_C463 (p : ℕ) (hlo : 926005 ≤ p) (hhi : p ≤ 928004) (hp : p.Prime) : GoodP p := by
  by_cases hc926005 : p ≤ 927004
  · exact scan_sound 927004 _ _ _ cert_926005 p hlo hc926005 hp
  exact scan_sound 928004 _ _ _ cert_927005 p (Nat.lt_of_not_le hc926005) hhi hp

/-- Every prime `p` with `928005 ≤ p ≤ 930004` is `GoodP`. -/
theorem good_C464 (p : ℕ) (hlo : 928005 ≤ p) (hhi : p ≤ 930004) (hp : p.Prime) : GoodP p := by
  by_cases hc928005 : p ≤ 929004
  · exact scan_sound 929004 _ _ _ cert_928005 p hlo hc928005 hp
  exact scan_sound 930004 _ _ _ cert_929005 p (Nat.lt_of_not_le hc928005) hhi hp

/-- Every prime `p` with `930005 ≤ p ≤ 932004` is `GoodP`. -/
theorem good_C465 (p : ℕ) (hlo : 930005 ≤ p) (hhi : p ≤ 932004) (hp : p.Prime) : GoodP p := by
  by_cases hc930005 : p ≤ 931004
  · exact scan_sound 931004 _ _ _ cert_930005 p hlo hc930005 hp
  exact scan_sound 932004 _ _ _ cert_931005 p (Nat.lt_of_not_le hc930005) hhi hp

/-- Every prime `p` with `932005 ≤ p ≤ 934004` is `GoodP`. -/
theorem good_C466 (p : ℕ) (hlo : 932005 ≤ p) (hhi : p ≤ 934004) (hp : p.Prime) : GoodP p := by
  by_cases hc932005 : p ≤ 933004
  · exact scan_sound 933004 _ _ _ cert_932005 p hlo hc932005 hp
  exact scan_sound 934004 _ _ _ cert_933005 p (Nat.lt_of_not_le hc932005) hhi hp

/-- Every prime `p` with `934005 ≤ p ≤ 936004` is `GoodP`. -/
theorem good_C467 (p : ℕ) (hlo : 934005 ≤ p) (hhi : p ≤ 936004) (hp : p.Prime) : GoodP p := by
  by_cases hc934005 : p ≤ 935004
  · exact scan_sound 935004 _ _ _ cert_934005 p hlo hc934005 hp
  exact scan_sound 936004 _ _ _ cert_935005 p (Nat.lt_of_not_le hc934005) hhi hp

/-- Every prime `p` with `936005 ≤ p ≤ 938004` is `GoodP`. -/
theorem good_C468 (p : ℕ) (hlo : 936005 ≤ p) (hhi : p ≤ 938004) (hp : p.Prime) : GoodP p := by
  by_cases hc936005 : p ≤ 937004
  · exact scan_sound 937004 _ _ _ cert_936005 p hlo hc936005 hp
  exact scan_sound 938004 _ _ _ cert_937005 p (Nat.lt_of_not_le hc936005) hhi hp

/-- Every prime `p` with `938005 ≤ p ≤ 940004` is `GoodP`. -/
theorem good_C469 (p : ℕ) (hlo : 938005 ≤ p) (hhi : p ≤ 940004) (hp : p.Prime) : GoodP p := by
  by_cases hc938005 : p ≤ 939004
  · exact scan_sound 939004 _ _ _ cert_938005 p hlo hc938005 hp
  exact scan_sound 940004 _ _ _ cert_939005 p (Nat.lt_of_not_le hc938005) hhi hp

/-- Every prime `p` with `940005 ≤ p ≤ 942004` is `GoodP`. -/
theorem good_C470 (p : ℕ) (hlo : 940005 ≤ p) (hhi : p ≤ 942004) (hp : p.Prime) : GoodP p := by
  by_cases hc940005 : p ≤ 941004
  · exact scan_sound 941004 _ _ _ cert_940005 p hlo hc940005 hp
  exact scan_sound 942004 _ _ _ cert_941005 p (Nat.lt_of_not_le hc940005) hhi hp

/-- Every prime `p` with `942005 ≤ p ≤ 944004` is `GoodP`. -/
theorem good_C471 (p : ℕ) (hlo : 942005 ≤ p) (hhi : p ≤ 944004) (hp : p.Prime) : GoodP p := by
  by_cases hc942005 : p ≤ 943004
  · exact scan_sound 943004 _ _ _ cert_942005 p hlo hc942005 hp
  exact scan_sound 944004 _ _ _ cert_943005 p (Nat.lt_of_not_le hc942005) hhi hp

/-- Every prime `p` with `944005 ≤ p ≤ 946004` is `GoodP`. -/
theorem good_C472 (p : ℕ) (hlo : 944005 ≤ p) (hhi : p ≤ 946004) (hp : p.Prime) : GoodP p := by
  by_cases hc944005 : p ≤ 945004
  · exact scan_sound 945004 _ _ _ cert_944005 p hlo hc944005 hp
  exact scan_sound 946004 _ _ _ cert_945005 p (Nat.lt_of_not_le hc944005) hhi hp

/-- Every prime `p` with `946005 ≤ p ≤ 948004` is `GoodP`. -/
theorem good_C473 (p : ℕ) (hlo : 946005 ≤ p) (hhi : p ≤ 948004) (hp : p.Prime) : GoodP p := by
  by_cases hc946005 : p ≤ 947004
  · exact scan_sound 947004 _ _ _ cert_946005 p hlo hc946005 hp
  exact scan_sound 948004 _ _ _ cert_947005 p (Nat.lt_of_not_le hc946005) hhi hp

/-- Every prime `p` with `948005 ≤ p ≤ 950004` is `GoodP`. -/
theorem good_C474 (p : ℕ) (hlo : 948005 ≤ p) (hhi : p ≤ 950004) (hp : p.Prime) : GoodP p := by
  by_cases hc948005 : p ≤ 949004
  · exact scan_sound 949004 _ _ _ cert_948005 p hlo hc948005 hp
  exact scan_sound 950004 _ _ _ cert_949005 p (Nat.lt_of_not_le hc948005) hhi hp

/-- Every prime `p` with `950005 ≤ p ≤ 952004` is `GoodP`. -/
theorem good_C475 (p : ℕ) (hlo : 950005 ≤ p) (hhi : p ≤ 952004) (hp : p.Prime) : GoodP p := by
  by_cases hc950005 : p ≤ 951004
  · exact scan_sound 951004 _ _ _ cert_950005 p hlo hc950005 hp
  exact scan_sound 952004 _ _ _ cert_951005 p (Nat.lt_of_not_le hc950005) hhi hp

/-- Every prime `p` with `952005 ≤ p ≤ 954004` is `GoodP`. -/
theorem good_C476 (p : ℕ) (hlo : 952005 ≤ p) (hhi : p ≤ 954004) (hp : p.Prime) : GoodP p := by
  by_cases hc952005 : p ≤ 953004
  · exact scan_sound 953004 _ _ _ cert_952005 p hlo hc952005 hp
  exact scan_sound 954004 _ _ _ cert_953005 p (Nat.lt_of_not_le hc952005) hhi hp

/-- Every prime `p` with `954005 ≤ p ≤ 956004` is `GoodP`. -/
theorem good_C477 (p : ℕ) (hlo : 954005 ≤ p) (hhi : p ≤ 956004) (hp : p.Prime) : GoodP p := by
  by_cases hc954005 : p ≤ 955004
  · exact scan_sound 955004 _ _ _ cert_954005 p hlo hc954005 hp
  exact scan_sound 956004 _ _ _ cert_955005 p (Nat.lt_of_not_le hc954005) hhi hp

/-- Every prime `p` with `956005 ≤ p ≤ 958004` is `GoodP`. -/
theorem good_C478 (p : ℕ) (hlo : 956005 ≤ p) (hhi : p ≤ 958004) (hp : p.Prime) : GoodP p := by
  by_cases hc956005 : p ≤ 957004
  · exact scan_sound 957004 _ _ _ cert_956005 p hlo hc956005 hp
  exact scan_sound 958004 _ _ _ cert_957005 p (Nat.lt_of_not_le hc956005) hhi hp

/-- Every prime `p` with `958005 ≤ p ≤ 960004` is `GoodP`. -/
theorem good_C479 (p : ℕ) (hlo : 958005 ≤ p) (hhi : p ≤ 960004) (hp : p.Prime) : GoodP p := by
  by_cases hc958005 : p ≤ 959004
  · exact scan_sound 959004 _ _ _ cert_958005 p hlo hc958005 hp
  exact scan_sound 960004 _ _ _ cert_959005 p (Nat.lt_of_not_le hc958005) hhi hp

/-- Every prime `p` with `960005 ≤ p ≤ 962004` is `GoodP`. -/
theorem good_C480 (p : ℕ) (hlo : 960005 ≤ p) (hhi : p ≤ 962004) (hp : p.Prime) : GoodP p := by
  by_cases hc960005 : p ≤ 961004
  · exact scan_sound 961004 _ _ _ cert_960005 p hlo hc960005 hp
  exact scan_sound 962004 _ _ _ cert_961005 p (Nat.lt_of_not_le hc960005) hhi hp

/-- Every prime `p` with `962005 ≤ p ≤ 964004` is `GoodP`. -/
theorem good_C481 (p : ℕ) (hlo : 962005 ≤ p) (hhi : p ≤ 964004) (hp : p.Prime) : GoodP p := by
  by_cases hc962005 : p ≤ 963004
  · exact scan_sound 963004 _ _ _ cert_962005 p hlo hc962005 hp
  exact scan_sound 964004 _ _ _ cert_963005 p (Nat.lt_of_not_le hc962005) hhi hp

/-- Every prime `p` with `964005 ≤ p ≤ 966004` is `GoodP`. -/
theorem good_C482 (p : ℕ) (hlo : 964005 ≤ p) (hhi : p ≤ 966004) (hp : p.Prime) : GoodP p := by
  by_cases hc964005 : p ≤ 965004
  · exact scan_sound 965004 _ _ _ cert_964005 p hlo hc964005 hp
  exact scan_sound 966004 _ _ _ cert_965005 p (Nat.lt_of_not_le hc964005) hhi hp

/-- Every prime `p` with `966005 ≤ p ≤ 968004` is `GoodP`. -/
theorem good_C483 (p : ℕ) (hlo : 966005 ≤ p) (hhi : p ≤ 968004) (hp : p.Prime) : GoodP p := by
  by_cases hc966005 : p ≤ 967004
  · exact scan_sound 967004 _ _ _ cert_966005 p hlo hc966005 hp
  exact scan_sound 968004 _ _ _ cert_967005 p (Nat.lt_of_not_le hc966005) hhi hp

/-- Every prime `p` with `968005 ≤ p ≤ 970004` is `GoodP`. -/
theorem good_C484 (p : ℕ) (hlo : 968005 ≤ p) (hhi : p ≤ 970004) (hp : p.Prime) : GoodP p := by
  by_cases hc968005 : p ≤ 969004
  · exact scan_sound 969004 _ _ _ cert_968005 p hlo hc968005 hp
  exact scan_sound 970004 _ _ _ cert_969005 p (Nat.lt_of_not_le hc968005) hhi hp

/-- Every prime `p` with `970005 ≤ p ≤ 972004` is `GoodP`. -/
theorem good_C485 (p : ℕ) (hlo : 970005 ≤ p) (hhi : p ≤ 972004) (hp : p.Prime) : GoodP p := by
  by_cases hc970005 : p ≤ 971004
  · exact scan_sound 971004 _ _ _ cert_970005 p hlo hc970005 hp
  exact scan_sound 972004 _ _ _ cert_971005 p (Nat.lt_of_not_le hc970005) hhi hp

/-- Every prime `p` with `972005 ≤ p ≤ 974004` is `GoodP`. -/
theorem good_C486 (p : ℕ) (hlo : 972005 ≤ p) (hhi : p ≤ 974004) (hp : p.Prime) : GoodP p := by
  by_cases hc972005 : p ≤ 973004
  · exact scan_sound 973004 _ _ _ cert_972005 p hlo hc972005 hp
  exact scan_sound 974004 _ _ _ cert_973005 p (Nat.lt_of_not_le hc972005) hhi hp

/-- Every prime `p` with `974005 ≤ p ≤ 976004` is `GoodP`. -/
theorem good_C487 (p : ℕ) (hlo : 974005 ≤ p) (hhi : p ≤ 976004) (hp : p.Prime) : GoodP p := by
  by_cases hc974005 : p ≤ 975004
  · exact scan_sound 975004 _ _ _ cert_974005 p hlo hc974005 hp
  exact scan_sound 976004 _ _ _ cert_975005 p (Nat.lt_of_not_le hc974005) hhi hp

/-- Every prime `p` with `976005 ≤ p ≤ 978004` is `GoodP`. -/
theorem good_C488 (p : ℕ) (hlo : 976005 ≤ p) (hhi : p ≤ 978004) (hp : p.Prime) : GoodP p := by
  by_cases hc976005 : p ≤ 977004
  · exact scan_sound 977004 _ _ _ cert_976005 p hlo hc976005 hp
  exact scan_sound 978004 _ _ _ cert_977005 p (Nat.lt_of_not_le hc976005) hhi hp

/-- Every prime `p` with `978005 ≤ p ≤ 980004` is `GoodP`. -/
theorem good_C489 (p : ℕ) (hlo : 978005 ≤ p) (hhi : p ≤ 980004) (hp : p.Prime) : GoodP p := by
  by_cases hc978005 : p ≤ 979004
  · exact scan_sound 979004 _ _ _ cert_978005 p hlo hc978005 hp
  exact scan_sound 980004 _ _ _ cert_979005 p (Nat.lt_of_not_le hc978005) hhi hp

/-- Every prime `p` with `980005 ≤ p ≤ 982004` is `GoodP`. -/
theorem good_C490 (p : ℕ) (hlo : 980005 ≤ p) (hhi : p ≤ 982004) (hp : p.Prime) : GoodP p := by
  by_cases hc980005 : p ≤ 981004
  · exact scan_sound 981004 _ _ _ cert_980005 p hlo hc980005 hp
  exact scan_sound 982004 _ _ _ cert_981005 p (Nat.lt_of_not_le hc980005) hhi hp

/-- Every prime `p` with `982005 ≤ p ≤ 984004` is `GoodP`. -/
theorem good_C491 (p : ℕ) (hlo : 982005 ≤ p) (hhi : p ≤ 984004) (hp : p.Prime) : GoodP p := by
  by_cases hc982005 : p ≤ 983004
  · exact scan_sound 983004 _ _ _ cert_982005 p hlo hc982005 hp
  exact scan_sound 984004 _ _ _ cert_983005 p (Nat.lt_of_not_le hc982005) hhi hp

/-- Every prime `p` with `984005 ≤ p ≤ 986004` is `GoodP`. -/
theorem good_C492 (p : ℕ) (hlo : 984005 ≤ p) (hhi : p ≤ 986004) (hp : p.Prime) : GoodP p := by
  by_cases hc984005 : p ≤ 985004
  · exact scan_sound 985004 _ _ _ cert_984005 p hlo hc984005 hp
  exact scan_sound 986004 _ _ _ cert_985005 p (Nat.lt_of_not_le hc984005) hhi hp

/-- Every prime `p` with `986005 ≤ p ≤ 988004` is `GoodP`. -/
theorem good_C493 (p : ℕ) (hlo : 986005 ≤ p) (hhi : p ≤ 988004) (hp : p.Prime) : GoodP p := by
  by_cases hc986005 : p ≤ 987004
  · exact scan_sound 987004 _ _ _ cert_986005 p hlo hc986005 hp
  exact scan_sound 988004 _ _ _ cert_987005 p (Nat.lt_of_not_le hc986005) hhi hp

/-- Every prime `p` with `988005 ≤ p ≤ 990004` is `GoodP`. -/
theorem good_C494 (p : ℕ) (hlo : 988005 ≤ p) (hhi : p ≤ 990004) (hp : p.Prime) : GoodP p := by
  by_cases hc988005 : p ≤ 989004
  · exact scan_sound 989004 _ _ _ cert_988005 p hlo hc988005 hp
  exact scan_sound 990004 _ _ _ cert_989005 p (Nat.lt_of_not_le hc988005) hhi hp

/-- Every prime `p` with `990005 ≤ p ≤ 992004` is `GoodP`. -/
theorem good_C495 (p : ℕ) (hlo : 990005 ≤ p) (hhi : p ≤ 992004) (hp : p.Prime) : GoodP p := by
  by_cases hc990005 : p ≤ 991004
  · exact scan_sound 991004 _ _ _ cert_990005 p hlo hc990005 hp
  exact scan_sound 992004 _ _ _ cert_991005 p (Nat.lt_of_not_le hc990005) hhi hp

/-- Every prime `p` with `992005 ≤ p ≤ 994004` is `GoodP`. -/
theorem good_C496 (p : ℕ) (hlo : 992005 ≤ p) (hhi : p ≤ 994004) (hp : p.Prime) : GoodP p := by
  by_cases hc992005 : p ≤ 993004
  · exact scan_sound 993004 _ _ _ cert_992005 p hlo hc992005 hp
  exact scan_sound 994004 _ _ _ cert_993005 p (Nat.lt_of_not_le hc992005) hhi hp

/-- Every prime `p` with `994005 ≤ p ≤ 996004` is `GoodP`. -/
theorem good_C497 (p : ℕ) (hlo : 994005 ≤ p) (hhi : p ≤ 996004) (hp : p.Prime) : GoodP p := by
  by_cases hc994005 : p ≤ 995004
  · exact scan_sound 995004 _ _ _ cert_994005 p hlo hc994005 hp
  exact scan_sound 996004 _ _ _ cert_995005 p (Nat.lt_of_not_le hc994005) hhi hp

/-- Every prime `p` with `996005 ≤ p ≤ 998004` is `GoodP`. -/
theorem good_C498 (p : ℕ) (hlo : 996005 ≤ p) (hhi : p ≤ 998004) (hp : p.Prime) : GoodP p := by
  by_cases hc996005 : p ≤ 997004
  · exact scan_sound 997004 _ _ _ cert_996005 p hlo hc996005 hp
  exact scan_sound 998004 _ _ _ cert_997005 p (Nat.lt_of_not_le hc996005) hhi hp

/-- Every prime `p` with `998005 ≤ p ≤ 999999` is `GoodP`. -/
theorem good_C499 (p : ℕ) (hlo : 998005 ≤ p) (hhi : p ≤ 999999) (hp : p.Prime) : GoodP p := by
  by_cases hc998005 : p ≤ 999004
  · exact scan_sound 999004 _ _ _ cert_998005 p hlo hc998005 hp
  exact scan_sound 999999 _ _ _ cert_999005 p (Nat.lt_of_not_le hc998005) hhi hp

/-- Every prime `5 ≤ p ≤ 999999` is `GoodP`. -/
theorem good_upto (p : ℕ) (h5 : 5 ≤ p) (hB : p ≤ 999999) (hp : p.Prime) : GoodP p := by
  by_cases hf5 : p ≤ 2004
  · exact good_C000 p h5 hf5 hp
  by_cases hf2005 : p ≤ 4004
  · exact good_C001 p (Nat.lt_of_not_le hf5) hf2005 hp
  by_cases hf4005 : p ≤ 6004
  · exact good_C002 p (Nat.lt_of_not_le hf2005) hf4005 hp
  by_cases hf6005 : p ≤ 8004
  · exact good_C003 p (Nat.lt_of_not_le hf4005) hf6005 hp
  by_cases hf8005 : p ≤ 10004
  · exact good_C004 p (Nat.lt_of_not_le hf6005) hf8005 hp
  by_cases hf10005 : p ≤ 12004
  · exact good_C005 p (Nat.lt_of_not_le hf8005) hf10005 hp
  by_cases hf12005 : p ≤ 14004
  · exact good_C006 p (Nat.lt_of_not_le hf10005) hf12005 hp
  by_cases hf14005 : p ≤ 16004
  · exact good_C007 p (Nat.lt_of_not_le hf12005) hf14005 hp
  by_cases hf16005 : p ≤ 18004
  · exact good_C008 p (Nat.lt_of_not_le hf14005) hf16005 hp
  by_cases hf18005 : p ≤ 20004
  · exact good_C009 p (Nat.lt_of_not_le hf16005) hf18005 hp
  by_cases hf20005 : p ≤ 22004
  · exact good_C010 p (Nat.lt_of_not_le hf18005) hf20005 hp
  by_cases hf22005 : p ≤ 24004
  · exact good_C011 p (Nat.lt_of_not_le hf20005) hf22005 hp
  by_cases hf24005 : p ≤ 26004
  · exact good_C012 p (Nat.lt_of_not_le hf22005) hf24005 hp
  by_cases hf26005 : p ≤ 28004
  · exact good_C013 p (Nat.lt_of_not_le hf24005) hf26005 hp
  by_cases hf28005 : p ≤ 30004
  · exact good_C014 p (Nat.lt_of_not_le hf26005) hf28005 hp
  by_cases hf30005 : p ≤ 32004
  · exact good_C015 p (Nat.lt_of_not_le hf28005) hf30005 hp
  by_cases hf32005 : p ≤ 34004
  · exact good_C016 p (Nat.lt_of_not_le hf30005) hf32005 hp
  by_cases hf34005 : p ≤ 36004
  · exact good_C017 p (Nat.lt_of_not_le hf32005) hf34005 hp
  by_cases hf36005 : p ≤ 38004
  · exact good_C018 p (Nat.lt_of_not_le hf34005) hf36005 hp
  by_cases hf38005 : p ≤ 40004
  · exact good_C019 p (Nat.lt_of_not_le hf36005) hf38005 hp
  by_cases hf40005 : p ≤ 42004
  · exact good_C020 p (Nat.lt_of_not_le hf38005) hf40005 hp
  by_cases hf42005 : p ≤ 44004
  · exact good_C021 p (Nat.lt_of_not_le hf40005) hf42005 hp
  by_cases hf44005 : p ≤ 46004
  · exact good_C022 p (Nat.lt_of_not_le hf42005) hf44005 hp
  by_cases hf46005 : p ≤ 48004
  · exact good_C023 p (Nat.lt_of_not_le hf44005) hf46005 hp
  by_cases hf48005 : p ≤ 50004
  · exact good_C024 p (Nat.lt_of_not_le hf46005) hf48005 hp
  by_cases hf50005 : p ≤ 52004
  · exact good_C025 p (Nat.lt_of_not_le hf48005) hf50005 hp
  by_cases hf52005 : p ≤ 54004
  · exact good_C026 p (Nat.lt_of_not_le hf50005) hf52005 hp
  by_cases hf54005 : p ≤ 56004
  · exact good_C027 p (Nat.lt_of_not_le hf52005) hf54005 hp
  by_cases hf56005 : p ≤ 58004
  · exact good_C028 p (Nat.lt_of_not_le hf54005) hf56005 hp
  by_cases hf58005 : p ≤ 60004
  · exact good_C029 p (Nat.lt_of_not_le hf56005) hf58005 hp
  by_cases hf60005 : p ≤ 62004
  · exact good_C030 p (Nat.lt_of_not_le hf58005) hf60005 hp
  by_cases hf62005 : p ≤ 64004
  · exact good_C031 p (Nat.lt_of_not_le hf60005) hf62005 hp
  by_cases hf64005 : p ≤ 66004
  · exact good_C032 p (Nat.lt_of_not_le hf62005) hf64005 hp
  by_cases hf66005 : p ≤ 68004
  · exact good_C033 p (Nat.lt_of_not_le hf64005) hf66005 hp
  by_cases hf68005 : p ≤ 70004
  · exact good_C034 p (Nat.lt_of_not_le hf66005) hf68005 hp
  by_cases hf70005 : p ≤ 72004
  · exact good_C035 p (Nat.lt_of_not_le hf68005) hf70005 hp
  by_cases hf72005 : p ≤ 74004
  · exact good_C036 p (Nat.lt_of_not_le hf70005) hf72005 hp
  by_cases hf74005 : p ≤ 76004
  · exact good_C037 p (Nat.lt_of_not_le hf72005) hf74005 hp
  by_cases hf76005 : p ≤ 78004
  · exact good_C038 p (Nat.lt_of_not_le hf74005) hf76005 hp
  by_cases hf78005 : p ≤ 80004
  · exact good_C039 p (Nat.lt_of_not_le hf76005) hf78005 hp
  by_cases hf80005 : p ≤ 82004
  · exact good_C040 p (Nat.lt_of_not_le hf78005) hf80005 hp
  by_cases hf82005 : p ≤ 84004
  · exact good_C041 p (Nat.lt_of_not_le hf80005) hf82005 hp
  by_cases hf84005 : p ≤ 86004
  · exact good_C042 p (Nat.lt_of_not_le hf82005) hf84005 hp
  by_cases hf86005 : p ≤ 88004
  · exact good_C043 p (Nat.lt_of_not_le hf84005) hf86005 hp
  by_cases hf88005 : p ≤ 90004
  · exact good_C044 p (Nat.lt_of_not_le hf86005) hf88005 hp
  by_cases hf90005 : p ≤ 92004
  · exact good_C045 p (Nat.lt_of_not_le hf88005) hf90005 hp
  by_cases hf92005 : p ≤ 94004
  · exact good_C046 p (Nat.lt_of_not_le hf90005) hf92005 hp
  by_cases hf94005 : p ≤ 96004
  · exact good_C047 p (Nat.lt_of_not_le hf92005) hf94005 hp
  by_cases hf96005 : p ≤ 98004
  · exact good_C048 p (Nat.lt_of_not_le hf94005) hf96005 hp
  by_cases hf98005 : p ≤ 100004
  · exact good_C049 p (Nat.lt_of_not_le hf96005) hf98005 hp
  by_cases hf100005 : p ≤ 102004
  · exact good_C050 p (Nat.lt_of_not_le hf98005) hf100005 hp
  by_cases hf102005 : p ≤ 104004
  · exact good_C051 p (Nat.lt_of_not_le hf100005) hf102005 hp
  by_cases hf104005 : p ≤ 106004
  · exact good_C052 p (Nat.lt_of_not_le hf102005) hf104005 hp
  by_cases hf106005 : p ≤ 108004
  · exact good_C053 p (Nat.lt_of_not_le hf104005) hf106005 hp
  by_cases hf108005 : p ≤ 110004
  · exact good_C054 p (Nat.lt_of_not_le hf106005) hf108005 hp
  by_cases hf110005 : p ≤ 112004
  · exact good_C055 p (Nat.lt_of_not_le hf108005) hf110005 hp
  by_cases hf112005 : p ≤ 114004
  · exact good_C056 p (Nat.lt_of_not_le hf110005) hf112005 hp
  by_cases hf114005 : p ≤ 116004
  · exact good_C057 p (Nat.lt_of_not_le hf112005) hf114005 hp
  by_cases hf116005 : p ≤ 118004
  · exact good_C058 p (Nat.lt_of_not_le hf114005) hf116005 hp
  by_cases hf118005 : p ≤ 120004
  · exact good_C059 p (Nat.lt_of_not_le hf116005) hf118005 hp
  by_cases hf120005 : p ≤ 122004
  · exact good_C060 p (Nat.lt_of_not_le hf118005) hf120005 hp
  by_cases hf122005 : p ≤ 124004
  · exact good_C061 p (Nat.lt_of_not_le hf120005) hf122005 hp
  by_cases hf124005 : p ≤ 126004
  · exact good_C062 p (Nat.lt_of_not_le hf122005) hf124005 hp
  by_cases hf126005 : p ≤ 128004
  · exact good_C063 p (Nat.lt_of_not_le hf124005) hf126005 hp
  by_cases hf128005 : p ≤ 130004
  · exact good_C064 p (Nat.lt_of_not_le hf126005) hf128005 hp
  by_cases hf130005 : p ≤ 132004
  · exact good_C065 p (Nat.lt_of_not_le hf128005) hf130005 hp
  by_cases hf132005 : p ≤ 134004
  · exact good_C066 p (Nat.lt_of_not_le hf130005) hf132005 hp
  by_cases hf134005 : p ≤ 136004
  · exact good_C067 p (Nat.lt_of_not_le hf132005) hf134005 hp
  by_cases hf136005 : p ≤ 138004
  · exact good_C068 p (Nat.lt_of_not_le hf134005) hf136005 hp
  by_cases hf138005 : p ≤ 140004
  · exact good_C069 p (Nat.lt_of_not_le hf136005) hf138005 hp
  by_cases hf140005 : p ≤ 142004
  · exact good_C070 p (Nat.lt_of_not_le hf138005) hf140005 hp
  by_cases hf142005 : p ≤ 144004
  · exact good_C071 p (Nat.lt_of_not_le hf140005) hf142005 hp
  by_cases hf144005 : p ≤ 146004
  · exact good_C072 p (Nat.lt_of_not_le hf142005) hf144005 hp
  by_cases hf146005 : p ≤ 148004
  · exact good_C073 p (Nat.lt_of_not_le hf144005) hf146005 hp
  by_cases hf148005 : p ≤ 150004
  · exact good_C074 p (Nat.lt_of_not_le hf146005) hf148005 hp
  by_cases hf150005 : p ≤ 152004
  · exact good_C075 p (Nat.lt_of_not_le hf148005) hf150005 hp
  by_cases hf152005 : p ≤ 154004
  · exact good_C076 p (Nat.lt_of_not_le hf150005) hf152005 hp
  by_cases hf154005 : p ≤ 156004
  · exact good_C077 p (Nat.lt_of_not_le hf152005) hf154005 hp
  by_cases hf156005 : p ≤ 158004
  · exact good_C078 p (Nat.lt_of_not_le hf154005) hf156005 hp
  by_cases hf158005 : p ≤ 160004
  · exact good_C079 p (Nat.lt_of_not_le hf156005) hf158005 hp
  by_cases hf160005 : p ≤ 162004
  · exact good_C080 p (Nat.lt_of_not_le hf158005) hf160005 hp
  by_cases hf162005 : p ≤ 164004
  · exact good_C081 p (Nat.lt_of_not_le hf160005) hf162005 hp
  by_cases hf164005 : p ≤ 166004
  · exact good_C082 p (Nat.lt_of_not_le hf162005) hf164005 hp
  by_cases hf166005 : p ≤ 168004
  · exact good_C083 p (Nat.lt_of_not_le hf164005) hf166005 hp
  by_cases hf168005 : p ≤ 170004
  · exact good_C084 p (Nat.lt_of_not_le hf166005) hf168005 hp
  by_cases hf170005 : p ≤ 172004
  · exact good_C085 p (Nat.lt_of_not_le hf168005) hf170005 hp
  by_cases hf172005 : p ≤ 174004
  · exact good_C086 p (Nat.lt_of_not_le hf170005) hf172005 hp
  by_cases hf174005 : p ≤ 176004
  · exact good_C087 p (Nat.lt_of_not_le hf172005) hf174005 hp
  by_cases hf176005 : p ≤ 178004
  · exact good_C088 p (Nat.lt_of_not_le hf174005) hf176005 hp
  by_cases hf178005 : p ≤ 180004
  · exact good_C089 p (Nat.lt_of_not_le hf176005) hf178005 hp
  by_cases hf180005 : p ≤ 182004
  · exact good_C090 p (Nat.lt_of_not_le hf178005) hf180005 hp
  by_cases hf182005 : p ≤ 184004
  · exact good_C091 p (Nat.lt_of_not_le hf180005) hf182005 hp
  by_cases hf184005 : p ≤ 186004
  · exact good_C092 p (Nat.lt_of_not_le hf182005) hf184005 hp
  by_cases hf186005 : p ≤ 188004
  · exact good_C093 p (Nat.lt_of_not_le hf184005) hf186005 hp
  by_cases hf188005 : p ≤ 190004
  · exact good_C094 p (Nat.lt_of_not_le hf186005) hf188005 hp
  by_cases hf190005 : p ≤ 192004
  · exact good_C095 p (Nat.lt_of_not_le hf188005) hf190005 hp
  by_cases hf192005 : p ≤ 194004
  · exact good_C096 p (Nat.lt_of_not_le hf190005) hf192005 hp
  by_cases hf194005 : p ≤ 196004
  · exact good_C097 p (Nat.lt_of_not_le hf192005) hf194005 hp
  by_cases hf196005 : p ≤ 198004
  · exact good_C098 p (Nat.lt_of_not_le hf194005) hf196005 hp
  by_cases hf198005 : p ≤ 200004
  · exact good_C099 p (Nat.lt_of_not_le hf196005) hf198005 hp
  by_cases hf200005 : p ≤ 202004
  · exact good_C100 p (Nat.lt_of_not_le hf198005) hf200005 hp
  by_cases hf202005 : p ≤ 204004
  · exact good_C101 p (Nat.lt_of_not_le hf200005) hf202005 hp
  by_cases hf204005 : p ≤ 206004
  · exact good_C102 p (Nat.lt_of_not_le hf202005) hf204005 hp
  by_cases hf206005 : p ≤ 208004
  · exact good_C103 p (Nat.lt_of_not_le hf204005) hf206005 hp
  by_cases hf208005 : p ≤ 210004
  · exact good_C104 p (Nat.lt_of_not_le hf206005) hf208005 hp
  by_cases hf210005 : p ≤ 212004
  · exact good_C105 p (Nat.lt_of_not_le hf208005) hf210005 hp
  by_cases hf212005 : p ≤ 214004
  · exact good_C106 p (Nat.lt_of_not_le hf210005) hf212005 hp
  by_cases hf214005 : p ≤ 216004
  · exact good_C107 p (Nat.lt_of_not_le hf212005) hf214005 hp
  by_cases hf216005 : p ≤ 218004
  · exact good_C108 p (Nat.lt_of_not_le hf214005) hf216005 hp
  by_cases hf218005 : p ≤ 220004
  · exact good_C109 p (Nat.lt_of_not_le hf216005) hf218005 hp
  by_cases hf220005 : p ≤ 222004
  · exact good_C110 p (Nat.lt_of_not_le hf218005) hf220005 hp
  by_cases hf222005 : p ≤ 224004
  · exact good_C111 p (Nat.lt_of_not_le hf220005) hf222005 hp
  by_cases hf224005 : p ≤ 226004
  · exact good_C112 p (Nat.lt_of_not_le hf222005) hf224005 hp
  by_cases hf226005 : p ≤ 228004
  · exact good_C113 p (Nat.lt_of_not_le hf224005) hf226005 hp
  by_cases hf228005 : p ≤ 230004
  · exact good_C114 p (Nat.lt_of_not_le hf226005) hf228005 hp
  by_cases hf230005 : p ≤ 232004
  · exact good_C115 p (Nat.lt_of_not_le hf228005) hf230005 hp
  by_cases hf232005 : p ≤ 234004
  · exact good_C116 p (Nat.lt_of_not_le hf230005) hf232005 hp
  by_cases hf234005 : p ≤ 236004
  · exact good_C117 p (Nat.lt_of_not_le hf232005) hf234005 hp
  by_cases hf236005 : p ≤ 238004
  · exact good_C118 p (Nat.lt_of_not_le hf234005) hf236005 hp
  by_cases hf238005 : p ≤ 240004
  · exact good_C119 p (Nat.lt_of_not_le hf236005) hf238005 hp
  by_cases hf240005 : p ≤ 242004
  · exact good_C120 p (Nat.lt_of_not_le hf238005) hf240005 hp
  by_cases hf242005 : p ≤ 244004
  · exact good_C121 p (Nat.lt_of_not_le hf240005) hf242005 hp
  by_cases hf244005 : p ≤ 246004
  · exact good_C122 p (Nat.lt_of_not_le hf242005) hf244005 hp
  by_cases hf246005 : p ≤ 248004
  · exact good_C123 p (Nat.lt_of_not_le hf244005) hf246005 hp
  by_cases hf248005 : p ≤ 250004
  · exact good_C124 p (Nat.lt_of_not_le hf246005) hf248005 hp
  by_cases hf250005 : p ≤ 252004
  · exact good_C125 p (Nat.lt_of_not_le hf248005) hf250005 hp
  by_cases hf252005 : p ≤ 254004
  · exact good_C126 p (Nat.lt_of_not_le hf250005) hf252005 hp
  by_cases hf254005 : p ≤ 256004
  · exact good_C127 p (Nat.lt_of_not_le hf252005) hf254005 hp
  by_cases hf256005 : p ≤ 258004
  · exact good_C128 p (Nat.lt_of_not_le hf254005) hf256005 hp
  by_cases hf258005 : p ≤ 260004
  · exact good_C129 p (Nat.lt_of_not_le hf256005) hf258005 hp
  by_cases hf260005 : p ≤ 262004
  · exact good_C130 p (Nat.lt_of_not_le hf258005) hf260005 hp
  by_cases hf262005 : p ≤ 264004
  · exact good_C131 p (Nat.lt_of_not_le hf260005) hf262005 hp
  by_cases hf264005 : p ≤ 266004
  · exact good_C132 p (Nat.lt_of_not_le hf262005) hf264005 hp
  by_cases hf266005 : p ≤ 268004
  · exact good_C133 p (Nat.lt_of_not_le hf264005) hf266005 hp
  by_cases hf268005 : p ≤ 270004
  · exact good_C134 p (Nat.lt_of_not_le hf266005) hf268005 hp
  by_cases hf270005 : p ≤ 272004
  · exact good_C135 p (Nat.lt_of_not_le hf268005) hf270005 hp
  by_cases hf272005 : p ≤ 274004
  · exact good_C136 p (Nat.lt_of_not_le hf270005) hf272005 hp
  by_cases hf274005 : p ≤ 276004
  · exact good_C137 p (Nat.lt_of_not_le hf272005) hf274005 hp
  by_cases hf276005 : p ≤ 278004
  · exact good_C138 p (Nat.lt_of_not_le hf274005) hf276005 hp
  by_cases hf278005 : p ≤ 280004
  · exact good_C139 p (Nat.lt_of_not_le hf276005) hf278005 hp
  by_cases hf280005 : p ≤ 282004
  · exact good_C140 p (Nat.lt_of_not_le hf278005) hf280005 hp
  by_cases hf282005 : p ≤ 284004
  · exact good_C141 p (Nat.lt_of_not_le hf280005) hf282005 hp
  by_cases hf284005 : p ≤ 286004
  · exact good_C142 p (Nat.lt_of_not_le hf282005) hf284005 hp
  by_cases hf286005 : p ≤ 288004
  · exact good_C143 p (Nat.lt_of_not_le hf284005) hf286005 hp
  by_cases hf288005 : p ≤ 290004
  · exact good_C144 p (Nat.lt_of_not_le hf286005) hf288005 hp
  by_cases hf290005 : p ≤ 292004
  · exact good_C145 p (Nat.lt_of_not_le hf288005) hf290005 hp
  by_cases hf292005 : p ≤ 294004
  · exact good_C146 p (Nat.lt_of_not_le hf290005) hf292005 hp
  by_cases hf294005 : p ≤ 296004
  · exact good_C147 p (Nat.lt_of_not_le hf292005) hf294005 hp
  by_cases hf296005 : p ≤ 298004
  · exact good_C148 p (Nat.lt_of_not_le hf294005) hf296005 hp
  by_cases hf298005 : p ≤ 300004
  · exact good_C149 p (Nat.lt_of_not_le hf296005) hf298005 hp
  by_cases hf300005 : p ≤ 302004
  · exact good_C150 p (Nat.lt_of_not_le hf298005) hf300005 hp
  by_cases hf302005 : p ≤ 304004
  · exact good_C151 p (Nat.lt_of_not_le hf300005) hf302005 hp
  by_cases hf304005 : p ≤ 306004
  · exact good_C152 p (Nat.lt_of_not_le hf302005) hf304005 hp
  by_cases hf306005 : p ≤ 308004
  · exact good_C153 p (Nat.lt_of_not_le hf304005) hf306005 hp
  by_cases hf308005 : p ≤ 310004
  · exact good_C154 p (Nat.lt_of_not_le hf306005) hf308005 hp
  by_cases hf310005 : p ≤ 312004
  · exact good_C155 p (Nat.lt_of_not_le hf308005) hf310005 hp
  by_cases hf312005 : p ≤ 314004
  · exact good_C156 p (Nat.lt_of_not_le hf310005) hf312005 hp
  by_cases hf314005 : p ≤ 316004
  · exact good_C157 p (Nat.lt_of_not_le hf312005) hf314005 hp
  by_cases hf316005 : p ≤ 318004
  · exact good_C158 p (Nat.lt_of_not_le hf314005) hf316005 hp
  by_cases hf318005 : p ≤ 320004
  · exact good_C159 p (Nat.lt_of_not_le hf316005) hf318005 hp
  by_cases hf320005 : p ≤ 322004
  · exact good_C160 p (Nat.lt_of_not_le hf318005) hf320005 hp
  by_cases hf322005 : p ≤ 324004
  · exact good_C161 p (Nat.lt_of_not_le hf320005) hf322005 hp
  by_cases hf324005 : p ≤ 326004
  · exact good_C162 p (Nat.lt_of_not_le hf322005) hf324005 hp
  by_cases hf326005 : p ≤ 328004
  · exact good_C163 p (Nat.lt_of_not_le hf324005) hf326005 hp
  by_cases hf328005 : p ≤ 330004
  · exact good_C164 p (Nat.lt_of_not_le hf326005) hf328005 hp
  by_cases hf330005 : p ≤ 332004
  · exact good_C165 p (Nat.lt_of_not_le hf328005) hf330005 hp
  by_cases hf332005 : p ≤ 334004
  · exact good_C166 p (Nat.lt_of_not_le hf330005) hf332005 hp
  by_cases hf334005 : p ≤ 336004
  · exact good_C167 p (Nat.lt_of_not_le hf332005) hf334005 hp
  by_cases hf336005 : p ≤ 338004
  · exact good_C168 p (Nat.lt_of_not_le hf334005) hf336005 hp
  by_cases hf338005 : p ≤ 340004
  · exact good_C169 p (Nat.lt_of_not_le hf336005) hf338005 hp
  by_cases hf340005 : p ≤ 342004
  · exact good_C170 p (Nat.lt_of_not_le hf338005) hf340005 hp
  by_cases hf342005 : p ≤ 344004
  · exact good_C171 p (Nat.lt_of_not_le hf340005) hf342005 hp
  by_cases hf344005 : p ≤ 346004
  · exact good_C172 p (Nat.lt_of_not_le hf342005) hf344005 hp
  by_cases hf346005 : p ≤ 348004
  · exact good_C173 p (Nat.lt_of_not_le hf344005) hf346005 hp
  by_cases hf348005 : p ≤ 350004
  · exact good_C174 p (Nat.lt_of_not_le hf346005) hf348005 hp
  by_cases hf350005 : p ≤ 352004
  · exact good_C175 p (Nat.lt_of_not_le hf348005) hf350005 hp
  by_cases hf352005 : p ≤ 354004
  · exact good_C176 p (Nat.lt_of_not_le hf350005) hf352005 hp
  by_cases hf354005 : p ≤ 356004
  · exact good_C177 p (Nat.lt_of_not_le hf352005) hf354005 hp
  by_cases hf356005 : p ≤ 358004
  · exact good_C178 p (Nat.lt_of_not_le hf354005) hf356005 hp
  by_cases hf358005 : p ≤ 360004
  · exact good_C179 p (Nat.lt_of_not_le hf356005) hf358005 hp
  by_cases hf360005 : p ≤ 362004
  · exact good_C180 p (Nat.lt_of_not_le hf358005) hf360005 hp
  by_cases hf362005 : p ≤ 364004
  · exact good_C181 p (Nat.lt_of_not_le hf360005) hf362005 hp
  by_cases hf364005 : p ≤ 366004
  · exact good_C182 p (Nat.lt_of_not_le hf362005) hf364005 hp
  by_cases hf366005 : p ≤ 368004
  · exact good_C183 p (Nat.lt_of_not_le hf364005) hf366005 hp
  by_cases hf368005 : p ≤ 370004
  · exact good_C184 p (Nat.lt_of_not_le hf366005) hf368005 hp
  by_cases hf370005 : p ≤ 372004
  · exact good_C185 p (Nat.lt_of_not_le hf368005) hf370005 hp
  by_cases hf372005 : p ≤ 374004
  · exact good_C186 p (Nat.lt_of_not_le hf370005) hf372005 hp
  by_cases hf374005 : p ≤ 376004
  · exact good_C187 p (Nat.lt_of_not_le hf372005) hf374005 hp
  by_cases hf376005 : p ≤ 378004
  · exact good_C188 p (Nat.lt_of_not_le hf374005) hf376005 hp
  by_cases hf378005 : p ≤ 380004
  · exact good_C189 p (Nat.lt_of_not_le hf376005) hf378005 hp
  by_cases hf380005 : p ≤ 382004
  · exact good_C190 p (Nat.lt_of_not_le hf378005) hf380005 hp
  by_cases hf382005 : p ≤ 384004
  · exact good_C191 p (Nat.lt_of_not_le hf380005) hf382005 hp
  by_cases hf384005 : p ≤ 386004
  · exact good_C192 p (Nat.lt_of_not_le hf382005) hf384005 hp
  by_cases hf386005 : p ≤ 388004
  · exact good_C193 p (Nat.lt_of_not_le hf384005) hf386005 hp
  by_cases hf388005 : p ≤ 390004
  · exact good_C194 p (Nat.lt_of_not_le hf386005) hf388005 hp
  by_cases hf390005 : p ≤ 392004
  · exact good_C195 p (Nat.lt_of_not_le hf388005) hf390005 hp
  by_cases hf392005 : p ≤ 394004
  · exact good_C196 p (Nat.lt_of_not_le hf390005) hf392005 hp
  by_cases hf394005 : p ≤ 396004
  · exact good_C197 p (Nat.lt_of_not_le hf392005) hf394005 hp
  by_cases hf396005 : p ≤ 398004
  · exact good_C198 p (Nat.lt_of_not_le hf394005) hf396005 hp
  by_cases hf398005 : p ≤ 400004
  · exact good_C199 p (Nat.lt_of_not_le hf396005) hf398005 hp
  by_cases hf400005 : p ≤ 402004
  · exact good_C200 p (Nat.lt_of_not_le hf398005) hf400005 hp
  by_cases hf402005 : p ≤ 404004
  · exact good_C201 p (Nat.lt_of_not_le hf400005) hf402005 hp
  by_cases hf404005 : p ≤ 406004
  · exact good_C202 p (Nat.lt_of_not_le hf402005) hf404005 hp
  by_cases hf406005 : p ≤ 408004
  · exact good_C203 p (Nat.lt_of_not_le hf404005) hf406005 hp
  by_cases hf408005 : p ≤ 410004
  · exact good_C204 p (Nat.lt_of_not_le hf406005) hf408005 hp
  by_cases hf410005 : p ≤ 412004
  · exact good_C205 p (Nat.lt_of_not_le hf408005) hf410005 hp
  by_cases hf412005 : p ≤ 414004
  · exact good_C206 p (Nat.lt_of_not_le hf410005) hf412005 hp
  by_cases hf414005 : p ≤ 416004
  · exact good_C207 p (Nat.lt_of_not_le hf412005) hf414005 hp
  by_cases hf416005 : p ≤ 418004
  · exact good_C208 p (Nat.lt_of_not_le hf414005) hf416005 hp
  by_cases hf418005 : p ≤ 420004
  · exact good_C209 p (Nat.lt_of_not_le hf416005) hf418005 hp
  by_cases hf420005 : p ≤ 422004
  · exact good_C210 p (Nat.lt_of_not_le hf418005) hf420005 hp
  by_cases hf422005 : p ≤ 424004
  · exact good_C211 p (Nat.lt_of_not_le hf420005) hf422005 hp
  by_cases hf424005 : p ≤ 426004
  · exact good_C212 p (Nat.lt_of_not_le hf422005) hf424005 hp
  by_cases hf426005 : p ≤ 428004
  · exact good_C213 p (Nat.lt_of_not_le hf424005) hf426005 hp
  by_cases hf428005 : p ≤ 430004
  · exact good_C214 p (Nat.lt_of_not_le hf426005) hf428005 hp
  by_cases hf430005 : p ≤ 432004
  · exact good_C215 p (Nat.lt_of_not_le hf428005) hf430005 hp
  by_cases hf432005 : p ≤ 434004
  · exact good_C216 p (Nat.lt_of_not_le hf430005) hf432005 hp
  by_cases hf434005 : p ≤ 436004
  · exact good_C217 p (Nat.lt_of_not_le hf432005) hf434005 hp
  by_cases hf436005 : p ≤ 438004
  · exact good_C218 p (Nat.lt_of_not_le hf434005) hf436005 hp
  by_cases hf438005 : p ≤ 440004
  · exact good_C219 p (Nat.lt_of_not_le hf436005) hf438005 hp
  by_cases hf440005 : p ≤ 442004
  · exact good_C220 p (Nat.lt_of_not_le hf438005) hf440005 hp
  by_cases hf442005 : p ≤ 444004
  · exact good_C221 p (Nat.lt_of_not_le hf440005) hf442005 hp
  by_cases hf444005 : p ≤ 446004
  · exact good_C222 p (Nat.lt_of_not_le hf442005) hf444005 hp
  by_cases hf446005 : p ≤ 448004
  · exact good_C223 p (Nat.lt_of_not_le hf444005) hf446005 hp
  by_cases hf448005 : p ≤ 450004
  · exact good_C224 p (Nat.lt_of_not_le hf446005) hf448005 hp
  by_cases hf450005 : p ≤ 452004
  · exact good_C225 p (Nat.lt_of_not_le hf448005) hf450005 hp
  by_cases hf452005 : p ≤ 454004
  · exact good_C226 p (Nat.lt_of_not_le hf450005) hf452005 hp
  by_cases hf454005 : p ≤ 456004
  · exact good_C227 p (Nat.lt_of_not_le hf452005) hf454005 hp
  by_cases hf456005 : p ≤ 458004
  · exact good_C228 p (Nat.lt_of_not_le hf454005) hf456005 hp
  by_cases hf458005 : p ≤ 460004
  · exact good_C229 p (Nat.lt_of_not_le hf456005) hf458005 hp
  by_cases hf460005 : p ≤ 462004
  · exact good_C230 p (Nat.lt_of_not_le hf458005) hf460005 hp
  by_cases hf462005 : p ≤ 464004
  · exact good_C231 p (Nat.lt_of_not_le hf460005) hf462005 hp
  by_cases hf464005 : p ≤ 466004
  · exact good_C232 p (Nat.lt_of_not_le hf462005) hf464005 hp
  by_cases hf466005 : p ≤ 468004
  · exact good_C233 p (Nat.lt_of_not_le hf464005) hf466005 hp
  by_cases hf468005 : p ≤ 470004
  · exact good_C234 p (Nat.lt_of_not_le hf466005) hf468005 hp
  by_cases hf470005 : p ≤ 472004
  · exact good_C235 p (Nat.lt_of_not_le hf468005) hf470005 hp
  by_cases hf472005 : p ≤ 474004
  · exact good_C236 p (Nat.lt_of_not_le hf470005) hf472005 hp
  by_cases hf474005 : p ≤ 476004
  · exact good_C237 p (Nat.lt_of_not_le hf472005) hf474005 hp
  by_cases hf476005 : p ≤ 478004
  · exact good_C238 p (Nat.lt_of_not_le hf474005) hf476005 hp
  by_cases hf478005 : p ≤ 480004
  · exact good_C239 p (Nat.lt_of_not_le hf476005) hf478005 hp
  by_cases hf480005 : p ≤ 482004
  · exact good_C240 p (Nat.lt_of_not_le hf478005) hf480005 hp
  by_cases hf482005 : p ≤ 484004
  · exact good_C241 p (Nat.lt_of_not_le hf480005) hf482005 hp
  by_cases hf484005 : p ≤ 486004
  · exact good_C242 p (Nat.lt_of_not_le hf482005) hf484005 hp
  by_cases hf486005 : p ≤ 488004
  · exact good_C243 p (Nat.lt_of_not_le hf484005) hf486005 hp
  by_cases hf488005 : p ≤ 490004
  · exact good_C244 p (Nat.lt_of_not_le hf486005) hf488005 hp
  by_cases hf490005 : p ≤ 492004
  · exact good_C245 p (Nat.lt_of_not_le hf488005) hf490005 hp
  by_cases hf492005 : p ≤ 494004
  · exact good_C246 p (Nat.lt_of_not_le hf490005) hf492005 hp
  by_cases hf494005 : p ≤ 496004
  · exact good_C247 p (Nat.lt_of_not_le hf492005) hf494005 hp
  by_cases hf496005 : p ≤ 498004
  · exact good_C248 p (Nat.lt_of_not_le hf494005) hf496005 hp
  by_cases hf498005 : p ≤ 500004
  · exact good_C249 p (Nat.lt_of_not_le hf496005) hf498005 hp
  by_cases hf500005 : p ≤ 502004
  · exact good_C250 p (Nat.lt_of_not_le hf498005) hf500005 hp
  by_cases hf502005 : p ≤ 504004
  · exact good_C251 p (Nat.lt_of_not_le hf500005) hf502005 hp
  by_cases hf504005 : p ≤ 506004
  · exact good_C252 p (Nat.lt_of_not_le hf502005) hf504005 hp
  by_cases hf506005 : p ≤ 508004
  · exact good_C253 p (Nat.lt_of_not_le hf504005) hf506005 hp
  by_cases hf508005 : p ≤ 510004
  · exact good_C254 p (Nat.lt_of_not_le hf506005) hf508005 hp
  by_cases hf510005 : p ≤ 512004
  · exact good_C255 p (Nat.lt_of_not_le hf508005) hf510005 hp
  by_cases hf512005 : p ≤ 514004
  · exact good_C256 p (Nat.lt_of_not_le hf510005) hf512005 hp
  by_cases hf514005 : p ≤ 516004
  · exact good_C257 p (Nat.lt_of_not_le hf512005) hf514005 hp
  by_cases hf516005 : p ≤ 518004
  · exact good_C258 p (Nat.lt_of_not_le hf514005) hf516005 hp
  by_cases hf518005 : p ≤ 520004
  · exact good_C259 p (Nat.lt_of_not_le hf516005) hf518005 hp
  by_cases hf520005 : p ≤ 522004
  · exact good_C260 p (Nat.lt_of_not_le hf518005) hf520005 hp
  by_cases hf522005 : p ≤ 524004
  · exact good_C261 p (Nat.lt_of_not_le hf520005) hf522005 hp
  by_cases hf524005 : p ≤ 526004
  · exact good_C262 p (Nat.lt_of_not_le hf522005) hf524005 hp
  by_cases hf526005 : p ≤ 528004
  · exact good_C263 p (Nat.lt_of_not_le hf524005) hf526005 hp
  by_cases hf528005 : p ≤ 530004
  · exact good_C264 p (Nat.lt_of_not_le hf526005) hf528005 hp
  by_cases hf530005 : p ≤ 532004
  · exact good_C265 p (Nat.lt_of_not_le hf528005) hf530005 hp
  by_cases hf532005 : p ≤ 534004
  · exact good_C266 p (Nat.lt_of_not_le hf530005) hf532005 hp
  by_cases hf534005 : p ≤ 536004
  · exact good_C267 p (Nat.lt_of_not_le hf532005) hf534005 hp
  by_cases hf536005 : p ≤ 538004
  · exact good_C268 p (Nat.lt_of_not_le hf534005) hf536005 hp
  by_cases hf538005 : p ≤ 540004
  · exact good_C269 p (Nat.lt_of_not_le hf536005) hf538005 hp
  by_cases hf540005 : p ≤ 542004
  · exact good_C270 p (Nat.lt_of_not_le hf538005) hf540005 hp
  by_cases hf542005 : p ≤ 544004
  · exact good_C271 p (Nat.lt_of_not_le hf540005) hf542005 hp
  by_cases hf544005 : p ≤ 546004
  · exact good_C272 p (Nat.lt_of_not_le hf542005) hf544005 hp
  by_cases hf546005 : p ≤ 548004
  · exact good_C273 p (Nat.lt_of_not_le hf544005) hf546005 hp
  by_cases hf548005 : p ≤ 550004
  · exact good_C274 p (Nat.lt_of_not_le hf546005) hf548005 hp
  by_cases hf550005 : p ≤ 552004
  · exact good_C275 p (Nat.lt_of_not_le hf548005) hf550005 hp
  by_cases hf552005 : p ≤ 554004
  · exact good_C276 p (Nat.lt_of_not_le hf550005) hf552005 hp
  by_cases hf554005 : p ≤ 556004
  · exact good_C277 p (Nat.lt_of_not_le hf552005) hf554005 hp
  by_cases hf556005 : p ≤ 558004
  · exact good_C278 p (Nat.lt_of_not_le hf554005) hf556005 hp
  by_cases hf558005 : p ≤ 560004
  · exact good_C279 p (Nat.lt_of_not_le hf556005) hf558005 hp
  by_cases hf560005 : p ≤ 562004
  · exact good_C280 p (Nat.lt_of_not_le hf558005) hf560005 hp
  by_cases hf562005 : p ≤ 564004
  · exact good_C281 p (Nat.lt_of_not_le hf560005) hf562005 hp
  by_cases hf564005 : p ≤ 566004
  · exact good_C282 p (Nat.lt_of_not_le hf562005) hf564005 hp
  by_cases hf566005 : p ≤ 568004
  · exact good_C283 p (Nat.lt_of_not_le hf564005) hf566005 hp
  by_cases hf568005 : p ≤ 570004
  · exact good_C284 p (Nat.lt_of_not_le hf566005) hf568005 hp
  by_cases hf570005 : p ≤ 572004
  · exact good_C285 p (Nat.lt_of_not_le hf568005) hf570005 hp
  by_cases hf572005 : p ≤ 574004
  · exact good_C286 p (Nat.lt_of_not_le hf570005) hf572005 hp
  by_cases hf574005 : p ≤ 576004
  · exact good_C287 p (Nat.lt_of_not_le hf572005) hf574005 hp
  by_cases hf576005 : p ≤ 578004
  · exact good_C288 p (Nat.lt_of_not_le hf574005) hf576005 hp
  by_cases hf578005 : p ≤ 580004
  · exact good_C289 p (Nat.lt_of_not_le hf576005) hf578005 hp
  by_cases hf580005 : p ≤ 582004
  · exact good_C290 p (Nat.lt_of_not_le hf578005) hf580005 hp
  by_cases hf582005 : p ≤ 584004
  · exact good_C291 p (Nat.lt_of_not_le hf580005) hf582005 hp
  by_cases hf584005 : p ≤ 586004
  · exact good_C292 p (Nat.lt_of_not_le hf582005) hf584005 hp
  by_cases hf586005 : p ≤ 588004
  · exact good_C293 p (Nat.lt_of_not_le hf584005) hf586005 hp
  by_cases hf588005 : p ≤ 590004
  · exact good_C294 p (Nat.lt_of_not_le hf586005) hf588005 hp
  by_cases hf590005 : p ≤ 592004
  · exact good_C295 p (Nat.lt_of_not_le hf588005) hf590005 hp
  by_cases hf592005 : p ≤ 594004
  · exact good_C296 p (Nat.lt_of_not_le hf590005) hf592005 hp
  by_cases hf594005 : p ≤ 596004
  · exact good_C297 p (Nat.lt_of_not_le hf592005) hf594005 hp
  by_cases hf596005 : p ≤ 598004
  · exact good_C298 p (Nat.lt_of_not_le hf594005) hf596005 hp
  by_cases hf598005 : p ≤ 600004
  · exact good_C299 p (Nat.lt_of_not_le hf596005) hf598005 hp
  by_cases hf600005 : p ≤ 602004
  · exact good_C300 p (Nat.lt_of_not_le hf598005) hf600005 hp
  by_cases hf602005 : p ≤ 604004
  · exact good_C301 p (Nat.lt_of_not_le hf600005) hf602005 hp
  by_cases hf604005 : p ≤ 606004
  · exact good_C302 p (Nat.lt_of_not_le hf602005) hf604005 hp
  by_cases hf606005 : p ≤ 608004
  · exact good_C303 p (Nat.lt_of_not_le hf604005) hf606005 hp
  by_cases hf608005 : p ≤ 610004
  · exact good_C304 p (Nat.lt_of_not_le hf606005) hf608005 hp
  by_cases hf610005 : p ≤ 612004
  · exact good_C305 p (Nat.lt_of_not_le hf608005) hf610005 hp
  by_cases hf612005 : p ≤ 614004
  · exact good_C306 p (Nat.lt_of_not_le hf610005) hf612005 hp
  by_cases hf614005 : p ≤ 616004
  · exact good_C307 p (Nat.lt_of_not_le hf612005) hf614005 hp
  by_cases hf616005 : p ≤ 618004
  · exact good_C308 p (Nat.lt_of_not_le hf614005) hf616005 hp
  by_cases hf618005 : p ≤ 620004
  · exact good_C309 p (Nat.lt_of_not_le hf616005) hf618005 hp
  by_cases hf620005 : p ≤ 622004
  · exact good_C310 p (Nat.lt_of_not_le hf618005) hf620005 hp
  by_cases hf622005 : p ≤ 624004
  · exact good_C311 p (Nat.lt_of_not_le hf620005) hf622005 hp
  by_cases hf624005 : p ≤ 626004
  · exact good_C312 p (Nat.lt_of_not_le hf622005) hf624005 hp
  by_cases hf626005 : p ≤ 628004
  · exact good_C313 p (Nat.lt_of_not_le hf624005) hf626005 hp
  by_cases hf628005 : p ≤ 630004
  · exact good_C314 p (Nat.lt_of_not_le hf626005) hf628005 hp
  by_cases hf630005 : p ≤ 632004
  · exact good_C315 p (Nat.lt_of_not_le hf628005) hf630005 hp
  by_cases hf632005 : p ≤ 634004
  · exact good_C316 p (Nat.lt_of_not_le hf630005) hf632005 hp
  by_cases hf634005 : p ≤ 636004
  · exact good_C317 p (Nat.lt_of_not_le hf632005) hf634005 hp
  by_cases hf636005 : p ≤ 638004
  · exact good_C318 p (Nat.lt_of_not_le hf634005) hf636005 hp
  by_cases hf638005 : p ≤ 640004
  · exact good_C319 p (Nat.lt_of_not_le hf636005) hf638005 hp
  by_cases hf640005 : p ≤ 642004
  · exact good_C320 p (Nat.lt_of_not_le hf638005) hf640005 hp
  by_cases hf642005 : p ≤ 644004
  · exact good_C321 p (Nat.lt_of_not_le hf640005) hf642005 hp
  by_cases hf644005 : p ≤ 646004
  · exact good_C322 p (Nat.lt_of_not_le hf642005) hf644005 hp
  by_cases hf646005 : p ≤ 648004
  · exact good_C323 p (Nat.lt_of_not_le hf644005) hf646005 hp
  by_cases hf648005 : p ≤ 650004
  · exact good_C324 p (Nat.lt_of_not_le hf646005) hf648005 hp
  by_cases hf650005 : p ≤ 652004
  · exact good_C325 p (Nat.lt_of_not_le hf648005) hf650005 hp
  by_cases hf652005 : p ≤ 654004
  · exact good_C326 p (Nat.lt_of_not_le hf650005) hf652005 hp
  by_cases hf654005 : p ≤ 656004
  · exact good_C327 p (Nat.lt_of_not_le hf652005) hf654005 hp
  by_cases hf656005 : p ≤ 658004
  · exact good_C328 p (Nat.lt_of_not_le hf654005) hf656005 hp
  by_cases hf658005 : p ≤ 660004
  · exact good_C329 p (Nat.lt_of_not_le hf656005) hf658005 hp
  by_cases hf660005 : p ≤ 662004
  · exact good_C330 p (Nat.lt_of_not_le hf658005) hf660005 hp
  by_cases hf662005 : p ≤ 664004
  · exact good_C331 p (Nat.lt_of_not_le hf660005) hf662005 hp
  by_cases hf664005 : p ≤ 666004
  · exact good_C332 p (Nat.lt_of_not_le hf662005) hf664005 hp
  by_cases hf666005 : p ≤ 668004
  · exact good_C333 p (Nat.lt_of_not_le hf664005) hf666005 hp
  by_cases hf668005 : p ≤ 670004
  · exact good_C334 p (Nat.lt_of_not_le hf666005) hf668005 hp
  by_cases hf670005 : p ≤ 672004
  · exact good_C335 p (Nat.lt_of_not_le hf668005) hf670005 hp
  by_cases hf672005 : p ≤ 674004
  · exact good_C336 p (Nat.lt_of_not_le hf670005) hf672005 hp
  by_cases hf674005 : p ≤ 676004
  · exact good_C337 p (Nat.lt_of_not_le hf672005) hf674005 hp
  by_cases hf676005 : p ≤ 678004
  · exact good_C338 p (Nat.lt_of_not_le hf674005) hf676005 hp
  by_cases hf678005 : p ≤ 680004
  · exact good_C339 p (Nat.lt_of_not_le hf676005) hf678005 hp
  by_cases hf680005 : p ≤ 682004
  · exact good_C340 p (Nat.lt_of_not_le hf678005) hf680005 hp
  by_cases hf682005 : p ≤ 684004
  · exact good_C341 p (Nat.lt_of_not_le hf680005) hf682005 hp
  by_cases hf684005 : p ≤ 686004
  · exact good_C342 p (Nat.lt_of_not_le hf682005) hf684005 hp
  by_cases hf686005 : p ≤ 688004
  · exact good_C343 p (Nat.lt_of_not_le hf684005) hf686005 hp
  by_cases hf688005 : p ≤ 690004
  · exact good_C344 p (Nat.lt_of_not_le hf686005) hf688005 hp
  by_cases hf690005 : p ≤ 692004
  · exact good_C345 p (Nat.lt_of_not_le hf688005) hf690005 hp
  by_cases hf692005 : p ≤ 694004
  · exact good_C346 p (Nat.lt_of_not_le hf690005) hf692005 hp
  by_cases hf694005 : p ≤ 696004
  · exact good_C347 p (Nat.lt_of_not_le hf692005) hf694005 hp
  by_cases hf696005 : p ≤ 698004
  · exact good_C348 p (Nat.lt_of_not_le hf694005) hf696005 hp
  by_cases hf698005 : p ≤ 700004
  · exact good_C349 p (Nat.lt_of_not_le hf696005) hf698005 hp
  by_cases hf700005 : p ≤ 702004
  · exact good_C350 p (Nat.lt_of_not_le hf698005) hf700005 hp
  by_cases hf702005 : p ≤ 704004
  · exact good_C351 p (Nat.lt_of_not_le hf700005) hf702005 hp
  by_cases hf704005 : p ≤ 706004
  · exact good_C352 p (Nat.lt_of_not_le hf702005) hf704005 hp
  by_cases hf706005 : p ≤ 708004
  · exact good_C353 p (Nat.lt_of_not_le hf704005) hf706005 hp
  by_cases hf708005 : p ≤ 710004
  · exact good_C354 p (Nat.lt_of_not_le hf706005) hf708005 hp
  by_cases hf710005 : p ≤ 712004
  · exact good_C355 p (Nat.lt_of_not_le hf708005) hf710005 hp
  by_cases hf712005 : p ≤ 714004
  · exact good_C356 p (Nat.lt_of_not_le hf710005) hf712005 hp
  by_cases hf714005 : p ≤ 716004
  · exact good_C357 p (Nat.lt_of_not_le hf712005) hf714005 hp
  by_cases hf716005 : p ≤ 718004
  · exact good_C358 p (Nat.lt_of_not_le hf714005) hf716005 hp
  by_cases hf718005 : p ≤ 720004
  · exact good_C359 p (Nat.lt_of_not_le hf716005) hf718005 hp
  by_cases hf720005 : p ≤ 722004
  · exact good_C360 p (Nat.lt_of_not_le hf718005) hf720005 hp
  by_cases hf722005 : p ≤ 724004
  · exact good_C361 p (Nat.lt_of_not_le hf720005) hf722005 hp
  by_cases hf724005 : p ≤ 726004
  · exact good_C362 p (Nat.lt_of_not_le hf722005) hf724005 hp
  by_cases hf726005 : p ≤ 728004
  · exact good_C363 p (Nat.lt_of_not_le hf724005) hf726005 hp
  by_cases hf728005 : p ≤ 730004
  · exact good_C364 p (Nat.lt_of_not_le hf726005) hf728005 hp
  by_cases hf730005 : p ≤ 732004
  · exact good_C365 p (Nat.lt_of_not_le hf728005) hf730005 hp
  by_cases hf732005 : p ≤ 734004
  · exact good_C366 p (Nat.lt_of_not_le hf730005) hf732005 hp
  by_cases hf734005 : p ≤ 736004
  · exact good_C367 p (Nat.lt_of_not_le hf732005) hf734005 hp
  by_cases hf736005 : p ≤ 738004
  · exact good_C368 p (Nat.lt_of_not_le hf734005) hf736005 hp
  by_cases hf738005 : p ≤ 740004
  · exact good_C369 p (Nat.lt_of_not_le hf736005) hf738005 hp
  by_cases hf740005 : p ≤ 742004
  · exact good_C370 p (Nat.lt_of_not_le hf738005) hf740005 hp
  by_cases hf742005 : p ≤ 744004
  · exact good_C371 p (Nat.lt_of_not_le hf740005) hf742005 hp
  by_cases hf744005 : p ≤ 746004
  · exact good_C372 p (Nat.lt_of_not_le hf742005) hf744005 hp
  by_cases hf746005 : p ≤ 748004
  · exact good_C373 p (Nat.lt_of_not_le hf744005) hf746005 hp
  by_cases hf748005 : p ≤ 750004
  · exact good_C374 p (Nat.lt_of_not_le hf746005) hf748005 hp
  by_cases hf750005 : p ≤ 752004
  · exact good_C375 p (Nat.lt_of_not_le hf748005) hf750005 hp
  by_cases hf752005 : p ≤ 754004
  · exact good_C376 p (Nat.lt_of_not_le hf750005) hf752005 hp
  by_cases hf754005 : p ≤ 756004
  · exact good_C377 p (Nat.lt_of_not_le hf752005) hf754005 hp
  by_cases hf756005 : p ≤ 758004
  · exact good_C378 p (Nat.lt_of_not_le hf754005) hf756005 hp
  by_cases hf758005 : p ≤ 760004
  · exact good_C379 p (Nat.lt_of_not_le hf756005) hf758005 hp
  by_cases hf760005 : p ≤ 762004
  · exact good_C380 p (Nat.lt_of_not_le hf758005) hf760005 hp
  by_cases hf762005 : p ≤ 764004
  · exact good_C381 p (Nat.lt_of_not_le hf760005) hf762005 hp
  by_cases hf764005 : p ≤ 766004
  · exact good_C382 p (Nat.lt_of_not_le hf762005) hf764005 hp
  by_cases hf766005 : p ≤ 768004
  · exact good_C383 p (Nat.lt_of_not_le hf764005) hf766005 hp
  by_cases hf768005 : p ≤ 770004
  · exact good_C384 p (Nat.lt_of_not_le hf766005) hf768005 hp
  by_cases hf770005 : p ≤ 772004
  · exact good_C385 p (Nat.lt_of_not_le hf768005) hf770005 hp
  by_cases hf772005 : p ≤ 774004
  · exact good_C386 p (Nat.lt_of_not_le hf770005) hf772005 hp
  by_cases hf774005 : p ≤ 776004
  · exact good_C387 p (Nat.lt_of_not_le hf772005) hf774005 hp
  by_cases hf776005 : p ≤ 778004
  · exact good_C388 p (Nat.lt_of_not_le hf774005) hf776005 hp
  by_cases hf778005 : p ≤ 780004
  · exact good_C389 p (Nat.lt_of_not_le hf776005) hf778005 hp
  by_cases hf780005 : p ≤ 782004
  · exact good_C390 p (Nat.lt_of_not_le hf778005) hf780005 hp
  by_cases hf782005 : p ≤ 784004
  · exact good_C391 p (Nat.lt_of_not_le hf780005) hf782005 hp
  by_cases hf784005 : p ≤ 786004
  · exact good_C392 p (Nat.lt_of_not_le hf782005) hf784005 hp
  by_cases hf786005 : p ≤ 788004
  · exact good_C393 p (Nat.lt_of_not_le hf784005) hf786005 hp
  by_cases hf788005 : p ≤ 790004
  · exact good_C394 p (Nat.lt_of_not_le hf786005) hf788005 hp
  by_cases hf790005 : p ≤ 792004
  · exact good_C395 p (Nat.lt_of_not_le hf788005) hf790005 hp
  by_cases hf792005 : p ≤ 794004
  · exact good_C396 p (Nat.lt_of_not_le hf790005) hf792005 hp
  by_cases hf794005 : p ≤ 796004
  · exact good_C397 p (Nat.lt_of_not_le hf792005) hf794005 hp
  by_cases hf796005 : p ≤ 798004
  · exact good_C398 p (Nat.lt_of_not_le hf794005) hf796005 hp
  by_cases hf798005 : p ≤ 800004
  · exact good_C399 p (Nat.lt_of_not_le hf796005) hf798005 hp
  by_cases hf800005 : p ≤ 802004
  · exact good_C400 p (Nat.lt_of_not_le hf798005) hf800005 hp
  by_cases hf802005 : p ≤ 804004
  · exact good_C401 p (Nat.lt_of_not_le hf800005) hf802005 hp
  by_cases hf804005 : p ≤ 806004
  · exact good_C402 p (Nat.lt_of_not_le hf802005) hf804005 hp
  by_cases hf806005 : p ≤ 808004
  · exact good_C403 p (Nat.lt_of_not_le hf804005) hf806005 hp
  by_cases hf808005 : p ≤ 810004
  · exact good_C404 p (Nat.lt_of_not_le hf806005) hf808005 hp
  by_cases hf810005 : p ≤ 812004
  · exact good_C405 p (Nat.lt_of_not_le hf808005) hf810005 hp
  by_cases hf812005 : p ≤ 814004
  · exact good_C406 p (Nat.lt_of_not_le hf810005) hf812005 hp
  by_cases hf814005 : p ≤ 816004
  · exact good_C407 p (Nat.lt_of_not_le hf812005) hf814005 hp
  by_cases hf816005 : p ≤ 818004
  · exact good_C408 p (Nat.lt_of_not_le hf814005) hf816005 hp
  by_cases hf818005 : p ≤ 820004
  · exact good_C409 p (Nat.lt_of_not_le hf816005) hf818005 hp
  by_cases hf820005 : p ≤ 822004
  · exact good_C410 p (Nat.lt_of_not_le hf818005) hf820005 hp
  by_cases hf822005 : p ≤ 824004
  · exact good_C411 p (Nat.lt_of_not_le hf820005) hf822005 hp
  by_cases hf824005 : p ≤ 826004
  · exact good_C412 p (Nat.lt_of_not_le hf822005) hf824005 hp
  by_cases hf826005 : p ≤ 828004
  · exact good_C413 p (Nat.lt_of_not_le hf824005) hf826005 hp
  by_cases hf828005 : p ≤ 830004
  · exact good_C414 p (Nat.lt_of_not_le hf826005) hf828005 hp
  by_cases hf830005 : p ≤ 832004
  · exact good_C415 p (Nat.lt_of_not_le hf828005) hf830005 hp
  by_cases hf832005 : p ≤ 834004
  · exact good_C416 p (Nat.lt_of_not_le hf830005) hf832005 hp
  by_cases hf834005 : p ≤ 836004
  · exact good_C417 p (Nat.lt_of_not_le hf832005) hf834005 hp
  by_cases hf836005 : p ≤ 838004
  · exact good_C418 p (Nat.lt_of_not_le hf834005) hf836005 hp
  by_cases hf838005 : p ≤ 840004
  · exact good_C419 p (Nat.lt_of_not_le hf836005) hf838005 hp
  by_cases hf840005 : p ≤ 842004
  · exact good_C420 p (Nat.lt_of_not_le hf838005) hf840005 hp
  by_cases hf842005 : p ≤ 844004
  · exact good_C421 p (Nat.lt_of_not_le hf840005) hf842005 hp
  by_cases hf844005 : p ≤ 846004
  · exact good_C422 p (Nat.lt_of_not_le hf842005) hf844005 hp
  by_cases hf846005 : p ≤ 848004
  · exact good_C423 p (Nat.lt_of_not_le hf844005) hf846005 hp
  by_cases hf848005 : p ≤ 850004
  · exact good_C424 p (Nat.lt_of_not_le hf846005) hf848005 hp
  by_cases hf850005 : p ≤ 852004
  · exact good_C425 p (Nat.lt_of_not_le hf848005) hf850005 hp
  by_cases hf852005 : p ≤ 854004
  · exact good_C426 p (Nat.lt_of_not_le hf850005) hf852005 hp
  by_cases hf854005 : p ≤ 856004
  · exact good_C427 p (Nat.lt_of_not_le hf852005) hf854005 hp
  by_cases hf856005 : p ≤ 858004
  · exact good_C428 p (Nat.lt_of_not_le hf854005) hf856005 hp
  by_cases hf858005 : p ≤ 860004
  · exact good_C429 p (Nat.lt_of_not_le hf856005) hf858005 hp
  by_cases hf860005 : p ≤ 862004
  · exact good_C430 p (Nat.lt_of_not_le hf858005) hf860005 hp
  by_cases hf862005 : p ≤ 864004
  · exact good_C431 p (Nat.lt_of_not_le hf860005) hf862005 hp
  by_cases hf864005 : p ≤ 866004
  · exact good_C432 p (Nat.lt_of_not_le hf862005) hf864005 hp
  by_cases hf866005 : p ≤ 868004
  · exact good_C433 p (Nat.lt_of_not_le hf864005) hf866005 hp
  by_cases hf868005 : p ≤ 870004
  · exact good_C434 p (Nat.lt_of_not_le hf866005) hf868005 hp
  by_cases hf870005 : p ≤ 872004
  · exact good_C435 p (Nat.lt_of_not_le hf868005) hf870005 hp
  by_cases hf872005 : p ≤ 874004
  · exact good_C436 p (Nat.lt_of_not_le hf870005) hf872005 hp
  by_cases hf874005 : p ≤ 876004
  · exact good_C437 p (Nat.lt_of_not_le hf872005) hf874005 hp
  by_cases hf876005 : p ≤ 878004
  · exact good_C438 p (Nat.lt_of_not_le hf874005) hf876005 hp
  by_cases hf878005 : p ≤ 880004
  · exact good_C439 p (Nat.lt_of_not_le hf876005) hf878005 hp
  by_cases hf880005 : p ≤ 882004
  · exact good_C440 p (Nat.lt_of_not_le hf878005) hf880005 hp
  by_cases hf882005 : p ≤ 884004
  · exact good_C441 p (Nat.lt_of_not_le hf880005) hf882005 hp
  by_cases hf884005 : p ≤ 886004
  · exact good_C442 p (Nat.lt_of_not_le hf882005) hf884005 hp
  by_cases hf886005 : p ≤ 888004
  · exact good_C443 p (Nat.lt_of_not_le hf884005) hf886005 hp
  by_cases hf888005 : p ≤ 890004
  · exact good_C444 p (Nat.lt_of_not_le hf886005) hf888005 hp
  by_cases hf890005 : p ≤ 892004
  · exact good_C445 p (Nat.lt_of_not_le hf888005) hf890005 hp
  by_cases hf892005 : p ≤ 894004
  · exact good_C446 p (Nat.lt_of_not_le hf890005) hf892005 hp
  by_cases hf894005 : p ≤ 896004
  · exact good_C447 p (Nat.lt_of_not_le hf892005) hf894005 hp
  by_cases hf896005 : p ≤ 898004
  · exact good_C448 p (Nat.lt_of_not_le hf894005) hf896005 hp
  by_cases hf898005 : p ≤ 900004
  · exact good_C449 p (Nat.lt_of_not_le hf896005) hf898005 hp
  by_cases hf900005 : p ≤ 902004
  · exact good_C450 p (Nat.lt_of_not_le hf898005) hf900005 hp
  by_cases hf902005 : p ≤ 904004
  · exact good_C451 p (Nat.lt_of_not_le hf900005) hf902005 hp
  by_cases hf904005 : p ≤ 906004
  · exact good_C452 p (Nat.lt_of_not_le hf902005) hf904005 hp
  by_cases hf906005 : p ≤ 908004
  · exact good_C453 p (Nat.lt_of_not_le hf904005) hf906005 hp
  by_cases hf908005 : p ≤ 910004
  · exact good_C454 p (Nat.lt_of_not_le hf906005) hf908005 hp
  by_cases hf910005 : p ≤ 912004
  · exact good_C455 p (Nat.lt_of_not_le hf908005) hf910005 hp
  by_cases hf912005 : p ≤ 914004
  · exact good_C456 p (Nat.lt_of_not_le hf910005) hf912005 hp
  by_cases hf914005 : p ≤ 916004
  · exact good_C457 p (Nat.lt_of_not_le hf912005) hf914005 hp
  by_cases hf916005 : p ≤ 918004
  · exact good_C458 p (Nat.lt_of_not_le hf914005) hf916005 hp
  by_cases hf918005 : p ≤ 920004
  · exact good_C459 p (Nat.lt_of_not_le hf916005) hf918005 hp
  by_cases hf920005 : p ≤ 922004
  · exact good_C460 p (Nat.lt_of_not_le hf918005) hf920005 hp
  by_cases hf922005 : p ≤ 924004
  · exact good_C461 p (Nat.lt_of_not_le hf920005) hf922005 hp
  by_cases hf924005 : p ≤ 926004
  · exact good_C462 p (Nat.lt_of_not_le hf922005) hf924005 hp
  by_cases hf926005 : p ≤ 928004
  · exact good_C463 p (Nat.lt_of_not_le hf924005) hf926005 hp
  by_cases hf928005 : p ≤ 930004
  · exact good_C464 p (Nat.lt_of_not_le hf926005) hf928005 hp
  by_cases hf930005 : p ≤ 932004
  · exact good_C465 p (Nat.lt_of_not_le hf928005) hf930005 hp
  by_cases hf932005 : p ≤ 934004
  · exact good_C466 p (Nat.lt_of_not_le hf930005) hf932005 hp
  by_cases hf934005 : p ≤ 936004
  · exact good_C467 p (Nat.lt_of_not_le hf932005) hf934005 hp
  by_cases hf936005 : p ≤ 938004
  · exact good_C468 p (Nat.lt_of_not_le hf934005) hf936005 hp
  by_cases hf938005 : p ≤ 940004
  · exact good_C469 p (Nat.lt_of_not_le hf936005) hf938005 hp
  by_cases hf940005 : p ≤ 942004
  · exact good_C470 p (Nat.lt_of_not_le hf938005) hf940005 hp
  by_cases hf942005 : p ≤ 944004
  · exact good_C471 p (Nat.lt_of_not_le hf940005) hf942005 hp
  by_cases hf944005 : p ≤ 946004
  · exact good_C472 p (Nat.lt_of_not_le hf942005) hf944005 hp
  by_cases hf946005 : p ≤ 948004
  · exact good_C473 p (Nat.lt_of_not_le hf944005) hf946005 hp
  by_cases hf948005 : p ≤ 950004
  · exact good_C474 p (Nat.lt_of_not_le hf946005) hf948005 hp
  by_cases hf950005 : p ≤ 952004
  · exact good_C475 p (Nat.lt_of_not_le hf948005) hf950005 hp
  by_cases hf952005 : p ≤ 954004
  · exact good_C476 p (Nat.lt_of_not_le hf950005) hf952005 hp
  by_cases hf954005 : p ≤ 956004
  · exact good_C477 p (Nat.lt_of_not_le hf952005) hf954005 hp
  by_cases hf956005 : p ≤ 958004
  · exact good_C478 p (Nat.lt_of_not_le hf954005) hf956005 hp
  by_cases hf958005 : p ≤ 960004
  · exact good_C479 p (Nat.lt_of_not_le hf956005) hf958005 hp
  by_cases hf960005 : p ≤ 962004
  · exact good_C480 p (Nat.lt_of_not_le hf958005) hf960005 hp
  by_cases hf962005 : p ≤ 964004
  · exact good_C481 p (Nat.lt_of_not_le hf960005) hf962005 hp
  by_cases hf964005 : p ≤ 966004
  · exact good_C482 p (Nat.lt_of_not_le hf962005) hf964005 hp
  by_cases hf966005 : p ≤ 968004
  · exact good_C483 p (Nat.lt_of_not_le hf964005) hf966005 hp
  by_cases hf968005 : p ≤ 970004
  · exact good_C484 p (Nat.lt_of_not_le hf966005) hf968005 hp
  by_cases hf970005 : p ≤ 972004
  · exact good_C485 p (Nat.lt_of_not_le hf968005) hf970005 hp
  by_cases hf972005 : p ≤ 974004
  · exact good_C486 p (Nat.lt_of_not_le hf970005) hf972005 hp
  by_cases hf974005 : p ≤ 976004
  · exact good_C487 p (Nat.lt_of_not_le hf972005) hf974005 hp
  by_cases hf976005 : p ≤ 978004
  · exact good_C488 p (Nat.lt_of_not_le hf974005) hf976005 hp
  by_cases hf978005 : p ≤ 980004
  · exact good_C489 p (Nat.lt_of_not_le hf976005) hf978005 hp
  by_cases hf980005 : p ≤ 982004
  · exact good_C490 p (Nat.lt_of_not_le hf978005) hf980005 hp
  by_cases hf982005 : p ≤ 984004
  · exact good_C491 p (Nat.lt_of_not_le hf980005) hf982005 hp
  by_cases hf984005 : p ≤ 986004
  · exact good_C492 p (Nat.lt_of_not_le hf982005) hf984005 hp
  by_cases hf986005 : p ≤ 988004
  · exact good_C493 p (Nat.lt_of_not_le hf984005) hf986005 hp
  by_cases hf988005 : p ≤ 990004
  · exact good_C494 p (Nat.lt_of_not_le hf986005) hf988005 hp
  by_cases hf990005 : p ≤ 992004
  · exact good_C495 p (Nat.lt_of_not_le hf988005) hf990005 hp
  by_cases hf992005 : p ≤ 994004
  · exact good_C496 p (Nat.lt_of_not_le hf990005) hf992005 hp
  by_cases hf994005 : p ≤ 996004
  · exact good_C497 p (Nat.lt_of_not_le hf992005) hf994005 hp
  by_cases hf996005 : p ≤ 998004
  · exact good_C498 p (Nat.lt_of_not_le hf994005) hf996005 hp
  exact good_C499 p (Nat.lt_of_not_le hf996005) hB hp

end H2K

end P2qJumps
