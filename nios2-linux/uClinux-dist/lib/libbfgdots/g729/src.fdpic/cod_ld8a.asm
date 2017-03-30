/*****************************************************************************
Developed by Analog Devices Australia - Unit 3, 97 Lewis Road,
Wantirna, Victoria, Australia, 3152.  Email: ada.info@analog.com

Analog Devices, Inc.
BSD-Style License

libgdots
Copyright (c) 2007 Analog Devices, Inc.

All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:
  - Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
  - Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in
    the documentation and/or other materials provided with the
    distribution.
  - Neither the name of Analog Devices, Inc. nor the names of its
    contributors may be used to endorse or promote products derived
    from this software without specific prior written permission.
  - The use of this software may or may not infringe the patent rights
    of one or more patent holders.  This license does not release you
    from the requirement that you obtain separate licenses from these
    patent holders to use this software.

THIS SOFTWARE IS PROVIDED BY ANALOG DEVICES "AS IS" AND ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, NON-INFRINGEMENT,
MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL ANALOG DEVICES BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
BUT NOT LIMITED TO, INTELLECTUAL PROPERTY RIGHTS, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE
******************************************************************************
$RCSfile: Cod_ld8a.asm,v $
$Revision: 1.4 $
$Date: 2006/05/24 07:46:54 $

Project:		G.729AB for Blackfin
Title:			Cod_ld8a
Author(s):		wuxiangzhi,
Revised by:		E. HSU

Description     :      Main coder function 

Prototype       :      	_Coder_ld8a()						
						_Corr_xy2()
						_Residu()
						_Syn_filt()

******************************************************************************
Tab Setting:			4
Target Processor:		ADSP-21535
Target Tools Revision:	2.2.2.0
******************************************************************************

Modification History:
====================
$Log: Cod_ld8a.asm,v $
Revision 1.4  2006/05/24 07:46:54  adamliyi
Fixed the failing case for g729ab decoder for tstseq6. The issue is the uClinux GAS bug: it cannot treat the (m) option correctly.

Revision 1.4  2004/01/27 23:40:21Z  ehsu
Revision 1.3  2004/01/23 00:39:42Z  ehsu
Revision 1.2  2004/01/13 01:33:39Z  ehsu
Revision 1.1  2003/12/01 00:12:11Z  ehsu
Initial revision

Version         Date            Authors        		  Comments
0.0         11/01/2002          wuxiangzhi            Original

*******************************************************************************/ 
           
.extern L_exc_err;        
.extern _ACELP_Code_A;    
.extern _Autocorr;        
.extern _Az_lsp;          
.extern _Cod_cng;         
.extern _Enc_lag3;        
.extern _G_pitch;         
.extern _Int_qlpc;        
.extern _Levinson;        
.extern _Lsp_lsf;         
.extern _Pitch_fr3_fast;  
.extern _Pitch_ol_fast;   
.extern _Qua_gain;        
.extern _Qua_lsp;         
.extern _Update_cng;      
.extern _Weight_Az;       
.extern __update_exc_err; 
.extern _vad;             
.extern count_frame;      
.extern exc;              
.extern exc_1;            
.extern lag;              
.extern lsp_new;          
.extern lsp_new_q;        
.extern lsp_old;          
.extern lsp_old_q;        
.extern mem_w;            
.extern mem_w0;           
.extern mem_zero;         
.extern new_speech;       
.extern old_exc;          
.extern old_exc_1;        
.extern old_speech;       
.extern old_speech_1;     
.extern old_wsp;          
.extern old_wsp_1;        
.extern pastVad_flag;     
.extern rri0i0;           
.extern seed;             
.extern sharp;            
.extern speech;           
.extern tab_zone;         
.extern wsp;              
.extern wsp_1;            
       

.text;

.align 8;
_OSyn_filt:
	  .global _OSyn_filt;
      .type  _OSyn_filt,STT_FUNC;	  
	  	P4 = B3;
	  	P2 = B1;                
	  	I2 = B2;
	  	I0 = B0;	      
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+rri0i0@GOT17M4];
	I3 = R0
	P3 = [SP++];
	R0 = [SP++];
	  	P0 = 40;
	  	P1 = 10;
	  	R2 = 1;
	  	R2.H = R2.L << 14 || R6 = W[P4++](Z);	  	
	  	LSETUP(OSyn_filt1,OSyn_filt1) LC0 = P1;
