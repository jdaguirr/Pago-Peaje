library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Tarjeta_Peaje is
	port(Clock,Resetn,Start,R,Add,Recarga,Cobre_Pase, Salir, Aceptar: in std_logic;
			T,Boton, Dir_Buscada, Comp_Me_Regp, Lleno, Lim_Letra, Comp_Me_Dinero: in std_logic;
			Encontrado, No_Registrado: in std_logic;
			Poco_Saldo, Saldo: buffer std_logic;
			Led, EN_ID, EN_Cont_DirRam, EN_Cont_Regp, EN_Cobrar, EN_Aux: out std_logic;
			EN_Vuelto, RW, Sel_Regp, Sel_Aux, LD_Regp, LD_Cont_DirRam, EN_Vehiculo: out std_logic;
			EN_Dir_Vehiculo, EN_Cont_Letra, EN_Reg_Tecla, Sel_Dir_Vehiculo, Sel_Tecla, EN_Matricula: out std_logic;
			LD_Cont_Letra, Sel_UnaTecla, EN_Reg_Dec, EN_Reg_Uni, EN_Saldo, Sel_Saldo, Sel_Vehiculo: out std_logic;
			EN_Saldo_Actual, EN_Cont_No_Reg, EN_Nuevo_Saldo2, LD_No_Reg, Sel_Saldo2, EN_Cont_TID: out std_logic;
			estados: out std_logic_vector(6 downto 0));
end entity;

