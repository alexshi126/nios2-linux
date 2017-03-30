	.file	"bounds.c"
#  GNU C version 4.1.2 (nios2-linux-gnu)
# 	compiled by GNU C version 3.4.6 20060404 (Red Hat 3.4.6-4).
#  GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
#  options passed:  -nostdinc
#  -I/home/developer/altera/nios2-linux/linux-2.6/arch/nios2/include
#  -Iarch/nios2/include/generated -Iinclude
#  -I/home/developer/altera/nios2-linux/linux-2.6/include
#  -I/home/developer/altera/nios2-linux/linux-2.6/. -I. -iprefix -isysroot
#  -D__KERNEL__ -D__linux__ -D__ELF__ -DUTS_SYSNAME="Linux"
#  -DKBUILD_STR(s)=#s -DKBUILD_BASENAME=KBUILD_STR(bounds)
#  -DKBUILD_MODNAME=KBUILD_STR(bounds) -isystem -include -MD -G -mhw-mul
#  -mno-hw-mulx -mno-hw-div -auxbase-strip -O2 -Wall -Wundef
#  -Wstrict-prototypes -Wno-trigraphs -Werror-implicit-function-declaration
#  -Wno-format-security -Wdeclaration-after-statement -Wno-pointer-sign
#  -fno-strict-aliasing -fno-common -fno-delete-null-pointer-checks
#  -fno-optimize-sibling-calls -fno-builtin -fno-stack-protector
#  -fomit-frame-pointer -fverbose-asm
#  options enabled:  -falign-loops -fargument-alias -fbranch-count-reg
#  -fcaller-saves -fcprop-registers -fcrossjumping -fcse-follow-jumps
#  -fcse-skip-blocks -fdefer-pop -fearly-inlining
#  -feliminate-unused-debug-types -femit-class-debug-always
#  -fexpensive-optimizations -ffunction-cse -fgcse -fgcse-lm
#  -fguess-branch-probability -fident -fif-conversion -fif-conversion2
#  -finline-functions-called-once -fipa-pure-const -fipa-reference
#  -fipa-type-escape -fivopts -fkeep-static-consts -fleading-underscore
#  -floop-optimize -floop-optimize2 -fmath-errno -fmerge-constants
#  -fomit-frame-pointer -foptimize-register-move -fpeephole -fpeephole2
#  -freg-struct-return -fregmove -freorder-blocks -freorder-functions
#  -frerun-cse-after-loop -frerun-loop-opt -fsched-interblock -fsched-spec
#  -fsched-stalled-insns-dep -fschedule-insns -fschedule-insns2
#  -fshow-column -fsplit-ivs-in-unroller -fstrength-reduce -fthread-jumps
#  -ftrapping-math -ftree-ccp -ftree-ch -ftree-copy-prop -ftree-copyrename
#  -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-fre -ftree-loop-im
#  -ftree-loop-ivcanon -ftree-loop-optimize -ftree-lrs -ftree-pre
#  -ftree-salias -ftree-sink -ftree-sra -ftree-store-ccp
#  -ftree-store-copy-prop -ftree-ter -ftree-vect-loop-version -ftree-vrp
#  -funit-at-a-time -fverbose-asm -fzero-initialized-in-bss -mcustom-fabsd=
#  -mcustom-fabss= -mcustom-faddd= -mcustom-fadds= -mcustom-fatand=
#  -mcustom-fatans= -mcustom-fcmpeqd= -mcustom-fcmpeqs= -mcustom-fcmpged=
#  -mcustom-fcmpges= -mcustom-fcmpgtd= -mcustom-fcmpgts= -mcustom-fcmpled=
#  -mcustom-fcmples= -mcustom-fcmpltd= -mcustom-fcmplts= -mcustom-fcmpned=
#  -mcustom-fcmpnes= -mcustom-fcosd= -mcustom-fcoss= -mcustom-fdivd=
#  -mcustom-fdivs= -mcustom-fexpd= -mcustom-fexps= -mcustom-fextsd=
#  -mcustom-fixdi= -mcustom-fixdu= -mcustom-fixsi= -mcustom-fixsu=
#  -mcustom-floatid= -mcustom-floatis= -mcustom-floatud= -mcustom-floatus=
#  -mcustom-flogd= -mcustom-flogs= -mcustom-fmaxd= -mcustom-fmaxs=
#  -mcustom-fmind= -mcustom-fmins= -mcustom-fmuld= -mcustom-fmuls=
#  -mcustom-fnegd= -mcustom-fnegs= -mcustom-frdxhi= -mcustom-frdxlo=
#  -mcustom-frdy= -mcustom-fsind= -mcustom-fsins= -mcustom-fsqrtd=
#  -mcustom-fsqrts= -mcustom-fsubd= -mcustom-fsubs= -mcustom-ftand=
#  -mcustom-ftans= -mcustom-ftruncds= -mcustom-fwrx= -mcustom-fwry= -mel
#  -mglibc -mhw-mul -minline-memory -mno-custom-fabsd -mno-custom-fabss
#  -mno-custom-faddd -mno-custom-fadds -mno-custom-fatand
#  -mno-custom-fatans -mno-custom-fcmpeqd -mno-custom-fcmpeqs
#  -mno-custom-fcmpged -mno-custom-fcmpges -mno-custom-fcmpgtd
#  -mno-custom-fcmpgts -mno-custom-fcmpled -mno-custom-fcmples
#  -mno-custom-fcmpltd -mno-custom-fcmplts -mno-custom-fcmpned
#  -mno-custom-fcmpnes -mno-custom-fcosd -mno-custom-fcoss
#  -mno-custom-fdivd -mno-custom-fdivs -mno-custom-fexpd -mno-custom-fexps
#  -mno-custom-fextsd -mno-custom-fixdi -mno-custom-fixdu -mno-custom-fixsi
#  -mno-custom-fixsu -mno-custom-floatid -mno-custom-floatis
#  -mno-custom-floatud -mno-custom-floatus -mno-custom-flogd
#  -mno-custom-flogs -mno-custom-fmaxd -mno-custom-fmaxs -mno-custom-fmind
#  -mno-custom-fmins -mno-custom-fmuld -mno-custom-fmuls -mno-custom-fnegd
#  -mno-custom-fnegs -mno-custom-frdxhi -mno-custom-frdxlo -mno-custom-frdy
#  -mno-custom-fsind -mno-custom-fsins -mno-custom-fsqrtd
#  -mno-custom-fsqrts -mno-custom-fsubd -mno-custom-fsubs -mno-custom-ftand
#  -mno-custom-ftans -mno-custom-ftruncds -mno-custom-fwrx -mno-custom-fwry

#  Compiler executable checksum: 612375937fe75968b15f74d5e8cd68b4

	.section	.text
	.align	2
	.global	foo
	.type	foo, @function
foo:
	#  Current Frame Info
	#  total_size = 0
	#  var_size = 0
	#  args_size = 0
	#  save_reg_size = 0
	#  initialized = 1
	#  save_regs_offset = 0
	#  current_function_is_leaf = 1
	#  frame_pointer_needed = 0
	#  pretend_args_size = 0
#APP
	
->NR_PAGEFLAGS 22 __NR_PAGEFLAGS	# 
	
->MAX_NR_ZONES 3 __MAX_NR_ZONES	# 
	
->NR_PCG_FLAGS 3 __NR_PCG_FLAGS	# 
#NO_APP
	ret	
	.size	foo, .-foo
	.ident	"GCC: (GNU) 4.1.2"