OSyn_filt1: MNOP || W[I3++] = R6.L || R6 = W[P4++](Z);	  	
	  	I1 = I3;	  	 
	  	R3 = R0-|-R0 || R4 = [I0++] || R5 = [P2++];	         
	  	M0 = -20;			
		ASTAT = R3;				
	    I1 -= 4;      	 	      
	    A0 = R5.L * R4.L,A1 = R5.H * R4.L ||	 R6 = [I1] || I1 -= 2;
		A0 -= R6.H * R4.H || R4 = [I0++] ;   
		A1 -= R6.H * R4.L , A0 -= R6.L * R4.L || R6.H = W[I1--];         
	  	LOOP OSyn_filt2 LC0 = P0>>1;
	  	LOOP_BEGIN OSyn_filt2;	  		           	      	    		 	
		 	A1 -= R6.L * R4.H, A0 -= R6.H * R4.H || R4 = [I0++] || R6.L = W[I1--];  
			A1 -= R6.H * R4.L, A0 -= R6.L * R4.L || R6.H = W[I1--];         
		 	A1 -= R6.L * R4.H, A0 -= R6.H * R4.H || R4 = [I0++] || R6.L = W[I1--];  
			A1 -= R6.H * R4.L, A0 -= R6.L * R4.L || R6.H = W[I1--];         
			A1 -= R6.L * R4.H, A0 -= R6.H * R4.H || R4 = [I0++] || R6.L = W[I1--];  
			A1 -= R6.H * R4.L, A0 -= R6.L * R4.L || R6.H = W[I1--];         
		 	A1 -= R6.L * R4.H, A0 -= R6.H * R4.H || R4 = [I0++M0] || R6.L = W[I1--];       
          	A1 -= R6.H * R4.L, A0 -= R6.L * R4.L || R4 = [I0++] || I1 -= M0;          	
          	A0 = A0 << 3 ;
          	R6.L = (A0+=R2.H*R2.L)(T) || R5 = [P2++];         
			NOP;
          	A1 -= R6.L * R4.H || W[I2++] = R6.L ;	      	 	      			
		  	A1 = A1 << 3 || W[I3++] = R6.L;		  
          	R3.H = (A1+=R2.H*R2.L)(T) || R6.H = W[I1--];
          	W[I2++] = R3.H ||  A0  = R5.L * R4.L, A1 = R5.H * R4.L|| R4.L = W[I0++];
		  	A1 -= R3.H * R4.L ,A0 -= R3.H * R4.H || R4.H = W[I0++];	      
		  	W[I3++] = R3.H || A0 -= R6.L * R4.L ;         
	  	LOOP_END OSyn_filt2;
/*	  	
      	CC = BITTST(R7,0);
	  	IF !CC JUMP OSyn_filtEND;
	    P4 = B2;
		I0 = B3;
		P4 += 60;		
		R6 = W[P4++](Z);
		LSETUP(OSyn_filt4,OSyn_filt4) LC0 = P1;
OSyn_filt4: MNOP || W[I0++] = R6.L || R6 = W[P4++](Z);
OSyn_filtEND:
*/
	   RTS;		   
.text;
	   
.align 8;
_Coder_ld8a:
	  .global _Coder_ld8a;
      .type  _Coder_ld8a,STT_FUNC;
	  LINK 128 + 48 + 80 + 80 + 240;
	  [FP-4] = R0;   // ADDRESS OF ana
	  [FP-24] = R1;   // VAD ENABLE OR DISABLE
	  // [FP-8]    HIGH T0_max LOW T0_min
	  // [FP-12]   BIT 0 i_subfr  BIT 1 IS taming
	  // [FP-16]   HIGH T0_frac LOW T0
	  // [FP-20]   gain_pit
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+old_speech@GOT17M4];
	B0 = R0
	P3 = [SP++];
	R0 = [SP++];
	  P5 = 392;
	  P5 = P5 + SP;
	  B1 = P5;
	  CALL _Autocorr;	  	    
	  I1 = B1;
	  B0 = B1;
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+lag@GOT17M4];
	I2 = R0
	P3 = [SP++];
	R0 = [SP++];
	  P0 = 11;
	  I0 = SP;
	  R7 = 1;
	  MNOP || R6 = [I1++] || [FP-20] = R3;   
	  I3 = I1;		  		  
	  MNOP || R5 = [I2++] || R4 = [I1++];
	  R2.L = R5.H * R4.L, R2.H = R5.L * R4.H (T) || W[I0++] = R6.H;	  			
	  LOOP Coder_ld8a_1 LC0 = P0;
	  LOOP_BEGIN Coder_ld8a_1;
	  		A0 = R5.H * R4.H || W[I0++] = R4.H;
	  		A0 += R2.L * R7.L,A1 = R2.H * R7.L || R5 = [I2++] || R4 = [I1++];
	  		R0 = A0+A1, R1 = A0-A1;		  
	  		R0.L = R0.L >> 1;
	      	R2.L = R5.H * R4.L, R2.H = R5.L * R4.H (T) || [I3++] = R0;	      
	  LOOP_END Coder_ld8a_1;	  	  		  	  	
		M1 = 60;
	  	M0 = 44;
	  	I2 = SP;
	  	R0.L = R0.L >> 1 || I2 += M0;
	  	B2 = I2;
	  	[I3++] = R0 || I2 += M1;
	  	B1 = I2;
	  	CALL _Levinson;	  
	  	B0 = B1;
	  	P0 = 64;
	  	P0 = SP + P0;
	  	B1 = P0;
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+lsp_old@GOT17M4];
	B2 = R0
	P3 = [SP++];
	R0 = [SP++];
	  	CALL _Az_lsp;
	  	I0 = B1;
	  	I1 = SP;
	  	M0 = 24;
	  	I1 += M0;
	  	B1 = I1;
	  	P0 = 10;
	  	CALL _Lsp_lsf;      
	  	M0 = 44;
	  	I0 = SP;
	  	I0 += M0;		
		P5 = 392;
	  	P5 = P5 + SP;
	  	B2 = P5;
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+count_frame@GOT17M4];
	P5 = R0
	P3 = [SP++];
	R0 = [SP++];
	  	MNOP || R0 = [FP-20] || R7.L = W[I0++];
	  	R1 = W[P5](Z);     // FRAME COUNTER
	  	B0 = I0;
	  	CALL _vad;			  	  	   	    	 	  
	  	R7 = [FP-20];  
	  	I3 = SP;
	  	CALL _Update_cng;
	  	R0 = [FP-24];    //VAD ENABLE FLAG  	 	 		
	  	CC = R0 == 0;
	  	IF CC JUMP Coder_ld8a_Main;
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+pastVad_flag@GOT17M4];
	I0 = R0
	P3 = [SP++];
	R0 = [SP++];
	  	R7.L = W[I0];
	  	CC = BITTST(R7,4);	 	  	  	  	  
		IF CC JUMP Coder_ld8a_Main;	 	  
	  	R0 = [FP-4];
	    R2 = B2;
	    R1 = R2;
	    R1 += 56;
	  	CALL _Cod_cng;
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+pastVad_flag@GOT17M4];
	I3 = R0
	P3 = [SP++];
	R0 = [SP++];
	// BIT 0 = pastVad BIT 1 = ppastVad BIT 2 = flag BIT 3 =  v_flag
	  		R0.L = W[I3];
	  		CC = BITTST(R0,0);
	  		R1 = CC;
      		BITCLR(R0,0);
			R1 = R1 << 1;
			R1 = R0 | R1;
        	W[I3] = R1.L || R0 = R1 -|- R1;
			[FP-24] = R0;    // i_subfr
