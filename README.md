# oslab in ZJU fall 2022

Instructor: jjm

## Notes
This repository is created for synchronizing codes between different machines and reference. The codes will be submitted to PTA for **duplication checking**, please obey the code of academy.

## Contents
### Lab0
- Compile Linux kernel using cross compiling tools
- Learn how to debug using gdb in qemu
### Lab1
- Complete RV64 kernel boot
- Call API provided by OpenSBI to implement the output of characters in console.
```
OpenSBI v0.9
____                    _____ ____ _____
/ __ \                  / ____|  _ \_   _|
| |  | |_ __   ___ _ __ | (___ | |_) || |
| |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
| |__| | |_) |  __/ | | |____) | |_) || |_
\____/| .__/ \___|_| |_|_____/|____/_____|
      | |
      |_|

......

Boot HART MIDELEG         : 0x0000000000000222
Boot HART MEDELEG         : 0x000000000000b109

......
2022 Hello RISC-V
```
### Lab2
- Set timer interrupt event 
- Complete trap handler
```
kernel is running!
[S] Supervisor Mode Timer Interrupt
kernel is running!
[S] Supervisor Mode Timer Interrupt
kernel is running!
[S] Supervisor Mode Timer Interrupt
kernel is running!
[S] Supervisor Mode Timer Interrupt
kernel is running!
[S] Supervisor Mode Timer Interrupt
kernel is running!
[S] Supervisor Mode Timer Interrupt
kernel is running!
[S] Supervisor Mode Timer Interrupt
kernel is running!
[S] Supervisor Mode Timer Interrupt
kernel is running!
[S] Supervisor Mode Timer Interrupt
```
### Lab3
- Implement switch of thread
- Complete thread schedule(SJF, PRIORITY)
```
OpenSBI v0.9
  ____                    _____ ____ _____
 / __ \                  / ____|  _ \_   _|
| |  | |_ __   ___ _ __ | (___ | |_) || |
| |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
| |__| | |_) |  __/ | | |____) | |_) || |_
 \____/| .__/ \___|_| |_|_____/|____/_____|
       | |
       |_|

...

Boot HART MIDELEG         : 0x0000000000000222
Boot HART MEDELEG         : 0x000000000000b109

...mm_init done!
...proc_init done!
Hello RISC-V
idle process is running!

SET [PID = 1 COUNTER = 10]
SET [PID = 2 COUNTER = 10]
SET [PID = 3 COUNTER = 5]
SET [PID = 4 COUNTER = 2]

switch to [PID = 4 COUNTER = 2]
[PID = 4] is running. auto_inc_local_var = 1
[PID = 4] is running. auto_inc_local_var = 2

switch to [PID = 3 COUNTER = 5]
[PID = 3] is running. auto_inc_local_var = 1
.....
[PID = 3] is running. auto_inc_local_var = 5

switch to [PID = 2 COUNTER = 10]
[PID = 2] is running. auto_inc_local_var = 1
...
[PID = 2] is running. auto_inc_local_var = 10

switch to [PID = 1 COUNTER = 10]
[PID = 1] is running. auto_inc_local_var = 1
...
[PID = 1] is running. auto_inc_local_var = 10

SET [PID = 1 COUNTER = 9]
SET [PID = 2 COUNTER = 4]
SET [PID = 3 COUNTER = 4]
SET [PID = 4 COUNTER = 10]

switch to [PID = 3 COUNTER = 4]
[PID = 3] is running. auto_inc_local_var = 6
...
[PID = 3] is running. auto_inc_local_var = 9
```
### Lab4

```
OpenSBI v0.9
  ____                    _____ ____ _____
 / __ \                  / ____|  _ \_   _|
| |  | |_ __   ___ _ __ | (___ | |_) || |
| |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
| |__| | |_) |  __/ | | |____) | |_) || |_
 \____/| .__/ \___|_| |_|_____/|____/_____|
       | |
       |_|

...

Boot HART MIDELEG         : 0x0000000000000222
Boot HART MEDELEG         : 0x000000000000b109

...mm_init done!
...proc_init done!
Hello RISC-V
idle process is running!

switch to [PID = 28 COUNTER = 1] 
[PID = 28] is running! thread space begin at 0xffffffe007fa2000

switch to [PID = 12 COUNTER = 1] 
[PID = 12] is running! thread space begin at 0xffffffe007fb2000

switch to [PID = 14 COUNTER = 2] 
[PID = 14] is running! thread space begin at 0xffffffe007fb0000
[PID = 14] is running! thread space begin at 0xffffffe007fb0000

switch to [PID = 9 COUNTER = 2] 
[PID = 9] is running! thread space begin at 0xffffffe007fb5000
[PID = 9] is running! thread space begin at 0xffffffe007fb5000

switch to [PID = 2 COUNTER = 2] 
[PID = 2] is running! thread space begin at 0xffffffe007fbc000
[PID = 2] is running! thread space begin at 0xffffffe007fbc000

switch to [PID = 1 COUNTER = 2] 
[PID = 1] is running! thread space begin at 0xffffffe007fbd000
[PID = 1] is running! thread space begin at 0xffffffe007fbd000

switch to [PID = 29 COUNTER = 3] 
[PID = 29] is running! thread space begin at 0xffffffe007fa1000
[PID = 29] is running! thread space begin at 0xffffffe007fa1000
[PID = 29] is running! thread space begin at 0xffffffe007fa1000

switch to [PID = 11 COUNTER = 3] 
[PID = 11] is running! thread space begin at 0xffffffe007fb3000
...
```
## Instruction
[guide book](https://zju-sec.github.io/os22fall-stu/)
