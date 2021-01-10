global _start

extern strcmp
section .data
code                db "-c", 0x0
invalid_args_string db "Invalid argument(s). Refer to 'https://github.com/reimeytal/xor-cipher' for help.", 0xA
len_invalid_args equ $ - invalid_args_string

section .text
_start:
  pop eax
  cmp eax, 1
  je invalid_args

  add esp, 4
  pop ebx

  mov eax, code
  call strcmp
  cmp eax, 1
  je code_func

  jmp invalid_args

code_func:
  pop ebx

  mov eax, 5
  mov ecx, 0
  int 0x80

  push eax
  jmp code_loop

code_loop:
  mov eax, 3
  pop ebx
  sub esp, 8
  mov ecx, esp
  add esp, 8
  mov edx, 4
  int 0x80

  mov ebp, eax

  mov ebx, [esp]
  mov ecx, [ecx]
  xor ecx, [ebx]
  sub esp, 8
  mov [esp], ecx
  mov ecx, esp
  add esp, 8

  mov edx, ebp
  mov eax, 4
  mov ebx, 1
  int 0x80

  sub esp, 4
  cmp ebp, 4
  jne close_exit
  jmp code_loop
  jmp exit

invalid_args:
  mov eax, 4
  mov ebx, 1
  mov ecx, invalid_args_string
  mov edx, len_invalid_args
  int 0x80

  mov eax, 1
  mov ebx, 2
  int 0x80

close_exit:
  pop ebx
  mov eax, 6
  int 0x80
  jmp exit

exit:
  mov eax, 1
  mov ebx, 0
  int 0x80