Coder_ld8B1:
         	R0 = [FP-24];    // i_subfr
         	P4 = 448;
         	P5 = 472;         	
         	I3 = SP;
			M0 = 152;			
		 	R6 = ROT R0 BY -1 || I3 += M0;
		 	B1 = I3;
		 	IF CC P4 = P5;
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+speech@GOT17M4];
	R6 = R0
	P3 = [SP++];
	R0 = [SP++];
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+new_speech@GOT17M4];
	R7 = R0
	P3 = [SP++];
	R0 = [SP++];
		 	IF CC R6 = R7;
			I2 = R6;
			P4 = P4 + SP;
	  		B0 = P4;	  					
			P0 = 40;
			CALL _Residu;
			I0 = B0;
            R7.H = 24576;
			P0 = 10;
			I1 = SP;//Ap_t_0 = SP+104
			M0 = 104;
			I1 += M0;
			B3 = I1;
			CALL _Weight_Az;
			R3.L = 4096;
			R7.L = 22938;
			I0 = B3;
			M1 = 128;//Ap_t_1 = SP+128
			I2 = SP;			
			P0 = 5;
			MNOP || R6.L = W[I0++] || R2 = [FP-24];
			I1 = I0;
			R5 = R6.L * R7.L || R4.L = W[I1++];
			R3.H = R4.L - R5.H(S) || R6.H = W[I0++] || I2 += M1;
			B0 = I2;
			R0 = ROT R2 BY -1 || [I2++] = R3 || R6.L = W[I0++];
			LOOP Coder_ld8B5 LC0 = P0;
			LOOP_BEGIN Coder_ld8B5;
			    R3.L = R6.H * R7.L, R3.H = R6.L * R7.L (T) || R6.H = W[I0++] || R4 = [I1++];
				R0 = R4 -|- R3(S) || R6.L = W[I0++];
			    [I2++] = R0;
			LOOP_END Coder_ld8B5;
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+wsp_1@GOT17M4];
	R7 = R0
	P3 = [SP++];
	R0 = [SP++];
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+wsp@GOT17M4];
	R6 = R0
	P3 = [SP++];
	R0 = [SP++];
			IF CC R6 = R7;
			B2 = R6;
//			P0 = 40;
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+mem_w@GOT17M4];
	B3 = R0
	P3 = [SP++];
	R0 = [SP++];
//			R7 = 1;
			CALL _Syn_filt;
			R0 = [FP-24];    // i_subfr
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+exc_1@GOT17M4];
	R6 = R0
	P3 = [SP++];
	R0 = [SP++];
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+exc@GOT17M4];
	R5 = R0
	P3 = [SP++];
	R0 = [SP++];
			R7 = ROT R0 BY -1;
			IF CC R5 = R6;
			I0 = R5;
			P0 = 40;
			I1 = B1;
			I2 = B1;
			MNOP || R7 = [I1++] || R6 = [I0++];
			LOOP Coder_ld8B9 LC0 = P0 >> 1;
			LOOP_BEGIN Coder_ld8B9;
			     R5 = R7 -|- R6(S) || R7 = [I1++] || R6 = [I0++];
				 [I2++] = R5;
			LOOP_END Coder_ld8B9;
			P1 = 104;//Ap_t_0 = SP+104
			P1 = P1 + SP;
			B0 = P1;
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+mem_w0@GOT17M4];
	B3 = R0
	P3 = [SP++];
	R0 = [SP++];
//			R7 = 1;
			B2 = B1;
			CALL _Syn_filt;
			R0 = [FP-24];
			R7 = ROT R0 BY -1;
			BITSET(R0,0);
			[FP-24] = R0;
			IF !CC JUMP Coder_ld8B1;
Coder_ld8B91:
            R7 = 3277;
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+sharp@GOT17M4];
	I0 = R0
	P3 = [SP++];
	R0 = [SP++];
			W[I0] = R7.L;
			JUMP Coder_ld8aLOOPEND;
