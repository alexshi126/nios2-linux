cmd_kernel/notifier.o := nios2-linux-gnu-gcc -Wp,-MD,kernel/.notifier.o.d  -nostdinc -isystem /home/developer/altera/nios2-linux/toolchain-mmu/x86-linux2/bin/../lib/gcc/nios2-linux-gnu/4.1.2/include -I/home/developer/altera/nios2-linux/linux-2.6/arch/nios2/include -Iarch/nios2/include/generated -Iinclude  -I/home/developer/altera/nios2-linux/linux-2.6/include -include /home/developer/altera/nios2-linux/linux-2.6/include/linux/kconfig.h  -I/home/developer/altera/nios2-linux/linux-2.6/kernel -Ikernel -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -O2 -pipe -D__linux__ -D__ELF__ -mhw-mul -mno-hw-mulx -mno-hw-div -fno-optimize-sibling-calls -DUTS_SYSNAME=\"Linux\" -fno-builtin -G 0 -fno-stack-protector -fomit-frame-pointer -Wdeclaration-after-statement -Wno-pointer-sign    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(notifier)"  -D"KBUILD_MODNAME=KBUILD_STR(notifier)" -c -o kernel/notifier.o /home/developer/altera/nios2-linux/linux-2.6/kernel/notifier.c

source_kernel/notifier.o := /home/developer/altera/nios2-linux/linux-2.6/kernel/notifier.c

deps_kernel/notifier.o := \
    $(wildcard include/config/debug/notifiers.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/kdebug.h \
  arch/nios2/include/generated/asm/kdebug.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/kdebug.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/kprobes.h \
    $(wildcard include/config/kprobes.h) \
    $(wildcard include/config/kretprobes.h) \
    $(wildcard include/config/kprobes/sanity/test.h) \
    $(wildcard include/config/optprobes.h) \
    $(wildcard include/config/sysctl.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/linkage.h \
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
  /home/developer/altera/nios2-linux/linux-2.6/arch/nios2/include/asm/linkage.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
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
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/const.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/notifier.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/errno.h \
  arch/nios2/include/generated/asm/errno.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/errno.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/errno-base.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/mutex.h \
    $(wildcard include/config/debug/mutexes.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
    $(wildcard include/config/have/arch/mutex/cpu/relax.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/spinlock_types.h \
    $(wildcard include/config/generic/lockbreak.h) \
    $(wildcard include/config/debug/spinlock.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/spinlock_types_up.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/lockdep.h \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/lock/stat.h) \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/prove/rcu.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/rwlock_types.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/atomic.h \
    $(wildcard include/config/arch/has/atomic/or.h) \
    $(wildcard include/config/generic/atomic64.h) \
  arch/nios2/include/generated/asm/atomic.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/atomic.h \
  /home/developer/altera/nios2-linux/linux-2.6/arch/nios2/include/asm/cmpxchg.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/irqflags.h \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/typecheck.h \
  /home/developer/altera/nios2-linux/linux-2.6/arch/nios2/include/asm/irqflags.h \
  /home/developer/altera/nios2-linux/linux-2.6/arch/nios2/include/asm/registers.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/cmpxchg.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/cmpxchg-local.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/atomic-long.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/atomic64.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/ring/buffer.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/sysinfo.h \
  /home/developer/altera/nios2-linux/toolchain-mmu/x86-linux2/bin/../lib/gcc/nios2-linux-gnu/4.1.2/include/stdarg.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/bitops.h \
  arch/nios2/include/generated/asm/bitops.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/bitops.h \
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
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
  /home/developer/altera/nios2-linux/linux-2.6/arch/nios2/include/asm/string.h \
  arch/nios2/include/generated/asm/div64.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/div64.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/spinlock.h \
    $(wildcard include/config/preempt.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/preempt.h \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/thread_info.h \
    $(wildcard include/config/compat.h) \
    $(wildcard include/config/debug/stack/usage.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/bug.h \
    $(wildcard include/config/generic/bug.h) \
  arch/nios2/include/generated/asm/bug.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
    $(wildcard include/config/debug/bugverbose.h) \
  /home/developer/altera/nios2-linux/linux-2.6/arch/nios2/include/asm/thread_info.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/stringify.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/bottom_half.h \
  /home/developer/altera/nios2-linux/linux-2.6/arch/nios2/include/asm/barrier.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/spinlock_up.h \
  /home/developer/altera/nios2-linux/linux-2.6/arch/nios2/include/asm/processor.h \
  /home/developer/altera/nios2-linux/linux-2.6/arch/nios2/include/asm/ptrace.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/rwlock.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/spinlock_api_up.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/rwsem-spinlock.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/srcu.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/rcupdate.h \
    $(wildcard include/config/rcu/torture/test.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/tree/preempt/rcu.h) \
    $(wildcard include/config/rcu/trace.h) \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/tiny/preempt/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/preempt/rt.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /home/developer/altera/nios2-linux/linux-2.6/arch/nios2/include/asm/cache.h \
    $(wildcard include/config/nios2/dcache/size.h) \
    $(wildcard include/config/nios2/icache/size.h) \
    $(wildcard include/config/nios2/dcache/line/size.h) \
    $(wildcard include/config/nios2/icache/line/size.h) \
    $(wildcard include/config/nios2/icache/line/shift.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
    $(wildcard include/config/disable/obsolete/cpumask/functions.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/bitmap.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/seqlock.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/completion.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/wait.h \
  arch/nios2/include/generated/asm/current.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/current.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/rcutiny.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/timer.h \
    $(wildcard include/config/timer/stats.h) \
    $(wildcard include/config/debug/objects/timers.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/ktime.h \
    $(wildcard include/config/ktime/scalar.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/math64.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/jiffies.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/timex.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/param.h \
  arch/nios2/include/generated/asm/param.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/param.h \
    $(wildcard include/config/hz.h) \
  /home/developer/altera/nios2-linux/linux-2.6/arch/nios2/include/asm/timex.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/timex.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/smp.h \
    $(wildcard include/config/use/generic/smp/helpers.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/pfn.h \
  arch/nios2/include/generated/asm/percpu.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/percpu.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/export.h \
    $(wildcard include/config/symbol/prefix.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/unused/symbols.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/vmalloc.h \
  /home/developer/altera/nios2-linux/linux-2.6/arch/nios2/include/asm/page.h \
    $(wildcard include/config/mem/base.h) \
    $(wildcard include/config/kernel/region/base.h) \
    $(wildcard include/config/io/region/base.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/sparsemem.h) \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/getorder.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/linux/reboot.h \
  arch/nios2/include/generated/asm/emergency-restart.h \
  /home/developer/altera/nios2-linux/linux-2.6/include/asm-generic/emergency-restart.h \

kernel/notifier.o: $(deps_kernel/notifier.o)

$(deps_kernel/notifier.o):
