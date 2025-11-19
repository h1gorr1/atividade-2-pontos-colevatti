#63. Criar um algoritmo que imprima a soma de n primeiros termos da série de fibonacci (2 < n < 40 e, caso não seja, deve ser novamente solicitado).
.data
	n: .asciiz "Digite O Valor De N: "
	total: .asciiz "O Total é "
	lembrete: .asciiz  " Da Sequência de fibonacci!  "
	invalido: .asciiz "Valor Inválido, Tente Novamente! "
	somando: .asciiz "Somando o final de cada Sequência  o total fica: "
	linha: .asciiz "\n"
	espaco: .asciiz " + "
	igual: .asciiz " = "
.text
main:
	li $v0,4 
	la $a0,n
	syscall
	
	li $v0,5 
	syscall 
	move $t0,$v0
	
	li $t1,2
	li $t2,40
	
verificar_n:
	ble $t0,$t1,valor_invalido
	bge $t0,$t2,valor_invalido
	j calculo_fibonacci
	
valor_invalido:
	li $v0,4
	la $a0,invalido
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	j verificar_n
	
calculo_fibonacci:
	li $t3,0      # termo anterior
	li $t4,1      # termo atual
	li $t6,2      # contador inicia em 2 já contando 0 e 1
	li $t7,1      # incremento
	li $t8,1      # soma inicial = 0 + 1 = 1
	
	# imprime 0
	li $v0,1
	move $a0,$t3
	syscall
	li $v0,4
	la $a0,linha
	syscall
	
	# imprime 1
	li $v0,1
	move $a0,$t4
	syscall
	li $v0,4
	la $a0,linha
	syscall
	
add_fibonacci:
	add $t5,$t3,$t4   # próximo termo
	add $t8,$t8,$t5   # soma dos n termos
	
	# imprime operação
	li $v0,1
	move $a0,$t3
	syscall
	
	li $v0,4
	la $a0,espaco
	syscall
	
	li $v0,1
	move $a0,$t4
	syscall
	
	li $v0,4
	la $a0,igual
	syscall
	
	li $v0,1
	move $a0,$t5
	syscall
	
	li $v0,4
	la $a0,linha
	syscall
	
	# avança
	move $t3,$t4
	move $t4,$t5
	
	bge $t6,$t0,fim   # PARA quando t6 == N
	add $t6,$t6,$t7
	j add_fibonacci
	
fim:
	li $v0,4
	la $a0,total
	syscall
	
	li $v0,1
	move $a0,$t5
	syscall
	
	li $v0,4
	la $a0,lembrete
	syscall
	
	li $v0,4
	la $a0,linha
	syscall
	
	li $v0,4
	la $a0,somando
	syscall
	
	li $v0,1
	move $a0,$t8
	syscall
	
	li $v0,10
	syscall

	
	
	
	
	
	
	