Coder_ld8a_Main:
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+pastVad_flag@GOT17M4];
	I1 = R0
	P3 = [SP++];
	R0 = [SP++];
            R5.L = W[I1] || P0 = [FP-4];
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+seed@GOT17M4];
	I0 = R0
	P3 = [SP++];
	R0 = [SP++];
            R1 = 11111;
			R7 = 1;
			R6 = ROT R5 BY -2 ;
			R2 = ROT R5 BY -1 || W[I0] = R1.L;
			R6 = ROT R6 BY 2  || W[P0++] = R7; 
			[FP-4] = P0;
			BITSET(R6,0);
			R0 = SP;
	  		R1 = 64;
            R0 = R0 + R1 (S) || W[I1] = R6.L;     
      		R1 = 20;	
            R1 = R0 + R1 (S) || R2 = [FP-4];
	  		R3 = 4;
	  		R3 = R3 + R2;
	  		[FP-4] = R3;
	  		CALL _Qua_lsp;
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+lsp_old_q@GOT17M4];
	B0 = R0
	P3 = [SP++];
	R0 = [SP++];
	  		P0 = 84;
	  		P0 = SP + P0;
	  		B1 = P0;
			P5 = 448;
	  		P5 = P5 + SP;
	  		B2 = P5;
			P5 = 472;
	  		P5 = P5 + SP;
	  		B3 = P5;
	  		CALL _Int_qlpc;
			I0 = B2;
	  		P0 = 10;
	  		M0 = 104;//Ap_t_0 = SP+104
			I1 = SP;
			I1 += M0;
	  		R7.H = 24576;
	  		CALL _Weight_Az;
	  		I1 = SP;
	  		M0 = 128;
	  		I1 += M0;
	  		I0 = B3;
			P0 = 10;
	  		R7.H = 24576;
	  		CALL _Weight_Az;	  
	  		P1 = 64;
	  		P1 = SP + P1;
//	  		I0 = P1;
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+lsp_old@GOT17M4];
	I1 = R0
	P3 = [SP++];
	R0 = [SP++];
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+lsp_old_q@GOT17M4];
	I3 = R0
	P3 = [SP++];
	R0 = [SP++];
	  		R7 = [P1++];
	  		I2 = B1;
	  		LOOP Coder_ld8a_2 LC0 = P0 >> 1;
	  		LOOP_BEGIN Coder_ld8a_2;
	      		MNOP || [I1++] = R7 || R6 = [I2++];
		  		MNOP || [I3++] = R6 || R7 = [P1++];
	  		LOOP_END Coder_ld8a_2;
	  		B0 = B2;
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+speech@GOT17M4];
	I2 = R0
	P3 = [SP++];
	R0 = [SP++];
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+exc@GOT17M4];
	I3 = R0
	P3 = [SP++];
	R0 = [SP++];
      		P0 = 40;
	  		CALL _Residu;
	  		B0 = B3;
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+new_speech@GOT17M4];
	I2 = R0
	P3 = [SP++];
	R0 = [SP++];
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+exc_1@GOT17M4];
	I3 = R0
	P3 = [SP++];
	R0 = [SP++];
	  		CALL _Residu;
	  		M0 = 392;
	  		I0 = SP;
	  		I1 = SP;
	  		M1 = 104;
	  		R7=[I1++M1] || I0 += M0;
	  		B0 = I0;
	  		R7 = 22938;
	  		R3 = 4096;	  		
	  		R6.L = W[I1++];
	  		P1 = 10;
	  		LOOP Coder_ld8a_3 LC0 = P1;
	  		LOOP_BEGIN Coder_ld8a_3;
	      		R5 = R7.L * R6.L || R6.L = W[I1++];
		  		R3.L = R6.L - R5.H(S) || W[I0++] = R3.L;		  		
	  		LOOP_END Coder_ld8a_3;
	  		W[I0++] = R3.L;
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+exc@GOT17M4];
	B1 = R0
	P3 = [SP++];
	R0 = [SP++];
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+wsp@GOT17M4];
	B2 = R0
	P3 = [SP++];
	R0 = [SP++];
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+mem_w@GOT17M4];
	B3 = R0
	P3 = [SP++];
	R0 = [SP++];
//	  		R7 = 1;
	  		CALL _Syn_filt;
	  		P5 = B0;
	  		R7 = 22938;
	  		R3 = 4096;
	  		I0 = B0;
	  		M0 = 128;//Ap_t_1 = SP+128
	  		I1 = SP;		
	  		I1 += M0;
	  		R6.L = W[I1++];
	  		P1 = 10;
	  		LOOP Coder_ld8a_4 LC0 = P1;
	  		LOOP_BEGIN Coder_ld8a_4;
	    		R5.L = R7.L * R6.L(T) || R6.L = W[I1++];
		  		W[I0++] = R3.L || R3.L = R6.L - R5.L(S);	  	
//		  		R5.L = R7.L * R6.H(T) || R6.L = W[I1++];
//		  		W[I0++] = R3.H || R3.L = R6.L - R5.L(S);	 
	  		LOOP_END Coder_ld8a_4;
	  		W[I0++] = R3.L;
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+exc_1@GOT17M4];
	B1 = R0
	P3 = [SP++];
	R0 = [SP++];
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+wsp_1@GOT17M4];
	B2 = R0
	P3 = [SP++];
	R0 = [SP++];
//	  		P0 = 40;
//	  		R7 = 1;
	  		CALL _Syn_filt;
	  		CALL _Pitch_ol_fast;
	  		R0 += -3;
	  		R1 = 20;
	  		R2 = 6;
	  		R3 = 143;
	  		R4.H = 143;
	  		R4.L = 137;
	  		R7 = 0;
	  		R1 = MAX(R0,R1);
	  		R2 = R1 + R2;
	  		R1 = PACK(R2.L,R1.L) || [FP-12] = R7; // i_subfr	  
	  		CC = R3 < R2;
	  		IF CC R1 = R4;
	  		[FP-8] = R1 ;   // high = T0_max  low = T0_min	  	  	  	  
