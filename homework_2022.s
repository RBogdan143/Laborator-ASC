.data
    str: .space 1601
    formatScanf: .asciz "%ld"
    formatStringF: .asciz "0 "
    formatStringT: .asciz "1 "
    formatPrintfADD: .asciz "%s"
    formatPrintfADD1: .asciz "%ld"
    formatPrintfEND: .asciz "\n"
.text

.global main

matrix_mult:
push %ebp
mov %esp, %ebp
push %ebx
movl 8(%ebp), %eax
movl 12(%ebp), %ebx
mul %ebx
movl %eax, %edx
pop %ebx
pop %ebp
ret

main:
push $str
push $formatScanf
call scanf
pop %ecx
pop %ecx
movl str, %eax
cmpl $1, %eax
je et_c1
cmpl $2, %eax
je et_c2
jmp et_exit

et_c2:
push $str
push $formatScanf
call scanf
pop %ecx
pop %ecx
movl str, %edi
push $str
push $formatScanf
call scanf
pop %ecx
pop %ecx
push $str
push $formatScanf
call scanf
pop %ecx
pop %ecx
push $str
push $formatScanf
call scanf
pop %ecx
pop %ecx
push $str
push $formatScanf
call scanf
pop %ecx
pop %ecx
push $str
push $formatScanf
call scanf
pop %ecx
pop %ecx
push $str
push $formatScanf
call scanf
pop %ecx
pop %ecx
push $str
push $formatScanf
call scanf
pop %ecx
pop %ecx
push $str
push $formatScanf
call scanf
pop %ecx
pop %ecx
push $str
push $formatScanf
call scanf
pop %ecx
pop %ecx
push $str
push $formatScanf
call scanf
pop %ecx
pop %ecx
movl str, %ebx
push $str
push $formatScanf
call scanf
pop %ecx
pop %ecx
push $str
push $formatScanf
call scanf
pop %ecx
pop %ecx
cmpl %edi, %ebx
jae et_c20
push %eax
push %edx
call matrix_mult
addl $8, %esp
xor %eax, %eax
inc %eax
inc %eax
push %eax
push $formatPrintfADD1
call printf
pop %ebx
pop %ebx
pushl $0
call fflush
popl %ebx
jmp et_exit2

et_c20:
xor %eax, %eax
push %eax
push $formatPrintfADD1
call printf
pop %ebx
pop %ebx
jmp et_exit2

et_c1:
subl $416, %esp
push %ebp
movl %esp, %ebp
push $str
push $formatScanf
call scanf
pop %ecx
pop %ecx
movl str, %eax
incl %eax
movl %eax, 412(%ebp)
xor %ebx, %ebx

et_citire:
push $str
push $formatScanf
call scanf
pop %ecx
pop %ecx
movl str, %eax
movl %eax, 8(%ebp, %ebx, 4)
inc %ebx
movl 412(%ebp), %edx
cmp %ebx, %edx
je et_scadere
jmp et_citire

et_scadere:
movl 412(%ebp), %edx
decl %edx
movl %edx, 412(%ebp)
movl 412(%ebp), %edx
movl %edx, %eax
mul %edx
movl %eax, %edi
movl $0, 416(%ebp)
xor %ebx, %ebx
movl $0, 420(%ebp)
jmp et_verificare

et_urmnod:
cmp $0, %edi
je et_exit
push $formatPrintfEND
call printf
pop %ecx
movl $0, 416(%ebp)
movl 420(%ebp), %edx
incl %edx
movl %edx, 420(%ebp)
movl 420(%ebp), %edx
cmpl $0, 8(%ebp, %edx, 4)
jne et_c
cmpl $0, 8(%ebp, %edx, 4)
je et_afisare

et_cr:
movl 420(%ebp), %edx
cmpl $0, 8(%ebp, %edx, 4)
je et_afisare

et_c:
push $str
push $formatScanf
call scanf
pop %ecx
pop %ecx
inc %ebx

et_verificare:
movl 420(%ebp), %edx
cmpl $0, 8(%ebp, %edx, 4)
je et_afisare
movl 416(%ebp), %eax
cmpl str, %eax
je et_afisare1
push $formatStringF
push $formatPrintfADD
call printf
pop %ecx
pop %ecx
pushl $0
call fflush
popl %ecx
movl 416(%ebp), %eax
incl %eax
movl %eax, 416(%ebp)
decl %edi
jmp et_verificare

et_afisare1:
push $formatStringT
push $formatPrintfADD
call printf
pop %ecx
pop %ecx
pushl $0
call fflush
popl %ecx
movl 416(%ebp), %eax
incl %eax
movl %eax, 416(%ebp)
decl %edi
movl 420(%ebp), %edx
decl 8(%ebp, %edx, 4)
jmp et_cr

et_afisare:
movl 412(%ebp), %eax
cmpl 416(%ebp), %eax
je et_urmnod
push $formatStringF
push $formatPrintfADD
call printf
pop %ecx
pop %ecx
pushl $0
call fflush
popl %ecx
movl 416(%ebp), %eax
incl %eax
movl %eax, 416(%ebp)
decl %edi
jmp et_afisare

et_exit:
push $formatPrintfEND
call printf
pop %ecx
pushl $0
call fflush
popl %ecx
pop %ebp
addl $416, %esp
mov $1, %eax
xor %ebx, %ebx
int $0x80

et_exit2:
push $formatPrintfEND
call printf
pop %ecx
mov $1, %eax
xor %ebx, %ebx
int $0x80
