cmd_lib/zlib_inflate/inflate.o := nios2-linux-gnu-gcc -Wp,-MD,lib/zlib_inflate/.inflate.o.d  -nostdinc -isystem /home/developer/altera/nios2-linux/toolchain-mmu/x86-linux2/bin/../lib/gcc/nios2-linux-gnu/4.1.2/include -I/home/developer/altera/nios2-linux/linux-2.6/arch/nios2/include -Iarch/nios2/include/generated -Iinclude  -I/home/developer/altera/nios2-linux/linux-2.6/include -include /home/developer/altera/nios2-linux/linux-2.6/include/linux/kconfig.h  -I/home/developer/altera/nios2-linux/linux-2.6/lib/zlib_inflate -Ilib/zlib_inflate -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -O2 -pipe -D__linux__ -D__ELF__ -mhw-mul -mno-hw-mulx -mno-hw-div -fno-optimize-sibling-calls -DUTS_SYSNAME=\"Linux\" -fno-builtin -G 0 -fno-stack-protector -fomit-frame-pointer -Wdeclaration-after-statement -Wno-pointer-sign    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(inflate)"  -D"KBUILD_MODNAME=KBUILD_STR(zlib_inflate)" -c -o lib/zlib_inflate/inflate.o /home/developer/altera/nios2-linux/linux-2.6/lib/zlib_inflate/inflate.c

source_lib/zlib_inflate/inflate.o := /home/developer/altera/nios2-linux/linux-2.6/lib/zlib_inflate/inflate.c

deps_lib/zlib_inflate/inflate.o := \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/zutil.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/zlib.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/zconf.h \
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
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/ring/buffer.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/sysinfo.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/linkage.h \
  /home/developer/altera/nios2-linux/linux-2.6/arch/nios2/include/asm/linkage.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/bitops.h \
  arch/nios2/include/generated/asm/bitops.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/bitops.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/typecheck.h \
  /home/developer/altera/nios2-linux/linux-2.6/arch/nios2/include/asm/irqflags.h \
  /home/developer/altera/nios2-linux/linux-2.6/arch/nios2/include/asm/registers.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/bitops/__ffs.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/bitops/ffz.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/bitops/fls.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/bitops/__fls.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/bitops/fls64.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/bitops/find.h \
    $(wildcard include/config/generic/find/first/bit.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/bitops/sched.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/bitops/ffs.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/bitops/hweight.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/bitops/arch_hweight.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/bitops/const_hweight.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/bitops/lock.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/bitops/atomic.h \
    $(wildcard include/config/smp.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/bitops/non-atomic.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/bitops/le.h \
  /home/developer/altera/nios2-linux/linux-2.6/arch/nios2/include/asm/byteorder.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/byteorder/little_endian.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/swab.h \
  /home/developer/altera/nios2-linux/linux-2.6/arch/nios2/include/asm/swab.h \
    $(wildcard include/config/nios2/ci/swab/support.h) \
    $(wildcard include/config/nios2/ci/swab/no.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/swab.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/byteorder/generic.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/bitops/ext2-atomic.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/printk.h \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/init.h \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/hotplug.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/dynamic_debug.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/errno.h \
  arch/nios2/include/generated/asm/errno.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/errno.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/errno-base.h \
  arch/nios2/include/generated/asm/div64.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/div64.h \
  /home/developer/altera/nios2-linux/linux-2.6/lib/zlib_inflate/inftrees.h \
  /home/developer/altera/nios2-linux/linux-2.6/lib/zlib_inflate/inflate.h \
  /home/developer/altera/nios2-linux/linux-2.6/lib/zlib_inflate/inffast.h \
  /home/developer/altera/nios2-linux/linux-2.6/lib/zlib_inflate/infutil.h \
  /home/developer/altera/nios2-linux/linux-2.6/lib/zlib_inflate/inffixed.h \

lib/zlib_inflate/inflate.o: $(deps_lib/zlib_inflate/inflate.o)

$(deps_lib/zlib_inflate/inflate.o):