Coder_ld8aLOOPBEGIN:		
			P5 = 392;
	  		P5 = P5 + SP;
	  		B1 = P5;
	  		R7 = 4096;
	  		I1 = B1;
	  		I2 = B1;
	  		P0 = 19;	  		
 	  		R7 = R7 -|- R7 || [I1++] = R7 || R6 = [FP-12];
	  		
//	  	CC = BITTST(R6,0);
	  		R5 = ROT R6 BY -1 || I2 += 2;	  
	  		P2 = 104;
	  		P1 = 128;
	  		P2 = SP + P2;
	  		P1 = SP + P1;
	  		IF CC P2=P1;	   
      		B2 = B1;	  
	  		B3 = I2;
	  		LSETUP(Coder_ld8aLOOP1,Coder_ld8aLOOP1) LC0 = P0;
Coder_ld8aLOOP1: [I1++] = R7;
//	  		P0 = 40;
	  		B0 = P2;
	  		CALL _OSyn_filt;	  	  	  	  	  
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+exc_1@GOT17M4];
	R5 = R0
	P3 = [SP++];
	R0 = [SP++];
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+exc@GOT17M4];
	R4 = R0
	P3 = [SP++];
	R0 = [SP++];
	  		R7 = R6 -|- R6 || R6 = [FP-12];
	  		R3 = ROT R6 BY -1;
	  		IF CC R4 = R5;
	  		B1 = R4;
			P1 = 152;	  
	  		P1 = SP + P1;
	  		B2 = P1;
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+mem_w0@GOT17M4];
	B3 = R0
	P3 = [SP++];
	R0 = [SP++];
        	CALL _OSyn_filt;                                                        
	    	R0 = B1;
	    	I1 = B2;
			P5 = 392;
	  		P5 = P5 + SP;
	  		I0 = P5;
			R1 = [FP-8];
			R2 = [FP-12];
			CALL _Pitch_fr3_fast;
			R1 = [FP-8];
			R2 = [FP-12];
			[FP-16] = R0;
			CALL _Enc_lag3;				
				R5.L = 0X0206;
			 	R0 = EXTRACT(R7,R5.L)(Z) ||	P5 = [FP-4];
			 	P0 = 104;
			 	R3.L = ONES R0 ||	R2 = [FP-12];    
	    		[FP-8] = R6 || R4 = ROT R2 BY -1;	    		
	    		
	  			P1 = 128;
	  			P0 = SP + P0;
	  			P1 = SP + P1;
	  			IF CC P0 = P1;	  
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+exc_1@GOT17M4];
	R4 = R0
	P3 = [SP++];
	R0 = [SP++];
	[--SP] = R1;
	[--SP] = P3;
	P3 = M2;
	R1 = [P3+exc@GOT17M4];
	R0 = R1
	P3 = [SP++];
	R1 = [SP++];
		     	IF CC R0 = R4;
		     	B1 = R0;
				W[P5++] = R7;	
				B0 = P0; 
				IF CC JUMP Coder_ld8aLOOP4;
				R3 = ROT R3 BY -1;
				CC = !CC;
			 	R0 = CC;
			 	W[P5++] = R0;			 
Coder_ld8aLOOP4:
				P0 = 232; //y1 = SP + 252;
				P0 = P0 + SP;
				B2 = P0;
//			 	P0 = 40;
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+mem_zero@GOT17M4];
	B3 = R0
	P3 = [SP++];
	R0 = [SP++];
				R7 = R7-|-R7 || [FP-4] = P5;
			 	CALL _OSyn_filt;	 	 			 
			 	P1 = 152;
			 	P1 = SP+P1;
			 	B0 = P1;
			 	B1 = SP;
			 	CALL _G_pitch;			 			 			 
			 	R7 = R7 -|- R7 || R3 = [FP-16];	// *** [FP-16] HIGH T0_frac LOW T0
			 	R1 = R3 >>> 16 || [FP-20] = R0; // gain_pit
			  	R0 = R3.L(X);		
				R3 = R1 + R0;
				R3 += 8;
				R2 = R3 + R3;
				P0 = R2 ;
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+tab_zone@GOT17M4];
	P1 = R0
	P3 = [SP++];
	R0 = [SP++];
				R0 +=  -50;
				R0 = R1 + R0;			
				P0 = P1 + P0;
				R0 = MAX(R0,R7) || R1 = W[P0] (X);
				P0 = R0 ;			
				P2 = R1 ;
				R2 =   -1;
	[--SP] = R0;
	[--SP] = P2;
	P2 = M2;
	R0 = [P2+L_exc_err@GOT17M4];
	P3 = R0
	P2 = [SP++];
	R0 = [SP++];
				P0 = P1 + (P0<<1);
				R0 = ROT R1 BY 0 || R3 =W[P0] (X);
				R0 += 1;
				P1 = R0;
				P0 = P3 + (P2<<2);
				R0 = R2 -|- R2 || R7 = [P0--];
				LSETUP(P4L5,P4L5) LC0 = P1 ;				
