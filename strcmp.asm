global strcmp

section .text
strcmp:
  mov ecx, eax
  mov edx, ebx

  jmp strcmp_loop

strcmp_loop:
  mov eax, [ecx]
  mov ebx, [edx]
  and eax, 0x000000ff
  and ebx, 0x000000ff

  cmp eax, ebx
  jne strcmp_not_equal

  cmp eax, byte 0x0
  je strcmp_equal

  inc ecx
  inc edx
  jmp strcmp_loop

strcmp_not_equal:
  mov eax, 0
  ret

strcmp_equal:
  mov eax, 1
  ret