architecture solucion of Tarjeta_Peaje is
	type estado is (Ta,Tb,Tc,Td,Te,Tf,Tg,Th,Ti,Tj,Tk,Tl,Tm,Tn,Tp,Tq,Tr,Ts,Tt,Tu,Tv,Tw,Tx,Ty,Tz,
						Ta2,Tb2,Tc2,Td2,Te2,Tf2,Tg2,Th2,Ti2,Tj2,Tk2,Tl2,Tm2,Tn2,To2,Tp2,Tq2,Tr2,Ts2,
						Tt2,Tu2,Tv2,Tw2,Tx2,Ty2,Tz2,Ta3,Tb3,Tc3,Td3,Te3,Tf3,Tg3,Th3,Ti3,Tj3,Tk3,Tl3,
						Tm3,Tn3,To3,Tp3,Tq3,Tr3,Ts3,Tt3,Tu3,Tv3,Tw3,Tx3,Ty3,Tz3,Ta4);
	signal y :estado;

	
	begin
		process(Clock,Resetn)
		begin
			if Resetn='0' then y<=Ta;
			elsif (Clock'event and Clock='1') then
				case y is
					when Ta => if(Start='1') then y<=Tb; else y<=Ta; end if;
					when Tb => if(Start='0') then y<=Tc; else y<=Tb; end if;
					when Tc => if(R='1') then y<=Td; elsif (R='0' and T='1') then y<=Tm; else y<=Tc; end if;
					when Td => if(Dir_Buscada='1') then y<=Tf; else y<=Te; end if;
					when Te => y<=Td;
					when Tf => y<=Tg;
					when Tg => y<=Th;
					when Th => y<=Ti;
					when Ti => y<=Tj;
					when Tj => if(Comp_Me_Regp='0') then y<=Tk; else y<=Tj; end if; 
					when Tk => y<=Tl;
					when Tl => y<=Ty3;
					when Ty3 => y<=Tc;
					when Tm => if(Dir_Buscada='1') then y<=Tp; else y<=Tn; end if;
					when Tn => y<=Tm;
					when Tp => if (Add='1') then y<=Tq; 
									elsif(Add='0' and Recarga='1') then y<=Tq2;
									elsif(Add='0' and Recarga='0' and Cobre_Pase='1') then y<=Tc3; 
									elsif(Add='0' and Recarga='0' and Cobre_Pase='0' and Salir='1') then y<=Tx3; 
									else y<=Tp; end if;
					when Tq => y<=Tz3;
					when Tz3=> y<=Tr;
					when Tr => if(Lleno='1') then y<=Tp; else y<=Ts; end if;
					when Ts => y<=Tt;
					when Tt => if(Dir_Buscada='1') then y<=Tv; else y<=Tu; end if;
					when Tu => y<=Tt;
					when Tv => if(Boton='1') then y<=Tw; else y<=Tv; end if;
					when Tw => if(Lim_Letra='1') then y<=Tz; else y<=Tx; end if;
					when Tx => if(Boton='0') then y<=Ty; else y<=Tx; end if;
					when Ty => y<=Tv;
					when Tz => y<=Ta2;
					when Ta2 => if(Boton='0') then y<=Tb2; else y<=Ta2; end if;
					when Tb2=> y<=Tc2;
					when Tc2 => if(Boton='1') then y<=Td2; else y<=Tc2; end if;
					when Td2 => if(Lim_Letra='1') then y<=Tg2; else y<=Te2; end if;
					when Te2 => if(Boton='0') then y<=Tf2; else y<=Te2; end if;
					when Tf2 => y<=Tc2;
					when Tg2 => y<=Th2;
					when Th2 => if(Boton='0') then y<=Ti2; else y<=Th2; end if;
					when Ti2 => y<=Tj2;
					when Tj2 => if(Boton='1') then y<=Tk2; else y<=Tj2; end if;
					when Tk2 => y<=Tl2;
					when Tl2 => y<=Tm2;
					when Tm2 => if(Boton='0') then y<=Tn2; else y<=Tm2; end if;
					when Tn2 => y<=To2;
					when To2 => if(Dir_Buscada='1') then y<=Tp; else y<=Tp2; end if;
					when Tp2 => y<=To2;
					when Tq2 => if(Boton='1') then y<=Tr2; else y<=Tq2; end if;
					when Tr2 => if(Boton='0') then y<=Ts2; else y<=Tr2; end if;
					when Ts2 => if(Boton='1') then y<=Tt2; else y<=Ts2; end if;
					when Tt2 => if(Boton='0') then y<=Tu2; else y<=Tt2; end if;
					when Tu2 => if(Comp_Me_Dinero='0') then y<=Tv2; else y<=Tu2; end if; 
					when Tv2 => if(Aceptar='1') then y<=Tw2; else y<=Tv2; end if;
					when Tw2 => if(Aceptar='0') then y<=Tx2; else y<=Tw2; end if;
					when Tx2 => y<=Ty2;
					when Ty2 => y<=Ta4;
					when Ta4 => y<=Tz2;
					when Tz2 => y<=Ta3;
					when Ta3 => y<=Tb3;
					when Tb3 => y<=Tn2;
					when Tc3 => if(Boton='1') then y<=Td3; else y<=Tc3; end if;
					when Td3 => if(Lim_Letra='1') then y<=Tg3; else y<=Te3; end if;
					when Te3 => if(Boton='0') then y<=Tf3; else y<=Te3; end if;
					when Tf3 => y<=Tc3;
					when Tg3 => y<=Th3;
					when Th3 => y<=Ti3;
					when Ti3 => y<=Tj3;
					when Tj3 => y<=Tk3;
					when Tk3 => if(Encontrado='1') then y<=Tm3; elsif(Encontrado='0' and No_Registrado='1') then y<=Tw3; else y<=Tl3;end if;
					when Tl3 => y<=Tg3;
					when Tm3 => y<=Tn3;
					when Tn3 => y<=To3;
					when To3 => if(Aceptar='1') then y<=Tp3; else y<=To3; end if;
					when Tp3 => if(Poco_Saldo='1')then y<=Tn2; else y<=Tq3; end if;
					when Tq3 => y<=Tr3;
					when Tr3 => if(Dir_Buscada='1') then y<=Tt3; else y<=Ts3; end if;
					when Ts3 => y<=Tr3;
					when Tt3 => y<=Tu3;
					when Tu3 => y<=Tv3;
					when Tv3 => y<=Tn2;
					when Tw3 => y<=Tn2;
					when Tx3 => y<=Tc;
				end case;
			end if;
		end process;
		process(y)
		Begin
			EN_ID<='0';EN_Cont_DirRam<='0';RW<='0';EN_Cont_Regp<='0';EN_Cobrar<='0';
			EN_Aux<='0';Sel_Aux<='0';EN_Vuelto<='0';Sel_Regp<='0';LD_Regp<='0';
			LD_Cont_DirRam<='0';EN_Vehiculo<='0';EN_Dir_Vehiculo<='0';Sel_Vehiculo<='0';
			Sel_Dir_Vehiculo<='0';EN_Reg_Tecla<='0';En_Cont_Letra<='0';Sel_Tecla<='0';
			LD_Cont_Letra<='0';Sel_UnaTecla<='0';EN_Reg_Dec<='0';EN_Reg_Uni<='0';
			EN_Saldo<='0';Sel_Saldo<='0';EN_Saldo_Actual<='0';EN_Cont_No_Reg<='0';
			LD_No_Reg<='0';Saldo<='0';EN_Nuevo_Saldo2<='0';Sel_Saldo2<='0';EN_Cont_TID<='0';
			EN_Matricula<='0';
			case y is
				when Ta => estados<="0000001";
				when Tb => estados<="0000010";
				when Tc => estados<="0000011";
				when Td => estados<="0000100";EN_ID<='1';
				when Te => estados<="0000101";EN_Cont_DirRam<='1';EN_ID<='1';
				when Tf => estados<="0000110";EN_ID<='1';RW<='1';
				when Tg => estados<="0000111";EN_Cont_Regp<='1';
				when Th => estados<="0001000";EN_Cont_DirRam<='1';
				when Ti => estados<="0001001";EN_Cont_DirRam<='1';
				when Tj => estados<="0001010";EN_Cobrar<='1';EN_Aux<='1';
				when Tk => estados<="0001011";Sel_Aux<='1';EN_Vuelto<='1';
				when Tl => estados<="0001100";Sel_Regp<='1';RW<='1';EN_Cont_TID<='1';
				when Ty3 => estados<="0001101";LD_Regp<='1';EN_Cont_Regp<='1';LD_Cont_DirRam<='1';EN_Cont_DirRam<='1';
				when Tm => estados<="0001110";
				when Tn => estados<="0001111";EN_Cont_DirRam<='1';
				when Tp => estados<="0010000";
				when Tq => estados<="0010001";EN_Cont_DirRam<='1';
				when Tz3=> estados<="1001101";
				when Tr => estados<="0010010";EN_Vehiculo<='1';
				when Ts => estados<="0010011";EN_Dir_Vehiculo<='1'; Sel_Vehiculo<='1';RW<='1';
				when Tt => estados<="0010100";Sel_Dir_Vehiculo<='1';
				when Tu => estados<="0010101";Sel_Dir_Vehiculo<='1';EN_Cont_DirRam<='1';
				when Tv => estados<="0010110";if (Boton='1') then En_Reg_Tecla<='1'; end if;
				when Tw => estados<="0010111";
				when Tx => estados<="0011000";
				when Ty => estados<="0011001";EN_Cont_Letra<='1';
				when Tz => estados<="0011010";Sel_Tecla<='1';RW<='1';
				when Ta2 => estados<="0011011";
				when Tb2 => estados<="0011100";LD_Cont_Letra<='1';EN_Cont_Letra<='1';EN_Cont_DirRam<='1';
				when Tc2 => estados<="0011101";if (Boton='1') then En_Reg_Tecla<='1'; end if;
				when Td2 => estados<="0011110";
				when Te2 => estados<="0011111";
				when Tf2 => estados<="0100000";EN_Cont_Letra<='1';
				when Tg2 => estados<="0100001";Sel_Tecla<='1';RW<='1';
				when Th2 => estados<="0100010";
				when Ti2 => estados<="0100011";LD_Cont_Letra<='1';EN_Cont_Letra<='1';EN_Cont_DirRam<='1';
				when Tj2 => estados<="0100100";if (Boton='1') then En_Reg_Tecla<='1'; end if;
				when Tk2 => estados<="0100101";
				when Tl2 => estados<="0100110";Sel_UnaTecla<='1';RW<='1';
				when Tm2 => estados<="0100111";
				when Tn2 => estados<="0101000";LD_Cont_Letra<='1';EN_Cont_Letra<='1';LD_Cont_DirRam<='1';EN_Cont_DirRam<='1';
				when To2 => estados<="0101001";
				when Tp2 => estados<="0101010";EN_Cont_DirRam<='1';
				when Tq2 => estados<="0101011";if (Boton='1') then En_Reg_Dec<='1'; end if;
				when Tr2 => estados<="0101100";
				when Ts2 => estados<="0101101";if (Boton='1') then En_Reg_Uni<='1'; end if;
				when Tt2 => estados<="0101110";
				when Tu2 => estados<="0101111";EN_Cobrar<='1';
				when Tv2 => estados<="0110000";
				when Tw2 => estados<="0110001";
				when Tx2 => estados<="0110010";EN_Cont_DirRam<='1';
				when Ty2 => estados<="0110011";EN_Cont_DirRam<='1';
				when Ta4 => estados<="1001110";
				when Tz2 => estados<="0110100";EN_Saldo<='1';
				when Ta3 => estados<="0110101";Sel_Saldo<='1';RW<='1';
				when Tb3 => estados<="0110110";EN_Vuelto<='1';
				when Tc3 => estados<="0110111";if (Boton='1') then En_Reg_Tecla<='1'; end if;
				when Td3 => estados<="0111000";
				when Te3 => estados<="0111001";
				when Tf3 => estados<="0111010";EN_Cont_Letra<='1';
				when Tg3 => estados<="0111011";EN_Cont_DirRam<='1';EN_Matricula<='1';
				when Th3 => estados<="0111100";EN_Cont_DirRam<='1';
				when Ti3 => estados<="0111101";EN_Cont_DirRam<='1';
				when Tj3 => estados<="0111110";EN_Saldo_Actual<='1';
				when Tk3 => estados<="0111111";
				when Tl3 => estados<="1000000";EN_Cont_No_Reg<='1';
				when Tm3 => estados<="1000001";LD_No_Reg<='1';EN_Cont_No_Reg<='1';EN_Cont_DirRam<='1';
				when Tn3 => estados<="1000010";EN_Cont_DirRam<='1';
				when To3 => estados<="1000011";EN_Cobrar<='1';EN_Aux<='1';Saldo<='1';
				when Tp3 => estados<="1000100";EN_Nuevo_Saldo2<='1';
				when Tq3 => estados<="1000101";LD_Cont_DirRam<='1';EN_Cont_DirRam<='1';
				when Tr3 => estados<="1000110";
				when Ts3 => estados<="1000111";EN_Cont_DirRam<='1';
				when Tt3 => estados<="1001000";EN_Cont_DirRam<='1';
				when Tu3 => estados<="1001001";EN_Cont_DirRam<='1';
				when Tv3 => estados<="1001010";Sel_Saldo2<='1';RW<='1';
				when Tw3 => estados<="1001011";LD_No_Reg<='1';EN_Cont_No_Reg<='1';
				when Tx3 => estados<="1001100";LD_Cont_DirRam<='1';EN_Cont_DirRam<='1';
			end case;
		end process;
		
		Led<=(Saldo and Poco_Saldo);
end solucion;

		
				
				
	