P4L5:				R2 = MAX (R2,R7) || R7 = [P0--];
				R0.H =  15000;		  			  			  
			  	R6 = 15564;
			  	R7 = [FP-20];    // gain_pit
			  	R6 = MIN(R7,R6)(V) || R1 = [FP-12];
			  	I0 = B2;
			  	I1 = B0;
			  	R1 = ROT R1 BY -2 || R3 = [I1++];
			  	CC = R0 < R2;
			  	IF CC R7 = R6;	
				P0 = 40;		
				R1 = ROT R1 BY 2 || R6 = [I0++];                					
			    R4 = R7.L * R6.L, R5 = R7.L * R6.H (S2RND) || [FP-12] = R1;	
			    P5 = 312;
	  			P5 = P5 + SP;
	  			I2 = P5;		  			
				R2 = PACK(R5.H,R4.H) || R0 = [FP-16];     // R0.L = T0;
				R5 = P5;
				R1 = R3 -|- R2(S)    || R6 = [I0++];
 			    R0 = R0.L;
                LOOP Coder_ld8aLOOP6 LC0 = P0 >> 1;
				LOOP_BEGIN Coder_ld8aLOOP6;
				    R2=R7.L * R6.L, R3 = R7.L * R6.H (S2RND) || [I2++] = R1;
					R2 = PACK(R3.H,R2.H) || R3 = [I1++];
					R1 = R3 -|- R2(S) || R6 = [I0++];
				LOOP_END Coder_ld8aLOOP6;		
				P4 = 392;
	  			P4 = P4 + SP;	 
				P5 = 24;
				P5 = SP + P5;
				P2 = 472;
	  			P2 = P2 + SP;	  
				CALL _ACELP_Code_A;											
				R5.H = -1;
				R5.L = R5.L - R5.L (S) || P0 = [FP-4] ;
				R7 = [SP];
				I1 = SP;
				P5 = 12;
				P5 = SP + P5;
				I2 = P5;
				R4 = R0 >> 16 || R6 = [SP+4] ;
				R6 = R5 -|- R6(S) || W[P0++] = R0;
				R4 = - R7(V) || W[P0++] = R4;
				R3 = PACK(R6.L, R7.L) ; [FP-4] = P0;
				R2 = PACK(R6.H, R4.H) || [I1++] = R3;
				[I2++] = R2;
				P5 = 472;
	  			P5 = P5 + SP;	  
	  			P4 = 232; //y1 = SP + 232;
				P4 = P4 + SP;			
	  			P3 = 152;
	  			P3 = SP + P3;
				CALL _Corr_xy2;	//***	 [FP-20] = R0;  LOW gain_pit HIGH gain_code
			   	R0 = [FP-20];
			   	R1 = [FP-12];
			   
			   	B0 = SP;
			   	P5 = 12;
				P5 = SP + P5;
				B1 = P5;
				P5 += 12;
				B3 = P5;
			   	CALL _Qua_gain;					   
			   	P0 = [FP-4];			   			   
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+sharp@GOT17M4];
	I0 = R0
	P3 = [SP++];
	R0 = [SP++];
			   	[FP-20] = R0;
			   	R7 = 13017;   //SHARPMAX
			   	R6 = 3277;    //SHARPMIN
			   	R7 = MIN(R0,R7)(V) || W[P0++] = R1;
			   	R7 = MAX(R6,R7)(V) || R6 = [FP-12];			   		   
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+exc_1@GOT17M4];
	P4 = R0
	P3 = [SP++];
	R0 = [SP++];
			   	M0 = 24;
			   	I1 = SP;				
			   	R1 = ROT R6 BY -1 || W[I0] = R7.L || I1 += M0;
			   	[FP-4] = P0;				   		   			   				   
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+exc@GOT17M4];
	P5 = R0
	P3 = [SP++];
	R0 = [SP++];
				IF CC P5=P4;
				R7   = 1;
			   	R7.H = 0x2000;
               	A0   = R7.L * R7.H,  A1 = R7.L * R7.H || R1 = [I1++] || R6 = [FP-16];
			   	P0   = 40;
			   	R6   = R6.L;
			   	P4 = 2;
			   	LOOP Coder_ld8aLOOP8 LC0 = P0 >> 1;
			   	LOOP_BEGIN Coder_ld8aLOOP8;			   		
			       A0 += R1.L * R0.H, A1 += R1.H * R0.H || R3 = [P5];			     
			       R2=(A0 += R3.L * R0.L)(S2RND) || R1 = [I1++];
			       R3=(A1 += R3.H * R0.L)(S2RND) || W[P5++P4] = R2.H;
				   A0  = R7.L * R7.H,  A1 = R7.L * R7.H || W[P5++P4] = R3.H;
			   	LOOP_END Coder_ld8aLOOP8;			   			   			   
			    P0 = R6;
   				R7 = R0;
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+L_exc_err@GOT17M4];
	P5 = R0
	P3 = [SP++];
	R0 = [SP++];
				
				CALL __update_exc_err;
				R7 = [FP-20];  
				P4 = 292; //y1_1 = SP + 292;
				P4 = P4 + SP;
				P5 = 532;
	  			P5 = P5 + SP;
				P3 = 212;				
				P3 = P3 + SP;
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+mem_w0@GOT17M4];
	R0 += -4;
	I3 = R0
	P3 = [SP++];
	R0 = [SP++];
				R7.H = R7.H << 1 (S) ||	R5 = [P5++] || R0 = [I3];
				P0 = 10;
				LOOP Coder_ld8aLOOP9 LC0 = P0 >> 1;
				LOOP_BEGIN Coder_ld8aLOOP9;										
					R2 = R5.L * R7.H, R3 = R5.H * R7.H (S2RND) || R6 = [P4++];	
				    R0 = R6.L * R7.L, R1 = R6.H * R7.L (S2RND) || [I3++] = R0;
					R4.L = R0.H + R2.H (S) ;
					R4.H = R1.H + R3.H (S) || R5 = [P3++];
					R0 = R5 -|- R4(S) || R5 = [P5++];					
				LOOP_END Coder_ld8aLOOP9;
               	R6 = [FP-12];
			   	R7 = ROT R6 BY -1 || [I3] = R0;
			   	BITSET(R6,0);
			   	[FP-12] = R6;
			   	IF !CC JUMP Coder_ld8aLOOPBEGIN;
