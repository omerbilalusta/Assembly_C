.MODEL FLAT, C					
.CODE					

PUBLIC move_array_1byte					
move_array_1byte PROC							
	push ebp
	mov ebp,esp
	mov ESI,[ebp + 8]
	mov EDI,[ebp + 12]
	mov ecx,[ebp + 16]
rp1: 
	mov AL, [ESI]
	mov [EDI], AL
	add ESI, 1
	add EDI, 1
	sub ecx, 1
	jnz rp1
	
	pop ebp
	ret
move_array_1byte ENDP		


PUBLIC move_array_2byte					
move_array_2byte PROC							
	push ebp
	mov ebp,esp
	mov ESI,[ebp + 8]
	mov EDI,[ebp + 12]
	mov ecx,[ebp + 16]
rp1: 
	mov AX, [ESI]
	mov [EDI], AX
	add ESI, 2
	add EDI, 2
	sub ecx, 2
	jnz rp1

	pop ebp
	ret

move_array_2byte ENDP	


PUBLIC move_array_4byte				
move_array_4byte PROC						
	push ebp
	mov ebp,esp
	mov ESI,[ebp + 8]
	mov EDI,[ebp + 12]
	mov ecx,[ebp + 16]
rp1: 
	mov EAX, [ESI]
	mov [EDI], EAX
	add ESI, 4
	add EDI, 4
	sub ecx, 4
	jnz rp1

	pop ebp
	ret
move_array_4byte ENDP	


PUBLIC move_array_8byte
move_array_8byte PROC
	push ebp
	mov ebp, esp
	mov ESI, [ebp + 8]
	mov EDI, [ebp + 12]
	mov ecx, [ebp + 16]
rp1:
	movq mm0, [ESI]
	movq[EDI], mm0
	add ESI, 8
	add EDI, 8
	sub ecx, 8
	jnz rp1

	pop ebp
	ret
move_array_8byte ENDP

											


PUBLIC move_array_16byte					
move_array_16byte PROC					
	push ebp
	mov ebp,esp
	mov ESI,[ebp + 8]
	mov EDI,[ebp + 12]
	mov ecx,[ebp + 16]
rp1: 
	movdqa xmm0, [ESI]
	movdqa [EDI], xmm0
	add ESI, 16
	add EDI, 16
	sub ecx, 16
	jnz rp1

	pop ebp	
	ret

move_array_16byte ENDP
END