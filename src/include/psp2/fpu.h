/**
 * \file
 * \brief Header file which defines FPU functions
 *
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef _PSP2_FPU_
#define _PSP2_FPU_

/* prototypes */

float sceFpuLog2f(float x);
float sceFpuSinf(float x);
float sceFpuExp10f(float x);
float sceFpuAsinf(float x);
float sceFpuAtanf(float x);
float sceFpuAcosf(float x);
float sceFpuTanf(float x);
float sceFpuLogf(float x);
float sceFpuExp2f(float x);
float sceFpuLog10f(float x);
float sceFpuAtan2f(float y, float x);
float sceFpuCosf(float x);
float sceFpuPowf(float base, float exponent);
float sceFpuExpf(float x);

#endif