Coder_ld8aLOOPEND:

      		P0 = 160;
	  		P1 = 143;
	  		P2 = 154;
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+old_speech_1@GOT17M4];
	I0 = R0
	P3 = [SP++];
	R0 = [SP++];
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+old_speech@GOT17M4];
	I1 = R0
	P3 = [SP++];
	R0 = [SP++];
	  		R7 = [I0++];
	  LSETUP(Coder_ld8AEND1,Coder_ld8AEND1) LC0 = P0 >> 1;
	  Coder_ld8AEND1: MNOP || [I1++] = R7 || R7 = [I0++];

	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+old_wsp_1@GOT17M4];
	I0 = R0
	P3 = [SP++];
	R0 = [SP++];
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+old_wsp@GOT17M4];
	I1 = R0
	P3 = [SP++];
	R0 = [SP++];
	  		R7 = [I0++];
	  LSETUP(Coder_ld8AEND2,Coder_ld8AEND2) LC0 = P1 >> 1;
	  Coder_ld8AEND2: MNOP || [I1++] = R7 || R7 = [I0++];
	  		W[I1] = R7.L;
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+old_exc_1@GOT17M4];
	I0 = R0
	P3 = [SP++];
	R0 = [SP++];
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+old_exc@GOT17M4];
	I1 = R0
	P3 = [SP++];
	R0 = [SP++];
	  		R7 = [I0++];
  	  LSETUP(Coder_ld8AEND3,Coder_ld8AEND3) LC0 = P2 >> 1;
	  Coder_ld8AEND3: MNOP || [I1++] = R7 || R7 = [I0++];
      		UNLINK;
	  		RTS;

_Corr_xy2:
	   .global _Corr_xy2;
      .type  _Corr_xy2,STT_FUNC;
	  //*** I1 POINTS TO g_coeff_cs;
	  //*** I2 POINTS TO exp_g_coeff_cs;
	  R4 = 1;
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+rri0i0@GOT17M4];
	I3 = R0
	P3 = [SP++];
	R0 = [SP++];
	  I0 = I3;
	  P0 = 20;	  //L_acc = 1;                      
      //for(i=0; i<L_SUBFR; i++) L_acc = L_mac(L_acc, scaled_y2[i], scaled_y2[i]); 
	  A0 = R4.L * R4.L, A1 = R4.H * R4.H (IS) || R7 = [P5++];
	  M3 = -80;
	  
	  LSETUP(Corr_xy2_1,Corr_xy2_2) LC0 = P0 >> 1;
	  Corr_xy2_1: 	R5 = R7 >>> 3(V,S) || R6 = [P5++];
      				R0 = R6 >>> 3(V,S) || R7 = [P5++] ; 
      				A0 += R5.L * R5.L, A1 += R5.H * R5.H || [I3++] = R5;
      Corr_xy2_2:	A0 += R0.L * R0.L, A1 += R0.H * R0.H || [I3++] = R0;
//       	R5 = R7 >>> 3(V,S) || R6 = [P5++] ;          
	  R0 = (A0 += A1) || I3 += M3;
	  R7.H = 3;
	  R7.L = SIGNBITS R0;// || I3 -= 4;
	  R0 = ASHIFT R0 BY R7.L ;
	  R5.L = R7.L + R7.H(S) || R7 = [P3++] || R6 = [I3++];
	  R0.L = R0(RND) || W[I2++] = R5.L ;
	  A0 = R4.L * R4.L, A1 = R4.H * R4.H (IS) || W[I1++] = R0.L ;  //L_acc = 1;                       
      //for(i=0; i<L_SUBFR; i++) L_acc = L_mac(L_acc, xn[i], scaled_y2[i]);           /* L_acc:Q10 */
	  LSETUP(Corr_xy2_3,Corr_xy2_3) LC0 = P0 ;
      Corr_xy2_3: A0 += R7.L * R6.L, A1 += R7.H * R6.H || R7 = [P3++] || R6 = [I3++];
	  R0 = (A0 += A1) || I3 += M3;
	  R7.L = SIGNBITS R0;
	  R3.L = -7;
	  R0 = ASHIFT R0 BY R7.L(S) ;
	  R7.L = R7.L + R3.L(S);
	  R0.L = R0(RND) || W[I2++] = R7.L || I3 -= 4;
	  R0 = - R0(V) || R7 = [P4++] || R6 = [I3++];
	  A0 = R4.L * R4.L, A1 = R4.H * R4.H (IS) || W[I1++] = R0.L;                  
      //for(i=0; i<L_SUBFR; i++) L_acc = L_mac(L_acc, y1[i], scaled_y2[i]);        
	  LSETUP(Corr_xy2_4,Corr_xy2_4) LC0 = P0 ;
      Corr_xy2_4: A0 += R7.L * R6.L, A1 += R7.H * R6.H || R7 = [P4++] || R6 = [I3++];
	  R0 = (A0 += A1);
	  R7.L = SIGNBITS R0;	  
	  R0 = ASHIFT R0 BY R7.L(S);
	  R7.L = R7.L + R3.L(S);
	  R0.L = R0(RND) || W[I2] = R7.L;
	  W[I1] = R0.L;
	  RTS;
