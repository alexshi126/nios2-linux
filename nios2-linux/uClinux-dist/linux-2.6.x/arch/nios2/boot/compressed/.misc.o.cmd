cmd_arch/nios2/boot/compressed/misc.o := nios2-linux-gnu-gcc -Wp,-MD,arch/nios2/boot/compressed/.misc.o.d  -nostdinc -isystem /home/developer/altera/nios2-linux/toolchain-mmu/x86-linux2/bin/../lib/gcc/nios2-linux-gnu/4.1.2/include -I/home/developer/altera/nios2-linux/linux-2.6/arch/nios2/include -Iarch/nios2/include/generated -Iinclude  -I/home/developer/altera/nios2-linux/linux-2.6/include -include /home/developer/altera/nios2-linux/linux-2.6/include/linux/kconfig.h  -I/home/developer/altera/nios2-linux/linux-2.6/arch/nios2/boot/compressed -Iarch/nios2/boot/compressed -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -O2 -pipe -D__linux__ -D__ELF__ -mhw-mul -mno-hw-mulx -mno-hw-div -fno-optimize-sibling-calls -DUTS_SYSNAME=\"Linux\" -fno-builtin -G 0 -fno-stack-protector -fomit-frame-pointer -Wdeclaration-after-statement -Wno-pointer-sign    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(misc)"  -D"KBUILD_MODNAME=KBUILD_STR(misc)" -c -o arch/nios2/boot/compressed/misc.o /home/developer/altera/nios2-linux/linux-2.6/arch/nios2/boot/compressed/misc.c

source_arch/nios2/boot/compressed/misc.o := /home/developer/altera/nios2-linux/linux-2.6/arch/nios2/boot/compressed/misc.c

deps_arch/nios2/boot/compressed/misc.o := \
    $(wildcard include/config/mem/base.h) \
    $(wildcard include/config/kernel/region/base.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/compiler-gcc4.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  arch/nios2/include/generated/asm/types.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/types.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/int-ll64.h \
  arch/nios2/include/generated/asm/bitsperlong.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/bitsperlong.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/posix_types.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/stddef.h \
  /home/developer/altera/nios2-linux/linux-2.6/arch/nios2/include/asm/posix_types.h \
    $(wildcard include/config/mmu.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/posix_types.h \
  /home/developer/altera/nios2-linux/toolchain-mmu/x86-linux2/bin/../lib/gcc/nios2-linux-gnu/4.1.2/include/stdarg.h \
  /home/developer/altera/nios2-linux/linux-2.6/arch/nios2/include/asm/string.h \
  /home/developer/altera/nios2-linux/linux-2.6/arch/nios2/boot/compressed/console.c \
    $(wildcard include/config/io/region/base.h) \
    $(wildcard include/config/serial/altera/jtaguart/console.h) \
    $(wildcard include/config/serial/altera/jtaguart/console/bypass.h) \
    $(wildcard include/config/serial/altera/uart/console.h) \
    $(wildcard include/config/serial/altera/uart/baudrate.h) \
  /home/developer/altera/nios2-linux/linux-2.6/arch/nios2/include/asm/io.h \
    $(wildcard include/config/cc/optimize/for/size.h) \
  /home/developer/altera/nios2-linux/linux-2.6/arch/nios2/include/asm/pgtable-bits.h \
  /home/developer/altera/nios2-linux/linux-2.6/arch/nios2/boot/compressed/../../../../lib/inflate.c \

arch/nios2/boot/compressed/misc.o: $(deps_arch/nios2/boot/compressed/misc.o)

$(deps_arch/nios2/boot/compressed/misc.o):
