;
                PUBLIC   rs232_params
rs232_params:
                or $08				;two stop bits, set USBS=1 (Bit 4)
                ld   bc,$ff07
                ld   hl,3			;RS_ERR_BAUD_NOT_AVAIL
avail: 

                ld   hl,0			;RS_ERR_OK