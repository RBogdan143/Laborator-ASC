.data
    str: .space 51
    formatScanf: .asciz "%[^\n]"
    formatPrintf: .asciz "Nr. de vocale este %d\n"
    Vocale: .asciz "aeiou\n"
.text

.global main

main:
push $str
push $formatScanf
call scanf
pop %ebx
pop %ebx
xor %eax, %eax
mov $str, %edi
xor %ecx, %ecx
mov $Vocale, %esi
xor %edx, %edx

et_loop:
movb (%edi, %ecx, 1), %bh
cmp $0, %bh
je et_exit

et_vocale:
movb (%esi, %edx, 1), %bl
cmp $0, %bl
je et_add
cmp %bl, %bh
je et_par
inc %edx
jmp et_vocale

et_add:
xor %edx, %edx
inc %ecx
jmp et_loop

et_par:
inc %eax
jmp et_add

et_exit:
push %eax
push $formatPrintf
call printf
pop %ebx
pop %ebx
mov $1, %eax
mov $0, %ebx
int $0x80
