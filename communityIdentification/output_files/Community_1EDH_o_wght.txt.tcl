mol representation NewCartoon 0.300000 6.000000 4.100000 0
mol color ColorID 0
mol selection {residue 0 1 2 3 4 5 6 7 8 10 12 13 14 15 16 17 18 19 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 56 57 58 59 60 61 63 69 70 71 72 73 74 75 76 87 88 89 90 91 92 93 94 95 96 }
mol material Opaque
mol addrep top
mol representation NewCartoon 0.300000 6.000000 4.100000 0
mol color ColorID 1
mol selection {residue 315 316 317 318 319 320 321 322 323 334 336 337 338 339 340 341 356 357 358 359 360 372 373 374 376 377 378 379 380 396 397 398 399 400 411 412 413 414 415 416 }
mol material Opaque
mol addrep top
mol representation NewCartoon 0.300000 6.000000 4.100000 0
mol color ColorID 2
mol selection {residue 211 212 213 214 215 216 217 221 223 224 225 226 227 228 229 230 232 245 246 247 248 249 250 251 252 253 254 255 256 257 258 259 260 261 267 268 269 270 271 272 274 280 281 282 283 284 285 286 287 298 299 300 301 302 303 304 305 306 }
mol material Opaque
mol addrep top
mol representation NewCartoon 0.300000 6.000000 4.100000 0
mol color ColorID 3
mol selection {residue 9 11 196 218 219 220 273 275 276 277 278 279 307 308 309 310 311 312 313 314 342 343 344 345 346 347 348 349 350 351 352 353 354 355 375 401 402 403 404 405 406 407 408 409 410 }
mol material Opaque
mol addrep top
mol representation NewCartoon 0.300000 6.000000 4.100000 0
mol color ColorID 4
mol selection {residue 65 97 99 101 102 103 104 106 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 146 148 164 189 190 191 192 193 194 195 197 198 199 200 201 222 }
mol material Opaque
mol addrep top
mol representation NewCartoon 0.300000 6.000000 4.100000 0
mol color ColorID 5
mol selection {residue 105 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 145 147 149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 202 203 204 205 206 207 208 209 210 }
mol material Opaque
mol addrep top
mol representation NewCartoon 0.300000 6.000000 4.100000 0
mol color ColorID 6
mol selection {residue 20 21 22 23 24 25 26 27 28 29 30 31 32 33 50 51 52 53 54 55 77 78 79 80 81 82 83 84 85 86 }
mol material Opaque
mol addrep top
mol representation NewCartoon 0.300000 6.000000 4.100000 0
mol color ColorID 7
mol selection {residue 231 233 234 235 236 237 238 239 240 241 242 243 244 262 263 264 265 266 288 289 290 291 292 293 294 295 296 297 }
mol material Opaque
mol addrep top
mol representation NewCartoon 0.300000 6.000000 4.100000 0
mol color ColorID 8
mol selection {residue 62 64 66 67 68 98 100 }
mol material Opaque
mol addrep top
mol representation NewCartoon 0.300000 6.000000 4.100000 0
mol color ColorID 9
mol selection {residue 324 325 326 327 328 329 330 331 332 333 335 361 362 363 364 365 366 367 368 369 370 371 381 382 383 384 385 386 387 388 389 390 391 392 393 394 395 417 418 419 420 421 }
mol material Opaque
mol addrep top
graphics top color black
mol representation VDW 1.000000 8.000000
mol color ColorID 0
mol selection {residue 2 and name CA P}
mol material Opaque
mol addrep top
mol representation VDW 1.000000 8.000000
mol color ColorID 2
mol selection {residue 230 and name CA P}
mol material Opaque
mol addrep top
set sel1 [atomselect top "residue 2 and name CA P"]
set sel2 [atomselect top "residue 230 and name CA P"]
set coord1 [lindex [$sel1 get {x y z}] 0]
set coord2 [lindex [$sel2 get {x y z}] 0]
graphics top cylinder $coord1 $coord2 radius 0.035996
$sel1 delete
$sel2 delete
mol representation VDW 1.000000 8.000000
mol color ColorID 3
mol selection {residue 11 and name CA P}
mol material Opaque
mol addrep top
mol representation VDW 1.000000 8.000000
mol color ColorID 0
mol selection {residue 13 and name CA P}
mol material Opaque
mol addrep top
set sel1 [atomselect top "residue 11 and name CA P"]
set sel2 [atomselect top "residue 13 and name CA P"]
set coord1 [lindex [$sel1 get {x y z}] 0]
set coord2 [lindex [$sel2 get {x y z}] 0]
graphics top cylinder $coord1 $coord2 radius 0.493376
$sel1 delete
$sel2 delete
mol representation VDW 1.000000 8.000000
mol color ColorID 0
mol selection {residue 8 and name CA P}
mol material Opaque
mol addrep top
mol representation VDW 1.000000 8.000000
mol color ColorID 4
mol selection {residue 97 and name CA P}
mol material Opaque
mol addrep top
set sel1 [atomselect top "residue 8 and name CA P"]
set sel2 [atomselect top "residue 97 and name CA P"]
set coord1 [lindex [$sel1 get {x y z}] 0]
set coord2 [lindex [$sel2 get {x y z}] 0]
graphics top cylinder $coord1 $coord2 radius 0.225619
$sel1 delete
$sel2 delete
mol representation VDW 1.000000 8.000000
mol color ColorID 6
mol selection {residue 50 and name CA P}
mol material Opaque
mol addrep top
mol representation VDW 1.000000 8.000000
mol color ColorID 0
mol selection {residue 57 and name CA P}
mol material Opaque
mol addrep top
set sel1 [atomselect top "residue 50 and name CA P"]
set sel2 [atomselect top "residue 57 and name CA P"]
set coord1 [lindex [$sel1 get {x y z}] 0]
set coord2 [lindex [$sel2 get {x y z}] 0]
graphics top cylinder $coord1 $coord2 radius 0.395282
$sel1 delete
$sel2 delete
mol representation VDW 1.000000 8.000000
mol color ColorID 0
mol selection {residue 8 and name CA P}
mol material Opaque
mol addrep top
mol representation VDW 1.000000 8.000000
mol color ColorID 8
mol selection {residue 98 and name CA P}
mol material Opaque
mol addrep top
set sel1 [atomselect top "residue 8 and name CA P"]
set sel2 [atomselect top "residue 98 and name CA P"]
set coord1 [lindex [$sel1 get {x y z}] 0]
set coord2 [lindex [$sel2 get {x y z}] 0]
graphics top cylinder $coord1 $coord2 radius 0.153737
$sel1 delete
$sel2 delete
mol representation VDW 1.000000 8.000000
mol color ColorID 8
mol selection {residue 68 and name CA P}
mol material Opaque
mol addrep top
mol representation VDW 1.000000 8.000000
mol color ColorID 0
mol selection {residue 70 and name CA P}
mol material Opaque
mol addrep top
set sel1 [atomselect top "residue 68 and name CA P"]
set sel2 [atomselect top "residue 70 and name CA P"]
set coord1 [lindex [$sel1 get {x y z}] 0]
set coord2 [lindex [$sel2 get {x y z}] 0]
graphics top cylinder $coord1 $coord2 radius 0.153737
$sel1 delete
$sel2 delete
mol representation VDW 1.000000 8.000000
mol color ColorID 8
mol selection {residue 68 and name CA P}
mol material Opaque
mol addrep top
mol representation VDW 1.000000 8.000000
mol color ColorID 0
mol selection {residue 71 and name CA P}
mol material Opaque
mol addrep top
set sel1 [atomselect top "residue 68 and name CA P"]
set sel2 [atomselect top "residue 71 and name CA P"]
set coord1 [lindex [$sel1 get {x y z}] 0]
set coord2 [lindex [$sel2 get {x y z}] 0]
graphics top cylinder $coord1 $coord2 radius 0.153737
$sel1 delete
$sel2 delete
mol representation VDW 1.000000 8.000000
mol color ColorID 1
mol selection {residue 373 and name CA P}
mol material Opaque
mol addrep top
mol representation VDW 1.000000 8.000000
mol color ColorID 3
mol selection {residue 375 and name CA P}
mol material Opaque
mol addrep top
set sel1 [atomselect top "residue 373 and name CA P"]
set sel2 [atomselect top "residue 375 and name CA P"]
set coord1 [lindex [$sel1 get {x y z}] 0]
set coord2 [lindex [$sel2 get {x y z}] 0]
graphics top cylinder $coord1 $coord2 radius 0.789593
$sel1 delete
$sel2 delete
mol representation VDW 1.000000 8.000000
mol color ColorID 9
mol selection {residue 335 and name CA P}
mol material Opaque
mol addrep top
mol representation VDW 1.000000 8.000000
mol color ColorID 1
mol selection {residue 380 and name CA P}
mol material Opaque
mol addrep top
set sel1 [atomselect top "residue 335 and name CA P"]
set sel2 [atomselect top "residue 380 and name CA P"]
set coord1 [lindex [$sel1 get {x y z}] 0]
set coord2 [lindex [$sel2 get {x y z}] 0]
graphics top cylinder $coord1 $coord2 radius 0.314542
$sel1 delete
$sel2 delete
mol representation VDW 1.000000 8.000000
mol color ColorID 3
mol selection {residue 220 and name CA P}
mol material Opaque
mol addrep top
mol representation VDW 1.000000 8.000000
mol color ColorID 2
mol selection {residue 274 and name CA P}
mol material Opaque
mol addrep top
set sel1 [atomselect top "residue 220 and name CA P"]
set sel2 [atomselect top "residue 274 and name CA P"]
set coord1 [lindex [$sel1 get {x y z}] 0]
set coord2 [lindex [$sel2 get {x y z}] 0]
graphics top cylinder $coord1 $coord2 radius 0.689177
$sel1 delete
$sel2 delete
mol representation VDW 1.000000 8.000000
mol color ColorID 3
mol selection {residue 279 and name CA P}
mol material Opaque
mol addrep top
mol representation VDW 1.000000 8.000000
mol color ColorID 2
mol selection {residue 282 and name CA P}
mol material Opaque
mol addrep top
set sel1 [atomselect top "residue 279 and name CA P"]
set sel2 [atomselect top "residue 282 and name CA P"]
set coord1 [lindex [$sel1 get {x y z}] 0]
set coord2 [lindex [$sel2 get {x y z}] 0]
graphics top cylinder $coord1 $coord2 radius 0.689177
$sel1 delete
$sel2 delete
mol representation VDW 1.000000 8.000000
mol color ColorID 4
mol selection {residue 137 and name CA P}
mol material Opaque
mol addrep top
mol representation VDW 1.000000 8.000000
mol color ColorID 2
mol selection {residue 221 and name CA P}
mol material Opaque
mol addrep top
set sel1 [atomselect top "residue 137 and name CA P"]
set sel2 [atomselect top "residue 221 and name CA P"]
set coord1 [lindex [$sel1 get {x y z}] 0]
set coord2 [lindex [$sel2 get {x y z}] 0]
graphics top cylinder $coord1 $coord2 radius 0.037748
$sel1 delete
$sel2 delete
mol representation VDW 1.000000 8.000000
mol color ColorID 2
mol selection {residue 287 and name CA P}
mol material Opaque
mol addrep top
mol representation VDW 1.000000 8.000000
mol color ColorID 7
mol selection {residue 289 and name CA P}
mol material Opaque
mol addrep top
set sel1 [atomselect top "residue 287 and name CA P"]
set sel2 [atomselect top "residue 289 and name CA P"]
set coord1 [lindex [$sel1 get {x y z}] 0]
set coord2 [lindex [$sel2 get {x y z}] 0]
graphics top cylinder $coord1 $coord2 radius 0.393898
$sel1 delete
$sel2 delete
mol representation VDW 1.000000 8.000000
mol color ColorID 4
mol selection {residue 139 and name CA P}
mol material Opaque
mol addrep top
mol representation VDW 1.000000 8.000000
mol color ColorID 3
mol selection {residue 220 and name CA P}
mol material Opaque
mol addrep top
set sel1 [atomselect top "residue 139 and name CA P"]
set sel2 [atomselect top "residue 220 and name CA P"]
set coord1 [lindex [$sel1 get {x y z}] 0]
set coord2 [lindex [$sel2 get {x y z}] 0]
graphics top cylinder $coord1 $coord2 radius 0.596135
$sel1 delete
$sel2 delete
mol representation VDW 1.000000 8.000000
mol color ColorID 8
mol selection {residue 98 and name CA P}
mol material Opaque
mol addrep top
mol representation VDW 1.000000 8.000000
mol color ColorID 3
mol selection {residue 351 and name CA P}
mol material Opaque
mol addrep top
set sel1 [atomselect top "residue 98 and name CA P"]
set sel2 [atomselect top "residue 351 and name CA P"]
set coord1 [lindex [$sel1 get {x y z}] 0]
set coord2 [lindex [$sel2 get {x y z}] 0]
graphics top cylinder $coord1 $coord2 radius 0.091283
$sel1 delete
$sel2 delete
mol representation VDW 1.000000 8.000000
mol color ColorID 5
mol selection {residue 162 and name CA P}
mol material Opaque
mol addrep top
mol representation VDW 1.000000 8.000000
mol color ColorID 4
mol selection {residue 164 and name CA P}
mol material Opaque
mol addrep top
set sel1 [atomselect top "residue 162 and name CA P"]
set sel2 [atomselect top "residue 164 and name CA P"]
set coord1 [lindex [$sel1 get {x y z}] 0]
set coord2 [lindex [$sel2 get {x y z}] 0]
graphics top cylinder $coord1 $coord2 radius 1.000000
$sel1 delete
$sel2 delete
mol representation VDW 1.000000 8.000000
mol color ColorID 8
mol selection {residue 66 and name CA P}
mol material Opaque
mol addrep top
mol representation VDW 1.000000 8.000000
mol color ColorID 4
mol selection {residue 133 and name CA P}
mol material Opaque
mol addrep top
set sel1 [atomselect top "residue 66 and name CA P"]
set sel2 [atomselect top "residue 133 and name CA P"]
set coord1 [lindex [$sel1 get {x y z}] 0]
set coord2 [lindex [$sel2 get {x y z}] 0]
graphics top cylinder $coord1 $coord2 radius 0.218576
$sel1 delete
$sel2 delete
