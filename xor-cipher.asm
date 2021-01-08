global _start

extern strcmp

section .data
s1 db "1234", 0x0
s2 db "1234", 0x0

section .text:
_start:
  mov eax, s1
  mov ebx, s2

  call strcmp

  mov ebx, eax
  mov eax, 1
  int 0x80