.text;
.align 8;	  
_Residu:
	   .global _Residu;
      .type  _Residu,STT_FUNC;
      [--SP]=B0;
      	P5 = B0;	  
	   	M0 = 28;
	   	P1 = 5;		
		R3.H=0x4000;
		R3.L = 1;
		R1=0;
		ASTAT = R0;
		A0 = 0 || R0 = [P5++] || R1 = [I2--];
	   LOOP Residu1 LC0 = P0>>1;
	   LOOP_BEGIN Residu1;
		  A1 = R0.L * R1.H;
		  LSETUP(Residu1_1,Residu1_2) LC1 = P1;
		  Residu1_1: A1 += R0.H * R1.L, A0 += R0.L * R1.L || R1 = [I2--] || R0.L = W[P5];		   
		  Residu1_2: A1 += R0.L * R1.H, A0 += R0.H * R1.H || R0 = [P5++];
		  A0 += R0.L * R1.L || P5 = [SP];
		  A1 = A1 << 3 || I2+=M0;    
		  A0 = A0 << 3 || R1 = [I2--]; 
		  R0.L = (A0+=R3.H*R3.L),R0.H = (A1+=R3.H*R3.L) (T) ;
		  A0 = 0 || R0 = [P5++] || [I3++] = R0;
	   LOOP_END Residu1;
	   SP += 4;
	   RTS;

.align 8;
_Syn_filt:
	  .global _Syn_filt;
      .type  _Syn_filt,STT_FUNC;	  
	  	P4 = B3;
	  	P2 = B1;                
	  	I2 = B2;
	  	I0 = B0;	      
	[--SP] = R0;
	[--SP] = P3;
	P3 = M2;
	R0 = [P3+rri0i0@GOT17M4];
	I3 = R0
	P3 = [SP++];
	R0 = [SP++];
	  	P0 = 40;
	  	P1 = 10;
	  	R2 = 1;
	  	R2.H = R2.L << 14 || R1 = [P4++];	  	
	  	LSETUP(Syn_filt1,Syn_filt1) LC0 = P1>>1;
Syn_filt1: MNOP || [I3++] = R1 || R1 = [P4++];	  	
//		MNOP || [I3++] = R1 || R1 = [P4++];	  
//		MNOP || [I3++] = R1 || R1 = [P4++];	  
//		MNOP || [I3++] = R1 || R1 = [P4++];	  
		I1 = I3;
//		MNOP || [I3++] = R6 || R6 = [P4++];	  				
//	  	I1 = I3;	  	 
	  	R3 = R0-|-R0 || R4 = [I0++] || R5 = [P2++];	         
	  	M0 = -20;			
		ASTAT = R3;				
	    I1 -= 4;      	 	      
	    A0 = R5.L * R4.L,A1 = R5.H * R4.L ||	 R6 = [I1] || I1 -= 2;
		A0 -= R6.H * R4.H || R4 = [I0++];// || [I3++] = R1;   
		A1 -= R6.H * R4.L , A0 -= R6.L * R4.L || R6.H = W[I1--];         
	  	LOOP Syn_filt2 LC0 = P0>>1;
	  	LOOP_BEGIN Syn_filt2;	  		           	      	    		 	
		 	A1 -= R6.L * R4.H, A0 -= R6.H * R4.H || R4 = [I0++] || R6.L = W[I1--];  
			A1 -= R6.H * R4.L, A0 -= R6.L * R4.L || R6.H = W[I1--];         
		 	A1 -= R6.L * R4.H, A0 -= R6.H * R4.H || R4 = [I0++] || R6.L = W[I1--];  
			A1 -= R6.H * R4.L, A0 -= R6.L * R4.L || R6.H = W[I1--];         
			A1 -= R6.L * R4.H, A0 -= R6.H * R4.H || R4 = [I0++] || R6.L = W[I1--];  
			A1 -= R6.H * R4.L, A0 -= R6.L * R4.L || R6.H = W[I1--];         
		 	A1 -= R6.L * R4.H, A0 -= R6.H * R4.H || R4 = [I0++M0] || R6.L = W[I1--];       
          	A1 -= R6.H * R4.L, A0 -= R6.L * R4.L || R4 = [I0++] || I1 -= M0;          	
          	A0 = A0 << 3 ;
          	R6.L = (A0+=R2.H*R2.L)(T) || R5 = [P2++];         
			NOP;
          	A1 -= R6.L * R4.H || W[I2++] = R6.L ;	      	 	      			
		  	A1 = A1 << 3 || W[I3++] = R6.L;		  
          	R3.H = (A1+=R2.H*R2.L)(T) || R6.H = W[I1--];
          	W[I2++] = R3.H ||  A0  = R5.L * R4.L, A1 = R5.H * R4.L|| R4.L = W[I0++];
		  	A1 -= R3.H * R4.L ,A0 -= R3.H * R4.H || R4.H = W[I0++];	      
		  	W[I3++] = R3.H || A0 -= R6.L * R4.L ;         
	  	LOOP_END Syn_filt2;
	    P4 = B2;
		I0 = B3;
		P4 += 60;		
		R6 = W[P4++](Z);
		LSETUP(Syn_filt4,Syn_filt4) LC0 = P1;
Syn_filt4: MNOP || W[I0++] = R6.L || R6 = W[P4++](Z);
	   RTS;		   
	   		   
