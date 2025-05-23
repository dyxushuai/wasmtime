;;! target = "x86_64"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation -W memory64 -O static-memory-maximum-size=0 -O static-memory-guard-size=0 -O dynamic-memory-guard-size=0"

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i64 1)

  (func (export "do_store") (param i64 i32)
    local.get 0
    local.get 1
    i32.store offset=0)

  (func (export "do_load") (param i64) (result i32)
    local.get 0
    i32.load offset=0))

;; wasm[0]::function[0]:
;;       pushq   %rbp
;;       movq    %rsp, %rbp
;;       movq    0x48(%rdi), %r10
;;       subq    $4, %r10
;;       xorq    %r11, %r11
;;       movq    %rdx, %rsi
;;       addq    0x40(%rdi), %rsi
;;       cmpq    %r10, %rdx
;;       cmovaq  %r11, %rsi
;;       movl    %ecx, (%rsi)
;;       movq    %rbp, %rsp
;;       popq    %rbp
;;       retq
;;
;; wasm[0]::function[1]:
;;       pushq   %rbp
;;       movq    %rsp, %rbp
;;       movq    0x48(%rdi), %r10
;;       subq    $4, %r10
;;       xorq    %r11, %r11
;;       movq    %rdx, %rsi
;;       addq    0x40(%rdi), %rsi
;;       cmpq    %r10, %rdx
;;       cmovaq  %r11, %rsi
;;       movl    (%rsi), %eax
;;       movq    %rbp, %rsp
;;       popq    %rbp
;;       retq
